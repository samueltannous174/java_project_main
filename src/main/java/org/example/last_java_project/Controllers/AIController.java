package org.example.last_java_project.Controllers;

import org.example.last_java_project.Services.AiService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/ai")
public class AIController {

    private final AiService aiService;

    public AIController(AiService aiService) {
        this.aiService = aiService;
    }

    @GetMapping("/test")
    public String test() {
        return "AI Controller is working! Current time: " + java.time.LocalDateTime.now();
    }

    @GetMapping("/echo")
    public String echo(@RequestParam String message) {
        return "Echo: " + message;
    }

    @GetMapping("/ask")
    public String askAI(@RequestParam String q, Model model) {
        String response = aiService.sendPrompt(q);
        System.out.println(response);
        String formattedResponse = String.format(
                "🤔 Question: %s\n\n" +
                        "🤖 Answer: %s\n\n" +
                        "📅 Timestamp: %s",
                q, response, java.time.LocalDateTime.now()
        );

        model.addAttribute("desc",response);
        return "eventPage";    }



    @GetMapping("/{id}/ai-tasks")
    @ResponseBody
    public Map<String, Object> generateTasks2(@PathVariable Long id,
                                             @RequestParam String description) {
        List<String> tasks = aiService.getThreeTasks(description);

        Map<String, Object> response = new HashMap<>();
        response.put("tasks", tasks);
        response.put("description", description);
        response.put("eventId", id);

        return response;
    }

}