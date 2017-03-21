package com.cloud.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.entity.Comment;
import com.cloud.entity.User;
import com.cloud.service.CommentService;
import com.cloud.util.StringUtil;

@Controller
@RequestMapping("/comment")
public class CommentController {
	public static final Logger LOGGER = Logger.getLogger(CommentController.class);
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> save(Comment comment,HttpServletRequest request,Model model){
		String message = "恭喜您，评论成功！";
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		comment.setUser(user);
		comment.setCreateTime(StringUtil.getDateToLong(new Date()));
		
		commentService.save(comment);
		
		returnMap.put("comment", comment);
		returnMap.put("message", message);
		
		return returnMap;
	}
	
	@RequestMapping("/delete.json")
	public @ResponseBody Map<String,Object> delete(int id,HttpServletRequest request,Model model){
		String message = "恭喜您，删除成功！";
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		commentService.delete(id);
		
		returnMap.put("message", message);
		return returnMap;
	}
	
	@RequestMapping("/list.json")
	public @ResponseBody Map<String,Object> list(int page,int contentId,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		List<Comment> comments = commentService.getListToContentId(page,100,contentId);
		
		returnMap.put("comments", comments);
		
		return returnMap;
	}
	
	
}
