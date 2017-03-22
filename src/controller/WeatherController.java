package controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.WeatherInformer;
@Controller
public class WeatherController {
	@Autowired
	WeatherInformer winfo; 
	
	@RequestMapping("/wtoday")
	public ModelAndView weatherHandler(HttpServletRequest req, @RequestParam Map map) throws UnsupportedEncodingException{
		req.setCharacterEncoding("UTF-8");
		System.out.println(req.getParameter("title"));
		System.out.println(req.getParameter("temp"));
		System.out.println(map.toString());

		Map weather = winfo.service();
		
		ModelAndView mav = new ModelAndView("/views/testing/weather.jsp");
		mav.addObject("weather", weather);
		return mav;
	}
	
}
