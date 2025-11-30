package org.example.last_java_project.Controllers;


import org.example.last_java_project.Models.*;
import org.example.last_java_project.Repositories.EventRepository;
import org.example.last_java_project.Repositories.TaskRepository;
import org.example.last_java_project.Repositories.UserRepository;
import org.example.last_java_project.Services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class TestController {
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
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TaskRepository taskRepository;


    @GetMapping("/add_skills")
    public String addSkills(){
        skillService.deleteAll();
        for (int i = 0; i < 10; i++) {
            skillService.deleteById((long) (40 + i));
        }
        skillService.createSkill(new Skill("Communication"));
        skillService.createSkill(new Skill("Teamwork"));
        skillService.createSkill(new Skill("Planning"));
        skillService.createSkill( new Skill("Time Management"));
        skillService.createSkill(new Skill("Physical stamina"));
        skillService.createSkill(new Skill("Crowd management"));
        return "home";
    }

    @GetMapping("/add_chat")
    public String addChat(){

        userRepository.save(new User("ai", "ai","ai@gmail.com","ai"));
        return "home";
    }




}
