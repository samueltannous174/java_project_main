package org.example.last_java_project.Controllers;


import org.example.last_java_project.Models.Skill;
import org.example.last_java_project.Models.User;
import org.example.last_java_project.Repositories.UserRepository;
import org.example.last_java_project.Services.SkillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class TestController {
    @Autowired
    private SkillService skillService;
    @Autowired
    private UserRepository userRepository;


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
