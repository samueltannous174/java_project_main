package org.example.last_java_project.Controllers;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.example.last_java_project.Models.*;
import org.example.last_java_project.Services.AiService;
import org.example.last_java_project.Services.EventService;
import org.example.last_java_project.Services.SkillService;
import org.example.last_java_project.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ai")
public class AIController {

    @Autowired
    private  AiService aiService;
    @Autowired
    EventService eventService;
    @Autowired
    UserService userService;
    @Autowired
    SkillService skillService;

    @PostMapping ("/pdf")
    public ResponseEntity<byte[]> downloadSimpleCertificate(
            @RequestParam("volunteerName") String volunteerName,
            @RequestParam("volunteerEmail") String volunteerEmail,
            @RequestParam("eventsNumber") int eventsNumber) {

        String currentDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("MMMM dd, yyyy"));

        String certificateHtml = """
<!DOCTYPE html>
<html>
<head>
    <style>
        body { 
            font-family: 'Arial', sans-serif; 
            margin: 40px;
            text-align: center;
        }
        .certificate {
            border: 10px solid #2c3e50;
            padding: 50px;
            max-width: 800px;
            margin: 0 auto;
            background: #f8f9fa;
        }
        .title {
            color: #2c3e50;
            font-size: 36px;
            margin-bottom: 20px;
        }
        .recipient {
            font-size: 28px;
            color: #e74c3c;
            margin: 30px 0;
            font-weight: bold;
        }
        .details {
            font-size: 18px;
            line-height: 1.6;
            margin: 20px 0;
        }
        .email {
            color: #7f8c8d;
            font-size: 16px;
            margin: 10px 0;
        }
        .gold-box {
            margin-top: 35px;
            font-size: 30px;
            font-weight: bold;
            padding: 20px;
            border-radius: 10px;
            color: #b8860b;
            background: linear-gradient(to right, #fff5cc, #ffe799, #fff5cc);
            border: 2px solid #d4af37;
            display: inline-block;
        }
        .signature {
            margin-top: 50px;
            border-top: 2px solid #2c3e50;
            padding-top: 10px;
            display: inline-block;
        }
        .footer {
            margin-top: 30px;
            color: #95a5a6;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="certificate">
        <h1 class="title">Volunteer Certificate</h1>
        
        <div class="details">
            This certificate is awarded to
        </div>
        
        <div class="recipient">%s</div>
        <div class="email">%s</div>

        <div class="gold-box">
            Participated in %d Volunteer Events
        </div>

 
        
        <div class="details">
            We appreciate your dedication, hard work, and commitment<br>
            to making our community a better place.
        </div>
        
        <div class="signature">
            Event Organizer
        </div>
        
        <div class="footer">
            Date: %s
        </div>
    </div>
</body>
</html>
""".formatted(volunteerName, volunteerEmail, eventsNumber, currentDate);

        try {
            byte[] pdfBytes = aiService.convertHtmlToPdf(certificateHtml);

            String fileName = "certificate-" + volunteerName.replaceAll("\\s+", "-") + ".pdf";

            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
                    .contentType(MediaType.APPLICATION_PDF)
                    .body(pdfBytes);

        } catch (IOException e) {
            throw new RuntimeException("Error generating certificate", e);
        }
    }


    @GetMapping("/")
    public String home(Model model, HttpSession session) {
        Long loggedId = (Long) session.getAttribute("id");
        if (loggedId == null) {
            return "redirect:/";
        }

        User logged = userService.findUser(loggedId);
        model.addAttribute("logged", logged);
        model.addAttribute("categories", eventService.getUniqueCategories());

        Event event =new Event();
        model.addAttribute("event", event);
        return "createEvent2";
    }



    @PostMapping("/create2")
    public String saveEvent(@Valid @ModelAttribute("event") Event event,
                            BindingResult bindingResult,
                            Model model,
                            HttpSession session) {
        Long loggedId = (Long) session.getAttribute("id");
        if (loggedId == null) {
            return "redirect:/";
        }


        User logged = userService.findUser(loggedId);
        model.addAttribute("logged", logged);

        if (bindingResult.hasErrors()) {
            model.addAttribute("logged", logged);
            model.addAttribute("categories", eventService.getUniqueCategories());
            model.addAttribute("allSkills", skillService.getAll());
            return "createEvent2";
        }

        eventService.save(event);

        Map<String, Object> aiDetails = aiService.getEventDetails(event.getDescription());
        System.out.println("AI Details: " + aiDetails);

        List<String> taskDescriptions = (List<String>) aiDetails.get("tasks");
        List<String> outcomesNames = (List<String>) aiDetails.get("outcomes");
        List<String> skillNames = (List<String>) aiDetails.get("skills");

        if (skillNames != null) {
            for (String skillName : skillNames) {
                if (skillName != null && !skillName.trim().isEmpty()) {
                    Skill skill = skillService.findByName(skillName);
                    if (skill == null) {
                        skill = new Skill();
                        skill.setName(skillName);
                        skillService.save(skill);
                    }
                    event.getSkills().add(skill);
                }
            }
        }

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


}