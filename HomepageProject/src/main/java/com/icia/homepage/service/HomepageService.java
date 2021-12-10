package com.icia.homepage.service;

import java.io.IOException;
import java.util.List;

import com.icia.homepage.dto.HomepageDTO;

public interface HomepageService {

	void signup(HomepageDTO homepage) throws IllegalStateException, IOException;

	String idDuplicate(String m_id);

	String login(HomepageDTO homepage);

	List<HomepageDTO> memberList();

	void delete(long m_number);

	HomepageDTO findById(long m_number);

	void update(HomepageDTO homepage);



}
