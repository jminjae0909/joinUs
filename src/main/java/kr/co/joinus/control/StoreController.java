package kr.co.joinus.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.joinus.dto.StoreDTO;
import kr.co.joinus.service.StoreService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {

	@Autowired
	StoreService service;
	
	@GetMapping("/storehome")
	public String home(Model model) {
		model.addAttribute("list", service.getAll());
		log.info(">>>>>>>>>>" + service.getAll());
		return "storehome";
	}
	
	@GetMapping("search")
	public String home(Model model, @RequestParam("data")String data) {
		
		System.out.println(data);
		List<StoreDTO> list = service.getSearch(data);
		
		log.info("list>>>>>>>>>>:" + list);
		model.addAttribute("list",list);
		return "storehome";
	}
	
	@GetMapping("/getStore")
	public String getStore(@RequestParam("store_number")int store_number, Model model) {
		StoreDTO dto = service.getOne(store_number);
		
		model.addAttribute("dto", dto);
		
		return "storedetail";
	}

}