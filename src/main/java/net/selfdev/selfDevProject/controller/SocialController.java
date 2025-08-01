package net.selfdev.selfDevProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 20250801 csh 소셜 기능 미구현
 */
@Controller
public class SocialController {
	
	@GetMapping("social")
	public String social() {
		return "social";
	}
}
