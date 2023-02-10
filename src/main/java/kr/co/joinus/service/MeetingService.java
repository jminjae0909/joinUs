package kr.co.joinus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.joinus.dao.MeetingDAO;
import kr.co.joinus.dto.MeetingDTO;

@Service
public class MeetingService {

	@Autowired
	private MeetingDAO dao;
	// @Autowired
	// private TestDAO dao2;

	public List<MeetingDTO> getAll() {

		return dao.getAll();
	}

	public List<MeetingDTO> getAllComplete() {
		return dao.getAllComplete();
	}

	public List<MeetingDTO> getAllCheck(int category) {
		return dao.getAllCheck(category);
	}
	
	public List<MeetingDTO> getCategoryCheck(int category){
		return dao.getCategoryCheck(category);
	}
	
	public List<MeetingDTO> getAllCompleteCheck(int category) {
		return dao.getAllCompleteCheck(category);
	}

	public void add(MeetingDTO dto) {
		dao.insertOne(dto);
	}

	public List<MeetingDTO> getSearch(String data) {

		return dao.getSearch(data);
	}

	public MeetingDTO selectOne(int meeting_number) {
		dao.raiseHits(meeting_number);
		return dao.getOne(meeting_number);
	}

	public void updateOne(MeetingDTO dto) {
		dao.updateOne(dto);
	}

	public void deleteOne(int meeting_number) {
		dao.deleteOne(meeting_number);
	}

	public int getTotal() {
		return dao.getTotal();
	}
	
	public List<MeetingDTO> getSkill(String skill) {
		
		return dao.getSkill(skill);
	}
	
	public List<MeetingDTO> getHitsAll(){
		
		return dao.getHitsAll();
	}

}
