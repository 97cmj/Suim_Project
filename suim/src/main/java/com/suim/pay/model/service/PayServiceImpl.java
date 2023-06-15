package com.suim.pay.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suim.house.model.service.HouseService;
import com.suim.pay.model.dao.PayDao;

@Service
public class PayServiceImpl implements PayService {
	@Autowired
	private PayDao payDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	
	
	
	
	
}
