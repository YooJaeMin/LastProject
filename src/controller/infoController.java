package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.FileUpLoadDao;
import model.infoDao;

@Controller
@RequestMapping("/Mypage")
public class infoController {
	@Autowired
	infoDao infoDao;

	@Autowired
	ServletContext application;

	@Autowired
	FileUpLoadDao upload;

	@RequestMapping("/info")
	public ModelAndView infoHandle(@RequestParam Map map, HttpSession session, HttpServletResponse response) {
		System.out.println(session.getAttribute("auth_id"));
		map.put("id", session.getAttribute("auth_id"));
		System.out.println("map의 값" + map);
		List<HashMap> result = infoDao.getInfo(map);
		String[] taglist = { "한식", "중식", "일식", "카페", "술집", "고기집", "횟집", "해산물", "밥집", "분식", "파스타", "뷔페", "국물요리", "면요리",
				"이탈리안", "멕시칸", "프렌치", "아시안" };
		
		ModelAndView mav = new ModelAndView("t_mypage");
		mav.addObject("taglist", taglist);
		mav.addObject("InfoR", result);
		return mav;
	}

	@RequestMapping("pictureR")
	public ModelAndView pictR(@RequestParam Map param, HttpSession session, HttpServletResponse response,
			@RequestParam(name = "pic") MultipartFile file) throws Exception {
		System.out.println(param);
		Map map = upload.execute(file);
		param.putAll(map);
		param.put("id", session.getAttribute("auth_id"));
		System.out.println(param);
		int rst = upload.picSave(param);

		if (rst == 1)
			return new ModelAndView("redirect:/Mypage/info");
		else {
			ModelAndView mav = new ModelAndView("redirect:/Mypage/info");
				mav.addObject("err", "업로드 처리중에 문제가 발생하였습니다");
			return mav;
		}
	}

	@RequestMapping("/infoUpdate")
	public ModelAndView infoUpdate(@RequestParam Map param, @RequestParam(name="preferency") String[] result) {
		System.out.println(result);
		
		
		List<String> list = new ArrayList<>();
		param.remove("preferency");
		String birthL = (String)param.get("birth");
		String[] birthR = birthL.split("\\s");
		String birth = birthR[0];
		
		
		
		System.out.println(birth);
		param.remove(birth);
		param.put("birth", birth);
		for(String m : result){
			list.add(m);
		}
		System.out.println(list);
		param.put("favor", list);
		System.out.println(param);
		
		int rst = infoDao.infoUpdate(param);
		if (rst == 1)
			return new ModelAndView("redirect:/Mypage/info");
		else {
			ModelAndView mav = new ModelAndView("redirect:/Mypage/info");
				mav.addObject("errinfo", "업데이트 처리중에 문제가 발생하였습니다");
			return mav;
		}
	
	}

}
