package com.icia.homepage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.homepage.dto.CommentDTO;
import com.icia.homepage.service.CommentService;

@Controller
@RequestMapping(value="/comment/*")
public class CommentController {
@Autowired
private CommentService cs;

	// 댓글작성
	@RequestMapping(value="save",method=RequestMethod.POST)
	public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO comment){
		cs.save(comment);
		List<CommentDTO> commentList = cs.findAll(comment.getB_number());
		return commentList;
	
	}

}
