package com.yicai.temp.task;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.commons.lang.time.DateFormatUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

/**
 * 
 * @author Pactera-NEN
 * @date 2016年1月18日-下午4:03:33
 */
public class SimpleFixedTimeTask {
	
	private Timer timer;
	private List<String> oneDayTimes;
	private NestedLogic nestedLogic;
	
	public SimpleFixedTimeTask(List<String> _HHmmss, NestedLogic nestedLogic){
		this.timer=new Timer();
		this.oneDayTimes=_HHmmss;
		this.nestedLogic=nestedLogic;
	}
	
	public void launch(){
		timer.scheduleAtFixedRate(new lightTask(), 0, 1000);
	}	
	
	public void stop(){
		timer.cancel();
	}
	
	class lightTask extends TimerTask{
		
		@Override
		public void run() {
			String currHHmmss=DateFormatUtils.format(new Date(), "HH:mm:ss");
			if(oneDayTimes.contains(currHHmmss)){
				nestedLogic.doBusi();
			}
		}
		
	}	
	
	//使用示例
	public static void main(String[] args){
		//业务
		NestedLogic nl=new NestedLogic(){

			public void doBusi() {
				//System.out.println("业务逻辑"); 你的逻辑
				Document doc=null;
				try {
					doc = Jsoup.connect("http://123.57.93.233:8080/CknBlog/m/article/toArticle.action").data("aid","8a2be07d523b33d0015278911fcd0098").cookie("JSESSIONID", "74149C805515611E7D57F15400B72B3D").get();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(doc);
			}
			
		};
		//时间
		List<String> sls=new ArrayList<String>();
		sls.add("11:55:10");
		sls.add("12:30:10");
		sls.add("13:30:10");
		sls.add("15:30:10");
		sls.add("18:30:10");
		
		//调用
		new SimpleFixedTimeTask(sls,nl).launch();
		
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
	
}

