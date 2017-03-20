package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.FreeBoardDao;

@Controller
@RequestMapping("/spoon_board")
public class FreeboardController {
	@Autowired
	FreeBoardDao fdao;
	
	@RequestMapping("/tot")
	public ModelAndView cntAllHandler(){
		ModelAndView mav = new ModelAndView("t_board freeboard/board_list");
		return mav; 
	}
	@RequestMapping("/list")
	public ModelAndView getSomeHandler(@RequestParam Map map){
		ModelAndView mav = new ModelAndView("t_board freeboard/board_list");
		return mav; 
	}
	@RequestMapping("/totList")
	public ModelAndView listAllHandler(){
		int all = fdao.cntAll();
		ModelAndView mav = new ModelAndView("t_board freeboard/board_list"); 
		mav.addObject("data", all);
		return mav;
	}
	@RequestMapping("/detail")
	public ModelAndView getOneInDetailHandler(){
		ModelAndView mav = new ModelAndView("t_board freeboard/board_list"); 
		return mav;
	}
	@RequestMapping("/write")
	public ModelAndView addNewHandler(){
		ModelAndView mav = new ModelAndView("t_board freeboard/board_form"); 
		return mav;
	}
	@RequestMapping("/add")
	public ModelAndView addNewHandler(@RequestParam Map map){
		int a = fdao.addNew(map);
		
		System.out.println(a);
		ModelAndView mav = new ModelAndView("/spoon_board/totList");
		return mav;
	}
}
