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

    private Double top_p;
    private Integer n;
    private String stop;
    private Double presence_penalty;
    private Double frequency_penalty;
    private Object logit_bias;

    @Data
    @NoArgsConstructor
    public static class Message {
        private String role;
        private String content;

        public Message(String role, String content) {
            this.role = role;
            this.content = content;
        }
    }

    public ChatRequest(String model, List<Message> messages, Double temperature, Integer max_tokens, Boolean stream) {
        this.model = model;
        this.messages = messages;
        this.temperature = temperature;
        this.max_tokens = max_tokens;
        this.stream = stream;
    }


}