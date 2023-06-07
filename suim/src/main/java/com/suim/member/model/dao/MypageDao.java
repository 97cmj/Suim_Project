package com.suim.member.model.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.suim.board.model.vo.Board;
import com.suim.common.model.vo.PageInfo;
import com.suim.member.model.vo.Wish;

@Repository
public class MypageDao {


	public int selectBoardListCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("mypageMapper.selectBoardListCount", memberId);

	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, String memberId) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // offset : 건너뛸 숫자
		int limit = pi.getBoardLimit(); // limit : 조회할 갯수

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("mypageMapper.selectBoardList", memberId, rowBounds);
	}

	public int selectFindListCount(SqlSessionTemplate sqlSession, String memberId) {

		return sqlSession.selectOne("mypageMapper.selectFindListCount", memberId);

	}

	public ArrayList<Board> selectFindList(SqlSessionTemplate sqlSession, PageInfo pi, String memberId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // offset : 건너뛸 숫자
		int limit = pi.getBoardLimit(); // limit : 조회할 갯수
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFindList", memberId, rowBounds);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int[] intArray, String memberId) {
		Map<String, Object> member = new HashMap<>();
		member.put("memberId", memberId);
		member.put("intArray", intArray);
		
		return sqlSession.update("mypageMapper.deleteBoard", member);
	}

	public int selectWishListCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("mypageMapper.selectWishListCount", memberId);
	}

	public ArrayList<Wish> selectWishList(SqlSessionTemplate sqlSession, PageInfo pi, String memberId) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // offset : 건너뛸 숫자
		int limit = pi.getBoardLimit(); // limit : 조회할 갯수
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectWishList", memberId, rowBounds);
	}

}
