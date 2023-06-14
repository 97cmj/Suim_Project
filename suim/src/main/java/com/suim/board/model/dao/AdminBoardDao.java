package com.suim.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.suim.board.model.vo.Board;

@Repository
public class AdminBoardDao {

	public ArrayList<Board> adminBoardList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminBoardMapper.selectBoardList");
	}
	
}
