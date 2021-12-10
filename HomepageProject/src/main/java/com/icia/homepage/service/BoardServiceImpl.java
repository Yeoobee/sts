package com.icia.homepage.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.icia.homepage.dto.BoardDTO;
import com.icia.homepage.dto.HomepageDTO;
import com.icia.homepage.dto.PageDTO;
import com.icia.homepage.repository.BoardRepository;
import com.icia.homepage.repository.HomepageRepository;

@Service
public class BoardServiceImpl implements BoardService {
@Autowired
private BoardRepository br;

	
	@Override
	public void save(BoardDTO board) throws IllegalStateException, IOException {
		// dto에 담긴 파일을 가져옴 
		MultipartFile b_file = board.getB_file();
		// 파일 이름을 가져옴(파일이름을 DB에 저장하기 위해)
		String b_filename = b_file.getOriginalFilename();
		// 파일명 중복을 피하기 위해 파일이름앞에 현재 시간값을 붙임. 
		b_filename = System.currentTimeMillis() + "-" + b_filename;
		System.out.println("b_filename: " + b_filename);
		// 파일 저장 경로 세팅 
		String savePath = "D:\\development\\source\\spring\\HomepageProject\\src\\main\\webapp\\resources\\upload\\"+b_filename;
		// bfile이 비어있지 않다면(즉 파일이 있으면) savePath에 저장을 하겠다.
		if(!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));
		}
		// 여기까지의 내용은 파일을 저장하는 과정 
		
		// DB에 저장하기 위해 dto에 파일이름을 담는다.
		board.setB_filename(b_filename);

		br.save(board);
		
	}
	
	@Override
	public List<BoardDTO> findAll() {
		return br.findAll();
	}
	
	private static final int PAGE_LIMIT = 5; 
	private static final int BLOCK_LIMIT = 3; 

	@Override
	public List<BoardDTO> pagingList(int page) {
		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
		List<BoardDTO> pagingList = br.pagingList(pagingParam);
		for(BoardDTO b: pagingList) {
			System.out.println(b.toString());
		}
		return pagingList;
	}

	@Override
	public PageDTO paging(int page) {
		int boardCount = br.boardCount(); 
		int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT)); 
		int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if(endPage > maxPage)
			endPage = maxPage; 
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		System.out.println("paging.toString(): "+ paging.toString());
		
		return paging;
	}

	@Override
	public BoardDTO findById(long b_number) {
		br.hits(b_number);
		return br.findById(b_number);
	}

	@Override
	public void delete(long b_number) {
	br.delete(b_number);
		
	}

	@Override
	public void update(BoardDTO board) {
		br.update(board);
		
	}

	@Override
	public List<BoardDTO> search(String searchtype, String keyword) {
		Map<String, String> searchParam = new HashMap<String, String>();
		searchParam.put("type", searchtype);
		searchParam.put("word", keyword);
		List<BoardDTO> boardList = br.search(searchParam);
		return boardList;
	}




}
