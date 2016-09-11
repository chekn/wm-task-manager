package com.yicai.temp.task;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.yicai.dt.modhs.client.HsVisitorClient;
import com.yicai.medialab.writingmaster.extraction.amplitude15pct.Amplitude15PctMonitor;
import com.yicai.medialab.writingmaster.extraction.blockupdowntop5.BlockUpDownTop5Monitor;
import com.yicai.medialab.writingmaster.extraction.chg5minstktest.Chg5MinStkTestMonitor;
import com.yicai.medialab.writingmaster.extraction.core.api.InfoExtraction;
import com.yicai.medialab.writingmaster.extraction.hkindexquote.HKIndexQuoteMonitor;
import com.yicai.medialab.writingmaster.extraction.ifquote.IFQuoteMonitor;
import com.yicai.medialab.writingmaster.extraction.indexquote.IndexQuoteMonitor;
import com.yicai.medialab.writingmaster.extraction.turnovertop10.TurnoverTop10Monitor;
import com.yicai.temp.task.SimpleFixedTimeRateTask.StartEndTime;
import com.yicai.temp.task.SimpleFixedTimeTask.NestedLogic;
import com.yicai.temp.task.drupal.SimpleDrupalTool;
import com.yicai.temp.task.mongo.MongoDBTool;
import com.yicai.temp.task.util.ExceptionTool;

/**
 * 
 * @author Pactera-NEN
 * @date 2016年2月29日-下午2:04:24
 */
@Component
public class All {
	
	private static Log logger=LogFactory.getLog(All.class);
	private String mongoDbName="hq_jar";
	
	@Autowired
	private HsVisitorClient hsv;
	
	public Map<String,Object> unifiedParseReq(InfoExtraction infoExtraction, Map<String,Object> rawData) throws IOException{
		Map<String,Object> revData=infoExtraction.extractFromRawData(rawData);
		if(revData==null) throw new NullPointerException("返回的数据为空");
		return revData;
	}
	
	public void fixedTimer(final InfoExtraction infoExtraction, String sleepSecondStr, String... args){
		int sleepSecond=0;
		if(sleepSecondStr!=null)
			sleepSecond=Integer.parseInt(sleepSecondStr);
		
		final Map<String,Object> rawData=new HashMap<String,Object>();
		rawData.put(InfoExtraction.HQ_HSCLIENT_KEY, hsv);
		rawData.put(InfoExtraction.HQ_MONGOCLIENT_KEY, MongoDBTool.getMongoClient());
		rawData.put(InfoExtraction.HQ_MONGODBNAME_KEY, mongoDbName);
		rawData.put(InfoExtraction.HQ_SLEEPSECOND_KEY, sleepSecondStr);
		
		NestedLogic nl=new NestedLogic(){
			public void doBusi() {
				String uuid="Task_"+UUID.randomUUID().toString();
				logger.info("标识当前任务ID:"+uuid+", 解析程序>"+infoExtraction.getUniqueName()+"> 开始执行:");
				
				boolean isBreak=false;
				String expStackMsg=null;
				
				try {
					Map<String,Object> revData=All.this.unifiedParseReq(infoExtraction, rawData);
					logger.info("标识当前任务ID:"+uuid+", 解析程序>"+infoExtraction.getUniqueName()+"> 执行:"+( (revData==null) ? "失败" : ("返回JSON:"+"revData") ));
					if(revData!=null && !revData.isEmpty())
						new SimpleDrupalTool().pushDataSet(infoExtraction.getUniqueName(), revData);
					else
						isBreak=true;
					
				} catch (Exception e) {
					expStackMsg=ExceptionTool.getExceptionStactInfo(e);
				}
				
				logger.info("标识当前任务ID: "+uuid+", 解析程序>"+infoExtraction.getUniqueName()
						+(  isBreak ? "> compare same with upone" : ("> 执行"+( (expStackMsg==null)? "成功": ("失败"+", 原因>"+expStackMsg))) ) );
			}
		};
		
		if(args.length==0)
			return ;
		
		new SimpleFixedTimeTask(Arrays.asList(args),nl).launch();
	}
	
	
	public void fixedRate(final InfoExtraction infoExtraction, String sleepSecondStr, String startTimeStr) throws ParseException{
		int sleepSecond=Integer.parseInt(sleepSecondStr);
		String startDateStr=DateFormatUtils.format(new Date(), "yyyyMMdd")+" "+startTimeStr;
		
		final Map<String,Object> rawData=new HashMap<String,Object>();
		rawData.put(InfoExtraction.HQ_HSCLIENT_KEY, hsv);
		rawData.put(InfoExtraction.HQ_MONGOCLIENT_KEY, MongoDBTool.getMongoClient());
		rawData.put(InfoExtraction.HQ_MONGODBNAME_KEY, mongoDbName);
		rawData.put(InfoExtraction.HQ_SLEEPSECOND_KEY, sleepSecondStr);
		
		Timer timer=new Timer();
		//scheduleAtFixedRate(TimerTask task, Date firstTime, long period)  firstTime 是第一次启动时间, 不是任务启动时间
		timer.scheduleAtFixedRate(new TimerTask(){

			@Override
			public void run() {
				String uuid="Task_"+UUID.randomUUID().toString();
				logger.info("标识当前任务ID:"+uuid+", 解析程序>"+infoExtraction.getUniqueName()+"> 开始执行:");

				boolean isBreak=false;
				String expStackMsg=null;
				
				try {
					Map<String,Object> revData=All.this.unifiedParseReq(infoExtraction, rawData);
					if(revData!=null && !revData.isEmpty())
						new SimpleDrupalTool().pushDataSet(infoExtraction.getUniqueName(), revData);
					else
						isBreak=true;
				} catch (IOException e) {
					expStackMsg=ExceptionTool.getExceptionStactInfo(e);
				}
				
				logger.info("标识当前任务ID: "+uuid+", 解析程序>"+infoExtraction.getUniqueName()
						+(  isBreak ? "> 没取到有效数据" : ("> 执行"+( (expStackMsg==null)? "成功": ("失败"+", 原因>"+expStackMsg))) ) );
			}
			
		}, DateUtils.parseDate(startDateStr, "yyyyMMdd HH:mm:ss"), sleepSecond*1000);
		
	}
	
