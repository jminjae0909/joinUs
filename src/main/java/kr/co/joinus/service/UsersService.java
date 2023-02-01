package kr.co.joinus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.joinus.dao.UsersDAO;
import kr.co.joinus.dto.UsersDTO;

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
	
	public UsersDTO isExistId(String id) {
		return dao.isExistId(id);
	}
	
	public void insertEmailOnly(UsersDTO dto) {
		dao.insertEmailOnly(dto);
	}
	
	public void insertOne(UsersDTO dto) {
		dao.insertOne(dto);
	}

}
