package kr.co.joinus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.joinus.dto.CommentsDTO;

@Repository
@Mapper
public interface CommentsDAO {
	
	void insertOne(CommentsDTO dto);
	List<CommentsDTO> getAll();
	List<CommentsDTO> getlist(int meeting_number);
	void updateOne(CommentsDTO dto);
	void deleteOne(int comments_number);
	CommentsDTO getOne(int comments_number);
	void deletemnum(int meeting_number);
	
	
}
