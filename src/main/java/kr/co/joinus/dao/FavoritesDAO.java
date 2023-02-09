package kr.co.joinus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.joinus.dto.FavoritesDTO;

@Repository
@Mapper
public interface FavoritesDAO {
	
	void addOne(FavoritesDTO dto);
	FavoritesDTO getOne(int meeting_number, String users_id);
	void deleteOne(int meeting_number, String users_id);
	void deleteOne2(int meeting_number);
}
