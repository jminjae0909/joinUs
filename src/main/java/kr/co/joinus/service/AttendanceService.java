package kr.co.joinus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.joinus.dao.AttendanceDAO;
import kr.co.joinus.dao.MeetingDAO;
import kr.co.joinus.dto.AttendanceDTO;
import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.dto.UsersDTO;

@Service
public class AttendanceService {

	@Autowired
	private AttendanceDAO dao;
	// @Autowired
	// private TestDAO dao2;


	public void addAttend(String users_id) {
		dao.addAttend(users_id);
	}


	public AttendanceDTO getOneAttend(String users_id) {
		
		return dao.getOneAttend(users_id);
	}
	
	public void waterUpdate(String users_id) {
		dao.waterUpdate(users_id);
	}

}
