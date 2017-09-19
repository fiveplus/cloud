package com.cloud.spring;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cloud.entity.MailQuartz;
import com.cloud.quartz.MailQuartzJob;
import com.cloud.quartz.QuartzManager;
import com.cloud.service.MailQuartzService;


public class SystemConfigListener implements ServletContextListener{
	/** 当前应用上下文 */
	private ServletContext context;
	
	@Autowired
	private MailQuartzService mailQuartzService;
	
	//TODO 动态任务调度
	@Autowired
	private SchedulerFactoryBean schedulerFactoryBean;
	
	public void contextInitialized(ServletContextEvent sce) {
		context = sce.getServletContext();
		//TODO autowired注入
		WebApplicationContextUtils.getRequiredWebApplicationContext(context).getAutowireCapableBeanFactory().autowireBean(this);
		//contextPath = context.getContextPath();
		//contextPath = PropertiesUtil.getValue("domain");
		//全站注入
		String contextPath = context.getContextPath();
		context.setAttribute("contextPath", contextPath);
		
		//TODO 定时器启动
		List<MailQuartz> list =  mailQuartzService.findAll();
		for(MailQuartz m:list){
			String jobName = m.getJobName();
			String time = m.getCron();
			String status = m.getStatus();
			if(status.equals("Y")){
				//TODO 启动定时任务
				Scheduler sche = schedulerFactoryBean.getScheduler();
				QuartzManager.addJob(sche, jobName, MailQuartzJob.class, time);
			}
		}
	}

	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