	public void fixedTimeRate(final InfoExtraction infoExtraction, int periodMs, List<StartEndTime> sets) throws ParseException{
	    
	    final Map<String,Object> rawData=new HashMap<String,Object>();
	    rawData.put(InfoExtraction.HQ_HSCLIENT_KEY, hsv);
	    rawData.put(InfoExtraction.HQ_MONGOCLIENT_KEY, MongoDBTool.getMongoClient());
	    rawData.put(InfoExtraction.HQ_MONGODBNAME_KEY, mongoDbName);
	    rawData.put("setUdPct", "0.001");
	    rawData.put("timeFloatRange", "300000");

	    com.yicai.temp.task.SimpleFixedTimeRateTask.NestedLogic nl=new com.yicai.temp.task.SimpleFixedTimeRateTask.NestedLogic(){
	      public void doBusi() {
	        String uuid="Task_"+UUID.randomUUID().toString();
	        logger.info("标识当前任务ID:"+uuid+", 解析程序>"+infoExtraction.getUniqueName()+"> 开始执行:");
	        
	        boolean isBreak=false;
	        String expStackMsg=null;
	        
	        try {
	          Map<String,Object> revData=All.this.unifiedParseReq(infoExtraction, rawData);
	          logger.info("标识当前任务ID:"+uuid+", 解析程序>"+infoExtraction.getUniqueName()+"> 执行:"+( (revData==null) ? "失败" : ("返回JSON:"+"revData") ));
	          if(revData!=null && !revData.isEmpty())
	            new SimpleDrupalTool().pushDataSet(infoExtraction.getUniqueName(), revData);
	          else
	            isBreak=true;
	          
	        } catch (Exception e) {
	          expStackMsg=ExceptionTool.getExceptionStactInfo(e);
	        }
	        
	        logger.info("标识当前任务ID: "+uuid+", 解析程序>"+infoExtraction.getUniqueName()
	            +(  isBreak ? "> 没取到有效数据" : ("> 执行"+( (expStackMsg==null)? "成功": ("失败"+", 原因>"+expStackMsg))) ) );
	      }
	    };
	    
	    new SimpleFixedTimeRateTask(sets,periodMs,nl).launch();
	}
	
	public static void main(String[] args) throws ParseException{
		String dateStr="当前时间:"+new Date().toLocaleString();
		logger.info(dateStr);
		
		AbstractApplicationContext aac=new ClassPathXmlApplicationContext("classpath:applicationContext-task.xml");
		All all=aac.getBean(All.class);
		/*
		//1、indexquote   11:30:30   15:01:00
		all.fixedRate(new IndexQuoteMonitor(), "5", "09:25:00", "11:30:30", "15:01:00");
		//2、ifquote 	 11:30:30   15:16:00 
		all.fixedRate(new IFQuoteMonitor(), "5", "09:30:00","11:30:30", "15:16:00");
		//3、hkindexquote 12:30:30   16:00:30
		all.fixedRate(new HKIndexQuoteMonitor(), "5", "09:30:00","12:00:30", "16:01:00");
		//4、hkindexquote 11:31:00   15:01:00
		all.fixedTimer(new BlockUpDownTop5Monitor(), "5", "11:31:00", "15:01:00");
		//5、amplitude15pct 11:31:00  15:01:00
		all.fixedTimer(new Amplitude15PctMonitor(), "5", "11:31:00","15:01:00");
		//6、turnovertop10 11:31:00  15:01:00
		all.fixedTimer(new TurnoverTop10Monitor(), "5", "11:31:00","15:01:00");
		//7.chg5minstktest 09:35
	    all.fixedRate(new Chg5MinStkTestMonitor(), "60", "09:00:00");
		*/
		String time="14:56:00";
		
		all.fixedTimer(new IndexQuoteMonitor(), "350", time);
		//2、ifquote 	 11:30:30   15:16:00 
		all.fixedTimer(new IFQuoteMonitor(), "350", time);
		//3、hkindexquote 12:30:30   16:00:30
		all.fixedTimer(new HKIndexQuoteMonitor(), "350", time);
		//4、hkindexquote 11:31:00   15:01:00
		all.fixedTimer(new BlockUpDownTop5Monitor(), null, time);
		//5、amplitude15pct 11:31:00  15:01:00
		all.fixedTimer(new Amplitude15PctMonitor(), null, time);
		//6、turnovertop10 11:31:00  15:01:00
		all.fixedTimer(new TurnoverTop10Monitor(), null, time);
		//7.chg5minstktest 09:35
	    all.fixedRate(new Chg5MinStkTestMonitor(), "350", "14:59:00");
		
		
	}
	
	
}
