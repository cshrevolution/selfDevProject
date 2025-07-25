package net.selfdev.selfDevProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import net.selfdev.selfDevProject.dto.UserDTO;
import net.selfdev.selfDevProject.service.UserService;

@Controller
public class UserLogInOutController {
	
	@Autowired
	UserService uService;
	
	@GetMapping("/login")
	public String userLogin() {
		return "login";
	}
	
	@PostMapping("/loginProcess")
	public String userLoginProcess(HttpSession session, HttpServletRequest request, UserDTO user) {

		try {
			int uid = uService.getUser(user); 
			session.setAttribute("UID", uid);
			request.setAttribute("message", "로그인에 성공했습니다.");
			request.setAttribute("url", "/main");
			return "alert";
		} catch (Exception e) {
			request.setAttribute("message", "아이디 또는 비밀번호가 잘못되었습니다.");
			request.setAttribute("url", "/login");
			return "alert";
		}

	}
	
	@GetMapping("/logout")
	public String userLogout(HttpSession session, HttpServletRequest request, UserDTO user) {
		
		session.removeAttribute("UID");
		
		if (session.getAttribute("UID") == null) {
			request.setAttribute("message", "로그아웃 되었습니다.");
			request.setAttribute("url", "/login");
		}
		else {
			request.setAttribute("message", "로그아웃 과정에서 오류가 발생했습니다.");
			request.setAttribute("url", "/main");
		}
		return "alert";	
	}

}
