package controller;

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







