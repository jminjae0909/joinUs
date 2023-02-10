package kr.co.joinus.control;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.cj.Session;

import kr.co.joinus.dto.FavoritesDTO;
import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.dto.ReviewsDTO;
import kr.co.joinus.dto.UsersDTO;
import kr.co.joinus.service.MeetingService;
import kr.co.joinus.service.MypageService;
import kr.co.joinus.service.UsersService;
import kr.co.joinus.util.PageUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/joinus")
public class MyPageController {
	
	@Autowired
	MypageService service;
	
	@Autowired
	UsersService service2;
	
	
	@GetMapping("mypage")
	public String mypage() {
		
		return "mypage";
	}

	@GetMapping("mypageMeetingList")
	public String list(Model model, 
			// @RequestParam(name = "파라미터명", defaultValue = "생략시 기본값")int 변수명) {
			@RequestParam(name = "cp", defaultValue = "1")int currentPage,
			@RequestParam("users_id")String users_id) {
		
		log.info("cp : " + currentPage + " / users_id : " + users_id);
		int totalNumber = service.getMeetingTotal(users_id);
		
		// 페이지당 게시물 수
		int recordPerPage = 10;
							// 총페이지수,	  한페이지당 수,	 현재페이지
		Map<String, Object> map = PageUtil.getPageData(totalNumber, recordPerPage, currentPage);
		int startNo = (int)map.get("startNo")-1;
		int endNo = (int)map.get("endNo");
		
		List<MeetingDTO> list = service.mypageReadAll(startNo, endNo, users_id);
		
		log.info("mypageList {} " ,list);
		log.info("users_id : " + users_id);
		log.info("totalNumber : " + totalNumber + " / startNo : "+startNo + " / endNo : "+ endNo);
		log.info("isPre : " + map.get("isPre") + " / isNext : "+map.get("isNext"));
		log.info("endPage : " + map.get("endPage"));
		
		model.addAttribute("mypageList", list);
		model.addAttribute("mypageMap", map);
		
		return "/mypage/meeting_list";
	}
	
	@GetMapping("mypageFavoritesList")
	public String favorites(Model model, 
			// @RequestParam(name = "파라미터명", defaultValue = "생략시 기본값")int 변수명) {
			@RequestParam(name = "cp", defaultValue = "1")int currentPage,
			@RequestParam("users_id")String users_id) {
		
		log.info("cp : " + currentPage + " / users_id : " + users_id);
		int totalNumber = service.getFavoritesTotal(users_id);
		
		// 페이지당 게시물 수
		int recordPerPage = 10;
							// 총페이지수,	  한페이지당 수,	 현재페이지
		Map<String, Object> map = PageUtil.getPageData(totalNumber, recordPerPage, currentPage);
		int startNo = (int)map.get("startNo")-1;
		int endNo = (int)map.get("endNo");
		
		List<FavoritesDTO> list = service.mypageFavorites(startNo, endNo, users_id);
				
		log.info("mypageList {} " ,list);
		log.info("users_id : " + users_id);
		log.info("totalNumber : " + totalNumber + " / startNo : "+startNo + " / endNo : "+ endNo);
		log.info("isPre : " + map.get("isPre") + " / isNext : "+map.get("isNext"));
		log.info("endPage : " + map.get("endPage"));
		
		model.addAttribute("mypageList", list);
		model.addAttribute("mypageMap", map);
		
		
		return "/mypage/favorites_list";
	}
	
	
	@GetMapping("mypageFavoritesDelete")
	public String delete(@RequestParam("favorites_number")int favorites_number) {
		log.info("favorites_number : " + favorites_number);
		service.deleteOne(favorites_number);
		return "redirect:/joinus/mypage";
	}
	
	@GetMapping("/reviewsWrite")
	public String wirteForm() {
		return "/reviewsWriteForm";
	}

	@PostMapping("/reviewsWrite")
	public String WriteOk(@ModelAttribute("dto")ReviewsDTO dto) {			

		//미팅 등록
		log.info("dto : " + dto);
		service.addReivews(dto);
		
				
		return "redirect:/joinus/main";		
	}
	
	@GetMapping("/mypageBean")
	public String bean(@RequestParam("water")int water,
			@RequestParam("bean")int bean,
			@RequestParam("users_id")String users_id,
			HttpSession session) {
		
		UsersDTO dto = service2.getMemberFindById(users_id);
		dto.setUsers_water(water);
		dto.setUsers_bean(bean);
		
		service.waterBean(dto);
		
		session.setAttribute("ldto", dto);
		
		return "/mypage/myBean";
	}
}
