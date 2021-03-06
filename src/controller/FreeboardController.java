package controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/cntAll")
	public ModelAndView cntAllHandler(){
		int all = fdao.cntAll();
		ModelAndView mav = new ModelAndView("t_board freeboard&qna/board_list"); 
		mav.addObject("cnt", all);
		
		return mav;
	}
		
	@RequestMapping("/list")
	public ModelAndView getSomeHandler(@RequestParam Map map, HttpSession session){
		ModelAndView mav = new ModelAndView("t_board freeboard&qna/board_list");
		System.out.println("session"+session);
		return mav; 
	}
	
	@RequestMapping("/listAll")
	public ModelAndView listAllHandler(){
		ModelAndView mav = new ModelAndView("t_board freeboard&qna/board_list"); 
		List list = fdao.listAll();
		mav.addObject("list", list);
		int all = fdao.cntAll();
		mav.addObject("cnt", all);
		System.out.println("해리해리"+list+"/"+all);
		return mav;
	}
	
	
	@RequestMapping("/detail")
	public ModelAndView getOneInDetailHandler(@RequestParam Map map,HttpSession session ){
		ModelAndView mav = new ModelAndView("t_board freeboard&qna/board_detail"); 
		List<HashMap> detail = fdao.getOneInDetail(map);
		System.out.println(detail);
		mav.addObject("detail", detail);
		return mav;
	}
	@RequestMapping("/write")
	public ModelAndView addNewHandler(){
		ModelAndView mav = new ModelAndView("t_board freeboard&qna/board_form"); 
		return mav;
	}
	@RequestMapping("/add")
	public ModelAndView addNewHandler(HttpServletRequest req ,@RequestParam Map map) throws UnsupportedEncodingException{
		req.setCharacterEncoding("UTF-8");
		System.out.println(req.getParameter("title"));
		System.out.println(map.toString());
		int a = fdao.addNew(map);
		
		System.out.println(a);
		ModelAndView mav = new ModelAndView("/spoon_board/listAll");
		return mav;
	}
}
