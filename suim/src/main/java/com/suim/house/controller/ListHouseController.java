package com.suim.house.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.suim.house.model.service.ListHouseService;
import com.suim.house.model.vo.House;

@Controller
public class ListHouseController {
	
	@Autowired
	private ListHouseService listHouseService;
	
	@RequestMapping("list.ho")
	public ModelAndView selectList(ModelAndView mv) {
		
		ArrayList<House> list = listHouseService.selectList();
		
		mv.addObject("list", list);
		mv.setViewName("house/houseMapView");
		
		return mv;

		
	}

}
