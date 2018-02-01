package com.cloud.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cloud.util.DateUtil;
import org.apache.log4j.Logger;
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
import com.cloud.service.UserService;
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
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> save(Comment comment,HttpServletRequest request,Model model){
		String message = "恭喜您，评论成功！";
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		Date now = new Date();
		
		comment.setUser(user);
		comment.setCreateTime(DateUtil.convertDate(now));
		
		int comment_id = commentService.save(comment);
		
		Content c = contentService.get(comment.getCont().getId());
		
		//TODO 给发布者提醒
		String title = "评论消息";
		String str = StringUtil.HTML2Text(c.getContent()).trim();
		str = str.equals("") ? "无标题" : str;
		String content = "<font user-id='"+user.getId()+"' data-id='"+comment_id+"'>"+user.getUsername()+"</font>评论帖子\""+StringUtil.substring(str, 10)+"\"："+comment.getContent();
		SysLog log = new SysLog();
		log.setTitle(title);
		log.setContent(content);
		log.setUser(c.getUser());
		log.setCreateTime(DateUtil.convertDate(now));
		log.setIsRead("N");
		sysLogService.save(log);
		
		returnMap.put("comment", comment);
		returnMap.put("message", message);
		
		return returnMap;
	}
	
	@RequestMapping("/reply.json")
	public @ResponseBody Map<String,Object> reply(Comment comment,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Date now = new Date();
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 200;
		String message = "恭喜您，回复成功！";
		
		//TODO 修改已读状态
		SysLog l = sysLogService.get(comment.getLogId());
		l.setIsRead("Y");
		sysLogService.update(l, l.getId());
		
		//TODO 新增评论内容
		Comment cmt = commentService.get(comment.getComment().getId());
		Content c = contentService.get(cmt.getCont().getId());
		User toUser = userService.get(comment.getToUser().getId());
		comment.setUser(user);
		comment.setCont(c);
		comment.setCreateTime(DateUtil.convertDate(now));
		comment.setComment(cmt);
		comment.setToUser(toUser);
		commentService.save(comment);
		
		String content = "<font user-id='"+user.getId()+"' data-id='"+cmt.getId()+"'>"+user.getUsername()+"</font>回复评论："+comment.getContent();
		//TODO 发送消息到对应用户。
		SysLog log = new SysLog();
		log.setContent(content);
		log.setCreateTime(DateUtil.convertDate(now));
		log.setUser(toUser);
		log.setIsRead("N");
		log.setTitle("回复消息");
		sysLogService.save(log);
		
		returnMap.put("code", code);
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
		
		List<Comment> comments = commentService.getListToContentIdAndCommentId(page,100,contentId,0,"DESC");
		for(Comment c:comments){
			List<Comment> cs = commentService.getListToContentIdAndCommentId(page,100,contentId,c.getId(),"ASC");
			c.setComments(cs);
		}
		
		returnMap.put("comments", comments);
		
		return returnMap;
	}
	
	@RequestMapping("/getlist.json")
	public @ResponseBody Map<String,Object> getlist(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		List<Comment> comments = commentService.getListToCommentId(id);
		Comment c = commentService.get(id);
		comments.add(0, c);
		returnMap.put("comments", comments);
		return returnMap;
	}
	
	
}
