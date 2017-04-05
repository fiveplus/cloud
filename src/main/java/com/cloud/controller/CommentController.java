package com.cloud.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.entity.Comment;
import com.cloud.entity.Content;
import com.cloud.entity.SysLog;
import com.cloud.entity.User;
import com.cloud.service.CommentService;
import com.cloud.service.ContentService;
import com.cloud.service.SysLogService;
import com.cloud.util.StringUtil;

@Controller
@RequestMapping("/comment")
public class CommentController {
	public static final Logger LOGGER = Logger.getLogger(CommentController.class);
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ContentService contentService;
	
	@Autowired
	private SysLogService sysLogService;
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> save(Comment comment,HttpServletRequest request,Model model){
		String message = "恭喜您，评论成功！";
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		Date now = new Date();
		
		comment.setUser(user);
		comment.setCreateTime(StringUtil.getDateToLong(now));
		
		commentService.save(comment);
		
		Content c = contentService.get(comment.getCont().getId());
		//TODO 给发布者提醒
		String title = "评论消息";
		String str = StringUtil.HTML2Text(c.getContent()).trim();
		str = str.equals("") ? "无标题" : str;
		String content = "<font data-id='"+user.getId()+"'>"+user.getUsername()+"</font>评论帖子\""+StringUtil.substring(str, 10)+"\"："+comment.getContent();
		SysLog log = new SysLog();
		log.setTitle(title);
		log.setContent(content);
		log.setUser(c.getUser());
		log.setCreateTime(StringUtil.getDateToLong(now));
		log.setIsRead("N");
		sysLogService.save(log);
		
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
