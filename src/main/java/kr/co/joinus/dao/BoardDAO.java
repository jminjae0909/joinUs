package kr.co.joinus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.joinus.dto.BoardDTO;

@Repository
@Mapper
public interface BoardDAO {
	List<BoardDTO> getAll();
	List<BoardDTO> getSearch(String data);
	void insertOne(BoardDTO dto);
	
	BoardDTO getOne(int meeting_number); 
	
	void updateOne(BoardDTO dto);
	void deleteOne(int meeting_number);
	void raiseHits(int meeting_number);
	int getTotal();
}
