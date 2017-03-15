package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	@RequestMapping({ "/", "/index" })
	public ModelAndView indexHandle() {
		ModelAndView mav = new ModelAndView("update_form");
		
		return mav;
	}
}