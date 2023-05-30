package com.suim.house.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suim.house.model.dao.ListHouseDao;
import com.suim.house.model.vo.House;

@Service
public class ListHouseServiceImpl implements ListHouseService{

	@Autowired
	private ListHouseDao listHouseDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<House> selectList() {
		return listHouseDao.selectList(sqlSession);
	}
	
	

}
