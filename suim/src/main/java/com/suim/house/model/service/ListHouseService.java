package com.suim.house.model.service;

import java.util.ArrayList;

import com.suim.house.model.vo.House;

public interface ListHouseService {
	

	// 건물 정보조회 서비스
	ArrayList<House> selectList();

}
