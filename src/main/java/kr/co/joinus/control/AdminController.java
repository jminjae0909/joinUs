package kr.co.joinus.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.dto.UsersDTO;
import kr.co.joinus.service.MeetingService;
import kr.co.joinus.service.UsersService;

@Controller
public class AdminController {
	
	@Autowired
	UsersService service;
	
	@Autowired
	MeetingService service2;
	
	@GetMapping("/admin")
	public String admin() {
		return "admin/adminMain";
	}
	
	@GetMapping("/adminProject")
	public String adminProject(Model model) {
		List<MeetingDTO> list = service2.getCategoryCheck(0);
		model.addAttribute("list", list);
		return "admin/adminProject";
	}
	
	@GetMapping("/adminProjectDelete")
	public String adminProjectDelete(@RequestParam("no") int meeting_number, Model model) {
		service2.deleteOne(meeting_number);
		List<MeetingDTO> list = service2.getCategoryCheck(0);
		model.addAttribute("list", list);
		return "admin/adminProject";
	}
	
	@GetMapping("/adminStudy")
	public String adminStudy(Model model) {
		List<MeetingDTO> list = service2.getCategoryCheck(1);
		model.addAttribute("list", list);
		return "admin/adminStudy";
	}
	
	@GetMapping("/adminStudyDelete")
	public String adminStudyDelete(@RequestParam("no") int meeting_number, Model model) {
		service2.deleteOne(meeting_number);
		List<MeetingDTO> list = service2.getCategoryCheck(1);
		model.addAttribute("list", list);
		return "admin/adminStudy";
	}
	
	@GetMapping("/adminUsers")
	public String adminUsers(Model model) {
		List<UsersDTO> list = service.selectAll();
		model.addAttribute("list", list);
		return "admin/adminUsers";
	}
	
	@GetMapping("/adminUsersModify")
	public String adminUsersModify() {
		return "admin/adminUsersModify";
	}
	
	@GetMapping("/adminUsersDelete")
	public String adminUsersDelete(@RequestParam("id") String id) {
		service.deleteOne(id);
		return "admin/adminUsers";
	}
}
