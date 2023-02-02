package kr.co.joinus.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.service.MeetingService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/joinus")
public class MainController {
	
	@Autowired
	MeetingService service;
	
	@GetMapping(value = {"", "main"})
	public String list(Model model) {
		
		List<MeetingDTO> list = service.getAll();
		
		log.info("list >>>>>>>>>>>>>>> : " + list);
		model.addAttribute("list", list);
		
		return "main";
	}
	
	@GetMapping("distinction")
	public String list_All(
			Model model, 
			@RequestParam("state")int state,
			@RequestParam("category")String category) {

		List<MeetingDTO> list = null;
		
		if(state==0) {
			if(category.equals("전체")) {
				list = service.getAll();
			}else {
				list = service.getAllCheck(Integer.parseInt(category)-1);
			}
			
		}else {
			if(category.equals("전체")) {
				list = service.getAllComplete();
			}else {
				list = service.getAllCompleteCheck(Integer.parseInt(category)-1);
			}
		}
		
		
		log.info("list >>>>>>>>>>>>>>> : " + list);
		model.addAttribute("list", list);
		
		return "change_list";
	}

	@GetMapping("search")
	public String list(Model model, @RequestParam("word")String word) {
		
		List<MeetingDTO> list = service.getSearch(word);
		
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
