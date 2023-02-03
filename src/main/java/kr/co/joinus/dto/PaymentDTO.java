package kr.co.joinus.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PaymentDTO {
	//뷰로 전달받을 값 
	private String users_id;
	private int store_number;
	
	//db로 꺼내올 값
	private int payment_number;
	private String payment_date;
	
}
