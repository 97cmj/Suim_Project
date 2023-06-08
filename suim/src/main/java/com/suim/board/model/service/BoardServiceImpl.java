package com.suim.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suim.board.model.dao.BoardDao;
import com.suim.board.model.vo.Battachment;
import com.suim.board.model.vo.Board;
import com.suim.board.model.vo.Find;
import com.suim.board.model.vo.Reply;
import com.suim.board.model.vo.findReply;
import com.suim.common.model.vo.PageInfo;
import com.suim.board.model.vo.InReview;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//------------------자유게시판-----------------------
	
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return boardDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Board b) {
		return boardDao.insertBoard(sqlSession, b);
	}
	@Override
	public int insertBattachment(Battachment ba) {
		return boardDao.insertBattachment(sqlSession, ba);
	}

	@Override
	public ArrayList<Board> selectbList() {
		return boardDao.selectbList(sqlSession);
	}

	@Override
	public int increaseCount(int boardNo) {
		return boardDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return boardDao.selectBoard(sqlSession, boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return boardDao.selectReplyList(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Reply r) {
		return boardDao.insertReply(sqlSession, r);
	}

	@Override
	public int ReplyCount(int boardNo) {
		
		
		return boardDao.ReplyCount(sqlSession, boardNo);
	}
	
	@Override
	public int updateBoard(Board b) {
		return boardDao.updateBoard(sqlSession, b);

	}
	
	@Override
	public Board updateBoardList(int boardNo) {
		return boardDao.updateBoardList(sqlSession, boardNo);
	}

	
	
	//------------------------------------------------
	//------------------사람구해요-----------------------
	
	@Override
	public int selectfListCount() {
		return boardDao.selectfListCount(sqlSession);
	}

	@Override
	public int selectfListCount(HashMap<String, String> fin) {
		return boardDao.selectfListCount(sqlSession, fin);
	}

	@Override
	public ArrayList<Find> selectfList(PageInfo pi) {
		return boardDao.selectfList(sqlSession, pi);
	}
	
	public ArrayList<Find> selectfList(PageInfo pi,HashMap<String, String> fin) {
		return boardDao.selectfList(sqlSession, pi,fin);
	}

	
	@Override
	public int increasefCount(int findNo) {
		return boardDao.increasefCount(sqlSession, findNo);
	}

	@Override
	public Find selectFind(int findNo) {
		return boardDao.selectFind(sqlSession, findNo);
	}
	@Override
	public int deleteFind(int findNo) {
		return boardDao.deleteFind(sqlSession, findNo);
	}

	@Override
	public ArrayList<findReply> selectfReplyList(int findNo) {
		
		
		return boardDao.selectfReplyList(sqlSession, findNo);
	}

	@Override
	public int insertfReply(findReply fr) {
		return boardDao.insertfReply(sqlSession, fr);
	}

	@Override
	public int insertFind(Find f) {
		return boardDao.insertFind(sqlSession, f);
	}


	@Override
	public int updateFind(Find f) {
		return boardDao.updateFind(sqlSession, f);
	}

	@Override
	public Find updateFindList(int findNo) {
		return boardDao.updateFindList(sqlSession, findNo);
	}
	
	//------------------------------------------------
	//------------------사람구해요-----------------------
	@Override
	public int selectiListCount() {
		return boardDao.selectfListCount(sqlSession);
	}

	@Override
	public int selectiListCount(HashMap<String, String> fin) {
		return boardDao.selectiListCount(sqlSession, fin);
	}

	@Override
	public ArrayList<InReview> selectiList(PageInfo pi) {
		return boardDao.selectiList(sqlSession, pi);
	}
	
	public ArrayList<InReview> selectiList(PageInfo pi,HashMap<String, String> fin) {
		return boardDao.selectiList(sqlSession, pi,fin);
	}


	
	
	

}
