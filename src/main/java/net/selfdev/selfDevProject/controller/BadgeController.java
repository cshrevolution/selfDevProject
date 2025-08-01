package net.selfdev.selfDevProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 20250801 csh 뱃지 뽑기 기능 미구현.
 */
@Controller
public class BadgeController {
	
	@GetMapping("badgeDraw")
	public String badge() {
		return "badgeDraw";
	}
}
