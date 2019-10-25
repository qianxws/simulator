package com.cinema.quartz;

import java.util.TimeZone;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.impl.StdSchedulerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 告警任务调度器
 * @author hanxu
 */
public class AlarmScheduler {
	
	private static final Logger logger = LoggerFactory.getLogger(AlarmScheduler.class);
	private SchedulerFactory schedulerFactory = new StdSchedulerFactory();
	
	//单例
	private static AlarmScheduler alarmScheduler = new AlarmScheduler();
	private AlarmScheduler () {
		
	}
	public static AlarmScheduler getAlarmScheduler() {
		return alarmScheduler;
	}
	
	/**
	 * 创建调度任务
	 * @throws SchedulerException 
	 */
	public void startSchdeulerJob(String hour, String minute) throws SchedulerException {
		
		String cron = "0 " + minute + " " + hour + " * * ?";
		
		CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder
				.cronSchedule(cron).inTimeZone(TimeZone.getTimeZone("GMT+08:00"));
		
		//创建任务
		JobDetail jobDetail = JobBuilder.newJob(AlarmJob.class).withIdentity("alarm", "alarm").build();
		//创建任务触发器
		Trigger trigger = TriggerBuilder.newTrigger().withIdentity("alarm", "alarm")
				.withSchedule(cronScheduleBuilder)
				.build();
		
		Scheduler scheduler = schedulerFactory.getScheduler();
		//将任务及其触发器放入调度器
		scheduler.scheduleJob(jobDetail, trigger);
		//调度器开始任务
		scheduler.start();
		
		logger.info("创建定时任务,时间：" + hour + ":" + minute + ";cron=" + cron);
	}
	
	/**
	 * 修改调度任务
	 * @throws SchedulerException 
	 */
	public void updateSchdeulerJob(String hour, String minute) throws SchedulerException {
		
		String cron = "0 " + minute + " " + hour + " * * ?";
		
		CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder
				.cronSchedule(cron)
				.inTimeZone(TimeZone.getTimeZone("GMT+08:00"));
		
		//获得调度器
		Scheduler scheduler = schedulerFactory.getScheduler();
		
		TriggerKey triggerKey = TriggerKey.triggerKey("alarm", "alarm");
		
		//获得任务触发器
		Trigger trigger = scheduler.getTrigger(triggerKey);
		
		if (trigger != null) {
			if (!((CronTrigger)trigger).getCronExpression().equals(cron)) {
				
				trigger = TriggerBuilder.newTrigger().withIdentity("alarm", "alarm").startNow()
						.withSchedule(cronScheduleBuilder).build();
				
				scheduler.rescheduleJob(triggerKey, trigger);

				logger.info("更新定时任务,时间：" + hour + ":" + minute);
			}else {
				logger.info("触发器修改前后时间相同,时间：" + hour + ":" + minute + ";cron=" + cron);
			}
		}else {
			logger.info("没有触发器");
			this.startSchdeulerJob(hour, minute);
		}
		
	}
	
	
	public static void main(String[] args) throws SchedulerException {
//		AlarmScheduler.startSchdeulerJob("15", "19");
//		AlarmScheduler.updateSchdeulerJob("15", "21");
//		AlarmScheduler.startSchdeulerJob();
	}
	
}
