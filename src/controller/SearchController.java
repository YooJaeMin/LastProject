package controller;

import java.util.*;

import javax.tools.DocumentationTool.Location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.LocationDao;
import model.SearchDao;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	SearchDao sd;
	@Autowired
	LocationDao ld;
	
	@RequestMapping("/keyword")
	public ModelAndView searchBar(@RequestParam(name="keyword") String keyword){
		ModelAndView mav = new ModelAndView("test");
		sd.insertSearch(keyword);
		Map map = ld.googleLocation(keyword);
		map.put("keyword", keyword);
		List list = sd.doSearch(map);
		if(list.size()==0){
		}
		mav.addObject("searchResult",list);
		return mav;
	}
	
	@RequestMapping("/tag")
	public ModelAndView selectTag(@RequestParam(name="selectedTag") String selectedTag){
		ModelAndView mav = new ModelAndView("test");
		List list = sd.tagSearch(selectedTag);
		mav.addObject("tagResult",list);
		return mav;
	}
	
	
}
