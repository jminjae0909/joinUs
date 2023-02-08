package kr.co.joinus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.joinus.dto.FavoritesDTO;
import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.dto.ReviewsDTO;
import kr.co.joinus.dto.StartEnd;

@Repository
@Mapper
public interface MypageDAO {
	List<MeetingDTO> mypageReadAll(StartEnd se);
	int getMeetingTotal(String users_id);
	
	List<FavoritesDTO> mypageFavorites(StartEnd se);
	int getFavoritesTotal(String users_id);
	
	String getMeetingTitle(int meeting_number);
	
	void deleteOne(int favorites_number);

	void addReivews(ReviewsDTO dto);
}
