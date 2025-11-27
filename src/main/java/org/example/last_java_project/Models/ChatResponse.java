package org.example.last_java_project.Models;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatResponse {
    private String id;
    private String object;
    private Long created;
    private String model;
    private List<Choice> choices;
    private Usage usage;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Choice {
        private Integer index;
        private Message message;
        private String finish_reason;

        @Data
        @AllArgsConstructor
        @NoArgsConstructor
        public static class Message {
            private String role;
            private String content;
        }
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Usage {
        private Integer prompt_tokens;
        private Integer completion_tokens;
        private Integer total_tokens;
    }

    public String getFirstContent() {
        if (choices != null && !choices.isEmpty() && choices.get(0).getMessage() != null) {
            return choices.get(0).getMessage().getContent();
        }
        return null;
    }
}