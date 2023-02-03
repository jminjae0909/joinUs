package kr.co.joinus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.joinus.dao.StoreDAO;
import kr.co.joinus.dto.StoreDTO;


@Service
public class StoreService {
	@Autowired
	StoreDAO dao;
	
	public List<StoreDTO> getAll(){
		return dao.getAll();
	}
	
	public List<StoreDTO>getSearch(String data){
		return dao.getSearch(data);
	}
	
	public StoreDTO getOne(int store_number) {
		dao.raiseHits(store_number);
		
		return dao.getOne(store_number);
	}
}
