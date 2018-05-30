package com.htcf.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.SearchForm;
import com.htcf.entity.THyxcXckpDwkh;
import com.htcf.entity.THyxcXckpRykh;
import com.htcf.entity.User;
import com.htcf.service.IBusinessService;
import com.htcf.service.IPatrolService;
/**
 * 巡查考评管理
 * @author yinying
 *
 */
@Controller("patorlAction")
@Scope("prototype")
public class PatorlAction extends BaseAction{
	@Autowired
	private IPatrolService patrolService;
	@Autowired
	private IBusinessService businessService;
	
	//实体
	private THyxcXckpDwkh hyxcXckpDwkh = new THyxcXckpDwkh();
	private THyxcXckpRykh hyxcXckpRykh = new THyxcXckpRykh();
	private SearchForm searchForm = new SearchForm();
	
	
	
	//List
	private List<?> dwkhList;
	private List<?> rykhList;
	
	//变量
	private String dwkhID;
	private String dwkhType;
	private String tjData_x;
	private String tjData_y;
	private String rykhID;
	
	
	private String fileName;
	private String filePath;
	//下载文件原始存放路径  
    private final static String downloadPath="C:/hydg/download/";
    
    
	/**
	 * 巡查考评管理
	 
	 为了全面提升海域网格化管理水平，需要结合现有数据资源信息，建立一套适合海域网格化管理综合分析评价的管理办法，
	 通过信息化的手段实现对巡查单位及巡查人员等角色客观评价考核，提高网格化管理的质量。主要包括以下功能模块： 
	 
	3.3.3.5.1 巡查人员考核评价
	通过对巡查人员对巡查信息办理的数量、重要性及巡查响应时间等建立考核评价机制，
	系统自动生成巡查人员工作办理情况考核表，成果提供导出Execl与打印功能。

	3.3.3.5.2 巡查单位考核
	巡查单位主要由巡查管理部门对其每月进行考核，考核打分的内容包括：
	管理机构、计划管理、精神文明、制度管理、档案管理、日常管理、安全管理、信息上报量、巡查次数、
	巡查路径、社会测评等，对考核的内容建立核评价模型，系统生成考核月报、季度、年报等定期发布，
	成果提供导出Execl与打印功能。

	 * 
	 */
	
    
    /******************************人员考核**********************************/
    
    
    /**
     * 
    Description :人员考核查询
    @param:@return
    @return:String
    @throws
    @Author：yinying
    @Create 2018-1-4 下午06:02:36
     */
	public String fetchXckhRykh(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		rykhList = patrolService.fetchXckhRykh(searchForm, pageBean,"id");
		return "goXckpRykhList";
	}
    /**
     * 
    Description :新增人员考核
    @param:@return
    @return:String
    @throws
    @Author：yinying
    @Create 2018-1-4 下午06:02:36
     */
	public String addXckhRykh(){
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hyxcXckpRykh.setAddtime(xzsj);
		hyxcXckpRykh.setLastupdatetime(xzsj);
		hyxcXckpRykh.setAddusername(userXm);
		hyxcXckpRykh.setAdduserid(userId);
		System.out.println("总分："+hyxcXckpRykh.getZf());
//		int zf=0;
//		hyxcXckpRykh.setZf(zf);
		
		businessService.addObject(hyxcXckpRykh);
		return "addRykhSuccess";
	}
	
	/**
	 * 
	Description :人员考核详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-4 下午06:03:36
	 */
	public String fetchRykhDetail(){
		System.out.println("rykhID="+rykhID);
		hyxcXckpRykh = patrolService.fetchRykhDetail(rykhID);
		return "goXckpRykhDetail";
	}
	/**
	 * 
	Description :获取人员考核修改
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-4 下午06:03:36
	 */
	public String getRykhForUpdate(){
		System.out.println("rykhID="+rykhID);
		hyxcXckpRykh = patrolService.fetchRykhDetail(rykhID);
		return "goXckpRykhUpdate";
	}
	
	/**
	 * 
	Description :人员考核修改
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-5 下午05:52:35
	 */
	public String updateRykh(){
		System.out.println("rykhID="+rykhID);
		String xzsj=this.getDateTime();
		hyxcXckpRykh.setLastupdatetime(xzsj);
		businessService.updateObject(hyxcXckpRykh);
		return "addRykhSuccess";
	}
	
	/**
	 * 
	Description :删除人员考核
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-4 下午06:04:44
	 */
	public String deleteRykh(){
		System.out.println("rykhID="+rykhID);
		patrolService.deleteRykh(rykhID);
		return "addRykhSuccess";
	}

