package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.LikeDao;

@Controller
@RequestMapping("/like")
public class LikeController {
	@Autowired
	LikeDao ldao;
	
	@RequestMapping("/button")
	@ResponseBody
	public String likeHandle(@RequestParam Map map){
		String r = ldao.allLike(map);
		System.out.println("결과값"+r);
		return r;
	}

}
