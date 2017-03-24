package controller;

import java.util.*;

import javax.servlet.http.HttpSession;
import javax.tools.DocumentationTool.Location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.LikeDao;
import model.LocationDao;
import model.SearchDao;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	SearchDao sd;
	@Autowired
	LocationDao ld;
	@Autowired 
	LikeDao likedao;

	@RequestMapping("/keyword")
	public ModelAndView searchBar(@RequestParam Map reqMap) {
		ModelAndView mav = new ModelAndView("t_searchMain");
		String[] foods = { "수요미식회", "생활의달인", "TV맛집", "한식", "중식", "일식", "카페", "술집", "고기집", "횟집", "해산물", "밥집", "분식",
				"파스타", "뷔페", "국물요리", "면요리", "이탈리안", "멕시칸", "프렌치", "아시안" };
		String keyword = (String) reqMap.get("keyword");
		mav.addObject("tagsList", foods);
		System.out.println(keyword);
		if (keyword == null)
			return mav;
		sd.insertSearch(keyword);
		Map map = ld.googleLocation(keyword);
		map.put("keyword", keyword);
		mav.addObject("keyword", keyword);

		List list = sd.doSearch(map);

		// 리뷰가 완성되면 진행할 예정
		mav.addObject("locationResult", list);
		// mav.addObject("locationResult", sd.rankFilter(list));

		List list2 = sd.titleSearch(map);
		// mav.addObject("titleResult",sd.rankFilter(list2));
		mav.addObject("titleResult", list2);

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

		mav.addObject("result", list);
		// 리뷰가 완성되면 진행할 예정

		// mav.addObject("locationResult", sd.rankFilter(list));

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

		String[] foods = { "수요미식회", "생활의달인", "TV맛집", "한식", "중식", "일식", "카페", "술집", "고기집", "횟집", "해산물", "밥집", "분식",
				"파스타", "뷔페", "국물요리", "면요리", "이탈리안", "멕시칸", "프렌치", "아시안" };
		mav.addObject("tagsList", foods);
		List list = sd.tagSearch(selectedTag);
		mav.addObject("selectedTag", selectedTag);
		mav.addObject("result", list);
		return mav;
	}
	
	@RequestMapping("/detail")
	public ModelAndView storeDetail(@RequestParam Map reqMap ,HttpSession session) {
		ModelAndView mav = new ModelAndView("t_detail");
		/*태영 고친부분 */
		
		
		List<HashMap> like = likedao.getliekN(reqMap);
		HashMap likeRR = like.get(0);
		
		reqMap.put("id", session.getAttribute("auth_id"));
		int likeR = likedao.Check(reqMap);
		boolean likeResult=false;
		if(likeR==1){
			likeResult=true;
		}
	
		/*태영 like*/
		
		
		String tel = (String) reqMap.get("tel");
		List list = sd.storeDetail(reqMap);
		
		mav.addObject("result",list);
		Map map = (Map)list.get(0);
		List<String> imgList = (List) map.get("img");
		List tempList = new ArrayList();
		for(String str : imgList){
			if(!str.contains("btn-arrow")){
				tempList.add(str);
			}
		}
		
		List reviewList = sd.reviewList(reqMap);
		mav.addObject("reviewList", reviewList);
		/*태영 고친 부분*/
		mav.addObject("like", likeRR);
		mav.addObject("likeResult", likeResult);
		/*  */
		map.put("img", tempList);
		mav.addObject("store",map);
		System.out.println(list.get(0).toString());
		return mav;
	} 

}
