package net.selfdev.selfDevProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@GetMapping("/error")
	public String error() {
		return "error";
	}
	
	@GetMapping("/main")
	public String main(HttpSession session, HttpServletRequest request) {
		
		Integer uid = (Integer)session.getAttribute("UID"); // null 체크를 위해 원시타입이 아닌 참조타입으로 사용
		
		if (uid != null) {
			System.out.println(uid.toString());
		}
		else {
			request.setAttribute("message", "사용자 정보가 없습니다. 로그인 화면으로 이동합니다.");
			request.setAttribute("url", "/login");
			return "alert";
		}
		
		return "main";
	}
	
	
	@GetMapping("/radio")
	public String radio() {
		return "radio";
	}
	
	@PostMapping("/radioConfirm")
	public String radioConfirm(HttpServletRequest request) {
		System.out.println(request.getAttribute("radio"));
		return null;
	}
	
}
