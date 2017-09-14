package com.cloud.quartz;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.entity.User;
import com.cloud.service.UserService;
import com.cloud.util.StringUtil;

/**
 * quartz定时器类
 * @author five
 *
 */
public class MailQuartzJob implements Job{
	
	@Autowired
	private UserService userService;
	
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		System.out.println(date+":mail spring quartz is running...");
		//TODO 此处进行相关邮件操作
		List<User> users = userService.findAll();
		
	}
}
