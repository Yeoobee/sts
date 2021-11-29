package com.icia.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.member.dto.MemberDTO;
import com.icia.member.repository.MemberRepository;
@Service
public class MemberService {
	@Autowired
	private MemberRepository mr;
	@Autowired
	private HttpSession session;

	public int insert(MemberDTO members) {
		System.out.println("객체값: "+ members);
		int result = mr.insert(members);
		return result;
		
	}


	public String login(MemberDTO members) {
		MemberDTO loginMember = mr.login(members);
		if(loginMember != null) {
		// 로그인 성공(로그인 정보를 세션에저장)
		session.setAttribute("loginId", members.getM_id());
		session.setAttribute("loginNumber", loginMember.getM_number());
		return "main";
	}else {
		// 로그인 실패
		return "login";
	}
}


	public List<MemberDTO> findAll() {
		
		List<MemberDTO> mList = mr.findAll();
		
		// mList를 출력하는 sysout
		for(MemberDTO m: mList) {
			System.out.println(m);
		}
		
		return mList;
		
	}


	public MemberDTO findById(long m_number) {
		MemberDTO members = mr.findById(m_number);
		return members;
	}
}
