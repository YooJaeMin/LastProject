package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.LikeDao;

@Controller
@RequestMapping("/like")
public class LikeController {
	@Autowired
	LikeDao ldao;
	
	@RequestMapping("/button")
	@ResponseBody
	public HashMap likeHandle(@RequestParam Map map){
		String r = ldao.allLike(map);
		List<HashMap> cnt = ldao.getliekN(map);
		HashMap cnt2 = cnt.get(0);
		cnt2.put("like", r);
		System.out.println("결과값"+cnt2);
		return cnt2;
	}
	
	
	@RequestMapping("/shopping")
	@ResponseBody
	public String shoppingHandle(@RequestParam Map map){
		String r = "";
		r = ldao.shoppingInsert(map);
		System.out.println("shopping Controller"+r);
		return r;
	}
	
	@RequestMapping("/review")
	@ResponseBody
	public int reviewInsert(@RequestParam Map map){
		int r = 0;
		System.out.println(map.toString());
			r = ldao.reviewInsert(map);
		System.out.println("shopping Controller"+r);
		return r;
	}
	
	@RequestMapping("/reviewD")
	@ResponseBody
	public int reviewDelete(@RequestParam Map map){
		int r = 0;
		r = ldao.reviewDelete(map);
		System.out.println("shopping Controller"+r);
		return r;
	}
	
	@RequestMapping("/reviewC")
	@ResponseBody
	public int reviewCheck(@RequestParam Map map){
		int r = 0;
		r = ldao.reviewCheck(map);
		System.out.println("shopping Controller"+r);
		return r;
	}

}
