package org.example.last_java_project.Controllers;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.example.last_java_project.Models.Event;
import org.example.last_java_project.Models.LoginUser;
import org.example.last_java_project.Models.User;
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
    public String logout(HttpSession session){
        if (session != null) {
            session.invalidate();
        }

        return "redirect:/";
    }

    @GetMapping("/events")
    public String showEvents(Model model) {
        model.addAttribute("events", eventService.findAll());

        return "events";
    }
    @GetMapping("/event/{id}")
    public String showEvent(Model model, @PathVariable("id") Long id) {
        Event event= eventService.findById(id);
        model.addAttribute("event", event);

        return "eventPage";
    }

}
