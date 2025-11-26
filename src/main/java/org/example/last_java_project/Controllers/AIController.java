package org.example.last_java_project.Controllers;

import org.example.last_java_project.Services.AiService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/ai")
public class AIController {

    private final AiService aiService;

    public AIController(AiService aiService) {
        this.aiService = aiService;
    }

    // Test endpoint to verify the controller is working
    @GetMapping("/test")
    public String test() {
        return "AI Controller is working! Current time: " + java.time.LocalDateTime.now();
    }

    // Simple echo endpoint to test parameter passing
    @GetMapping("/echo")
    public String echo(@RequestParam String message) {
        return "Echo: " + message;
    }

    // Your AI endpoint
    @GetMapping("/ask")
    public String askAI(@RequestParam String q) {
        String response = aiService.sendPrompt(q);
        System.out.println(response);
        String formattedResponse = String.format(
                "🤔 Question: %s\n\n" +
                        "🤖 Answer: %s\n\n" +
                        "📅 Timestamp: %s",
                q, response, java.time.LocalDateTime.now()
        );

        return formattedResponse;    }
}