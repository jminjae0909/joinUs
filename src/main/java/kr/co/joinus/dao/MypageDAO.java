package kr.co.joinus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.dto.StartEnd;

@Repository
@Mapper
public interface MypageDAO {
	List<MeetingDTO> mypageReadAll(StartEnd se);
	int getTotal(String users_id);
}
