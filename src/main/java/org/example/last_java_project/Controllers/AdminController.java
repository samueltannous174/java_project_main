package org.example.last_java_project.Controllers;

import org.example.last_java_project.Models.Event;
import org.example.last_java_project.Services.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

public class AdminController {

    private  final EventService eventService;

    public AdminController(EventService eventService) {
        this.eventService = eventService;
    }

    @GetMapping("/admin/event/{id}/volunteers")
    public String viewVolunteers(@PathVariable Long id, Model model) {
        Event event = eventService.findById(id);

        model.addAttribute("event", event);
        model.addAttribute("volunteers", event.getUsers());

        return "admin/event_volunteers.jsp";
    }

}
