package com.cloud.quartz;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.entity.MailQuartz;
import com.cloud.entity.User;
import com.cloud.service.MailQuartzService;
import com.cloud.service.UserService;
import com.cloud.util.MailThread;
import com.cloud.util.StringUtil;

/**
 * quartz定时器类
 * @author five
 *
 */
public class MailQuartzJob implements Job{
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MailQuartzService mailQuartzService;
	
	public void execute(JobExecutionContext context) throws JobExecutionException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		//TODO 取出参数
		JobDataMap dataMap = context.getJobDetail().getJobDataMap();
		Integer id = dataMap.getIntValue("id");
		MailQuartz mail = mailQuartzService.get(id);
		
		System.out.println(date+": ["+mail.getJobName()+"] mail spring quartz is running...");
		//TODO 此处进行相关邮件操作
		List<User> users = userService.findAll();
		String title = mail.getTitle();
		String content = mail.getContent();
		//TODO 开启邮件发送线程
		Thread mailThread = new MailThread(users, title, content);
		mailThread.start();
		
	}
}
