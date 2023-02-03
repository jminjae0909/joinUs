package kr.co.joinus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.joinus.dto.PaymentDTO;



@Repository
@Mapper
public interface PaymentDAO {
	
	List<PaymentDTO> getOne(int store_number);

	
	//insert
	void insertOne (PaymentDTO dto);
	
	
	

}
