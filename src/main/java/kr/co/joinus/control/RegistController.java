package kr.co.joinus.control;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.joinus.dto.UsersDTO;
import kr.co.joinus.service.UsersService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RegistController {

	@Autowired
	UsersService service;

	@GetMapping("/regist")
	public String registIm() {
		return "regist/registForm";
	}

	@GetMapping("/registWithSns")
	public String regist(HttpServletRequest req, Model model) throws IOException {
		Map<String, String> map = (Map<String, String>) req.getSession().getAttribute("registSns");
		String clientName = (String) map.get("clientName");
		String email = (String) map.get("email");
		log.info("sns 종류: {}", clientName);
		log.info("이메일: {}", email);
		
		int idx = email.indexOf("@");
		String emailId = email.substring(0, idx);
		String emailDomain = email.substring(idx + 1);
		model.addAttribute("emailId", emailId);
		model.addAttribute("emailDomain", emailDomain);
		model.addAttribute("clientName", clientName);
		return "regist/registForm";
	}

	@ResponseBody
	@GetMapping("/isExistId")
	public int isExistId(@RequestParam("users_id") String users_id) {

		int result = service.isExistId(users_id);

		return result;
	}

	@PostMapping("/regist")
	public String registOk(@RequestParam("email1") String email1, 
						   @RequestParam("email2") String email2,
						   @RequestParam("address") String address, 
						   @RequestParam("addrsDetail") String addrsDetail,
						   @RequestParam("clientName") String clientName,
						   @ModelAttribute("dto") UsersDTO dto) {
		String users_email = email1 + "@" + email2;
		String users_addrs = address + " " + addrsDetail;
		dto.setUsers_addrs(users_addrs);
		dto.setUsers_email(users_email);
		dto.setUsers_sns(clientName);
		service.insertOne(dto);
		log.info("dto: {}", dto);
		return "regist/registOk";
	}
}
