package net.selfdev.selfDevProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


/**
 * 20250801 csh 인증 기능 미구현
 */
@Controller
public class CertController {
	
	@GetMapping("/cert")
	public String cert() {
		return "cert";
	}
}
