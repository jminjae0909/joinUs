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

@Controller
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
		if(dto == null) {
			PrintWriter out = resp.getWriter();
			out.println("<script> alert('등록된 회원이 아닙니다. 회원가입 페이지로 이동합니다') </script>");
			return "regist/registForm";
		}else {
			session.setAttribute("dto", dto);
			return "main";
		}
		
	}
}
