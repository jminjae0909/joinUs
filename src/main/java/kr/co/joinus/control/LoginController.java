package kr.co.joinus.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.joinus.dto.UsersDTO;
import kr.co.joinus.service.AttendanceService;
import kr.co.joinus.service.UsersService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
	
	@Autowired
	UsersService service;
	
	@Autowired
	AttendanceService service2;

	@GetMapping("/login")
	public String login() {
		return "login/loginForm";
	}
	
	@PostMapping("/login")
	public String registForm(@RequestParam("users_id") String id, HttpSession session, HttpServletResponse resp) throws IOException {
		UsersDTO dto = service.getMemberFindById(id);
		if(dto == null) {
			resp.setContentType("text/html; charset=euc-kr");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('회원정보가 없습니다. 회원가입 페이지로 이동합니다.'); </script>");
			out.flush();
			return "regist/registForm";
		}else {
			session.setAttribute("ldto", dto);
			
			if(service2.getOneAttend(id) == null) {
				service2.addAttend(id);
				service2.waterUpdate(id);	
			}
			
			return "main";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/joinus/main";
	}
	
	@GetMapping("/searchIdPw")
	public String searchIdPW() {
		return "login/searchIdPw";
	}
	
	@ResponseBody
	@GetMapping("/isExistEmail")
	public int isExistEmail(@RequestParam("users_email") String users_email) {
		
		int result = service.isExistEmail(users_email);
		
		return result;
	}
	
	@ResponseBody
	@GetMapping("/viewIdPw")
	public Map<String, String> viewIdPw(@RequestParam("users_email") String users_email) {
		
		UsersDTO dto = service.getMemberByEmail(users_email);
		String id = (String)dto.getUsers_id();
		String pw = (String)dto.getUsers_pwd();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		return map;
	}
}
