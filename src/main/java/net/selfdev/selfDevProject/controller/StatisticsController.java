package net.selfdev.selfDevProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StatisticsController {

	@GetMapping("stats")
	public String Statistics() {
		return "stats";
	}
}
