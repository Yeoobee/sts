package com.icia.member.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.member.dto.MemberDTO;

@Repository
public class MemberRepository {
	
	@Autowired
	public SqlSessionTemplate sql;

	public int insert(MemberDTO members) {
		return sql.insert("Member.insertMember", members);
	}

	public MemberDTO login(MemberDTO members) {
		return sql.selectOne("Member.login", members);
	}

	public List<MemberDTO> findAll() {
		return sql.selectList("Member.findAll");
	}

	public MemberDTO findById(long m_number) {
		return sql.selectOne("Member.findById", m_number);
	}

}
