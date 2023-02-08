package kr.co.joinus.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.joinus.dto.FavoritesDTO;
import kr.co.joinus.service.FavoritesService;

@Controller
public class FavoritesController {
	
	@Autowired
	FavoritesService favoritesService;
	
	@PostMapping("/meeting/favorites_add")
	public String addOk(@ModelAttribute("dto")FavoritesDTO dto,
						@RequestParam("meeting_number")int meeting_number,
						  Model model,
						@RequestParam("users_id")String users_id) {
		
		favoritesService.add(dto);
		
		return "redirect:/meeting/detail?meeting_number="+dto.getMeeting_number()+"&users_id="+users_id;
		
	}
	
	@GetMapping("/meeting/favorites_delete")
	public String delete(@RequestParam("meeting_number")int meeting_number,
						Model model,
						@RequestParam("users_id")String users_id) {
		
		favoritesService.deleteOne(meeting_number, users_id);
		
		return "redirect:/meeting/detail?meeting_number="+meeting_number+"&users_id="+users_id;
	}
}
