package controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.ReviewDao;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	ReviewDao rd;
	
	@RequestMapping("/basic")
	public ModelAndView basicHandle(@RequestParam Map map){
		ModelAndView mav = new ModelAndView("t_review");
		rd.insertBasic(map);
		return mav;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detailHandle(@RequestParam Map map ){
		ModelAndView mav = new ModelAndView();
		rd.insertDetail(map);
		return mav;
	}
}
