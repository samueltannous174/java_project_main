package org.example.last_java_project.Controllers;

import org.example.last_java_project.Models.Event;
import org.example.last_java_project.Services.EventService;
import org.example.last_java_project.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class AdminController {

    private  final EventService eventService;
    private  final UserService userService;

    public AdminController(EventService eventService, UserService userService) {
        this.eventService = eventService;
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String viewVolunteers( Model model) {
        model.addAttribute("volunteers", userService.findAll() );
        System.out.println(userService.findAll());
        return "admin_volunteers";
    }

    @PostMapping("/admin/make-organizer")
    public String makeOrganizer(
            @RequestParam("userId") Long userId
    ) {
        userService.promoteToOrganizer(userId);
        return "redirect:/admin";
    }


}
