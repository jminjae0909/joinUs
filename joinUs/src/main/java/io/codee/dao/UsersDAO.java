package io.codee.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.codee.dto.UsersDTO;

@Repository
@Mapper
public interface UsersDAO {

	UsersDTO getMemberFindByEmail(String email);
	void insertOne(UsersDTO dto);
}
