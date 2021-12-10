package com.icia.homepage.service;

import java.util.List;

import com.icia.homepage.dto.CommentDTO;

public interface CommentService {

	void save(CommentDTO comment);

	List<CommentDTO> findAll(long b_number);

}
