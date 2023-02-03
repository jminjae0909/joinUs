package kr.co.joinus.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.service.MeetingService;
import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
@RequestMapping("/joinus")
public class MyPageController {
	
	@Autowired
	MeetingService service;

	@GetMapping("mypage")
	public String list(Model model) {
		
		List<MeetingDTO> list = service.getAll();
		
		log.info("list >>>>>>>>>>>>>>> : " + list);
		model.addAttribute("list", list);
		
		return "mypage";
	}
}
