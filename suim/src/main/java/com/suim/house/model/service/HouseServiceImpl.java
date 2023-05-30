package com.suim.house.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suim.house.model.dao.HouseDao;
import com.suim.house.model.vo.House;

@Service
public class HouseServiceImpl implements HouseService {
	@Autowired
	private HouseDao houseDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public House selectHouse(int hno) {
	  return houseDao.selectHouse(sqlSession, hno);
	}

}
