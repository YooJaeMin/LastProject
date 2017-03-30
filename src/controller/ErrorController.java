package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/error")
public class ErrorController {
	@RequestMapping("/auth")
	public ModelAndView authen(){
		ModelAndView mav = new ModelAndView("t_contact error_auth");
		
		return mav;
	}
}
