package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/about")
public class AboutCountroller {
	@RequestMapping("/contact")
	public ModelAndView contactHandler(){
		ModelAndView mav = new ModelAndView("t_about");
		return mav;
	}
}
