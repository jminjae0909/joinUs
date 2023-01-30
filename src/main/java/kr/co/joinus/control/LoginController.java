package kr.co.joinus.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.joinus.dto.UsersDTO;
import kr.co.joinus.service.UsersService;

@Controller
public class LoginController {
	
	@Autowired
	UsersService service;

	@GetMapping("/login")
	public String login() {
		return "login/loginForm";
	}
	
	@PostMapping("/login")
	public String registForm(@RequestParam("users_id") String id, HttpSession session) {
		UsersDTO dto = service.getMemberByEmail(id);
		if(dto == null) {
			return "regist/registForm";
		}else {
			session.setAttribute("dto", dto);
			return "main";
		}
		
	}
}
