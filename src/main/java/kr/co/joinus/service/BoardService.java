package kr.co.joinus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.joinus.dao.BoardDAO;
import kr.co.joinus.dto.BoardDTO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO dao;
	// @Autowired
	// private TestDAO dao2;
	
	public List<BoardDTO> getAll() {
		
		return dao.getAll();
	}
	
	public List<BoardDTO> getSearch(String data) {
		
		return dao.getSearch(data);
	}
		
	public void add(BoardDTO dto) {
		dao.insertOne(dto);
	}
	
	public BoardDTO selectOne(int meeting_number) {
		dao.raiseHits(meeting_number);
		return dao.getOne(meeting_number);
	}
	
	public void updateOne(BoardDTO dto) {
		dao.updateOne(dto);
	}
	
	public void deleteOne(int meeting_number) {
		dao.deleteOne(meeting_number);
	}
	
	public int getTotal() {
		return dao.getTotal();
	}
}
