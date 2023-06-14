package com.suim.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suim.board.model.dao.AdminBoardDao;
import com.suim.board.model.vo.Board;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	private AdminBoardDao adminBoardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Board> adminBoardList() {
		return adminBoardDao.adminBoardList(sqlSession);
	}

}
