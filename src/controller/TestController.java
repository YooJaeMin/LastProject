package controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.SearchDao;

@Controller
public class TestController {
	@Autowired
	SearchDao sd;
	
	@RequestMapping({ "/", "/index" })
	public ModelAndView indexHandle() {
		ModelAndView mav = new ModelAndView("t_main");
		List list1 = sd.realTimeRank();
		mav.addObject("realRank",list1);
		List list2 = sd.todayRank();
		mav.addObject("todayRank",list2);
		return mav;
	}
}