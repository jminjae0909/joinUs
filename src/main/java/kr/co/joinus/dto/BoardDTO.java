package kr.co.joinus.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDTO {
	private int meeting_number;
	private String users_id;
	private String meeting_insertdate;
	private String meeting_title;
	private String meeting_contents;
	private int meeting_state;
	private int meeting_hits;
	private int meeting_membernum;
	private String meeting_contact;
	private String meeting_onoff;
	private String meeting_startdate;
	private String meeting_period;
	private String meeting_place;
	private int meeting_category;
	
}
