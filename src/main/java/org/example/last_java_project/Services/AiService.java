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

import java.util.*;

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


    public List<String> getThreeTasks(String description) {
        String prompt = "Based on this event: \"" + description + "\" give me exactly 3 tasks needed. Return as simple list: 1. Task one 2. Task two 3. Task three";

        String response = sendPrompt(prompt);

        // Simple parsing - extract tasks from response
        return extractTasksFromText(response);
    }

    private List<String> extractTasksFromText(String text) {
        List<String> tasks = new ArrayList<>();

        String[] lines = text.split("\n");
        for (String line : lines) {
            if (line.matches(".*\\d+\\..*") || line.matches(".*\\d+\\).*")) {
                String task = line.replaceAll("^\\s*\\d+[\\.\\)]\\s*", "").trim();
                if (!task.isEmpty()) {
                    tasks.add(task);
                }
            }
        }

        if (tasks.size() < 3) {
            tasks.add("Plan and organize event logistics");
            tasks.add("Coordinate with participants and stakeholders");
            tasks.add("Prepare materials and resources");
        }

        return tasks.subList(0, Math.min(3, tasks.size()));
    }


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

}
