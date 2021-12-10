package com.icia.homepage.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.icia.homepage.dto.BoardDTO;
import com.icia.homepage.dto.CommentDTO;
import com.icia.homepage.dto.PageDTO;
import com.icia.homepage.service.BoardService;
import com.icia.homepage.service.CommentService;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
@Autowired
private BoardService bs;
@Autowired
private CommentService cs;
	
	// 글작성 페이지 출력
	@RequestMapping(value="save", method=RequestMethod.GET)
	public String saveform() {
		return "board/save";
	}
	// 글작성
	@RequestMapping(value="save", method=RequestMethod.POST)
	public String save(@ModelAttribute BoardDTO board, Model model) throws IllegalStateException, IOException {
		List<BoardDTO> boardList = bs.findAll();
		model.addAttribute("boardList",boardList);
		bs.save(board);
		return "redirect:/board/paging";
	}

	
	// 페이징
	@RequestMapping(value="paging", method=RequestMethod.GET)
	// value: 파라미터이름, required: 필수여부, defaultValue: 기본값(page 요청값이 없으면 1로 세팅)
	public String paging(@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {
		List<BoardDTO> boardList = bs.pagingList(page);
		PageDTO paging = bs.paging(page);
		model.addAttribute("boardList", boardList);
		model.addAttribute("paging", paging);
		return "board/findAll";
	}
	//글 상세정보 보기
		@RequestMapping(value="detail",method=RequestMethod.GET)
		public String findById(@ModelAttribute CommentDTO comment, @RequestParam("b_number") long b_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
			List<CommentDTO> commentList = cs.findAll(comment.getB_number());
			model.addAttribute("commentList",commentList);
			
			BoardDTO board = bs.findById(b_number);
			model.addAttribute("board",board);
			model.addAttribute("page",page);
			return "board/detail";
		}
	// 게시글삭제
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam("b_number") long b_number) {
		bs.delete(b_number);
		return "redirect:/board/paging";
	}
	
	// 글 수정 페이지 열기
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateform(@RequestParam("b_number") long b_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		BoardDTO board = bs.findById(b_number);
		model.addAttribute("board",board);
		model.addAttribute("page",page);
		return "board/update";
	}

	
	// 글 수정 
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(@ModelAttribute BoardDTO board, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		bs.update(board);
		return "redirect:/board/detail?b_number="+board.getB_number() + "&page=" + page;
	}
	
	// 검색기능
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(@RequestParam("searchtype") String searchtype,@RequestParam("keyword") String keyword, Model model) {
		List<BoardDTO> boardList= bs.search(searchtype, keyword);
		model.addAttribute("boardList",boardList);
		return "board/findAll";
	}

	
	
	
	
	
	
	
	
}
