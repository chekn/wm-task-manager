package com.yicai.temp.task;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.commons.lang.time.DateFormatUtils;

/**
 * 
 * @author Pactera-NEN
 * @date 2016年1月18日-下午4:03:33
 */
public class SimpleFixedTimeRateTask {
	
	private Timer timer;
	private List<StartEndTime> startEndTimes;
	private int periodMs;
	private NestedLogic nestedLogic;
	
	public SimpleFixedTimeRateTask(List<StartEndTime> startEndTimes, int periodMs, NestedLogic nestedLogic){
		this.timer=new Timer();
		this.startEndTimes=startEndTimes;
		this.periodMs=periodMs;
		this.nestedLogic=nestedLogic;
	}
	
	public void launch(){
		timer.scheduleAtFixedRate(new lightTask(), 0, periodMs);
	}	
	
	public void stop(){
		timer.cancel();
	}
	
	class lightTask extends TimerTask{
		
		@Override
		public void run() {
			int currSpliceHHmmssInt=Integer.parseInt(DateFormatUtils.format(new Date(), "HHmmss"));
			
			//判断是否处于时间段中， 只执行一次内部逻辑
			for(StartEndTime set: startEndTimes) {
				int startHHmmssSpliceInt=Integer.parseInt(set.getStartHHmmss().replace(":", ""));
				int endHHmmssSpliceInt=Integer.parseInt(set.getEndHHmmss().replace(":", ""));
				if(currSpliceHHmmssInt>startHHmmssSpliceInt && currSpliceHHmmssInt<endHHmmssSpliceInt){
					nestedLogic.doBusi();
					break;
				}
			}
		}
		
	}	
	
	//使用示例
	public static void main(String[] args){
		//业务
		NestedLogic nl=new NestedLogic(){

			public void doBusi() {
				//System.out.println("业务逻辑"); 你的逻辑
				System.out.println(DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss。SSS"));
			}
			
		};
		
		//时间
		StartEndTime set=new StartEndTime("11:00:10", "12:30:10");
		
		//调用
		new SimpleFixedTimeRateTask(Arrays.asList(set), 500, nl).launch();
		
	}
	
	/**
	 * 内嵌逻辑
	 * 
	 * @author Pactera-NEN
	 * @date 2016年2月16日-下午6:20:53
	 */
	public interface NestedLogic{
		public void doBusi();
	}
	
	/**
	 * 配置参数类
	 * 
	 * @author Pactera-NEN
	 * @date 2016年5月6日-上午11:16:01
	 */
	public static class StartEndTime {
		private String startHHmmss;
		private String endHHmmss;
		
		public StartEndTime(String startHHmmss, String endHHmmss) {
			super();
			this.startHHmmss = startHHmmss;
			this.endHHmmss = endHHmmss;
		}
		
		//getter and setter
		public String getStartHHmmss() {
			return startHHmmss;
		}
		public void setStartHHmmss(String startHHmmss) {
			this.startHHmmss = startHHmmss;
		}
		
		public String getEndHHmmss() {
			return endHHmmss;
		}
		public void setEndHHmmss(String endHHmmss) {
			this.endHHmmss = endHHmmss;
		}
	}
}

