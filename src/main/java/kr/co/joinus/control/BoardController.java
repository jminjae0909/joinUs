package kr.co.joinus.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.joinus.dto.BoardDTO;
import kr.co.joinus.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@GetMapping("list")
	public String list(Model model) {
		
		List<BoardDTO> list = service.getAll();
		
		log.info("list >>>>>>>>>>>>>>> : " + list);
		model.addAttribute("list", list);
		
		return "list";
	}
	
	@GetMapping("search")
	public String list(Model model, @RequestParam("data")String data) {
		
		System.out.println(data);
		List<BoardDTO> list = service.getSearch(data);
		
		log.info("list >>>>>>>>>>>>>>> : " + list);
		model.addAttribute("list", list);
		
		return "list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam("meeting_number")int meeting_number, Model model) {
		BoardDTO dto = service.selectOne(meeting_number);
		
		log.info("one >>>>>>>>>>>>>>>> : " + dto);
		
		model.addAttribute("dto", dto);
		return "detail";
		
	}
}
