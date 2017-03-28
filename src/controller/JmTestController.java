package controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.LocationCalculator;
import model.TestDao;

@Controller
@RequestMapping("/testingJM")
public class JmTestController {
	@Autowired
	LocationCalculator jtm;
	
	@Autowired
	TestDao td;
	
	@RequestMapping("/drawMap")
	public ModelAndView testMapViewer(@RequestParam Map map){
		ModelAndView mav = new ModelAndView("/testing/addrRst");
//		double lat1 = Double.parseDouble((String)map.get("lat"));
//		double lng1 = Double.parseDouble((String)map.get("lng"));
		List list = jtm.getAll();
		mav.addObject("topList", list);
		return mav;
	}
	
	@RequestMapping("/adress")
	public ModelAndView testtest(){
		ModelAndView mav = new ModelAndView("/views/testing/adress.jsp");
		List list = td.adressGet();
		
		mav.addObject("result", list);
		return mav;
	}
}
