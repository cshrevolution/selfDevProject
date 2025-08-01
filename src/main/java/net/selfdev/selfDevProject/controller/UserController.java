package net.selfdev.selfDevProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import net.selfdev.selfDevProject.dto.UserDTO;
import net.selfdev.selfDevProject.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService uService;
	
	@GetMapping("/login")
	public String userLogin(HttpSession session) {
		if (session.getAttribute("UID") == null) {
			return "login";
		}
		else return "redirect:/main";
		
	}
	
	@PostMapping("/loginProcess")
	public String userLoginProcess(HttpSession session, HttpServletRequest request, UserDTO user) {

		try {
			int uid = uService.getUser(user); 
			session.setAttribute("UID", uid);
			request.setAttribute("message", "로그인에 성공했습니다.");
			request.setAttribute("url", "/main");
		} catch (Exception e) {
			request.setAttribute("message", "아이디 또는 비밀번호가 잘못되었습니다.");
			request.setAttribute("url", "/login");
		}
		return "alert";

	}
	
	@GetMapping("/logout")
	public String userLogout(HttpSession session, HttpServletRequest request) {

		System.err.println("==============/logout Called!==============");
		System.out.println("Current Session Attribute : " + session.getAttribute("UID"));
		
		session.invalidate();
		request.setAttribute("message", "로그아웃 되었습니다.");
		request.setAttribute("url", "/login");
		return "alert";	
	}
	
	@GetMapping("/signup")
	public String userSignUp() {
		return "sign_up";
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
	
	@GetMapping("/userInfo")
	public String userInfo(HttpServletRequest request, HttpSession session) {
		
		int uid = (int)session.getAttribute("UID");
		UserDTO info = uService.infoUser(uid);
		
		System.err.println("==============/userInfo Called!==============");
		System.out.println(info.getUname());
		System.out.println(info.getEmail());
		System.out.println(info.getNickname());
		
		request.setAttribute("uname", info.getUname());
		request.setAttribute("nickname", info.getNickname() == null ? "닉네임이 없습니다." : info.getNickname());			
		request.setAttribute("email", info.getEmail());
		
		return "userinfo";
	}
	
	@PostMapping("/updateUser")
	public String updateUser(HttpSession session, HttpServletRequest request, @ModelAttribute UserDTO user) {
		try {
			user.setUid((int)session.getAttribute("UID"));
			if (user.getPassword().isEmpty() || user.getPassword() == null) {
				uService.updateUserWithoutPW(user);
			}
			else uService.updateUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("message", "사용자 정보가 수정되었습니다.");
		request.setAttribute("url", "/userInfo");

		return "alert";
	}
	
	@PostMapping("/deleteuser")
	public String userDelete(HttpSession session, HttpServletRequest request, @ModelAttribute UserDTO user) {
		try {
			uService.delUser(user);
			
			if (session.getAttribute("UID") == null) {
				session.removeAttribute("UID");
			}
			request.setAttribute("message", "사용자가 삭제되었습니다.");
			request.setAttribute("url", "/login");
			return "alert";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
