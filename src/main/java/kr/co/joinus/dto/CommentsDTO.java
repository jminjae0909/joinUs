package kr.co.joinus.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommentsDTO {
	
	private int comments_number;
	private String users_id;
	private int meeting_number;
	private String comments_contents;
	private String comments_date;
	
	

}
