package kr.co.joinus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.joinus.dto.StoreDTO;

@Repository
@Mapper
public interface StoreDAO{
	List<StoreDTO> getAll();
	List<StoreDTO> getSearch(String data);
	StoreDTO getOne(int store_number);
	void raiseHits(int no);
	
}
