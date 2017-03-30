package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.FileUpLoadDao;
import model.LikeDao;
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
	
	@Autowired
	LikeDao likedao;
	
	@RequestMapping("/info")
	public ModelAndView infoHandle(@RequestParam Map map, HttpSession session, HttpServletResponse response) throws JsonProcessingException {

		
		ObjectMapper mapper = new ObjectMapper();
		System.out.println(session.getAttribute("auth_id"));
		map.put("id", session.getAttribute("auth_id"));
		System.out.println("map의 값" + map);
		List<HashMap> result = infoDao.getInfo(map);
		System.out.println(result);
		String[] taglist = { "한식", "중식", "일식", "카페", "술집", "고기집", "횟집", "해산물", "밥집", "분식", "파스타", "뷔페", "국물요리", "면요리",
				"이탈리안", "멕시칸", "프렌치", "아시안" };
		
		Map m= result.get(0);
		System.out.println("m"+m);
		ModelAndView mav = new ModelAndView("t_mypage");
		String id = (String)session.getAttribute("auth_id");
		System.out.println(id);
		List bucketList = infoDao.bucketList(id);
		mav.addObject("bucketList",bucketList);
		List reviewList = infoDao.reviewList(id);
		mav.addObject("reviewList",reviewList);
		if(m.get("BIRTH")!= null){
			Date date = (Date)m.get("BIRTH");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String newDate = sdf.format(date);
			m.put("BIRTH", newDate);
		}
		HashMap<String,String> favorR = new HashMap<String,String>();
		String DateR ="";
	
		if(m.get("FAVOR")!=null){
			String arBasic = (String)m.get("FAVOR");
			String ar = ((String)m.get("FAVOR"));
			String []arResult = ar.split("\\s");
			for(String arR : arResult){
				System.out.println(arR);
				favorR.put(arR, arR);
			}
			DateR = mapper.writeValueAsString(favorR);
			System.out.println(DateR);
			mav.addObject("DateR",DateR);
			mav.addObject("taglist", taglist);
			mav.addObject("InfoR", result);
			
		}else{
			String arBasic = (String)m.get("FAVOR");
			favorR.put("favor", arBasic);
			DateR = mapper.writeValueAsString(favorR);
			mav.addObject("DateR",DateR);
			mav.addObject("taglist", taglist);
			
			mav.addObject("InfoR", result);
		
		}
		/*String[] ar = ((String)m.get("FAVOR")).replaceAll("\\s", "").substring(1, ((String)m.get("FAVOR")).lastIndexOf("]")-1).split(",");*/
		/*HashMap<String,String> favorR = new HashMap<String,String>();
		for(String m3: ar){
			System.out.println(m3);
			favorR.put(m3, m3);
		}
		String DateR = mapper.writeValueAsString(favorR);*/
		
	
		/**/
		
		return mav;
	}
	@RequestMapping("/logout")
	public ModelAndView logoutHandle(HttpSession session,/*@RequestParam(name = "keep", defaultValue = "off") String val,*/HttpServletResponse response){
		session.removeAttribute("auth");
		session.removeAttribute("fail");
		session.removeAttribute("auth_id");
		Cookie kc = new Cookie("save", null) ;
		    kc.setMaxAge(0) ;
		    kc.setPath("/");
		    response.addCookie(kc) ;
		ModelAndView mav = new ModelAndView("redirect:/");   
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
	public ModelAndView infoUpdate(@RequestParam Map param, @RequestParam(name="preferency", required=false) String[] result){
		System.out.println(result);
		List<String> list = new ArrayList<>();
		
		
		if(param.get("birth") != null){
			
			String birthL = (String)param.get("birth");
			String[] birthR = birthL.split("\\s");
			String birth = birthR[0];
			System.out.println(birth);
			param.remove(birth);
			param.put("birth", birth);
		}else{
			
		}
		if(result!=null){
			param.remove("preferency");
			for(String m : result){
				list.add(m);
			}
			
			System.out.println(list);
			param.put("favor", list);
		}else{
			param.put("favor",null);
		}
		
		int rst = infoDao.infoUpdate(param);
		ModelAndView mav = new ModelAndView("/views/alert.jsp");
		String infoR = "";
		if (rst == 1){
			String info = "변경 완료!";
			mav.addObject("errinfo", info);
			return mav;
		}else{
			String info = "업데이트 처리중에 문제가 발생하였습니다";
			mav.addObject("errinfo", info);
			return mav;
		}
	
	}
	
	@RequestMapping("/bucket")
	public ModelAndView myBucket(HttpSession session){
		ModelAndView mav = new ModelAndView("t_bucket");
		String id = (String)session.getAttribute("auth_id");
		System.out.println(id);
		List bucketList = infoDao.bucketList(id);
		mav.addObject("bucketList",bucketList);
		List reviewList = infoDao.reviewList(id);
		mav.addObject("reviewList",reviewList);
		return mav;
	}

}
