package controller;

import java.util.*;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSplitPaneUI;
import javax.tools.DocumentationTool.Location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.LikeDao;
import model.LocationDao;
import model.NaverBlogDao;
import model.SearchDao;
import model.WeatherInformer;

@Controller
@RequestMapping("/search")
public class SearchController {
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
	
	@RequestMapping("/keyword")
	public ModelAndView searchBar(@RequestParam Map reqMap) {
		ModelAndView mav = new ModelAndView("t_searchMain");
		String[] foods = { "수요미식회", "생활의달인", "TV맛집", "한식", "중식", "일식", "카페", "술집", "고기집", "횟집", "해산물", "밥집", "분식",
				"파스타", "뷔페", "국물요리", "면요리", "이탈리안", "멕시칸", "프렌치", "아시안" };
		String keyword = (String) reqMap.get("keyword");
		mav.addObject("tagsList", foods);
//		System.out.println(keyword);
		if (keyword == null) return mav;
		sd.insertSearch(keyword);
		
		//구글에 검색어를 던져서 위치 파악함...
		Map map = ld.googleLocation(keyword);
		map.put("keyword", keyword);
		mav.addObject("keyword", keyword);
		
		//파악된 위치 주변 1km 검색 or 구글에서 찾지 못할 경우에는 용산 기준 반경 20km (서울 맛집) 검색 
		List list = sd.doSearch(map);

		// 리뷰가 완성되면 진행할 예정
		list = sd.mongoWithSql(list);
//		mav.addObject("locationResult", list);
		 mav.addObject("locationResult", sd.rankFilter(list));

		List list2 = sd.titleSearch(map);
		list2 = sd.mongoWithSql(list2);
		 mav.addObject("titleResult",sd.rankFilter(list2));
//		mav.addObject("titleResult", list2);

		return mav;
	}

	@RequestMapping("/list")
	public ModelAndView searchList(@RequestParam Map reqMap) {
		ModelAndView mav = new ModelAndView("t_searchList");
		String[] foods = { "수요미식회", "생활의달인", "TV맛집", "한식", "중식", "일식", "카페", "술집", "고기집", "횟집", "해산물", "밥집", "분식",
				"파스타", "뷔페", "국물요리", "면요리", "이탈리안", "멕시칸", "프렌치", "아시안" };
		String keyword = (String) reqMap.get("keyword");
		String type = (String) reqMap.get("type");
		int page = 0;
		try {
			page = Integer.parseInt((String) reqMap.get("page"));
		} catch (Exception e) {
			page = 1;
		}finally {
			mav.addObject("page", page);
		}
		mav.addObject("tagsList", foods);
		if (keyword == null || type == null)
			return mav;
		Map map = ld.googleLocation(keyword);
		map.put("keyword", keyword);
		mav.addObject("keyword", keyword);
		String searchType;

		List list = null;
		if (type == null) {
			list = sd.doSearch(map);
			mav.addObject("type", "위치");
		} else if (type.equals("location")) {
			list = sd.doSearch(map);
			mav.addObject("type", "위치");
		} else if (type.equals("title")) {
			list = sd.titleSearch(map);
			mav.addObject("type", "상호");
		}
		list = sd.mongoWithSql(list);
//		mav.addObject("result", list);
		// 리뷰가 완성되면 진행할 예정
		int size = list.size();
		if(size % 10 ==0){
			mav.addObject("max", size/10);
		} else {
			mav.addObject("max", (int)(size/10 +1));
		}
		 mav.addObject("result", sd.rankFilter(list));

		// mav.addObject("titleResult",sd.rankFilter(list2));

		return mav;
	}

	@RequestMapping("/tag")
	public ModelAndView selectTag(@RequestParam Map reqMap) {
		ModelAndView mav = null;
		String type = (String) reqMap.get("type");
		String selectedTag = (String) reqMap.get("selectedTag");
		if (type == null) {
			mav = new ModelAndView("t_tagSearch");
		} else if (type.equals("all")) {
			mav = new ModelAndView("t_tagList");
		} else {
			mav = new ModelAndView("t_tagSearch");
		}
		if (selectedTag == null)
			selectedTag = "한식";
		int page = 1;
		if((String)reqMap.get("page")!=null){
			page = Integer.parseInt((String)reqMap.get("page"));
		}
		
		mav.addObject("page",page);
		
		String[] foods = { "수요미식회", "생활의달인", "TV맛집", "한식", "중식", "일식", "카페", "술집", "고기집", "횟집", "해산물", "밥집", "분식",
				"파스타", "뷔페", "국물요리", "면요리", "이탈리안", "멕시칸", "프렌치", "아시안" };
		mav.addObject("tagsList", foods);
		List list = sd.tagSearch(selectedTag);
		list = sd.mongoWithSql(list);
		
		mav.addObject("selectedTag", selectedTag);
		list = sd.rankFilter(list);
		
		mav.addObject("result", list);
		int size = list.size();
		if(size % 10 ==0){
			mav.addObject("max", size/10);
		} else {
			mav.addObject("max", (int)(size/10 +1));
		}
		return mav;
	}
	
	@RequestMapping("/detail")
	public ModelAndView storeDetail(@RequestParam Map reqMap ,HttpSession session) {
		ModelAndView mav = new ModelAndView("t_detail");
		/*태영 고친부분 */

		/*태영 like*/
		System.out.println("!!!"+reqMap);
		List<HashMap> like = likedao.getliekN(reqMap);
		HashMap likeRR = like.get(0);
		System.out.println(likeRR);
		
		reqMap.put("id", session.getAttribute("auth_id"));
		int likeR = likedao.Check(reqMap);
		boolean likeResult=false;
		if(likeR==1){
			likeResult=true;
		}
		/*                    */
		
		
		/* 태영 shopping 3-26부분*/
		int shoppingN = likedao.shoppingCheck(reqMap);
		boolean shoppingR = false;
		if(shoppingN==1){
			shoppingR=true;
		}
		/*			*/
		Map weather = wi.service();
		String Wstatus = (String)weather.get("wStatus");
		
	
		
		String tel = (String) reqMap.get("tel");
		sd.insertStore(tel);
		List list = sd.storeDetail(reqMap);
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
		

		List<Map> reviewList = sd.reviewList(reqMap);
		mav.addObject("Wstatus",Wstatus);
		System.out.println("체크중 : "+Wstatus);
		mav.addObject("reviewList", reviewList);
		/*태영 고친 부분*/
		mav.addObject("like", likeRR);
		mav.addObject("likeResult", likeResult);
			/*3-26*/
		/*mav.addObject("reviewLikeC",reviewLikeC);*/
		mav.addObject("shoppingR",shoppingR);
		/*  */
		map.put("img", tempList);
		mav.addObject("store",map);
//		System.out.println(list.get(0).toString());
		String adress = ((String)map.get("adress")).substring(0,((String)map.get("adress")).lastIndexOf("동")+1);
		String title = (String)map.get("title");
//		System.out.println(adress +" "+title);
		Map blogMap = nbd.getBlogData(adress+" "+(String)map.get("title"));
		mav.addObject("blog", blogMap);
		return mav;
	} 

}
