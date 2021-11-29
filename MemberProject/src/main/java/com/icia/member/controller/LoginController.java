package com.icia.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.icia.member.dto.MemberDTO;
import com.icia.member.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	private MemberService ms;

	
	  
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO members) {
		//public String login(@RequestParam("m_id") String m_id,@RequestParam("m_password") String m_password) {
		String resultPage = ms.login(members);
		
		return resultPage;
		
	}
	
	// 로그아웃 처리
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// 세션에 저장된 데이터를 지움.
		session.invalidate();
		return "index";
	}
	 
}
