package kr.co.joinus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.joinus.dao.MypageDAO;
import kr.co.joinus.dto.FavoritesDTO;
import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.dto.ReviewsDTO;
import kr.co.joinus.dto.StartEnd;
import kr.co.joinus.dto.UsersDTO;

@Service
public class MypageService {
	
	@Autowired
	private MypageDAO dao;

	public List<MeetingDTO> mypageReadAll(int startNo, int endNo, String users_id) {
		StartEnd se = new StartEnd(startNo, endNo, users_id);
		
		return dao.mypageReadAll(se);
	}	
	
	public int getMeetingTotal(String users_id) {
		return dao.getMeetingTotal(users_id);
	}
	
	public List<FavoritesDTO> mypageFavorites(int startNo, int endNo, String users_id) {
		StartEnd se = new StartEnd(startNo, endNo, users_id);
		
		return dao.mypageFavorites(se);
	}
	
	public int getFavoritesTotal(String users_id) {
		return dao.getFavoritesTotal(users_id);
	}
	
	public String getMeetingTitle(int meeting_number) {
		return dao.getMeetingTitle(meeting_number);
	}	
	
	public void deleteOne(int favorites_number) {
		dao.deleteOne(favorites_number);
	}
	
	public void addReivews(ReviewsDTO dto) {
		dao.addReivews(dto);
	}
	
	public void waterBean(UsersDTO dto) {
		dao.waterBean(dto);
	}
	
}
