package com.cloud.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.cloud.controller.ApplicationController;
import com.cloud.entity.User;
/**
 * 开启线程执行群发邮件操作。
 * @author five
 *
 */
public class MailThread extends Thread{
	private static final Logger LOGGER = Logger.getLogger(MailThread.class);
	private List<User> users;
	private String title;
	private String content;
	public MailThread(List<User> users,String title,String content){
		this.users = users;
		this.title = title;
		this.content = content;
	}

	private boolean validateEmail(String email){
		String EMAIL_REGEX = "^(.+)@(.+)$";
		boolean flag = email.matches(EMAIL_REGEX);
		return flag;
	}
	
	public void run() {
		for(User user:users){
			try{
				if(validateEmail(user.getLoginName())){
					//TODO 验证邮箱格式正确
					List<String> to = new ArrayList<String>();
					to.add(user.getLoginName());
					new MailUtil().sendMail(to, title, content, null);
				}
			}catch(Exception e){
				LOGGER.error(e);
			}
		}
	}

}
