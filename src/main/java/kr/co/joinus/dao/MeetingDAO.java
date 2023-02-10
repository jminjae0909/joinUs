package kr.co.joinus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.joinus.dto.MeetingDTO;

@Repository
@Mapper
public interface MeetingDAO {
	List<MeetingDTO> getAll();
	List<MeetingDTO> getAllComplete();
	
	List<MeetingDTO> getCategoryCheck(int category);
	
	List<MeetingDTO> getAllCheck(int category);
	List<MeetingDTO> getAllCompleteCheck(int category);
	
	List<MeetingDTO> getSearch(String data);	
	void insertOne(MeetingDTO dto);
	
	MeetingDTO getOne(int meeting_number); 
	
	void updateOne(MeetingDTO dto);
	void deleteOne(int meeting_number);
	void raiseHits(int meeting_number);
	int getTotal();
	
	List<MeetingDTO> getSkill(String skill);
	
	List<MeetingDTO> getHitsAll();
}
