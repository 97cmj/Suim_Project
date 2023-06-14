package com.suim.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.suim.board.model.service.AdminBoardService;
import com.suim.board.model.vo.Board;

@RequestMapping("/admin")
@Controller
public class AdminBoardController {
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@RequestMapping("adminBoardList.bo")
	public ModelAndView adminBoardList(ModelAndView mv) {
		
		ArrayList<Board> blist =  adminBoardService.adminBoardList();
		
		mv.addObject("blist", blist)
		  .setViewName("admin/board/freeBoard"); 
		
		return mv;
		
	}
	

}
