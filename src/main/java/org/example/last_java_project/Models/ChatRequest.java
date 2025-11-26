package org.example.last_java_project.Models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatRequest {
    private String model;
    private List<Message> messages;
    private Double temperature = 0.7;
    private Integer max_tokens = 1000;
    private Boolean stream = false;

    // Optional parameters
    private Double top_p;
    private Integer n;
    private String stop;
    private Double presence_penalty;
    private Double frequency_penalty;
    private Object logit_bias;

    @Data
    @NoArgsConstructor
    public static class Message {
        private String role; // "system", "user", "assistant"
        private String content;

        // Constructor for easy message creation
        public Message(String role, String content) {
            this.role = role;
            this.content = content;
        }
    }

    // FIXED: Create a constructor that matches what you need
    public ChatRequest(String model, List<Message> messages, Double temperature, Integer max_tokens, Boolean stream) {
        this.model = model;
        this.messages = messages;
        this.temperature = temperature;
        this.max_tokens = max_tokens;
        this.stream = stream;
    }

    // FIXED: Helper methods for easy request building
    public static ChatRequest createSimpleRequest(String userMessage, String model) {
        Message message = new Message("user", userMessage);
        return new ChatRequest(model, List.of(message), 0.7, 1000, false);
    }

    public static ChatRequest createWithSystemPrompt(String systemPrompt, String userMessage, String model) {
        Message systemMessage = new Message("system", systemPrompt);
        Message userMessageObj = new Message("user", userMessage);
        return new ChatRequest(model, List.of(systemMessage, userMessageObj), 0.7, 1000, false);
    }
}