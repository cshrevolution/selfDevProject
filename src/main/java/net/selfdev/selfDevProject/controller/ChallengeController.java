package net.selfdev.selfDevProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import net.selfdev.selfDevProject.dto.ChallengeDTO;
import net.selfdev.selfDevProject.service.ChallengeService;

@Controller
public class ChallengeController {
	
	@Autowired
	ChallengeService cService;

	@GetMapping("/challenge")
	public String challenge() {
		return "challenge";
	}
	
	@PostMapping("/challengeRegister")
	public String challengeRegister(HttpSession session, HttpServletRequest request, @ModelAttribute ChallengeDTO challenge) {
		
		int uid = (int)session.getAttribute("UID");
		
		challenge.setCreaterId(uid);
		try {
			cService.setChallenge(challenge);			
		} catch (Exception e) {
			request.setAttribute("message", "챌린지 등록 과정에서 오류가 발생했습니다.");
			request.setAttribute("url", "/challenge");
			return "alert";
		}
		
		request.setAttribute("message", "챌린지가 등록되었습니다.");
		request.setAttribute("url", "/main");
		return "alert";
		
	}

}
