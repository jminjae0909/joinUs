package kr.co.joinus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.joinus.dao.UsersDAO;
import kr.co.joinus.dto.UsersDTO;

@Service
public class UsersService {
	
	@Autowired
	UsersDAO dao;
	
	public List<UsersDTO> selectAll(){
		return dao.selectAll();
	}
	
	public void deleteOne(String id) {
		dao.deleteOne(id);
	}
	
	public UsersDTO getMemberByEmail(String email) {
		return dao.getMemberFindByEmail(email);
	}
	
	public UsersDTO getMemberFindByEmailsearch(String email) {
		return dao.getMemberFindByEmailsearch(email);
	}
	
	public UsersDTO getMemberByEmailAndSns(String email, String clientName) {
		return dao.getMemberFindByEmailAndSns(email, clientName);
	}
	
	public UsersDTO getMemberFindById(String id) {
		return dao.getMemberFindById(id);
	}
	
	public int isExistId(String id) {
		return dao.isExistId(id);
	}
	
	public int isExistEmail(String email) {
		return dao.isExistEmail(email);
	}
	
	public void insertOne(UsersDTO dto) {
		dao.insertOne(dto);
	}

}
