package com.icia.homepage.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.homepage.dto.HomepageDTO;

@Repository
public class HomepageRepository {
@Autowired
private SqlSessionTemplate sql;

	public void signup(HomepageDTO homepage) {
		sql.insert("Homepage.signup",homepage);
		
	}

	public String idDuplicate(String m_id) {
		return sql.selectOne("Homepage.idDuplicate",m_id);
	}

	public HomepageDTO login(HomepageDTO homepage) {
		return sql.selectOne("Homepage.login", homepage);
	}

	public List<HomepageDTO> memberList() {
		return sql.selectList("Homepage.memberList");
	}

	public void delete(long m_number) {
		sql.delete("Homepage.delete",m_number);
		
	}

	public HomepageDTO findById(long m_number) {
		return sql.selectOne("Homepage.findById",m_number);
	}

	public void update(HomepageDTO homepage) {
		sql.update("Homepage.update",homepage);
		
	}



}
