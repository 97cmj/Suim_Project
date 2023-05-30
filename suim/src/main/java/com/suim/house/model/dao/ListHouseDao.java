package com.suim.house.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.suim.house.model.vo.House;

@Repository
public class ListHouseDao {

		public ArrayList<House> selectList(SqlSessionTemplate sqlSession) {
				
				return (ArrayList)sqlSession.selectList("houseMapper.selectList");
				
			}
	
	
}
