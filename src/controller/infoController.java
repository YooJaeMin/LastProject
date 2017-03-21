package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.infoDao;

@Controller
@RequestMapping("/Mypage")
public class infoController {
	@Autowired
	infoDao infoDao;
	
	@RequestMapping("/info")
	public ModelAndView infoHandle(@RequestParam Map map, HttpSession session,
			HttpServletResponse response){
		System.out.println(session.getAttribute("auth_id"));
		map.put("id", session.getAttribute("auth_id"));
		System.out.println("map의 값"+map);
		List<HashMap> result = infoDao.getInfo(map);
		String [] taglist = {"한식", "중식", "일식", "카페", "술집", "고기집",
							"횟집", "해산물", "밥집", "분식", "파스타", "뷔페",
							"국물요리", "면요리", "이탈리안", "멕시칸", "프렌치", "아시안"};
		ModelAndView mav = new ModelAndView("t_mypage");
		mav.addObject("taglist",taglist);
		mav.addObject("InfoR",result);
		return mav;
	}

}
