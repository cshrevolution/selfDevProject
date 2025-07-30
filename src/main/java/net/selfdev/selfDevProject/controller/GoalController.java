package net.selfdev.selfDevProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GoalController {

	@GetMapping("/goals")
	public String goal() {
		return "goal";
	}
}
