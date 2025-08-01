package net.selfdev.selfDevProject.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import net.selfdev.selfDevProject.dto.ChallengeDTO;
import net.selfdev.selfDevProject.service.ChallengeService;

@Controller
public class ChallengeController {
	
	@Autowired
	ChallengeService cService;


	/**
	 * 
	 * 20250801 csh Timezone 문제로 View에서 날짜 하루 전으로 나오는 문제 존재.
	 * 
	 */
	@GetMapping("/challenge")
	public String challenge(HttpSession session, HttpServletRequest request, Model model) throws JsonProcessingException {
		
		List<ChallengeDTO> challengeList = cService.getChallenge((int)session.getAttribute("UID"));
		ObjectMapper mapper = new ObjectMapper();
		mapper.registerModule(new JavaTimeModule());  // 자바 8 날짜/시간 모듈
		mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
		String challengeJSON = mapper.writeValueAsString(challengeList);
		model.addAttribute("challengeJSON", challengeJSON);
		
		return "challenge";
	}
	
	@PostMapping("/challengeRegister")
	public String challengeRegister(HttpSession session, HttpServletRequest request) {
		
		ChallengeDTO challenge = new ChallengeDTO();
		System.err.println("==============/userInfo Called!==============");
		System.out.println("endAt : " + request.getParameter("endAt"));
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		if (cService.getChallenge((int)session.getAttribute("UID")) != null) {
			try {
				challenge.setCname(request.getParameter("cname"));
				challenge.setDescription(request.getParameter("description"));
				challenge.setEndAt(format.parse(request.getParameter("endAt")));
				
				cService.updateChallenge(challenge);
			} catch(Exception e) {
				e.printStackTrace();
				return null;
			}
			
			request.setAttribute("message", "챌린지가 수정되었습니다.");
			request.setAttribute("url", "/main");
			return "alert";
			
		}
		else {
			
			try {
				challenge.setCname(request.getParameter("cname"));
				challenge.setDescription(request.getParameter("description"));
				challenge.setEndAt(format.parse(request.getParameter("endAt")));
			} catch(Exception e) {
				return "redirect:/error";
			}
			
			int uid = (int)session.getAttribute("UID");
			
			challenge.setCreatorId(uid);
			try {
				cService.setChallenge(challenge);			
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
			
			request.setAttribute("message", "챌린지가 등록되었습니다.");
			request.setAttribute("url", "/main");
			return "alert";
		}
	}
	
	
	/**
	 * 
	 * 20250801 csh 삭제 X, cname을 불러올 수가 없음.
	 * 
	 */
	@PostMapping("/deleteChallenge")
	public String deleteChallenge(HttpSession session, HttpServletRequest request, @ModelAttribute ChallengeDTO challenge, @RequestParam String cname) {
		
		int uid = (int)session.getAttribute("UID");
		challenge.setCreatorId(uid);
		challenge.setCname(cname);
		
		try {
			cService.deleteChallenge(challenge);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("message", "챌린지가 삭제되었습니다.");
		request.setAttribute("url", "/challenge");
		
		
		return "alert";
	}
	

}
