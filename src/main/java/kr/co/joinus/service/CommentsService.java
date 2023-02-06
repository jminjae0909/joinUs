package kr.co.joinus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.joinus.dao.CommentsDAO;
import kr.co.joinus.dto.CommentsDTO;

@Service
public class CommentsService {

	@Autowired
	private CommentsDAO dao;
	
	public void add(CommentsDTO dto) {
		dao.insertOne(dto);
	}
	
	public List<CommentsDTO> selectAll(){
		return dao.getAll();
	}
	
	public List<CommentsDTO> selectList(int meeting_number) {
		return dao.getlist(meeting_number);
	}
	
	public void updateOne(CommentsDTO dto) {
		dao.updateOne(dto);
	}
	
	public void deleteOne(int comments_number) {
		dao.deleteOne(comments_number);
	}
	
	public CommentsDTO selectOne(int comments_number) {
		return dao.getOne(comments_number);
	}
}
