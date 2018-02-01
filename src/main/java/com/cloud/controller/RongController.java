package com.cloud.controller;

import com.cloud.util.DateUtil;
import com.cloud.util.Resource;
import io.rong.models.SdkHttpResult;

import java.util.ArrayList;
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

import com.cloud.entity.Message;
import com.cloud.entity.User;
import com.cloud.service.MessageService;
import com.cloud.service.UserService;
import com.cloud.util.RongAPI;
import com.cloud.util.StringUtil;


@Controller  
@RequestMapping("/rong") 
public class RongController {
	 private static final Logger LOGGER = Logger.getLogger(RongController.class);
	 
	 @Autowired
	 private MessageService messageService;
	 
	 @Autowired
	 private UserService userService;
	 
	 @RequestMapping("/get_token.json")
	 public @ResponseBody SdkHttpResult get_token(HttpServletRequest request,Model model){
		 HttpSession session = request.getSession();
		 User user = (User)session.getAttribute("user");
		 SdkHttpResult result = RongAPI.getToken(user.getId(), user.getUsername(), "");
		 return result;
	 }
	 
	 @RequestMapping("/send_message.json")
	 public @ResponseBody Map<String,Object> send_message(int id,String message,HttpServletRequest request,Model model){
		 HttpSession session = request.getSession();
		 User user = (User)session.getAttribute("user");
		 
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 //本地储存消息记录
		 Message msg = new Message();
		 msg.setFromUser(user);
		 msg.setToUser(userService.get(id));
		 msg.setCreateTime(DateUtil.convertDate(new Date()));
		 msg.setContent(message);
		 msg.setIsRead(Resource.N);
		 messageService.save(msg);
		 
		 List<String> toIds = new ArrayList<String>();
		 toIds.add(id+"");
		 
		 SdkHttpResult result = RongAPI.sendStringMessage(message,user.getId(),toIds);
		 returnMap.put("result", result);
		 returnMap.put("user", user);
		 
		 return returnMap;
	 }
	 
	 @RequestMapping("/get_messages.json")
	 public @ResponseBody Map<String,Object> get_messages(int id,HttpServletRequest request,Model model){
		 HttpSession session = request.getSession();
		 User user = (User)session.getAttribute("user");
		 
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 
		 List<Message> msgs = messageService.getMessages(user.getId(),id);
		 
		 //TODO 修改未读消息为Y
		 messageService.updateReadMessage(user.getId(),id , Resource.Y);
		 
		 returnMap.put("user", userService.get(id));
		 returnMap.put("msgs", msgs);
		 
		 return returnMap;
	 }
	 
	 
}
