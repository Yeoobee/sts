package com.kjy.study;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		// 기본주소(/) 요청에 대해 home.jsp를 출력해줌.
		// 컨트롤러 메서드에서 String 리턴은 해당 String값.jsp 를 출력하도록 처리됨
		// ViewResolver가 해줌
		return "index";
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(){
		System.out.println("확인");
		
		return "login";
	}
	
	@RequestMapping(value="/loginParam", method=RequestMethod.GET)
	public String loginParam(Model model, @RequestParam("id") String id, @RequestParam("password") String password) {
		System.out.println("아이디: "+id);
		System.out.println("패스워드: "+password);
		
		// id를 model에 담아서 welcome.jsp로 가져가기
		model.addAttribute("idValue",id);
		// password를 pwValue에 담고 가져가기
		model.addAttribute("pwValue",password);
		
		//val 변수를 hello에 담고 welcome에서 출력
		String val = "이제 곧 끝";
		model.addAttribute("hello",val);
		
		return "welcome";
	}
	
	
}
