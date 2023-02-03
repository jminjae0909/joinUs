package kr.co.joinus.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.joinus.dto.UsersDTO;
import kr.co.joinus.service.UsersService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
	
	@Autowired
	UsersService service;

	@GetMapping("/login")
	public String login() {
		return "login/loginForm";
	}
	
	@PostMapping("/login")
	public String registForm(@RequestParam("users_id") String id, HttpSession session, HttpServletResponse resp) throws IOException {
		UsersDTO dto = service.getMemberByEmail(id);
		int result = service.isExistId(id);
		if(dto == null && result == 0) {
			return "regist/registForm";
		}else {
			session.setAttribute("dto", dto);
			return "main";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}
}
