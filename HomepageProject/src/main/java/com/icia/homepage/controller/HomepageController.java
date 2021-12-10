package com.icia.homepage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.homepage.dto.BoardDTO;
import com.icia.homepage.dto.HomepageDTO;
import com.icia.homepage.service.BoardService;
import com.icia.homepage.service.HomepageService;

@Controller
@RequestMapping(value="/members/*")
public class HomepageController {
	@Autowired
	private HomepageService hs;
	@Autowired
	private BoardService bs;
	
	// 회원가입 창 열기
	@RequestMapping(value="signup", method=RequestMethod.GET)
	public String signupform() {
		return "members/signup";
	}
	
	// 회원가입
		@RequestMapping(value="signup", method=RequestMethod.POST)
		public String signup(@ModelAttribute HomepageDTO homepage) throws IllegalStateException, IOException {
			hs.signup(homepage);
			return "redirect:/";
			
		}

	// 아이디중복확인
	@RequestMapping(value="idDuplicate", method=RequestMethod.POST)
	public @ResponseBody String idDuplicate(@RequestParam("m_id") String m_id) {
		String result = hs.idDuplicate(m_id);	
		return result;
	}
	
	// 로그인 페이지 출력
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginform() {
		return "members/login";
	}
	// 로그인
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@ModelAttribute HomepageDTO homepage, Model model) {
		List<BoardDTO> boardList = bs.findAll();
		model.addAttribute("boardList",boardList);
		
		String resultpage = hs.login(homepage);
		return resultpage;
	}
	//로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	} 
	
	// 회원목록 페이지 출력
	@RequestMapping(value="memberList", method=RequestMethod.GET)
	public String memberList(Model model) {
		List<HomepageDTO> mList = hs.memberList();
		model.addAttribute("mList", mList);
		return "members/memberList";
	}
	
	// 회원 삭제
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String mDelete(@RequestParam("m_number") long m_number) {
		hs.delete(m_number);
		return "redirect:/members/memberList";
	}
	
	// 마이페이지(회원정보) 출력
	@RequestMapping(value="findById",method=RequestMethod.GET)
	public String findById(@RequestParam("m_number") long m_number,Model model) {
		HomepageDTO members = hs.findById(m_number);
		model.addAttribute("members",members);
		return "members/findById";
		
	}
	
	// 정보수정
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(@ModelAttribute HomepageDTO homepage,Model model) {
		hs.update(homepage);
		return "redirect:/board/paging";
	}
}
