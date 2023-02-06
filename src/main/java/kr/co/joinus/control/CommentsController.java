package kr.co.joinus.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.joinus.dto.CommentsDTO;
import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.dto.UsersDTO;
import kr.co.joinus.service.CommentsService;
import kr.co.joinus.service.MeetingService;
import kr.co.joinus.service.UsersService;



@Controller
public class CommentsController {
	
	@Autowired
	MeetingService service;
	
	@Autowired
	CommentsService commentsservice;
	
	@Autowired
	UsersService usersservice;
	
	@PostMapping("/meeting/comments_write")
	public String WriteOk(@ModelAttribute("dto")CommentsDTO dto,
						@RequestParam("meeting_number")int meeting_number,
						  Model model) {			
		
		//미팅 등록
		commentsservice.add(dto);
				
		return "redirect:/meeting/detail?meeting_number="+dto.getMeeting_number();		
	}
	
	@GetMapping("/meeting/comments_delete")
	public String delete(@RequestParam("comments_number")int comments_number,
						@RequestParam("meeting_number")int meeting_number, Model model) {

		CommentsDTO dto = commentsservice.selectOne(comments_number);
		
		model.addAttribute("dto", dto);
		
		commentsservice.deleteOne(comments_number);
		return "redirect:/meeting/detail?meeting_number="+dto.getMeeting_number();
	}
	
	@GetMapping("/meeting/comments_modi")
	public String modifyForm(@RequestParam("comments_number")int comments_number,
							@RequestParam("meeting_number")int meeting_number, Model model) {
		
		MeetingDTO dto = service.selectOne(meeting_number);
		List<CommentsDTO> list = commentsservice.selectList(meeting_number);
		
		CommentsDTO dto2 = commentsservice.selectOne(comments_number);
		
		model.addAttribute("dto", dto);
		model.addAttribute("dto2", dto2);
		model.addAttribute("list", list);
				
		return "comments_modi";
	}
	
	@PostMapping("/meeting/comments_modi")
	public String modifyOk(@RequestParam("comments_number")int comments_number,
							@ModelAttribute("dto")CommentsDTO dto) {
		
		commentsservice.updateOne(dto);
		
		System.out.println(dto);

		return "redirect:/meeting/detail?meeting_number="+dto.getMeeting_number();
	}
	
}
