package net.selfdev.selfDevProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import net.selfdev.selfDevProject.dto.UserDTO;
import net.selfdev.selfDevProject.service.UserService;

@Controller
public class UserSignUpController {
	
	@Autowired
	private UserService uService;
	
	
	@GetMapping("/signup")
	public String userSignUp() {
		return "signup";
	}

	@PostMapping("/signupProcess")
	public String userSignUpProcess(@ModelAttribute UserDTO user, HttpServletRequest request) {

		try {
			uService.setUser(user);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "이미 존재하는 사용자이거나 입력된 정보가 잘못되었습니다.");
			request.setAttribute("url", "/signup");
			return "alert";
		}
		request.setAttribute("message", "회원가입이 완료되었습니다. 로그인 화면으로 이동합니다.");
		request.setAttribute("url", "/login");
		return "alert";
	}

}
