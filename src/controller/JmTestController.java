package controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.JmTestModel;

@Controller
@RequestMapping("/testingJM")
public class JmTestController {
	@Autowired
	JmTestModel jtm;
	
	@RequestMapping("/drawMap")
	public ModelAndView testMapViewer(@RequestParam Map map){
		ModelAndView mav = new ModelAndView("/views/testing/jmMap.jsp");
		double lat1 = Double.parseDouble((String)map.get("lat"));
		double lng1 = Double.parseDouble((String)map.get("lng"));
		List list = jtm.getLocation(lat1, lng1);
		mav.addObject("topList", list);
		return mav;
	}
}
