package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.FreeBoardDao;

@Controller
@RequestMapping("/spoon_board")
public class FreeboardController {
	@Autowired
	FreeBoardDao fdao;
	
	@RequestMapping("/list")
	public ModelAndView getSomeHandler(){
		
		ModelAndView mav = new ModelAndView("");
		return mav; 
		
	
	}

}
