package com.cloud.quartz;

import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;

/**
 * Quartz调度管理器
 * @author five
 *
 */
public class QuartzManager {
	private static String JOB_GROUP_NAME = "EXTJWEB_JOBGROUP_NAME";
    private static String TRIGGER_GROUP_NAME = "EXTJWEB_TRIGGERGROUP_NAME";
    /**
     * 添加一个定时任务，使用默认任务组名，触发器名，触发器组名
     * @param sched 调度器
     * @param jobName 任务名
     * @param cls 任务
     * @param time 时间设置,参考quartz说明文档
     */
    public static void addJob(Scheduler sched,String jobName,Class cls,String time){
    	try{
    		JobDetail jobDetail = new JobDetail(jobName,JOB_GROUP_NAME,cls);//任务名，任务组，任务执行类
    		//触发器
    		CronTrigger trigger = new CronTrigger(jobName,TRIGGER_GROUP_NAME);//触发器名，触发器组
    		trigger.setCronExpression(time);//触发器时间设置
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
			JobDetail jobDetail = new JobDetail(jobName,jobGroupName,jobClass);//任务名，任务组，任务执行类
			//触发器
			CronTrigger trigger = new CronTrigger(triggerName,triggerGroupName);
			trigger.setCronExpression(time);//触发器时间设置
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
			CronTrigger trigger = (CronTrigger)sched.getTrigger(jobName, TRIGGER_GROUP_NAME);
			if(trigger == null){
				return;
			}
			String oldTime = trigger.getCronExpression();
			if(!oldTime.equalsIgnoreCase(time)){
				JobDetail jobDetail = sched.getJobDetail(jobName, JOB_GROUP_NAME);
				Class objJobClass = jobDetail.getJobClass();
				removeJob(sched,jobName);
				addJob(sched, jobName, objJobClass, time);
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
    		CronTrigger trigger = (CronTrigger)sched.getTrigger(triggerName, triggerGroupName);
    		if(trigger == null){
    			return;
    		}
    		String oldTime = trigger.getCronExpression();
    		if(!oldTime.equalsIgnoreCase(time)){
    			CronTrigger ct = (CronTrigger)trigger;
    			//修改时间
    			ct.setCronExpression(time);
    			//重启触发器
    			sched.resumeJob(triggerName, triggerGroupName);
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
			sched.pauseTrigger(jobName, TRIGGER_GROUP_NAME);//停止触发器
			sched.unscheduleJob(jobName, TRIGGER_GROUP_NAME);//移除触发器
			sched.deleteJob(jobName, JOB_GROUP_NAME);//删除任务
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
			sched.pauseTrigger(triggerName, triggerGroupName);
			sched.unscheduleJob(triggerName, triggerGroupName);
			sched.deleteJob(jobName, jobGroupName);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
    /**
     * 开始多有定时任务
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
