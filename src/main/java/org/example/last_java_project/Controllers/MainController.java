package org.example.last_java_project.Controllers;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.example.last_java_project.Models.*;
import org.example.last_java_project.Repositories.MessageRepository;
import org.example.last_java_project.Services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class MainController {

    @Autowired
    EventService eventService;
    @Autowired
    UserService userService;
    @Autowired
    SkillService skillService;
    @Autowired
    AiService aiService;
    @Autowired
    MessageService messageService;


    @RequestMapping("/**")
    public String Error404(){
        return "error404";
    }

    @GetMapping("/")
    public String showHome(Model model, HttpSession session){
        Long loggedId = (Long) session.getAttribute("id");

        if (loggedId == null){
            return "redirect:/login";
        }

        User logged = userService.findUser(loggedId);

        model.addAttribute("logged",logged);

        return "home";
    }

    @GetMapping("/events")
    public String showEvents(Model model,
                             @RequestParam(value = "search", required = false) String title,
                             @RequestParam(value = "page", defaultValue = "0") int page,
                             @RequestParam(value = "category", required = false)String category,
                             HttpSession session) {

        Long loggedId = (Long) session.getAttribute("id");
        if (loggedId == null){
            return "redirect:/login";
        }

        int pageSize = 8;
        List<Event> allEvents = List.of();
        if(title == null && category == null){
            allEvents = eventService.findAll();
        }else if(title == null && category != null){
            allEvents = eventService.getEventsByCategory(category);
        }else if(title != null && category == null){
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
        User logged = userService.findUser(loggedId);
        model.addAttribute("logged", logged);
        model.addAttribute("categories", eventService.getUniqueCategories());
        model.addAttribute("allEvents", allEvents);
        model.addAttribute("events", eventsPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("search", title);
        return "events";
    }

    @GetMapping("/login")
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
    @GetMapping("/register")
    public String showRegister(
            @ModelAttribute("newUser") User user,
            HttpSession session,
            Model model) {

        Long loggedId = (Long) session.getAttribute("id");

        if (loggedId != null) {
            return "redirect:/";
        }

        model.addAttribute("allSkills", skillService.getAll());

        return "register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, HttpSession session,Model model){
        Long loggedId = (Long) session.getAttribute("id");
        System.out.println(newUser);
        if (loggedId != null) {
            return "redirect:/";
        }

        if (result.hasErrors()) {
            model.addAttribute("allSkills", skillService.getAll());

            return "register" ;
        }
        User user= userService.register(newUser,result);

        if (result.hasErrors()) {
            model.addAttribute("allSkills", skillService.getAll());
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
    public String logout(HttpSession session){
        if(session.getAttribute("id") != null){
            session.setAttribute("id", null);
        }

        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @GetMapping("/event/{id}")
    public String showEvent(Model model, @PathVariable("id") Long id,
                            HttpSession session) {
        Long loggedId = (Long) session.getAttribute("id");
        if (loggedId == null) {
            return "redirect:/";
        }

        if(!eventService.isExist(id)){
            return "redirect:/";
        }

        User logged = userService.findUser(loggedId);
        model.addAttribute("logged", logged);


        model.addAttribute("logged", logged);


        Event event= eventService.findById(id);
        model.addAttribute("event", event);
        System.out.println(event.getOrganizer());
        model.addAttribute("organizer", event.getOrganizer());

        model.addAttribute("outcomes", event.getOutcomes());
        model.addAttribute("skills", event.getSkills());
        model.addAttribute("tasks", event.getTasks());


        return "eventPage";
    }


    @GetMapping("/create")
    public String showCreate(Model model, HttpSession session) {

        Long loggedId = (Long) session.getAttribute("id");
        if (loggedId == null) {
            return "redirect:/";
        }

        User logged = userService.findUser(loggedId);
        model.addAttribute("logged", logged);


        Event event = new Event();

        for (int i = 0; i < 3; i++) {
            event.getTasks().add(new Task());
            event.getSkills().add(new Skill());
        }
        model.addAttribute("categories", eventService.getUniqueCategories());
        model.addAttribute("allSkills", skillService.getAll());
        model.addAttribute("event", event);
        return "createEvent";
    }

    @PostMapping("/create")
    public String saveEvent(@Valid @ModelAttribute("event") Event event,
                            BindingResult bindingResult,
                            Model model,
                            HttpSession session,
                            @RequestParam(value = "taskDescriptions", required = false) List<String> taskDescriptions,
                            @RequestParam(value="skillIds", required=false) List<Long> skillIds,
                            @RequestParam(value = "outcomesNames", required = false) List<String> outcomesNames
    ) {
        Long loggedId = (Long) session.getAttribute("id");
        if (loggedId == null) {
            return "redirect:/";
        }

        User logged = userService.findUser(loggedId);
        model.addAttribute("logged", logged);

        if (bindingResult.hasErrors()) {
            model.addAttribute("allSkills", skillService.getAll());
            return "createEvent";
        }

        eventService.save(event);

        if (taskDescriptions != null) {
            for (String desc : taskDescriptions) {
                if (desc != null && !desc.trim().isEmpty()) {
                    Task task = new Task();
                    task.setName(desc);
                    task.setDescription(desc);
                    task.setEvent(event);
                    event.getTasks().add(task);
                }
            }
        }

        if ( skillIds != null) {
            for (Long id : skillIds) {
                if (id != null) {
                    Skill skill = skillService.findById(id);
                    event.getSkills().add(skill);

                }
            }
        }
        if (outcomesNames != null) {
            for (String name : outcomesNames) {
                if (name != null && !name.trim().isEmpty()) {
                    Outcome outcome = new Outcome();
                    outcome.setDescription(name);
                    outcome.setEvent(event);
                    event.getOutcomes().add(outcome);
                }
            }
        }

        event.setOrganizer(logged);

        eventService.save(event);

        return "redirect:/events";
    }

    @GetMapping("/profile/{id}")
    public String profile(@PathVariable("id")Long id,
                          Model model,
                          HttpSession session){
        Long loggedId = (Long) session.getAttribute("id");
        if (loggedId == null) {
            return "redirect:/";
        }
        if(!loggedId.equals(id)){
            return "redirect:/";
        }

        User logged = userService.findUser(id);
        model.addAttribute("logged", logged);
        return "profile";
    }


    @PostMapping ("add_user_to_event")

    public String addUserToEvent(@RequestParam("event_id") Long event_id, HttpSession session){
        Long loggedId = (Long) session.getAttribute("id");
        if (loggedId == null) {
            return "redirect:/";
        }

        User logged = userService.findUser(loggedId);

        Event event= eventService.findById(event_id);
        event.getUsers().add(logged);
        eventService.save(event);
        return "redirect:/events";
    }

    @PostMapping ("remove_user_to_event")

    public String removeUserToEvent(@RequestParam("event_id") Long event_id, HttpSession session){
        Long loggedId = (Long) session.getAttribute("id");
        if (loggedId == null) {
            return "redirect:/";
        }

        User logged = userService.findUser(loggedId);
        Event event= eventService.findById(event_id);
        event.getUsers().remove(logged);
        eventService.save(event);
        return "redirect:/events";
    }

    @GetMapping("chat/{id}")
    public String chatAi(HttpSession session,
                         @PathVariable("id") Long id,
                         Model model){
        Long loggedId = (Long) session.getAttribute("id");
        if (loggedId == null) {
            return "redirect:/";
        }
        User logged = userService.findUser(loggedId);
        model.addAttribute("logged", logged);

        Event event = eventService.findById(id);
        model.addAttribute("event", event);

        return "chatAI";
    }


    @PostMapping("/ai/message")
    public String addAiMessage(@RequestParam("user_id") Long  user_id,
                               @RequestParam("event_id") Long  event_id,
                               @RequestParam("content") String  content ,
                               @RequestParam("type") Byte  type ){
        ChatMessage chatMessage = new ChatMessage(content, type);
        Event event= eventService.findById(event_id);
        chatMessage.setEvent(event);
        User user= userService.findUser(user_id);
        chatMessage.setUser(user);

        System.out.println(chatMessage);
        messageService.save(chatMessage);

      String response = aiService.sendPrompt(content);

        ChatMessage chatMessage2 = new ChatMessage(response, type);
        chatMessage2.setEvent(event);
        User chat = userService.findUser(9L);
        chatMessage2.setUser(chat);
        messageService.save(chatMessage2);


        return "redirect:/chat/"+ event.getId()+"?activeTab=ai";
    }



    @PostMapping("/participant/message")
    public String addParticipantMessage(@RequestParam("user_id") Long user_id,
                               @RequestParam("event_id") Long event_id,
                               @RequestParam("content") String content ,
                               @RequestParam("type") Byte type){
        System.out.println();
        ChatMessage chatMessage = new ChatMessage(content, type);
        Event event= eventService.findById(event_id);
        chatMessage.setEvent(event);
        User user = userService.findUser(user_id);
        chatMessage.setUser(user);
        messageService.save(chatMessage);

        System.out.println(chatMessage.getContent()+" by "+user.getFirstname());

        return "redirect:/chat/"+ event.getId()+"?activeTab=participant";
    }
}
