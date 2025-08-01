package net.selfdev.selfDevProject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import net.selfdev.selfDevProject.dto.ChallengeDTO;
import net.selfdev.selfDevProject.service.ChallengeService;

@Controller
public class ChallengeController {
	
	@Autowired
	ChallengeService cService;

	@GetMapping("/challenge")
	public String challenge(HttpSession session, HttpServletRequest request, @ModelAttribute ChallengeDTO challenge, Model model) throws JsonProcessingException {
		
		challenge = cService.getChallenge((int)session.getAttribute("UID"));
		ObjectMapper mapper = new ObjectMapper();
		String challengeJSON = mapper.writeValueAsString(challenge);
		model.addAttribute("challengeJSON", challengeJSON);
		
		return "challenge";
	}
	
	@PostMapping("/challengeRegister")
	public String challengeRegister(HttpSession session, HttpServletRequest request) {
		
		ChallengeDTO challenge = new ChallengeDTO();
		System.err.println("==============/userInfo Called!==============");
		System.out.println("endAt : " + request.getParameter("endAt"));
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			challenge.setCname(request.getParameter("cname"));
			challenge.setDescription(request.getParameter("description"));
			challenge.setEndAt(format.parse(request.getParameter("endAt")));
		} catch(ParseException e) {
			return "redirect:/error";
		}
		
		int uid = (int)session.getAttribute("UID");
		
		challenge.setCreaterId(uid);
		try {
			cService.setChallenge(challenge);			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			/*
			request.setAttribute("message", "챌린지 등록 과정에서 오류가 발생했습니다.");
			request.setAttribute("url", "/challenge");
			return "alert";
			*/
		}
		
		request.setAttribute("message", "챌린지가 등록되었습니다.");
		request.setAttribute("url", "/main");
		return "alert";
		
	}

}
