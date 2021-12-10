package com.icia.homepage.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.icia.homepage.dto.HomepageDTO;
import com.icia.homepage.repository.HomepageRepository;

@Service
public class HomepageServiceImpl implements HomepageService {
@Autowired
private HomepageRepository hr;
@Autowired
private HttpSession session;

	@Override
	public void signup(HomepageDTO homepage) throws IllegalStateException, IOException {
		// dto에 담긴 파일을 가져옴 
				MultipartFile m_file = homepage.getM_file();
				// 파일 이름을 가져옴(파일이름을 DB에 저장하기 위해)
				String m_filename = m_file.getOriginalFilename();
				// 파일명 중복을 피하기 위해 파일이름앞에 현재 시간값을 붙임. 
				m_filename = System.currentTimeMillis() + "-" + m_filename;
				System.out.println("b_filename: " + m_filename);
				// 파일 저장 경로 세팅 
				String savePath = "D:\\development\\source\\spring\\HomepageProject\\src\\main\\webapp\\resources\\upload\\"+m_filename;
				// bfile이 비어있지 않다면(즉 파일이 있으면) savePath에 저장을 하겠다.
				if(!m_file.isEmpty()) {
					m_file.transferTo(new File(savePath));
				}
				// 여기까지의 내용은 파일을 저장하는 과정 
				
				// DB에 저장하기 위해 dto에 파일이름을 담는다.
				homepage.setM_filename(m_filename);

				hr.signup(homepage);
		
	}
	@Override
	public String idDuplicate(String m_id) {
		String result = hr.idDuplicate(m_id);
		if(result == null) {
			return "ok"; 
		}else {
			return "no"; 
	}
	}
	@Override
	public String login(HomepageDTO homepage) {
		HomepageDTO loginMember = hr.login(homepage);
		if(loginMember!=null) {
			session.setAttribute("loginId", homepage.getM_id());
			session.setAttribute("loginNumber", loginMember.getM_number());	
			return "redirect:/board/paging";
		} else {
			return "members/login";
		}
	}
	@Override
	public List<HomepageDTO> memberList() {
		
		List<HomepageDTO> mList = hr.memberList();
		
		for(HomepageDTO m: mList) {
			System.out.println(m);
		}
		
		return mList;
	}
	@Override
	public void delete(long m_number) {
		hr.delete(m_number);
		
	}
	@Override
	public HomepageDTO findById(long m_number) {
		HomepageDTO members = hr.findById(m_number);
		return members;
	}
	@Override
	public void update(HomepageDTO homepage) {
		hr.update(homepage);
		
	}

}
