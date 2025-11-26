package org.example.last_java_project.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class testController {
    @GetMapping("/eventPage")
    public String test() {
        return "eventPage";
    }
}
