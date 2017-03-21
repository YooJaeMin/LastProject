package controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Mypage")
public class infoController {
	@Autowired
	
	@RequestMapping("/info")
	public ModelAndView infoHandle(@RequestParam Map map, HttpSession session,
			HttpServletResponse response){
		System.out.println(session.getAttribute("auth_id"));
		ModelAndView mav = new ModelAndView("t_mypage");
		return mav;
	}

}
