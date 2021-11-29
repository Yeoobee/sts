package com.icia.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.icia.member.dto.MemberDTO;
import com.icia.member.service.MemberService;


@Controller
public class MemberController {
	@Autowired
	private MemberService ms;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {

		
		return "index";
	}
	
	@RequestMapping(value = "/insertform", method = RequestMethod.GET)
	public String insertform() {

		
		return "insert";
	}
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute MemberDTO members) {
		int result = ms.insert(members);
		if(result > 0) {
			return "index";
			
		}else {
			return "insert";
		}
		
	}
	
	// 회원목록 처리
	@RequestMapping(value="/findAll", method= RequestMethod.GET)
	public String findAll(Model model) {
		// select * from members 결과를 mybatis가 List에 담아주고 그 리턴을 가져옴
		List<MemberDTO> mList = ms.findAll();
		
		model.addAttribute("mList",mList);
		
		return "findAll";
	}
	
	//  회원 상세조회
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String findById(@RequestParam("m_number") long m_number, Model model) {
		
		
		MemberDTO members = ms.findById(m_number);
		
		
		model.addAttribute("member",members);
		
		return "detail";
	}
	
}
