package kr.co.joinus.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.joinus.dto.UsersDTO;
import kr.co.joinus.service.UsersService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RegistController {
	
	@Autowired
	UsersService service;

	@GetMapping("/regist")
	public String regist(HttpServletRequest req, Model model) {
		String email = (String)req.getSession().getAttribute("email");
		int idx = email.indexOf("@");
		String emailId = email.substring(0, idx);
		String emailDomain = email.substring(idx+1);
		System.out.println("이메일 세션 확인: "+email);
		model.addAttribute("emailId", emailId);
		model.addAttribute("emailDomain", emailDomain);
		return "regist/registForm";
	}
	
	@GetMapping("/isExistId")
	public String isExistId(@RequestParam("id") String id, HttpServletRequest req, HttpServletResponse resp) {
		
		UsersDTO dto = service.isExistId(id);
		boolean isExist = false;
		if(dto == null) {
			isExist = false;
		}else {
			isExist = true;
		}
		req.setAttribute("isExist", isExist);
		return "registForm";
	}
	
	@PostMapping("/regist")
	public String registOk(@RequestParam("email1")String email1, 
						   @RequestParam("email2") String email2, 
						   @RequestParam("address") String address,
						   @RequestParam("addrsDetail") String addrsDetail,
						   @ModelAttribute("dto") UsersDTO dto) {
		String users_email = email1+"@"+email2;
		String users_addrs = address+" "+addrsDetail;
		dto.setUsers_addrs(users_addrs);
		dto.setUsers_email(users_email);
		service.insertOne(dto);
		return "registOk";
	}
}
