package com.cloud.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.entity.MailQuartz;
import com.cloud.entity.User;
import com.cloud.quartz.MailQuartzJob;
import com.cloud.quartz.QuartzManager;
import com.cloud.service.MailQuartzService;
import com.cloud.util.PageUtil;
import com.cloud.util.StringUtil;

@Controller
@RequestMapping("/admin/mail")
public class MailQuartzAdminController{
	//TODO 动态任务调度
	@Autowired
	private SchedulerFactory schedFactory;
	
	@Autowired
	private MailQuartzService mailQuartzService;
	
	@RequestMapping("/list")
	public String list(int page,HttpServletRequest request,Model model){
		int pageSize = 10;
		int count = mailQuartzService.getListCount(null, null);
		PageUtil pu = new PageUtil(page, count, pageSize);
		List<MailQuartz> list = mailQuartzService.getList(page, pageSize, null, null);
		
		model.addAttribute("pu",pu);
		model.addAttribute("mails",list);
		
		return "admin/mail/mails";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request,Model model){
		return "admin/mail/add_mail";
	}
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> save(MailQuartz mail,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 200;
		String msg = "恭喜您，邮件任务创建成功！";
		
		MailQuartz m = mailQuartzService.getMailQuartzToJobName(mail.getJobName());
		if(m == null){
			mail.setCreateTime(StringUtil.getDateToLong(new Date()));
			mail.setStatus("N");
			mail.setUser(user);
			int id = mailQuartzService.save(mail);
			if(id > 0){
				
			}else{
				code = -1;
				msg = "很抱歉，邮件任务创建失败！";
			}
		}else{
			msg = "邮件任务名称重复，请检查后重新输入！";
			code = -1;
		}
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
	@RequestMapping("upt")
	public String upt(int id,HttpServletRequest request,Model model){
		MailQuartz mail= mailQuartzService.get(id);
		model.addAttribute("mail",mail);
		return "admin/mail/update_mail";
	}
	
	@RequestMapping("/update.json")
	public @ResponseBody Map<String,Object> update(MailQuartz mail,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int code = 200;
		String msg = "恭喜您，邮件任务修改成功！";
		boolean flag = true;
		MailQuartz m = mailQuartzService.get(mail.getId());
		if(!m.getJobName().equals(mail.getJobName())){
			MailQuartz t_mail = mailQuartzService.getMailQuartzToJobName(mail.getJobName());
			if(t_mail != null){
				flag = false;
				code = -1;
				msg = "邮件任务名称重复，请检查后重新输入！";
			}
		}
		if(flag){
			mailQuartzService.update(mail, mail.getId());
		}
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		
		return returnMap;
	}
	
	@RequestMapping("/delete.json")
	public @ResponseBody Map<String,Object> delete(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int code = 200;
		String msg = "恭喜您，邮件任务删除成功。";
		
		mailQuartzService.delete(id);
		model.addAttribute("code",code);
		model.addAttribute("msg",msg);
		
		return returnMap;
	}
	
	@RequestMapping("/pause.json")
	public @ResponseBody Map<String,Object> pause(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int code = 200;
		String msg = "恭喜您，邮件暂停启动成功！";
		
		MailQuartz mail = mailQuartzService.get(id);
		//TODO 暂停任务
		try{
			Scheduler sche = schedFactory.getScheduler();
			String jobName = mail.getJobName();
			QuartzManager.removeJob(sche, jobName);
			//TODO 修改状态
			mail.setStatus("N");
			mailQuartzService.update(mail, mail.getId());
		}catch(Exception e){
			e.printStackTrace();
		}
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		
		return returnMap;
	}
	
	@RequestMapping("/start.json")
	public @ResponseBody Map<String,Object> start(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int code = 200;
		String msg = "恭喜您，邮件任务启动成功！";
		MailQuartz mail = mailQuartzService.get(id);
		//TODO 启动任务
		try {
			Scheduler sche = schedFactory.getScheduler();
			String jobName = mail.getJobName();
			String cron = mail.getCron();
			QuartzManager.addJob(sche, jobName, MailQuartzJob.class, cron);
			//TODO 修改数据库
			mail.setStatus("Y");
			mailQuartzService.update(mail, mail.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		
		return returnMap;
	}
	
	
}
