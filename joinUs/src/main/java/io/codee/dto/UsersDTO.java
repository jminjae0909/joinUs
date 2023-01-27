package io.codee.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UsersDTO {
	
	private String users_id;
	private String users_pwd;
	private String users_name;
	private String users_phone;
	private String users_email;
	private String users_nick;
	private String users_insertdate;
	private String users_addrs;
	private int users_water;
	private int users_bean;
	private int users_score;
	private String users_image;
}
