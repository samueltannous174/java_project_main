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

//    @GetMapping("/events")
//    public String showEvents(Model model) {
//        model.addAttribute("events", eventService.findAll());
//
//        return "events";
//    }

    @GetMapping("/events")
    public String showEvents(Model model,
                             @RequestParam(value = "search", required = false)String title) {
        List<Event> events;
        if(title ==  null){
            events = eventService.findAll();
        }else{
            events = eventService.findByTitleContainsIgnoreCase(title);
        }
        model.addAttribute("events", events);
        return "events";
    }


}
