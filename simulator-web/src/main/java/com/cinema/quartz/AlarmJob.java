package com.cinema.quartz;

import java.text.ParseException;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cinema.common.service.DataimportService;
import com.cinema.sys.utils.SpringBeanUtil;

/**
 * 告警定时任务
 */
public class AlarmJob implements Job{

	//标示定时任务是否正在运行
	public static volatile Boolean isRun = false;
	
	private Logger logger = LoggerFactory.getLogger(AlarmJob.class);
	private final DataimportService dataimportService = SpringBeanUtil.getBean(DataimportService.class);
//	private final AlarmSetService alarmSetService = SpringBeanUtil.getBean(AlarmSetService.class);
//	private final AlarmService alarmService = SpringBeanUtil.getBean(AlarmService.class);
//	private final FtfcService frfcService = SpringBeanUtil.getBean(FtfcService.class);
	
	/**
	 * 查询分厅分场包中，每一场的数据，判断是否有报警
	 */
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		isRun = true;
			try {
//				Map<String, Object> paraMap = alarmSetService.getMap(null);
//				alarmService.insertAlarm(paraMap);

				// 查询影院设备是否报警，并保存日志
//				getHallNotExistDevice();
				//更新影院状态
				//UpdateCinemaState.getUpdateCinemaState().quartzUpdateCinemaState();
//				UpdateHallState.quartzUpdateHallState();
				
			}catch (Exception ex) {
				ex.printStackTrace();
			}finally {
				isRun = false;
			}
		}
	
	// 影厅不存在设备的报警
	private void getHallNotExistDevice() throws ParseException{
//		TAlarmType logType = alarmSetService.getAlarmTypeByCode("device");
//		List<Alarm> list=alarmService. getHallNotExistDevice();
//		Map<String, String> hallMap = new HashMap<> ();
//		for(Alarm m:list) {
//			String key=m.getCinemaName()+","+m.getCinemaId();
//			String preValue=hallMap.get(key);
//			String value=preValue==null?m.getHallNum():preValue+","+m.getHallNum();
//			hallMap.put(key, value);
//		}
//
//		StringBuffer sb;
//		for(Entry<String,String> entry:hallMap.entrySet()) {
//			sb = new StringBuffer();
//			String[] key=entry.getKey().split(",");
//			sb.append("设备异常:影厅不存在设备：")
//			.append("影院：").append(key[0])
//			.append(",影厅：").append(entry.getValue())
//			.append("号厅,不存在设备 ");
//			alarmService.saveAlarmLog(logType, key[1], sb.toString(),new Date() );
//		}
	}
}




