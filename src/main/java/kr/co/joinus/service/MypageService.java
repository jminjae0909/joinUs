package kr.co.joinus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.joinus.dao.MypageDAO;
import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.dto.StartEnd;

@Service
public class MypageService {
	
	@Autowired
	private MypageDAO dao;

	public List<MeetingDTO> mypageReadAll(int startNo, int endNo, String users_id) {
		StartEnd se = new StartEnd(startNo, endNo, users_id);
		
		return dao.mypageReadAll(se);
	}	
	
	public int getTotal(String users_id) {
		return dao.getTotal(users_id);
	}
}
