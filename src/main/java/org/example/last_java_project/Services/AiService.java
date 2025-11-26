package org.example.last_java_project.Services;


import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.example.last_java_project.Config.OpenRouterConfig;
import org.example.last_java_project.Models.ChatRequest;
import org.example.last_java_project.Models.ChatResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class AiService {

    private final OpenRouterConfig config;
    private final WebClient webClient;

    public AiService(OpenRouterConfig config) {
        this.config = config;
        this.webClient = WebClient.builder()
                .baseUrl(config.getBaseUrl())
                .defaultHeader("Content-Type", "application/json")
                .defaultHeader("Authorization", "Bearer " + config.getKey())
                .defaultHeader("HTTP-Referer", "https://your-domain.com")
                .defaultHeader("X-Title", "Your Spring Boot App")
                .build();
    }

    // ADD THIS METHOD - Synchronous wrapper for your reactive service
    public String sendPrompt(String prompt) {
        try {
            log.info("Sending prompt to AI: {}", prompt);
            String response = generateResponse(prompt)
                    .block();

            log.info("AI response received: {}", response);
            return response;

        } catch (Exception e) {
            log.error("Error in sendPrompt: {}", e.getMessage(), e);
            return "Sorry, I encountered an error: " + e.getMessage();
        }
    }

    // Your existing reactive methods
    public Mono<ChatResponse> chatCompletion(List<ChatRequest.Message> messages) {
        ChatRequest request = new ChatRequest(
                config.getModel(),
                messages,
                config.getTemperature(),
                config.getMaxTokens(),
                false
        );

        log.info("Sending request to OpenRouter with model: {}", config.getModel());

        return webClient.post()
                .uri("/chat/completions")
                .bodyValue(request)
                .retrieve()
                .onStatus(status -> status.isError(), response -> {
                    log.error("OpenRouter API error: {}", response.statusCode());
                    return response.bodyToMono(String.class)
                            .flatMap(errorBody -> {
                                log.error("OpenRouter error body: {}", errorBody);
                                return Mono.error(new RuntimeException("OpenRouter API error: " + response.statusCode() + " - " + errorBody));
                            });
                })
                .bodyToMono(ChatResponse.class)
                .doOnSuccess(response -> log.info("OpenRouter response received successfully"))
                .doOnError(error -> log.error("Error calling OpenRouter: {}", error.getMessage(), error));
    }

    public Mono<String> generateResponse(String prompt) {
        List<ChatRequest.Message> messages = List.of(
                new ChatRequest.Message("user", prompt)
        );

        return chatCompletion(messages)
                .map(response -> {
                    if (response.getChoices() != null && !response.getChoices().isEmpty()) {
                        return response.getChoices().get(0).getMessage().getContent();
                    }
                    return "No response generated";
                });
    }


    public Map<String, Object> generateEventStructure(String description) {
        String prompt = String.format(
                "Based on this event description: \"%s\"\n\n" +
                        "Generate a JSON response with this exact structure:\n" +
                        "{\n" +
                        "  \"title\": \"creative event title\",\n" +
                        "  \"expectedOutcomes\": [\"outcome1\", \"outcome2\", \"outcome3\"],\n" +
                        "  \"tasks\": [\"task1\", \"task2\", \"task3\", \"task4\"],\n" +
                        "  \"skills\": [\"skill1\", \"skill2\", \"skill3\"]\n" +
                        "}\n\n" +
                        "Return ONLY valid JSON, no other text.",
                description
        );

        String response = sendPrompt(prompt);

        try {
            ObjectMapper mapper = new ObjectMapper();

            TypeReference<Map<String, Object>> typeRef = new TypeReference<Map<String, Object>>() {};
            return mapper.readValue(response, typeRef);

        } catch (Exception e) {
            log.error("Failed to parse AI response: {}", e.getMessage());
            log.error("Raw AI response: {}", response);

            String json = extractJsonFromResponse(response);
            if (json != null) {
                try {
                    ObjectMapper mapper = new ObjectMapper();
                    TypeReference<Map<String, Object>> typeRef = new TypeReference<Map<String, Object>>() {};
                    return mapper.readValue(json, typeRef);
                } catch (Exception ex) {
                    log.error("Failed to parse extracted JSON: {}", ex.getMessage());
                }
            }

            return createFallbackStructure();
        }
    }

    private String extractJsonFromResponse(String response) {
        try {
            int start = response.indexOf('{');
            int end = response.lastIndexOf('}');

            if (start != -1 && end != -1 && end > start) {
                return response.substring(start, end + 1);
            }
        } catch (Exception e) {
            log.error("Error extracting JSON: {}", e.getMessage());
        }
        return null;
    }

    private Map<String, Object> createFallbackStructure() {
        Map<String, Object> fallback = new HashMap<>();
        fallback.put("title", "Event Title");
        fallback.put("expectedOutcomes", Arrays.asList("Learn new skills", "Network with peers", "Achieve project goals"));
        fallback.put("tasks", Arrays.asList("Prepare materials", "Set up venue", "Coordinate participants"));
        fallback.put("skills", Arrays.asList("Communication", "Teamwork", "Problem-solving"));
        return fallback;
    }
}
