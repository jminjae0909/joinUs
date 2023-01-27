package kr.co.joinus.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.service.MeetingService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/joinus")
public class MainController {
	
	@Autowired
	MeetingService service;
	
	@GetMapping("main")
	public String list(Model model) {
		
		List<MeetingDTO> list = service.getAll();
		
		log.info("list >>>>>>>>>>>>>>> : " + list);
		model.addAttribute("list", list);
		
		return "main";
	}
	
	@GetMapping("search")
	public String list(Model model, @RequestParam("data")String data) {
		
		System.out.println(data);
		List<MeetingDTO> list = service.getSearch(data);
		
		log.info("list >>>>>>>>>>>>>>> : " + list);
		model.addAttribute("list", list);
		
		return "main";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam("meeting_number")int meeting_number, Model model) {
		MeetingDTO dto = service.selectOne(meeting_number);
		
		log.info("one >>>>>>>>>>>>>>>> : " + dto);
		
		model.addAttribute("dto", dto);
		return "detail";
		
	}
}
