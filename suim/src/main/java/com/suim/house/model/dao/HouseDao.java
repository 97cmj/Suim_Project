package com.suim.house.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.suim.house.model.vo.House;

@Repository
public class HouseDao {

	public House selectHouse(SqlSessionTemplate sqlSession, int hno) {
		return sqlSession.selectOne("houseMapper.selectHouse", hno);
	}
}
