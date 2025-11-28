package org.example.last_java_project.Services;


import com.itextpdf.html2pdf.HtmlConverter;
import lombok.extern.slf4j.Slf4j;
import org.example.last_java_project.Config.OpenRouterConfig;
import org.example.last_java_project.Models.ChatRequest;
import org.example.last_java_project.Models.ChatResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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


        public byte[] convertHtmlToPdf(String htmlContent) throws IOException {
            try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
                HtmlConverter.convertToPdf(htmlContent, outputStream);
                return outputStream.toByteArray();
            }

    }


    public Map<String, Object> getEventDetails(String description) {
        try {
            String prompt = "Based on this event: \"" + description + "\" " +
                    "give me exactly 3 tasks needed with  few words, 3 expected outcomes with few words, and identify which skills from this list are needed: " +
                    "Communication, Teamwork, Planning, Time Management, Physical stamina, Crowd management. " +
                    "Return in this exact format: " +
                    "TASKS: 1. Task one 2. Task two 3. Task three " +
                    "OUTCOMES: 1. Outcome one 2. Outcome two 3. Outcome three " +
                    "SKILLS: Skill1, Skill2, Skill3";

            System.out.println("Sending prompt: " + prompt);

            String response = sendPrompt(prompt);
            System.out.println("Raw AI Response: " + response);

            if (response == null || response.trim().isEmpty()) {
                System.out.println("Empty response from AI service");
                return getDefaultResponse();
            }

            return parseEventDetails(response);
        } catch (Exception e) {
            System.out.println("Error in getEventDetails: " + e.getMessage());
            e.printStackTrace();
            return getDefaultResponse();
        }
    }

    private Map<String, Object> getDefaultResponse() {
        Map<String, Object> defaultResponse = new HashMap<>();
        defaultResponse.put("tasks", Arrays.asList("Plan event logistics", "Coordinate with team", "Execute event activities"));
        defaultResponse.put("outcomes", Arrays.asList("Successful event completion", "Positive participant feedback", "Achieved event goals"));
        defaultResponse.put("skills", Arrays.asList("Planning", "Communication", "Teamwork"));
        return defaultResponse;
    }

    private Map<String, Object> parseEventDetails(String response) {
        Map<String, Object> result = new HashMap<>();

        try {
            // Initialize with empty lists
            result.put("tasks", new ArrayList<String>());
            result.put("outcomes", new ArrayList<String>());
            result.put("skills", new ArrayList<String>());

            // More flexible parsing
            if (response.contains("TASKS:") && response.contains("OUTCOMES:") && response.contains("SKILLS:")) {
                String tasksSection = response.split("TASKS:")[1].split("OUTCOMES:")[0].trim();
                String outcomesSection = response.split("OUTCOMES:")[1].split("SKILLS:")[0].trim();
                String skillsSection = response.split("SKILLS:")[1].trim();

                List<String> tasks = extractNumberedItems(tasksSection);
                List<String> outcomes = extractNumberedItems(outcomesSection);
                List<String> skills = extractSkills(skillsSection);

                result.put("tasks", tasks);
                result.put("outcomes", outcomes);
                result.put("skills", skills);

                System.out.println("Parsed tasks: " + tasks);
                System.out.println("Parsed outcomes: " + outcomes);
                System.out.println("Parsed skills: " + skills);
            } else {
                System.out.println("Response doesn't contain expected sections, using default");
                return getDefaultResponse();
            }

        } catch (Exception e) {
            System.out.println("Error parsing response: " + e.getMessage());
            e.printStackTrace();
            return getDefaultResponse();
        }

        return result;
    }

    private List<String> extractNumberedItems(String text) {
        List<String> items = new ArrayList<>();
        try {
            // Regex to match patterns like "1. Item", "2. Item", etc.
            Pattern pattern = Pattern.compile("\\d+\\.\\s*([^\\d]+)");
            Matcher matcher = pattern.matcher(text);

            while (matcher.find()) {
                String item = matcher.group(1).trim();
                // Clean up any trailing punctuation
                item = item.replaceAll("[.,;\\s]+$", "");
                items.add(item);
            }

            // If no numbered items found, try alternative parsing
            if (items.isEmpty()) {
                String[] parts = text.split("\\d+\\.");
                for (String part : parts) {
                    String cleaned = part.trim().replaceAll("[.,;\\s]+$", "");
                    if (!cleaned.isEmpty()) {
                        items.add(cleaned);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Error extracting numbered items: " + e.getMessage());
        }

        // Ensure we have exactly 3 items
        while (items.size() < 3) {
            items.add("Default task " + (items.size() + 1));
        }
        if (items.size() > 3) {
            items = items.subList(0, 3);
        }

        return items;
    }

    private List<String> extractSkills(String skillsText) {
        List<String> skills = new ArrayList<>();
        String[] possibleSkills = {"Communication", "Teamwork", "Planning", "Time Management", "Physical stamina", "Crowd management"};

        for (String skill : possibleSkills) {
            if (skillsText.toLowerCase().contains(skill.toLowerCase())) {
                skills.add(skill);
            }
        }

        if (skills.isEmpty()) {
            skills.add("Communication");
            skills.add("Planning");
            skills.add("Teamwork");
        }

        return skills;
    }



}
