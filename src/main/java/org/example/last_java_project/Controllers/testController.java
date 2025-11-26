package org.example.last_java_project.Controllers;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.example.last_java_project.Models.Event;
import org.example.last_java_project.Models.LoginUser;
import org.example.last_java_project.Models.User;


import org.example.last_java_project.Services.EventService;
import org.example.last_java_project.Services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.List;

@Controller

public class testController {

    private final EventService eventService;
    private final UserService userService;

    public testController(EventService eventService, UserService userService) {
        this.eventService = eventService;
        this.userService = userService;
    }

    @GetMapping("/eventPage")
    public String test() {
        return "eventPage";
    }



    @GetMapping("/add")

    public String add(){
        List<Event> events = List.of(
                new Event( "Olive Harvest Support",
                        "Volunteers join local farmers during the olive harvest season to help pick olives, carry baskets...",
                        "Community Service",
                        LocalDate.of(2025, 10, 5),
                        LocalDate.of(2025, 10, 7),
                        "https://english.wafa.ps/image/NewsThumbImg/Default/767dbcf9-9b63-4bbc-b4ea-07bf1ced90fc.jpg"

                ),

                new Event("School Wall Decoration Day",
                        "A creative activity where volunteers repaint school walls, add motivational quotes...",
                        "Decorating",
                        LocalDate.of(2025, 9, 14),
                        LocalDate.of(2025, 9, 15),
                        "https://i.pinimg.com/736x/96/14/00/961400e254dea953b6abd7460e6291a8.jpg"
                ),

                new Event( "University Blood Donation Campaign",
                        "Volunteers help organize a blood donation event and assist medical staff...",
                        "Blood Donation",
                        LocalDate.of(2025, 8, 20),
                        LocalDate.of(2025, 8, 20),
                        "https://www.goodnet.org/photos/281x197/26772_hd.jpg"
                ),

                new Event( "After-School Tutoring Program",
                        "Volunteers provide academic support to middle-school students, helping with math, science...",
                        "Education",
                        LocalDate.of(2025, 3, 1),
                        LocalDate.of(2025, 6, 1),
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYebS16dXroa61_sF0xDSD2BBis-txFMGDpQ&s"

                ),

                new Event("Campus Orientation Guides",
                        "Volunteers help new students find classrooms, explain university services...",
                        "Guiding New Students",
                        LocalDate.of(2025, 2, 1),
                        LocalDate.of(2025, 2, 7),
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8q0uVxwfJfbzVH2W9ZvdmIz1WjZ5lI7llJA&s"

                ),

                new Event("Beach Cleanup Initiative",
                        "A community cleanup day where volunteers collect trash and help protect marine life...",
                        "Community Service",
                        LocalDate.of(2025, 4, 12),
                        LocalDate.of(2025, 4, 12),
                        "https://static.sif.org.sg/inline-images/WWD2022-BeachCleanUp-%202.jpg"
                ),

                new Event("Olive Tree Plantation Day",
                        "Volunteers plant new olive trees to promote sustainability...",
                        "Community Service",
                        LocalDate.of(2025, 11, 10),
                        LocalDate.of(2025, 11, 10),
                        "https://one-more-tree.org/wp-content/uploads/2025/04/oliete2-rotated.jpg"
                ),

                new Event( "Classroom Renovation Helpers",
                        "Volunteers help repaint walls, repair desks, organize materials...",
                        "Decorating",
                        LocalDate.of(2025, 7, 18),
                        LocalDate.of(2025, 7, 20),
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWSI7PkdmqP3V1mrA_bREH2d2msoni51dgKA&s"
                ),

                new Event("First Aid Awareness Workshop",
                        "Volunteers coordinate a workshop teaching basic first aid and emergency response...",
                        "Education",
                        LocalDate.of(2025, 5, 3),
                        LocalDate.of(2025, 5, 3),
                        "https://www.safetyandhealthmagazine.com/ext/resources/images/2022/09-sept/first-aid.webp?t=1660332212&width=768"
                ),

                new Event("Freshman Campus Tours",
                        "Volunteers lead new students around campus and explain important locations...",
                        "Guiding New Students",
                        LocalDate.of(2025, 8, 25),
                        LocalDate.of(2025, 8, 27),
                        "https://img.freepik.com/free-photo/environment-volunteer-concept-with-group-con-grupo_23-2147807231.jpg?semt=ais_incoming&w=740&q=80"
                )
        );

        eventService.deleteAll();
        eventService.saveALl(events);
        return "login";
    }
    @RequestMapping("/**")
    public String Error404(){
        return "error404";
    }

    @GetMapping("/")
    public String showHome(Model model,HttpSession session){
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


    }
