package kr.co.joinus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.joinus.dto.AttendanceDTO;
import kr.co.joinus.dto.FavoritesDTO;
import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.dto.ReviewsDTO;
import kr.co.joinus.dto.StartEnd;
import kr.co.joinus.dto.UsersDTO;

@Repository
@Mapper
public interface AttendanceDAO {

	void addAttend(String users_id);
	
	AttendanceDTO getOneAttend(String users_id);
	
	void waterUpdate(String users_id);
}
