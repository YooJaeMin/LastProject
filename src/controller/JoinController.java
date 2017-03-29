/*package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDao;

@Controller
@RequestMapping("/join")
public class JoinController {
	@Autowired
	MemberDao mdao;
	@RequestMapping("/step01")
	public ModelAndView jstep01Handler() {
		ModelAndView mav = new ModelAndView("t_join01");
		
		return mav;
	}
	
	@RequestMapping("/step02")
	public ModelAndView jstep02Handler() {
		ModelAndView mav = new ModelAndView("t_join02");
		
		return mav;
	}
	
	
	@RequestMapping("/checkAjax")
	@ResponseBody	// ���ϵǴ� �� ���� SpringDispatcher���� ���̸����� �������� �ʰ�,
		// �ٷ� �������� ����Ѵ�. String ��ü�� ����� �����ϰ�, �ѱ� ������ ��� X
	public String cAjaxHandler(@RequestParam(name="id") String id) {
		ModelAndView mav = new ModelAndView("t_join02");
		// boolean rst = mdao.useAvailableCheck(id);
		boolean rst = true;	// false;
		// 'YYYYY' or 'NNNNN'  �̷� ���ڸ� ������ָ� �ȴ�.
		if(rst) 
			return "YYYYY";
		else
			return "NNNNN";
	}
}
*/
package controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDao;

@Controller
@RequestMapping("/join")
public class JoinController {
	@Autowired
	MemberDao mdao;

	@RequestMapping("/naverJoin")
	@ResponseBody
	public String nvJoinHandler(@RequestParam Map map, HttpSession session,
			@RequestParam(name = "keep", defaultValue = "off") String val, HttpServletResponse response) {
		System.out.println(map);
		String id = (String) map.get("email");
		String birth2="2017-";
		String birth3=((String) map.get("birth"));
		String birth=birth2+birth3;
		map.remove("birth");
		map.put("id", id);
		map.put("birth", birth);
		System.out.println(map);
		map.remove("email");
		map.remove("age");
		
		System.out.println(map);
		int result = 0;
		result = mdao.naverMamber(map);
		if (result == 1) {
			session.setAttribute("auth_id", map.get("id"));
			session.setAttribute("auth", "yes");
			System.out.println("val값 뭐임?"+map.get("cookie"));
			if (map.get("cookie").equals("on")) {
				Cookie c = new Cookie("save", (String)map.get("id")); // 밸류에는 계정정보가 있어야 함.
				c.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(c);
			}else{
				Cookie c = new Cookie("save", "");
			}
				
			return "yes";
		} else {
			boolean membercheck = mdao.naverCheckMember(map);
			if (membercheck == true) {
				session.setAttribute("auth_id", map.get("id"));
				session.setAttribute("auth", "yes");
				System.out.println("val값 뭐임?"+map.get("cookie"));
				if (map.get("cookie").equals("on")) {
					Cookie c = new Cookie("save", (String)map.get("id")); // 밸류에는 계정정보가 있어야 함.
					c.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(c);
				}else{
					Cookie c = new Cookie("save", "");
				}
				return "chOk";
			} else {
				return "fail";
			}
		}
	}

	@RequestMapping("/memberJoin")
	@ResponseBody
	public String mbJoinHandler(@RequestParam Map map) {
		System.out.println(map);
		String result = "";
		result = mdao.Mamber(map);
		if (result == "succed") {
			return "succed";
		} else {
			return "fail";
			
		}
	}
	
	@RequestMapping("/memberCheck")//로그인 체크
	@ResponseBody
	public String memberCehck(@RequestParam Map map, HttpSession session
			/*@RequestParam(name = "keep", defaultValue = "off") String val,*/) {
		System.out.println(map);
		boolean result = false;
		result = mdao.checkMember(map);
		System.out.println("result"+result);
		if (result) {
			session.setAttribute("auth_id", map.get("id"));
			session.setAttribute("auth", "yes");
			/*if (val.equals("on")) {
				Cookie c = new Cookie("save", (String)map.get("id")); // 밸류에는 계정정보가 있어야 함.
				c.setMaxAge(60 * 60 * 24 * 7);
				c.setPath("/");
				response.addCookie(c);
			}*/
			return "succed";
		} else {
			System.out.println("틀림");
			return "fail";
			
			
		}
	}

}
