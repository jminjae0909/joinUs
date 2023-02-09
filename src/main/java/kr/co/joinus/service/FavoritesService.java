package kr.co.joinus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.joinus.dao.FavoritesDAO;
import kr.co.joinus.dto.FavoritesDTO;

@Service
public class FavoritesService {
	
	@Autowired
	private FavoritesDAO dao;
	
	public void add(FavoritesDTO dto) {
		dao.addOne(dto);
	}
	
	public FavoritesDTO selectOne(int meeting_number, String users_id) {
		return dao.getOne(meeting_number, users_id);
	}
	
	public void deleteOne(int meeting_number, String users_id) {
		dao.deleteOne(meeting_number, users_id);
	}
	
	public void deleteOne2(int meeting_number) {
		dao.deleteOne2(meeting_number);
	}

}