	/**
	 * 
	Description :统计：巡查考评-人员考核：月报
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-8 下午06:13:39
	 */
	public String fetchXckpRykpTj(){
		System.out.println("人员考核统计：月报====行政区划："+searchForm.getXzqh()+"，年份："+searchForm.getYear()+"，月份："+searchForm.getMonth());
		
		//默认
		if(searchForm.getMonth() != null && !searchForm.getMonth().equals("")){
			
		}else{
			searchForm.setMonth("1");
		}
		dwkhType="1";
		searchForm.setJidu("");
		List<?> tjList = patrolService.fetchRykhTj(searchForm, "月报");
		tjData_x="";
		tjData_y="";
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					tjData_x += obj[0].toString() + "";
					tjData_y += obj[1].toString() + "";
				}else{
					tjData_x += obj[0].toString() + ",";
					tjData_y += obj[1].toString() + ",";
				}
			}
		}
		System.out.println("tjData_x="+tjData_x);
		System.out.println("tjData_y="+tjData_y);
		
		return "goXckpRykhTj1";
	}
	
	/**
	 * 
	Description :统计：巡查考评-人员考核：季度报
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-8 下午06:26:25
	 */
	public String fetchXckpRykpTj2(){
		System.out.println("人员考核统计：季度报====行政区划："+searchForm.getXzqh()+"，季度："+searchForm.getJidu());
		
		//默认
		if(searchForm.getJidu() != null && !searchForm.getJidu().equals("")){
			
		}else{
			searchForm.setJidu("1");
		}
		searchForm.setMonth("");
		dwkhType="2";
		List<?> tjList = patrolService.fetchRykhTj(searchForm, "季度报");
		tjData_x="";
		tjData_y="";
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					tjData_x += obj[0].toString() + "";
					tjData_y += obj[1].toString() + "";
				}else{
					tjData_x += obj[0].toString() + ",";
					tjData_y += obj[1].toString() + ",";
				}
			}
		}
		System.out.println("tjData_x="+tjData_x);
		System.out.println("tjData_y="+tjData_y);
		
		return "goXckpRykhTj2";
	}
	/**
	 * 
	Description :统计：巡查考评-人员考核：年报
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-8 下午06:26:33
	 */
	public String fetchXckpRykpTj3(){
		System.out.println("人员考核统计：年报====行政区划："+searchForm.getXzqh()+"，年份："+searchForm.getYear());
		
		//默认
		if(searchForm.getYear() != null && !searchForm.getYear().equals("")){
			
		}else{
			searchForm.setYear(this.getYear());
		}
		dwkhType="3";
		searchForm.setJidu("");
		searchForm.setMonth("");
		List<?> tjList = patrolService.fetchRykhTj(searchForm, "年报");
		tjData_x="";
		tjData_y="";
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					tjData_x += obj[0].toString() + "";
					tjData_y += obj[1].toString() + "";
				}else{
					tjData_x += obj[0].toString() + ",";
					tjData_y += obj[1].toString() + ",";
				}
			}
		}
		System.out.println("tjData_x="+tjData_x);
		System.out.println("tjData_y="+tjData_y);
		
		return "goXckpRykhTj3";
	}
	
	
    /**
     * 
    Description :人员考核-二维表
    @param:@return
    @return:String
    @throws
    @Author：yinying
    @Create 2018-1-5 下午06:40:20
     */
	public String fetchXckpRykpTj4(){
		searchForm=null;
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(20);
		rykhList = patrolService.fetchXckhRykh(searchForm, pageBean,"zf");
		return "goXckpRykhTj4";
	}
	public String fetchXckpRykpTj4cx(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(20);
		rykhList = patrolService.fetchXckhRykh(searchForm, pageBean,"zf");
		return "goXckpRykhTj4";
	}
	
	/**
	 * 
	Description :人员考核：导出统计报表
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-8 下午03:53:21
	 */
    public String downLoadRykh(){
		System.out.println("fileName="+fileName+",dwkhType="+dwkhType);
		
		return "downLoadRykh";
	}
	public InputStream getDownLoadFileRykh(){
		System.out.println("进入getDownloadFile.....");
		//查出数据
		if(dwkhType.equals("1")){
			if(searchForm.getMonth() != null && !searchForm.getMonth().equals("")){
				
			}else{
				searchForm.setMonth("1");
			}
			searchForm.setJidu("");
			fileName="巡查人员考核评价统计-"+searchForm.getXzqh();
			if(searchForm.getYear() != null && !searchForm.getYear().equals("")){
				fileName+= searchForm.getYear()+"年";
			}
			fileName += searchForm.getMonth()+"月报";
			
		}
		if(dwkhType.equals("2")){
			if(searchForm.getJidu() != null && !searchForm.getJidu().equals("")){
				
			}else{
				searchForm.setJidu("1");
			}	
			searchForm.setMonth("");
			fileName="巡查人员考核评价统计-"+searchForm.getXzqh()+searchForm.getYear()+"第"+searchForm.getJidu()+"季度报";
		}if(dwkhType.equals("3")){
			if(searchForm.getYear() != null && !searchForm.getYear().equals("")){
				
			}else{
				searchForm.setYear(this.getYear());
			}
			searchForm.setJidu("");
			searchForm.setMonth("");
			fileName="巡查人员考核评价统计-"+searchForm.getXzqh()+""+searchForm.getYear()+"年报";
		}
		
		List<Object[]> tjList = (List<Object[]>) patrolService.fetchRykhTj(searchForm, "");
		
		String path = null;
		
		try {
			path = this.tableRykhData(fileName,tjList);
			
		} catch (RowsExceededException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (WriteException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
   		filePath = downloadPath+path;
   		System.out.println("filePath="+filePath);
   		FileInputStream fis =null;
		try {
			fis = new FileInputStream(filePath);
		} catch (FileNotFoundException e) {	
			System.out.println("找不到该文件。");			
			e.printStackTrace();
		}
		return fis; 
	}
	
	
	public String tableRykhData(String fileName,List<Object[]> dataList) throws IOException, RowsExceededException, WriteException{  	
    	String path = downloadPath;   	
    	File filePath = new File(path);
    	if(!filePath.exists())
    		filePath.mkdirs();
    	FileOutputStream fis = new FileOutputStream(path+File.separator+fileName+".xls");

		System.out.println("dataList:"+dataList);   	
    	WritableWorkbook book = Workbook.createWorkbook(fis);
    	WritableSheet sheet = book.createSheet(fileName, 0);
    	//数据项表导出  	
    	sheet.addCell(new Label(0,0,fileName));
    	sheet.addCell(new Label(0,1,"序号"));
    	sheet.addCell(new Label(1,1,"行政区划"));
    	sheet.addCell(new Label(2,1,"考核评分"));
    	
    	int k =1;
    	if(dataList!=null && !dataList.equals("")){
	    	for(int i=0;i<dataList.size();i++){
	    		jxl.write.Number number = new jxl.write.Number(0, i+2, k);
	    		sheet.addCell(number);    	
	    		try{
	    		sheet.addCell(new Label(1,i+2,dataList.get(i)[0].toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(1,i+2,""));
	    			System.out.println("1");
	    		}
	    		try{
	    		sheet.addCell(new Label(2,i+2,dataList.get(i)[1].toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(2,i+2,""));
	    			System.out.println("2");
	    		}
//	    		for(int j=0;j<2;j++){
//	    			if(dataList.get(i)[j]==null || "".equals(dataList.get(i)[j])){
//	    				sheet.addCell(new Label(j+1,i+2,""));	
//	    			}else {
//	    				sheet.addCell(new Label(j+1,i+2,dataList.get(i)[j].toString()));	
//	    			}    			
//	    		}	    		
	    		k++;
	    	}
    	}	
    	book.write();
    	book.close();
    	return (fileName+".xls");
    }
	/**
	 * 
	Description :下载单位考核数据
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-11 下午04:26:20
	 */
    public String downLoadRykhData(){
		System.out.println("fileName="+fileName);
		return "downLoadRykhData";
	}
	public InputStream getDownLoadFileRykhData(){
		System.out.println("进入getDownloadFile.....");
		
		List<?> dataList = patrolService.fetchXckhRykh(searchForm, pageBean,"zf");
		
		String path = null;
		fileName="巡查人员考核评价数据";
		try {
			path = this.rykhData(fileName,dataList);
			
		} catch (RowsExceededException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (WriteException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
   		filePath = downloadPath+path;
   		System.out.println("filePath="+filePath);
   		FileInputStream fis =null;
		try {
			fis = new FileInputStream(filePath);
		} catch (FileNotFoundException e) {	
			System.out.println("找不到该文件。");			
			e.printStackTrace();
		}
		return fis; 
	}
	
    public String rykhData(String fileName,List<?> dataList) throws IOException, RowsExceededException, WriteException{  	
    	String path = downloadPath;   	
    	File filePath = new File(path);
    	if(!filePath.exists())
    		filePath.mkdirs();
    	FileOutputStream fis = new FileOutputStream(path+File.separator+fileName+".xls");

		System.out.println("dataList:"+dataList);   	
    	WritableWorkbook book = Workbook.createWorkbook(fis);
    	WritableSheet sheet = book.createSheet(fileName, 0);
    	//数据项表导出  	
    	sheet.addCell(new Label(0,0,fileName));
    	sheet.addCell(new Label(0,1,"序号"));
    	sheet.addCell(new Label(1,1,"姓名"));
    	sheet.addCell(new Label(2,1,"行政区划"));
    	sheet.addCell(new Label(3,1,"单位名称"));
    	sheet.addCell(new Label(4,1,"年份"));
    	sheet.addCell(new Label(5,1,"月份"));
    	sheet.addCell(new Label(6,1,"总分"));
    	
    	sheet.addCell(new Label(7,1,"巡查办理数"));
    	sheet.addCell(new Label(8,1,"重要性(重要)"));
    	sheet.addCell(new Label(9,1,"重要性(一般)"));
    	sheet.addCell(new Label(10,1,"重要性(不重要)"));
    	sheet.addCell(new Label(11,1,"响应时间(快速)"));
    	sheet.addCell(new Label(12,1,"响应时间(一般)"));
    	sheet.addCell(new Label(13,1,"响应时间(不及时)"));

    	int k =1;
    	if(dataList!=null && !dataList.equals("")){
    		System.out.println("dataList2222:"+dataList);
    		THyxcXckpRykh hyxcXckpRykh = null;
	    	for(int i=0;i<dataList.size();i++){
	    		System.out.println("i="+i);
	    		jxl.write.Number number = new jxl.write.Number(0, i+2, k);
	    		sheet.addCell(number);    	
	    		hyxcXckpRykh = new THyxcXckpRykh();
	    		hyxcXckpRykh = (THyxcXckpRykh) dataList.get(i);
	    		try{
	    		sheet.addCell(new Label(1,i+2,hyxcXckpRykh.getXm().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(1,i+2,""));
	    			System.out.println("1");
	    		}
	    		try{
	    		sheet.addCell(new Label(2,i+2,hyxcXckpRykh.getXzqhmc().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(2,i+2,""));
	    			System.out.println("2");
	    		}
	    		try{
	    		sheet.addCell(new Label(3,i+2,hyxcXckpRykh.getDwmc().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(3,i+2,""));
	    			System.out.println("3");
	    		}
	    		try{
	    		sheet.addCell(new Label(4,i+2,hyxcXckpRykh.getYear().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(4,i+2,""));
	    			System.out.println("4");
	    		}
	    		try{
	    		sheet.addCell(new Label(5,i+2,hyxcXckpRykh.getMonth().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(5,i+2,""));
	    			System.out.println("5");
	    		}
	    		try{
	    		sheet.addCell(new Label(6,i+2,hyxcXckpRykh.getZf()+""));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(6,i+2,""));
	    			System.out.println("6");
	    		}
	    		try{
	    		sheet.addCell(new Label(7,i+2,hyxcXckpRykh.getXcbls().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(7,i+2,""));
	    			System.out.println("7");
	    		}
	    		try{
	    		sheet.addCell(new Label(8,i+2,hyxcXckpRykh.getZyx_zy().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(8,i+2,""));
	    			System.out.println("8");
	    		}
	    		try{
	    		sheet.addCell(new Label(9,i+2,hyxcXckpRykh.getZyx_yb().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(9,i+2,""));
	    			System.out.println("9");
	    		}
	    		try{
	    		sheet.addCell(new Label(10,i+2,hyxcXckpRykh.getZyx_b().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(10,i+2,""));
	    			System.out.println("10");
	    		}
	    		try{
	    		sheet.addCell(new Label(11,i+2,hyxcXckpRykh.getXysj_ks().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(11,i+2,""));
	    			System.out.println("11");
	    		}
	    		try{
	    		sheet.addCell(new Label(12,i+2,hyxcXckpRykh.getXysj_yb().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(12,i+2,""));
	    			System.out.println("12");
	    		}
	    		try{
	    		sheet.addCell(new Label(13,i+2,hyxcXckpRykh.getXysj_b().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(13,i+2,""));
	    			System.out.println("13");
	    		}	
	    		k++;
	    	}
    	}	
    	book.write();
    	book.close();
    	return (fileName+".xls");
    }
	
	
	
	
	/******************************单位考核**********************************/
	
	/**
	 * 
	Description :查询：巡查考评-单位考核
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-8 下午03:59:04
	 */
	public String fetchXckpDwkh(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		dwkhList = patrolService.fetchDwkhList(searchForm, pageBean,"id");
		return "goXckpDwkhList";
	}
	/**
	 * 
	Description :新增：巡查考评-单位考核
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-8 下午03:59:04
	 */
	public String addXckpDwkh(){
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hyxcXckpDwkh.setAddtime(xzsj);
		hyxcXckpDwkh.setLastupdatetime(xzsj);
		hyxcXckpDwkh.setAddusername(userXm);
		hyxcXckpDwkh.setAdduserid(userId);
		
		//区县的考评是8个方面100+20=120分
		
		//11个方面：一题：9*10+10=100
		int gljg = Integer.parseInt(hyxcXckpDwkh.getGljg());
		int jhgl = Integer.parseInt(hyxcXckpDwkh.getJhgl());
		int jswm = Integer.parseInt(hyxcXckpDwkh.getJswm());
		int zdgl = Integer.parseInt(hyxcXckpDwkh.getZdgl());
		int dagl = Integer.parseInt(hyxcXckpDwkh.getDagl());
		int rcgl = Integer.parseInt(hyxcXckpDwkh.getRcgl());
		int aqgl = Integer.parseInt(hyxcXckpDwkh.getAqgl());
		int xxsbl = Integer.parseInt(hyxcXckpDwkh.getXxsbl());
		int xccs = Integer.parseInt(hyxcXckpDwkh.getXccs());
		int xclj = Integer.parseInt(hyxcXckpDwkh.getXclj());
		int shcp = Integer.parseInt(hyxcXckpDwkh.getShcp());
		
		int zf=gljg+jhgl+jswm+zdgl+dagl+rcgl+aqgl+xxsbl+xccs+xclj+shcp;
		
		hyxcXckpDwkh.setZf(zf);
		
		businessService.addObject(hyxcXckpDwkh);
		
		return "goAddDwkhSuccess";
	}
	/**
	 * 
	Description :详情：巡查考评-单位考核
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-8 下午04:02:44
	 */
	public String fetchXckpDwkhDetail(){
		System.out.println("dwkhID="+dwkhID);
		hyxcXckpDwkh = patrolService.fetchDwkhDetail(dwkhID);
		
		return "goXckpDwkhDetail";
	}
	/**
	 * 
	Description :获取修改：巡查考评-单位考核
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-8 下午04:03:23
	 */
	public String getDwkhForUpdate(){
		System.out.println("dwkhID="+dwkhID);
		hyxcXckpDwkh = patrolService.fetchDwkhDetail(dwkhID);
		
		return "goXckpDwkhUpdate";
	}
	/**
	 * 
	Description :修改：巡查考评-单位考核
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-8 下午04:04:25
	 */
	public String updateXckpDwkh(){
		System.out.println("dwkhID="+dwkhID);
		
		String xzsj=this.getDateTime();
		hyxcXckpDwkh.setLastupdatetime(xzsj);
		int gljg = Integer.parseInt(hyxcXckpDwkh.getGljg());
		int jhgl = Integer.parseInt(hyxcXckpDwkh.getJhgl());
		int jswm = Integer.parseInt(hyxcXckpDwkh.getJswm());
		int zdgl = Integer.parseInt(hyxcXckpDwkh.getZdgl());
		int dagl = Integer.parseInt(hyxcXckpDwkh.getDagl());
		int rcgl = Integer.parseInt(hyxcXckpDwkh.getRcgl());
		int aqgl = Integer.parseInt(hyxcXckpDwkh.getAqgl());
		int xxsbl = Integer.parseInt(hyxcXckpDwkh.getXxsbl());
		int xccs = Integer.parseInt(hyxcXckpDwkh.getXccs());
		int xclj = Integer.parseInt(hyxcXckpDwkh.getXclj());
		int shcp = Integer.parseInt(hyxcXckpDwkh.getShcp());
		
		int zf=gljg+jhgl+jswm+zdgl+dagl+rcgl+aqgl+xxsbl+xccs+xclj+shcp;
		
		hyxcXckpDwkh.setZf(zf);
		businessService.updateObject(hyxcXckpDwkh);
		return "goAddDwkhSuccess";
	}
	/**
	 * 
	Description :删除：巡查考评-单位考核
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-8 下午04:05:18
	 */
	public String deleteDwkh(){
		System.out.println("dwkhID="+dwkhID);
		patrolService.deleteDwkh(dwkhID);
		return "goAddDwkhSuccess";
	}
	
	
	/**
	 * 
	Description :统计：巡查考评-单位考核：月报
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-8 下午06:13:39
	 */
	public String fetchXckpDwkpTj(){
		System.out.println("单位考核统计：月报====行政区划："+searchForm.getXzqh()+"，年份："+searchForm.getYear()+"，月份："+searchForm.getMonth());
		
		//默认
		if(searchForm.getMonth() != null && !searchForm.getMonth().equals("")){
			
		}else{
			searchForm.setMonth("1");
		}
		dwkhType="1";
		searchForm.setJidu("");
		List<?> tjList = patrolService.fetchDwkhTj(searchForm, "月报");
		tjData_x="";
		tjData_y="";
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					tjData_x += obj[0].toString() + "";
					tjData_y += obj[1].toString() + "";
				}else{
					tjData_x += obj[0].toString() + ",";
					tjData_y += obj[1].toString() + ",";
				}
			}
		}
		System.out.println("tjData_x="+tjData_x);
		System.out.println("tjData_y="+tjData_y);
		
		return "goXckpDwkhTj";
	}
	
	/**
	 * 
	Description :统计：巡查考评-单位考核：季度报
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-8 下午06:26:25
	 */
	public String fetchXckpDwkpTj2(){
		System.out.println("单位考核统计：季度报====行政区划："+searchForm.getXzqh()+"，季度："+searchForm.getJidu());
		
		//默认
		if(searchForm.getJidu() != null && !searchForm.getJidu().equals("")){
			
		}else{
			searchForm.setJidu("1");
		}
		searchForm.setMonth("");
		dwkhType="2";
		List<?> tjList = patrolService.fetchDwkhTj(searchForm, "季度报");
		tjData_x="";
		tjData_y="";
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					tjData_x += obj[0].toString() + "";
					tjData_y += obj[1].toString() + "";
				}else{
					tjData_x += obj[0].toString() + ",";
					tjData_y += obj[1].toString() + ",";
				}
			}
		}
		System.out.println("tjData_x="+tjData_x);
		System.out.println("tjData_y="+tjData_y);
		
		return "goXckpDwkhTj2";
	}
	/**
	 * 
	Description :统计：巡查考评-单位考核：年报
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-8 下午06:26:33
	 */
	public String fetchXckpDwkpTj3(){
		System.out.println("单位考核统计：年报====行政区划："+searchForm.getXzqh()+"，年份："+searchForm.getYear());
		
		//默认
		if(searchForm.getYear() != null && !searchForm.getYear().equals("")){
			
		}else{
			searchForm.setYear(this.getYear());
		}
		dwkhType="3";
		searchForm.setJidu("");
		searchForm.setMonth("");
		List<?> tjList = patrolService.fetchDwkhTj(searchForm, "年报");
		tjData_x="";
		tjData_y="";
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					tjData_x += obj[0].toString() + "";
					tjData_y += obj[1].toString() + "";
				}else{
					tjData_x += obj[0].toString() + ",";
					tjData_y += obj[1].toString() + ",";
				}
			}
		}
		System.out.println("tjData_x="+tjData_x);
		System.out.println("tjData_y="+tjData_y);
		
		return "goXckpDwkhTj3";
	}
	
	
	/**
	 * 
	Description :表格的方式展示
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-5 下午06:31:43
	 */
	public String fetchXckpDwkpTj4(){
		searchForm=null;
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(20);
		dwkhList = patrolService.fetchDwkhList(searchForm, pageBean,"zf");
		return "goXckpDwkhTj4";
	}
	public String fetchXckpDwkpTj4cx(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(20);
		dwkhList = patrolService.fetchDwkhList(searchForm, pageBean,"zf");
		return "goXckpDwkhTj4";
	}
	
	

	/**
	 * 
	Description :导出统计报表
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-11 下午03:59:40
	 */
    public String downLoadDwkh(){
		System.out.println("fileName="+fileName+",dwkhType="+dwkhType);
		
		return "downLoadDwkh";
	}
	public InputStream getDownLoadFileDwkh(){
		System.out.println("进入getDownloadFile.....");
		//查出数据
		if(dwkhType.equals("1")){
			if(searchForm.getMonth() != null && !searchForm.getMonth().equals("")){
				
			}else{
				searchForm.setMonth("1");
			}
			searchForm.setJidu("");
			fileName="巡查单位考核统计-"+searchForm.getXzqh();
			if(searchForm.getYear() != null && !searchForm.getYear().equals("")){
				fileName+= searchForm.getYear()+"年";
			}
			fileName += searchForm.getMonth()+"月报";
			
		}
		if(dwkhType.equals("2")){
			if(searchForm.getJidu() != null && !searchForm.getJidu().equals("")){
				
			}else{
				searchForm.setJidu("1");
			}	
			searchForm.setMonth("");
			fileName="巡查单位考核统计-"+searchForm.getXzqh()+searchForm.getYear()+"第"+searchForm.getJidu()+"季度报";
		}if(dwkhType.equals("3")){
			if(searchForm.getYear() != null && !searchForm.getYear().equals("")){
				
			}else{
				searchForm.setYear(this.getYear());
			}
			searchForm.setJidu("");
			searchForm.setMonth("");
			fileName="巡查单位考核统计-"+searchForm.getXzqh()+""+searchForm.getYear()+"年报";
		}
		
		List<Object[]> tjList = (List<Object[]>) patrolService.fetchDwkhTj(searchForm, "");
		
		String path = null;
		
		try {
			path = this.tableData(fileName,tjList);
			
		} catch (RowsExceededException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (WriteException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
   		filePath = downloadPath+path;
   		System.out.println("filePath="+filePath);
   		FileInputStream fis =null;
		try {
			fis = new FileInputStream(filePath);
		} catch (FileNotFoundException e) {	
			System.out.println("找不到该文件。");			
			e.printStackTrace();
		}
		return fis; 
	}
	
	/**
	 * 
	Description :如果下载文件名为中文，进行字符编码转换
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午05:33:31
	 */
    public String getDownloadChineseFile() {
        String downloadChineseFileName = fileName+".xls";
        System.out.println("文件名："+ fileName+".xls");
        try {

            downloadChineseFileName = new String(downloadChineseFileName.getBytes(), "ISO8859-1");
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }  
        return downloadChineseFileName;          
    }  
	
    public String tableData(String fileName,List<Object[]> dataList) throws IOException, RowsExceededException, WriteException{  	
    	String path = downloadPath;   	
    	File filePath = new File(path);
    	if(!filePath.exists())
    		filePath.mkdirs();
    	FileOutputStream fis = new FileOutputStream(path+File.separator+fileName+".xls");

		System.out.println("dataList:"+dataList);   	
    	WritableWorkbook book = Workbook.createWorkbook(fis);
    	WritableSheet sheet = book.createSheet(fileName, 0);
    	//数据项表导出  	
    	sheet.addCell(new Label(0,0,fileName));
    	sheet.addCell(new Label(0,1,"序号"));
    	sheet.addCell(new Label(1,1,"行政区划"));
    	sheet.addCell(new Label(2,1,"考核评分"));
    	
    	int k =1;
    	if(dataList!=null && !dataList.equals("")){
	    	for(int i=0;i<dataList.size();i++){
	    		jxl.write.Number number = new jxl.write.Number(0, i+2, k);
	    		sheet.addCell(number);    	
	    		try{
	    		sheet.addCell(new Label(1,i+2,dataList.get(i)[0].toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(1,i+2,""));
	    			System.out.println("1");
	    		}
	    		try{
	    		sheet.addCell(new Label(2,i+2,dataList.get(i)[1].toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(2,i+2,""));
	    			System.out.println("2");
	    		}
//	    		for(int j=0;j<2;j++){
//	    			if(dataList.get(i)[j]==null || "".equals(dataList.get(i)[j])){
//	    				sheet.addCell(new Label(j+1,i+2,""));	
//	    			}else {
//	    				sheet.addCell(new Label(j+1,i+2,dataList.get(i)[j].toString()));	
//	    			}    			
//	    		}	    		
	    		k++;
	    	}
    	}	
    	book.write();
    	book.close();
    	return (fileName+".xls");
    }
	/**
	 * 
	Description :下载单位考核数据
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-11 下午04:26:20
	 */
    public String downLoadDwkhData(){
		System.out.println("fileName="+fileName);
		
		return "downLoadDwkhData";
	}
	public InputStream getDownLoadFileDwkhData(){
		System.out.println("进入getDownloadFile.....");

		List<?> dataList = patrolService.fetchDwkhList(searchForm, pageBean,"zf");
		
		String path = null;
		fileName="巡查单位考评数据";
		try {
			path = this.dwkhData(fileName,dataList);
			
		} catch (RowsExceededException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (WriteException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
   		filePath = downloadPath+path;
   		System.out.println("filePath="+filePath);
   		FileInputStream fis =null;
		try {
			fis = new FileInputStream(filePath);
		} catch (FileNotFoundException e) {	
			System.out.println("找不到该文件。");			
			e.printStackTrace();
		}
		return fis; 
	}
	
    public String dwkhData(String fileName,List<?> dataList) throws IOException, RowsExceededException, WriteException{  	
    	String path = downloadPath;   	
    	File filePath = new File(path);
    	if(!filePath.exists())
    		filePath.mkdirs();
    	FileOutputStream fis = new FileOutputStream(path+File.separator+fileName+".xls");

		System.out.println("dataList:"+dataList);   	
    	WritableWorkbook book = Workbook.createWorkbook(fis);
    	WritableSheet sheet = book.createSheet(fileName, 0);
    	//数据项表导出  	
    	sheet.addCell(new Label(0,0,fileName));
    	sheet.addCell(new Label(0,1,"序号"));
    	sheet.addCell(new Label(1,1,"行政区划"));
    	sheet.addCell(new Label(2,1,"单位名称"));
    	sheet.addCell(new Label(3,1,"年份"));
    	sheet.addCell(new Label(4,1,"月份"));
    	sheet.addCell(new Label(5,1,"总分"));
    	sheet.addCell(new Label(6,1,"管理机构"));
    	sheet.addCell(new Label(7,1,"计划管理"));
    	sheet.addCell(new Label(8,1,"精神文明"));
    	sheet.addCell(new Label(9,1,"制度管理"));
    	sheet.addCell(new Label(10,1,"档案管理"));
    	sheet.addCell(new Label(11,1,"日常管理"));
    	sheet.addCell(new Label(12,1,"安全管理"));
    	sheet.addCell(new Label(13,1,"信息上报量"));
    	sheet.addCell(new Label(14,1,"巡查次数"));
    	sheet.addCell(new Label(15,1,"巡查路径"));
    	sheet.addCell(new Label(16,1,"社会测评"));
    	
    	int k =1;
    	if(dataList!=null && !dataList.equals("")){
    		THyxcXckpDwkh hyxcXckpDwkh = null;
	    	for(int i=0;i<dataList.size();i++){
	    		jxl.write.Number number = new jxl.write.Number(0, i+2, k);
	    		sheet.addCell(number);    	
	    		hyxcXckpDwkh = new THyxcXckpDwkh();
	    		hyxcXckpDwkh = (THyxcXckpDwkh) dataList.get(i);
	    		try{
	    		sheet.addCell(new Label(1,i+2,hyxcXckpDwkh.getXzqhmc().toString()));
		    	}catch(Exception e){
	    			sheet.addCell(new Label(1,i+2,""));
	    			System.out.println("1");
	    		}
	    		try{
	    		sheet.addCell(new Label(2,i+2,hyxcXckpDwkh.getDwmc().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(2,i+2,""));
	    			System.out.println("2");
	    		}
	    		try{
	    		sheet.addCell(new Label(3,i+2,hyxcXckpDwkh.getYear().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(3,i+2,""));
	    			System.out.println("3");
	    		}
	    		try{
	    		sheet.addCell(new Label(4,i+2,hyxcXckpDwkh.getMonth().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(4,i+2,""));
	    			System.out.println("4");
	    		}
	    		try{
	    		sheet.addCell(new Label(5,i+2,hyxcXckpDwkh.getZf()+""));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(5,i+2,""));
	    			System.out.println("5");
	    		}
	    		try{
	    		sheet.addCell(new Label(6,i+2,hyxcXckpDwkh.getGljg().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(6,i+2,""));
	    			System.out.println("6");
	    		}
	    		try{
	    		sheet.addCell(new Label(7,i+2,hyxcXckpDwkh.getJhgl().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(7,i+2,""));
	    			System.out.println("7");
	    		}
	    		try{
	    		sheet.addCell(new Label(8,i+2,hyxcXckpDwkh.getJswm().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(8,i+2,""));
	    			System.out.println("8");
	    		}
	    		try{
	    		sheet.addCell(new Label(9,i+2,hyxcXckpDwkh.getZdgl().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(9,i+2,""));
	    			System.out.println("9");
	    		}
	    		try{
	    		sheet.addCell(new Label(10,i+2,hyxcXckpDwkh.getDagl().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(10,i+2,""));
	    			System.out.println("10");
	    		}
	    		try{
	    		sheet.addCell(new Label(11,i+2,hyxcXckpDwkh.getRcgl().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(11,i+2,""));
	    			System.out.println("11");
	    		}
	    		try{
	    		sheet.addCell(new Label(12,i+2,hyxcXckpDwkh.getAqgl().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(12,i+2,""));
	    			System.out.println("12");
	    		}
	    		try{
	    		sheet.addCell(new Label(13,i+2,hyxcXckpDwkh.getXxsbl().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(13,i+2,""));
	    			System.out.println("13");
	    		}
	    		try{
	    		sheet.addCell(new Label(14,i+2,hyxcXckpDwkh.getXccs().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(14,i+2,""));
	    			System.out.println("14");
	    		}
	    		try{
	    		sheet.addCell(new Label(15,i+2,hyxcXckpDwkh.getXclj().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(15,i+2,""));
	    			System.out.println("15");
	    		}
	    		try{
	    		sheet.addCell(new Label(16,i+2,hyxcXckpDwkh.getShcp().toString()));
	    		}catch(Exception e){
	    			sheet.addCell(new Label(16,i+2,""));
	    			System.out.println("16");
	    		}
	    		 		
	    		k++;
	    	}
    	}	
    	book.write();
    	book.close();
    	return (fileName+".xls");
    }
	
    
	
	
	public IPatrolService getPatrolService() {
		return patrolService;
	}

	public void setPatrolService(IPatrolService patrolService) {
		this.patrolService = patrolService;
	}

	public THyxcXckpDwkh getHyxcXckpDwkh() {
		return hyxcXckpDwkh;
	}

	public void setHyxcXckpDwkh(THyxcXckpDwkh hyxcXckpDwkh) {
		this.hyxcXckpDwkh = hyxcXckpDwkh;
	}

	public IBusinessService getBusinessService() {
		return businessService;
	}

	public void setBusinessService(IBusinessService businessService) {
		this.businessService = businessService;
	}

	public List<?> getDwkhList() {
		return dwkhList;
	}

	public void setDwkhList(List<?> dwkhList) {
		this.dwkhList = dwkhList;
	}

	public String getDwkhID() {
		return dwkhID;
	}

	public void setDwkhID(String dwkhID) {
		this.dwkhID = dwkhID;
	}

	public SearchForm getSearchForm() {
		return searchForm;
	}

	public void setSearchForm(SearchForm searchForm) {
		this.searchForm = searchForm;
	}
	public String getTjData_x() {
		return tjData_x;
	}
	public void setTjData_x(String tjDataX) {
		tjData_x = tjDataX;
	}
	public String getTjData_y() {
		return tjData_y;
	}
	public void setTjData_y(String tjDataY) {
		tjData_y = tjDataY;
	}
	public String getDwkhType() {
		return dwkhType;
	}
	public void setDwkhType(String dwkhType) {
		this.dwkhType = dwkhType;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public static String getDownloadpath() {
		return downloadPath;
	}
	public THyxcXckpRykh getHyxcXckpRykh() {
		return hyxcXckpRykh;
	}
	public void setHyxcXckpRykh(THyxcXckpRykh hyxcXckpRykh) {
		this.hyxcXckpRykh = hyxcXckpRykh;
	}
	public List<?> getRykhList() {
		return rykhList;
	}
	public void setRykhList(List<?> rykhList) {
		this.rykhList = rykhList;
	}
	public String getRykhID() {
		return rykhID;
	}
	public void setRykhID(String rykhID) {
		this.rykhID = rykhID;
	}
	
	
}
