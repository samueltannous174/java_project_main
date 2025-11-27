package org.example.last_java_project.Controllers;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.example.last_java_project.Models.*;
import org.example.last_java_project.Repositories.EventRepository;
import org.example.last_java_project.Services.EventService;
import org.example.last_java_project.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class MainController {

    @Autowired
    EventService eventService;
    @Autowired
    UserService userService;
    @Autowired
    private EventRepository eventRepository;

    @RequestMapping("/**")
    public String Error404(){
        return "error404";
    }

    @GetMapping("/")
    public String showHome(Model model, HttpSession session){
        Long loggedId = (Long) session.getAttribute("id");

        if (loggedId == null){
            return "redirect:/show_login";
        }

        User logged = userService.findUser(loggedId);
        model.addAttribute("logged",logged);

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

    @GetMapping("/show_login")
    public String showAuth(
            @ModelAttribute("user") LoginUser user,
            HttpSession session,
            Model model) {

        Long loggedId = (Long) session.getAttribute("id");

        if (loggedId != null) {
            return "redirect:/";
        }

        return "login";
    }
    @GetMapping("/show_register")
    public String showRegister(
            @ModelAttribute("newUser") User user,
            HttpSession session,
            Model model) {

        Long loggedId = (Long) session.getAttribute("id");

        if (loggedId != null) {
            return "redirect:/";
        }

        return "register";
    }


    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, HttpSession session, BindingResult result){
        Long loggedId = (Long) session.getAttribute("id");
        System.out.println(newUser);
        if (loggedId != null) {
            return "redirect:/";
        }

        if (result.hasErrors()) {
            return "register";
        }
        User user= userService.register(newUser,result);

        if (result.hasErrors()) {
            return "register";
        }

        if (session.getAttribute("id") == null){
            session.setAttribute("id", user.getId());
        }


        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("user") LoginUser user, BindingResult result, @ModelAttribute("newUser") User newUser, HttpSession session){
        Long loggedId = (Long) session.getAttribute("id");

        if (loggedId != null) {
            return "redirect:/";
        }

        if(result.hasErrors()){
            return "login";
        }

        User loggedUser=userService.login(user, result);

        if(result.hasErrors()){
            return "login";
        }
        if (session.getAttribute("id") == null){
            session.setAttribute("id", loggedUser.getId());
        }
        return "redirect:/";
    }

    @PostMapping("/logout")
    public String logout(HttpSession session) {
        if (session != null) {
            session.invalidate();
        }

        return "redirect:/";
    }

//    @GetMapping("/events")
//    public String showEvents(Model model) {
//        model.addAttribute("events", eventService.findAll());
//
//        return "events";
//    }
    @GetMapping("/event/{id}")
    public String showEvent(Model model, @PathVariable("id") Long id) {
        Event event= eventService.findById(id);
        model.addAttribute("event", event);

        return "eventPage";
    }


    @GetMapping("/show_create")
    public String showCreate(Model model) {
        Event event = new Event();

        for (int i = 0; i < 3; i++) {
            event.getTasks().add(new Task());
            event.getSkills().add(new Skill());
        }
        model.addAttribute("event", event);
        return "createEvent";
    }

    @PostMapping("/create")
    public String saveEvent(@Valid @ModelAttribute("event") Event event,
                            BindingResult bindingResult,
                            @RequestParam(value = "taskDescriptions", required = false) List<String> taskDescriptions,
                            @RequestParam(value = "skillNames", required = false) List<String> skillNames) {

        System.out.println(event);
        if (bindingResult.hasErrors()) {
            return "createEvent";
        }

        eventService.save(event);

        if (taskDescriptions != null) {
            for (String desc : taskDescriptions) {
                if (desc != null && !desc.trim().isEmpty()) {
                    Task task = new Task();
                    task.setName(desc);
                    task.setDescription(desc);
                    System.out.println(event.getId());
                    System.out.println(task.getId());
                    task.setEvent(event);
                    event.getTasks().add(task);
                }
            }
        }


        if (skillNames != null) {
            for (String name : skillNames) {
                if (name != null && !name.trim().isEmpty()) {
                    Skill skill = new Skill();
                    System.out.println(name);
                    skill.setName(name);
                    System.out.println(event.getId());
                    System.out.println(skill.getId());

                    skill.getEvents().add(event);
                    event.getSkills().add(skill);
                }
            }
        }

        eventService.save(event);

        return "redirect:/events";
    }

}
