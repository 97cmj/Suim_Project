package com.suim.house.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.suim.house.model.service.HouseService;
import com.suim.house.model.vo.House;


@Controller
public class HouseController {
	@Autowired
	private HouseService houseService;
	
    @RequestMapping("detail.ho")
    public ModelAndView selectList(ModelAndView mv) {
 
		House h = houseService.selectHouse(1);
		
		// 조회된 데이터를 mv 에 담아서 포워딩 페이지 경로를 잡아주기
		mv.addObject("h", h).setViewName("house/houseView");
		
		return mv;
    }
	
}
