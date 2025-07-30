package net.selfdev.selfDevProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CertController {
	
	@GetMapping("/cert")
	public String cert() {
		return "cert";
	}
}
