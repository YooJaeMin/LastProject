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
	public ModelAndView weatherHandler(HttpServletRequest req, @RequestParam Map map)
			throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		System.out.println(req.getParameter("title"));
		System.out.println(req.getParameter("temp"));
		System.out.println(map.toString());

		Map weather = winfo.service();
		// - SKY_A01: 맑음			sunny-
		// - SKY_A02: 구름조금		cloudy
		// - SKY_A03: 구름많음		cloudy
		// - SKY_A04: 구름많고 비	rainy-	
		// - SKY_A05: 구름많고 눈	snowy-
		// - SKY_A06: 구름많고 비 또는 눈	snowy-
		// - SKY_A07: 흐림			cloudy
		// - SKY_A08: 흐리고 비		rainy-
		// - SKY_A09: 흐리고 눈		cloudy
		// - SKY_A10: 흐리고 비 또는 눈		rainy-
		// - SKY_A11: 흐리고 낙뢰	rainy-
		// - SKY_A12: 뇌우, 비		rainy-
		// - SKY_A13: 뇌우, 눈		snowy-
		// - SKY_A14: 뇌우, 비 또는 눈	snowy-

		ModelAndView mav = new ModelAndView("/views/testing/weather.jsp");
		String wStatus = "";
		if (((String) weather.get("code")).equals("SKY_A01")) {
			wStatus = "sunny";
		} else if (((String) weather.get("code")).equals("SKY_A04")||equals("SKY_A08")||equals("SKY_A010")||equals("SKY_A011")||equals("SKY_A012")) {
			wStatus= "rainy";
		} else if (((String) weather.get("code")).equals("SKY_A05")||equals("SKY_A06")||equals("SKY_A13")||equals("SKY_A14")) {
			wStatus= "snowy";
		} else {
			wStatus= "cloudy";
		
		mav.addObject("weather", weather);
		mav.addObject("wStatus", wStatus);
		}
		return mav;
	}

}
