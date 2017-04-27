package com.cloud.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.entity.Skin;
import com.cloud.entity.User;
import com.cloud.service.SkinService;
import com.cloud.util.StringUtil;

@Controller
@RequestMapping("/skin")
public class SkinController {
	@Autowired
	private SkinService skinService;
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> save(int imgIndex,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Map<String,Object> returnMap = new HashMap<String, Object>();
		Skin skin = skinService.getSkinByUserId(user.getId());
		if(skin != null){
			skin.setImgIndex(imgIndex);
			skinService.update(skin, skin.getId());
		}else{
			skin = new Skin();
			skin.setImgIndex(imgIndex);
			skin.setUser(user);
			skin.setCreateTime(StringUtil.getDateToLong(new Date()));
			skinService.save(skin);
		}
		session.setAttribute("skin", skin);
		
		int code = 200;
		String message = "恭喜您，皮肤修改成功！";
		returnMap.put("code", code);
		returnMap.put("message", message);
		
		return returnMap;
	}
	
	
}
