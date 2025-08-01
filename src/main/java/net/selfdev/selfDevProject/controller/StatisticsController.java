package net.selfdev.selfDevProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 20250801 csh 통계 기능 미구현
 */
@Controller
public class StatisticsController {

	@GetMapping("stats")
	public String Statistics() {
		return "stats";
	}
}
