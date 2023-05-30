package com.suim.house.model.service;

import com.suim.house.model.vo.House;

public interface HouseService {

	// 게시글 상세 조회
		House selectHouse(int hno);
}
