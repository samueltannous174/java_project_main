package org.example.last_java_project.Controllers;

import jakarta.validation.Valid;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.example.last_java_project.Models.Event;
import org.example.last_java_project.Services.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
public class MainController {

    @Autowired
    EventService eventService;

    @GetMapping("/home")
    public String home() {
        return "home";
    }

    @GetMapping("/events")
    public String showEvents(Model model,
                             @RequestParam(value = "search", required = false) String title,
                             @RequestParam(value = "page", defaultValue = "0") int page) {

        int pageSize = 8;

        List<Event> allEvents;
        if (title == null || title.isBlank()) {
            allEvents = eventService.findAll();
        } else {
            allEvents = eventService.findByTitleContainsIgnoreCase(title);
        }

        int totalEvents = allEvents.size();
        int totalPages = (int) Math.ceil((double) totalEvents / pageSize);

        if (page < 0) page = 0;
        if (totalPages > 0 && page >= totalPages) page = totalPages - 1;

        int start = page * pageSize;
        int end = Math.min(start + pageSize, totalEvents);
        List<Event> eventsPage;

        if (totalEvents == 0) {
            eventsPage = List.of();
        } else {
            eventsPage = allEvents.subList(start, end);
        }

        model.addAttribute("allEvents", allEvents);
        model.addAttribute("events", eventsPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("search", title);

        return "events";
    }


}
