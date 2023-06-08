package com.suim.member.model.service;

import java.util.ArrayList;

import com.suim.board.model.vo.Board;
import com.suim.common.model.vo.PageInfo;
import com.suim.house.model.vo.House;

public interface MypageService {

	//자유게시판 게시글의 갯수를 조회합니다.
	int selectBoardListCount();

	//자유게시판의 게시글 리스트를 조회합니다.
	ArrayList<Board> selectBoardList(PageInfo pi, String memberId);

	//사람 구해요 게시글 갯수를 조회합니다.
	int selectFindListCount();
	
	//사람구해요 게시판의 게시글 리스트를 조회합니다.
	ArrayList<Board> selectFindList(PageInfo pi, String memberId);

	

	//내가올린셰어하우스리스트갯수 조회
	int selectHouseListCount(String memberId);
	
	//내가올린셰어하우스리스트 조회
	ArrayList<House> selectHouseList(PageInfo pi, String memberId);
	
}
