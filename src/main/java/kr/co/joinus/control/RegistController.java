package kr.co.joinus.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RegistController {

	@GetMapping("/regist")
	public String regist(HttpServletRequest req, Model model) {
		String email = (String)req.getSession().getAttribute("email");
		System.out.println("이메일 세션 확인: "+email);
		model.addAttribute("email", email);
		return "regist/registForm";
	}
}
