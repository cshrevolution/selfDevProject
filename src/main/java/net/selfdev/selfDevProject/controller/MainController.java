package net.selfdev.selfDevProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@ControllerAdvice
public class MainController {
	
	@RequestMapping("/")
	public String root() {
		return "redirect:/main";
	}

	@ExceptionHandler		// For Exception
	@GetMapping("/error")
	public String error(Exception e, Model model) {
		
		String errorString = e.toString();
		model.addAttribute("errorString", errorString);
		
		return "error";	
	}
	
	
	@GetMapping("/main")
	public String main(HttpSession session, HttpServletRequest request) {
		
		Integer uid = (Integer)session.getAttribute("UID"); // null 체크를 위해 원시타입이 아닌 참조타입으로 사용
		
		if (uid != null) {
			System.err.println("==============/main Called!==============");
			System.out.println("Current User's UID : " + uid.toString());
		}
		else {
			request.setAttribute("message", "사용자 정보가 없습니다. 로그인 화면으로 이동합니다.");
			request.setAttribute("url", "/login");
			return "alert";
		}
		
		return "main";
	}
	
	

	
}
