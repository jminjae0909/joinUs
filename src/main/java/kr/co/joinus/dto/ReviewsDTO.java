package kr.co.joinus.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewsDTO {
	
	private int reviews_number;
	private String users_id;
	private int meeting_number;
	private String reviews_title;
	private String reviews_contents;
	private String reviews_evaluation;
	private String reviews_date;
	
}
