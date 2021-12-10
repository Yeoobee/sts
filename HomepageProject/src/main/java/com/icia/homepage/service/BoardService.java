package com.icia.homepage.service;

import java.io.IOException;
import java.util.List;

import com.icia.homepage.dto.BoardDTO;
import com.icia.homepage.dto.HomepageDTO;
import com.icia.homepage.dto.PageDTO;

public interface BoardService {

	void save(BoardDTO board) throws IllegalStateException, IOException;

	List<BoardDTO> pagingList(int page);

	PageDTO paging(int page);

	List<BoardDTO> findAll();

	BoardDTO findById(long b_number);

	void delete(long b_number);

	void update(BoardDTO board);

	List<BoardDTO> search(String searchtype, String keyword);




}
