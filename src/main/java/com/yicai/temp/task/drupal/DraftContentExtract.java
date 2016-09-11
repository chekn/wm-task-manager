package com.yicai.temp.task.drupal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 
 * @author Pactera-NEN
 * @date 2016年5月16日-下午2:26:03
 */
public class DraftContentExtract {
	
	private static final String DRAFT_TAG="mediaDraft";
	private static final String TITLE_TAG="mediaTitle";
	private static final String BODY_TAG="mediaBody";
	
	//提取文章
	public List<String> extractDraftStrs(String ftlParseContent){
		List<String> draftList=new ArrayList<String>();
		
		if(ftlParseContent.contains("<"+DRAFT_TAG+">"))
			draftList.addAll(extractParseStr(ftlParseContent, DRAFT_TAG,true));
		else
			draftList.add(ftlParseContent);
		
		return draftList;
	}
	
	public boolean isAccordFullStructure(String ftlParseContent){
		
		boolean isAccordStructure= ftlParseContent.matches(
				"<"+DRAFT_TAG+">"
						+ "<"+TITLE_TAG+">.*?</"+TITLE_TAG+">"
						+ "<"+BODY_TAG+">.*?</"+BODY_TAG+">"
				+"</"+DRAFT_TAG+">");
		
		return isAccordStructure;
	}
	
	public String extractTitleStr(String draftStr){
		List<String> strs= extractParseStr(draftStr,TITLE_TAG,false);
		return strs.get(0);
	}

	public String extractBodyStr(String draftStr){
		List<String> cnts= extractParseStr(draftStr,BODY_TAG,false);
		return cnts.get(0);
	}
	
	private static List<String> extractParseStr(String cnt, String tagName, boolean isContainTag){
		List<String> rev=new ArrayList<String>();
		
		Pattern pattern=Pattern.compile("<"+tagName+">(.*?)</"+tagName+">");
		Matcher matcher=pattern.matcher(cnt);
		while(matcher.find()){
			String inCnt=matcher.group(isContainTag?0:1);
			rev.add(inCnt);
		}
		
		return rev;
	}
	
	public static void main(String[] args) throws IOException{
		DraftContentExtract dce=new DraftContentExtract();
		String strIn="<mediaDraft><mediaTitle>33344</mediaTitle><mediaBody>33444</mediaBody></mediaDraft>";
		List<String> recc=dce.extractDraftStrs(strIn);
		for(String cnt:recc){
			System.out.println(cnt);
			System.out.println(dce.extractTitleStr(cnt));
			System.out.println(dce.extractBodyStr(cnt));
			System.out.println(dce.isAccordFullStructure(cnt));
		}
	}
	
}
