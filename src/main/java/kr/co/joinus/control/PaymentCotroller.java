package kr.co.joinus.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.joinus.dto.PaymentDTO;
import kr.co.joinus.service.PaymentService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PaymentCotroller {
	
	@Autowired
	private PaymentService paymentService; 
	
	
	
	@PostMapping("/payment")
	public String payment(@RequestParam("store_number")int store_number, Model model) {
		
		List<PaymentDTO> list = paymentService.getOne(store_number); 
		
		log.info(">>>>>>>>>>>store_number : " + store_number);
		
		model.addAttribute("list", list );
		
		return "payment";
		
	}
	
	
}
