package com.cloud.quartz;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;

/**
 * Quartz调度管理器
 * @author five
 *
 */
public class QuartzManager {
	private final static String JOB_GROUP_NAME = "EXTJWEB_JOBGROUP_NAME";
    private final static String TRIGGER_GROUP_NAME = "EXTJWEB_TRIGGERGROUP_NAME";
    /**
     * 添加一个定时任务，使用默认任务组名，触发器名，触发器组名
     * @param sched 调度器
     * @param jobName 任务名
     * @param cls 任务
     * @param time 时间设置,参考quartz说明文档
     */
    public static void addJob(Scheduler sched,String jobName,Class cls,String time){
    	try{
    		JobDetail jobDetail = JobBuilder.newJob(cls).withIdentity(jobName, JOB_GROUP_NAME).build();//任务名，任务组，任务执行类
    		//表达式调度构建器
    		CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(time);
    		CronTrigger trigger = (CronTrigger) TriggerBuilder.newTrigger().withIdentity(jobName, TRIGGER_GROUP_NAME).withSchedule(scheduleBuilder).build(); //触发器名，触发器组
    		sched.scheduleJob(jobDetail,trigger);
    		//启动
    		if(!sched.isShutdown()){
    			sched.start();
    		}
    	}catch(Exception e){
    		throw new RuntimeException(e);
    	}
    }
    
    /**
     * 添加一个定时任务
     * @param sched 调度器
     * @param jobName 任务名
     * @param jobGroupName 任务组名
     * @param triggerName 触发器名
     * @param triggerGroupName  触发器组名
     * @param jobClass 任务
     * @param time 时间设置，参考quartz说明文档
     */
    public static void addJob(Scheduler sched,String jobName,String jobGroupName,String triggerName,String triggerGroupName,Class jobClass,String time){
    	try {
			JobDetail jobDetail = JobBuilder.newJob(jobClass).withIdentity(jobName, jobGroupName).build();//任务名，任务组，任务执行类
			//表达式调度构建器
			CronScheduleBuilder schedBuilder = CronScheduleBuilder.cronSchedule(time);
			CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(jobName, triggerGroupName).withSchedule(schedBuilder).build();
			sched.scheduleJob(jobDetail,trigger);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
    /**
     * 修改一个任务的触发时间
     * @param sched 调度器
     * @param jobName 任务名称
     * @param time 时间设置
     */
    public static void modifyJobTime(Scheduler sched,String jobName,String time){
		try {
			TriggerKey triggerKey = TriggerKey.triggerKey(jobName,JOB_GROUP_NAME);
			CronTrigger trigger = (CronTrigger)sched.getTrigger(triggerKey);
			if(trigger == null){
				return;
			}
			String oldTime = trigger.getCronExpression();
			if(!oldTime.equalsIgnoreCase(time)){
				//表达式构建器
				CronScheduleBuilder schedBuilder = CronScheduleBuilder.cronSchedule(time);
				//按新的cronExpression表达式重新构建trigger
				trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(schedBuilder).build();
				//按新的trigger重新设置job执行
				sched.rescheduleJob(triggerKey, trigger);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
    /**
     * 修改一个任务的触发时间
     * @param sched 调度器
     * @param triggerName 触发器名称
     * @param triggerGroupName 触发器组名称
     * @param time 时间设置
     */
    public static void modifyJobTime(Scheduler sched,String triggerName,String triggerGroupName,String time){
    	try {
    		TriggerKey triggerKey = TriggerKey.triggerKey(triggerName,triggerGroupName);
    		CronTrigger trigger = (CronTrigger)sched.getTrigger(triggerKey);
    		if(trigger == null){
    			return;
    		}
    		String oldTime = trigger.getCronExpression();
    		if(!oldTime.equalsIgnoreCase(time)){
    			//表达式构建器
				CronScheduleBuilder schedBuilder = CronScheduleBuilder.cronSchedule(time);
				//按新的cronExpression表达式重新构建trigger
				trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(schedBuilder).build();
				//按新的trigger重新设置job执行
				sched.rescheduleJob(triggerKey, trigger);
    		}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
    
    /**
     * 移除一个任务
     * @param sched 调度器
     * @param jobName 任务名称
     */
    public static void removeJob(Scheduler sched,String jobName){
    	try {
    		JobKey jobKey = JobKey.jobKey(jobName, JOB_GROUP_NAME);
    		sched.pauseJob(jobKey);
    		TriggerKey triggerKey = TriggerKey.triggerKey(jobName, TRIGGER_GROUP_NAME);
    		sched.pauseTrigger(triggerKey);//暂停触发器
			sched.unscheduleJob(triggerKey);//移除触发器
			sched.deleteJob(jobKey);//删除任务
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
    /**
     * 移除一个任务
     * @param sched 调度器
     * @param jobName 任务名称
     * @param jobGroupName 任务组名称
     * @param triggerName 触发器名称
     * @param triggerGroupName 触发器组名称
     */
    public static void removeJob(Scheduler sched,String jobName,String jobGroupName,String triggerName,String triggerGroupName){
    	try {
    		JobKey jobKey = JobKey.jobKey(jobName, jobGroupName);
    		sched.pauseJob(jobKey);
    		TriggerKey triggerKey = TriggerKey.triggerKey(triggerName, triggerGroupName);
    		sched.pauseTrigger(triggerKey);//暂停触发器
			sched.unscheduleJob(triggerKey);//移除触发器
			sched.deleteJob(jobKey);//删除任务
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
    /**
     * 开始所有定时任务
     * @param sched 调度器
     */
    public static void startJobs(Scheduler sched){
    	try {
			sched.start();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
    /**
     * 关闭所有定时任务
     * @param sched 调度器
     */
    public static void shutdownJobs(Scheduler sched){
    	try {
			if(!sched.isShutdown()){
				sched.shutdown();
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
    
}
