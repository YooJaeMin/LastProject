package controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.LikeDao;
import model.LocationDao;
import model.NaverBlogDao;
import model.ReviewDao;
import model.SearchDao;
import model.WeatherInformer;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	ReviewDao rd;
	@Autowired
	SearchDao sd;
	@Autowired
	LocationDao ld;
	@Autowired 
	LikeDao likedao;
	@Autowired
	NaverBlogDao nbd;
	@Autowired
	WeatherInformer wi;
	
	@RequestMapping("/basic")
	public ModelAndView basicHandle(@RequestParam Map map2, HttpSession session){
		
		System.out.println("너이르"+map2);
		
		ModelAndView mav = new ModelAndView("t_detail");
		
		int s1 = Integer.parseInt((String)map2.get("clean_s"));
		int s2 = Integer.parseInt((String)map2.get("good_s"));
		int s3 = Integer.parseInt((String)map2.get("taste_s"));
		int s4 = Integer.parseInt((String)map2.get("location_s"));
		int s5 = Integer.parseInt((String)map2.get("price_s"));
		double avg = (s1+s2+s3+s4+s5) / 5.00;
		System.out.println(avg);
		map2.put("avg_s",avg);
		rd.insertBasic(map2);
		Map newTel = new HashMap<>();
		
		newTel.put("tel", map2.get("tel"));
		List<HashMap> like = likedao.getliekN(newTel);
		HashMap likeRR = like.get(0);
		System.out.println(likeRR);
		
		newTel.put("id", session.getAttribute("auth_id"));
		int likeR = likedao.Check(newTel);
		boolean likeResult=false;
		if(likeR==1){
			likeResult=true;
		}
		                    
		
	
		int shoppingN = likedao.shoppingCheck(newTel);
		boolean shoppingR = false;
		if(shoppingN==1){
			shoppingR=true;
		}
					
		Map weather = wi.service();
		String Wstatus = (String)weather.get("wStatus");
		
	
		
		String tel = (String) newTel.get("tel");
		sd.insertStore(tel);
		List list = sd.storeDetail(newTel);
		list = sd.mongoWithSql(list);
		
		mav.addObject("result",sd.rankFilter(list));
		Map map = (Map)list.get(0);
		List<String> imgList = (List) map.get("img");
		List tempList = new ArrayList();
		for(String str : imgList){
			if(!str.contains("btn-arrow")){
				tempList.add(str);
			}
		}
		

		List<Map> reviewList = sd.reviewList(newTel);
		mav.addObject("Wstatus",Wstatus);
		mav.addObject("reviewList", reviewList);
		
		mav.addObject("like", likeRR);
		mav.addObject("likeResult", likeResult);
		
		
		mav.addObject("shoppingR",shoppingR);
		  
		map.put("img", tempList);
		mav.addObject("store",map);
//		System.out.println(list.get(0).toString());
		String adress = ((String)map.get("adress")).substring(0,((String)map.get("adress")).lastIndexOf("동")+1);
		String title = (String)map.get("title");
//		System.out.println(adress +" "+title);
		Map blogMap = nbd.getBlogData(adress+" "+(String)map.get("title"));
		mav.addObject("blog", blogMap);
		
		/**/
		return mav;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detailHandle(@RequestParam Map map ){
		ModelAndView mav = new ModelAndView();
		rd.insertDetail(map);
		return mav;
	}
}
