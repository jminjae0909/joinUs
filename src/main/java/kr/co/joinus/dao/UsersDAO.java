package kr.co.joinus.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.joinus.dto.UsersDTO;

@Repository
@Mapper
public interface UsersDAO {

	UsersDTO getMemberFindByEmail(String email);
	UsersDTO getMemberFindById(String id);
	void insertOne(UsersDTO dto);
	int isExistId(String id);
	void insertEmailOnly(UsersDTO dto);
}
