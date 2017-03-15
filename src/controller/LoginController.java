package controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.LoginlogDao;
import model.MemberDao;

@Controller
@RequestMapping("/log")
public class LoginController {
	@Autowired
	MemberDao mdao;
	
	@Autowired
	LoginlogDao ldao;
	
	@RequestMapping("/logout")
	public ModelAndView lloginHandler(HttpSession session) {
		session.removeAttribute("auth");
		session.removeAttribute("auth_id");
		ModelAndView mav = new ModelAndView("redirect:/");

		return mav;
	}
	
	@RequestMapping("/login")
	public ModelAndView lloginHandler() {
		ModelAndView mav = new ModelAndView("t_login");

		return mav;
	}

	@RequestMapping("/login/result")
	public ModelAndView lresultHandler(@RequestParam Map map, HttpSession session,
			@RequestParam(name = "keep", defaultValue = "off") String val, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		System.out.println(map.toString());
		boolean b = mdao.checkMember(map);
		if (b) {
			
			ldao.insertLoginlog(map);
			session.setAttribute("auth_id", map.get("id"));
			session.setAttribute("auth", "yes");
			if (val.equals("on")) {
				Cookie c = new Cookie("save", (String)map.get("id")); // 밸류에는 계정정보가 있어야 함.
				c.setMaxAge(60 * 60 * 24 * 7);
				c.setPath("/");
				response.addCookie(c);
			}
			mav.setViewName("redirect:/");
		}else {
			mav.setViewName("redirect:/log/login");
		}
		return mav;
		
	}
}
