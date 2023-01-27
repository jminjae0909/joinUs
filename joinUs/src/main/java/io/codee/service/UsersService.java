package io.codee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.codee.dao.UsersDAO;
import io.codee.dto.UsersDTO;

@Service
public class UsersService {

	@Autowired
	UsersDAO dao;
	
	public UsersDTO getMemberByEmail(String email) {
		return dao.getMemberFindByEmail(email);
	}
	
	public void addUsers(UsersDTO dto) {
		dao.insertOne(dto);
	}
}
