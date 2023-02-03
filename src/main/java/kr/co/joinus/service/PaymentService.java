package kr.co.joinus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.joinus.dao.PaymentDAO;
import kr.co.joinus.dto.PaymentDTO;


@Service
public class PaymentService {

	@Autowired
	private PaymentDAO dao;

	public List<PaymentDTO> getOne(int store_number){
		return dao.getOne(store_number);
	}
	
	//추가메서드
	//메개변수 paymentDTO 로 받기 
	public void add(PaymentDTO dto) {
		dao.insertOne(dto);
	}
	
	//paymentDAO
}
