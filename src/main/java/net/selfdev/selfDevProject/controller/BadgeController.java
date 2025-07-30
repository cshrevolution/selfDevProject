package net.selfdev.selfDevProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BadgeController {
	
	@GetMapping("badgeDraw")
	public String badge() {
		return "badgeDraw";
	}
}
