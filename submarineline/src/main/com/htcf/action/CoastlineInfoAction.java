package com.htcf.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.CoastlineInfo;
import com.htcf.service.CoastlineInfoService;
import com.htcf.util.DateUtil;
import com.htcf.util.StringUtil;

@Controller("coastlineInfoAction")
@Scope("prototype")
public class CoastlineInfoAction extends BaseAction {

	@Resource(name="coastlineAnalyzeService")
	private CoastlineInfoService coastlineAnalyzeService;//划界方案综合分析
	@Resource(name="coastlineDefineService")
	private CoastlineInfoService coastlineDefineService;//海岸线

	
	/**
	 * 海岸线信息
	 */
	private CoastlineInfo coastline;
	private CoastlineInfo coastlineU;
	/**
	 * 海岸线信息集合
	 */
	private List<CoastlineInfo> coastlines;
	
	public CoastlineInfo getCoastline() {
		return coastline;
	}
	public void setCoastline(CoastlineInfo coastline) {
		this.coastline = coastline;
	}
	public List<CoastlineInfo> getCoastlines() {
		return coastlines;
	}
	public void setCoastlines(List<CoastlineInfo> coastlines) {
		this.coastlines = coastlines;
	}
	
	/*****************************海岸线时空分析START*****************************************/
	
	/**
	 * 海岸线时空分析
	 * 添加
	 */
	public void saveClAnalyze(){
		
		String result = "{'result':0}";
		
		System.out.println(coastline.getLineLength());
		coastline = common4AddCl(coastline);
		if ( coastlineDefineService.addCoastlineInfo(coastline) ) {
			result = "{'result':0,'id':" + coastline.getId() + "}";
		}
		
		HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 海岸线时空分析
	 * 查询所有数据
	 */
	public void loadAllAnalyze(){
		
		coastlines = coastlineDefineService.loadAllCoastline();
		
		Map<String, List<CoastlineInfo>> map = new HashMap<String, List<CoastlineInfo>>();
		map.put("coastlines", coastlines);
		
		JSONObject json = JSONObject.fromObject(map);
		
		HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(json.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 海岸线时空分析
	 * 根据ID查询数据
	 */
	public void loadAnalyzeById(){
		
		coastline = coastlineDefineService.loadCoastlineById(coastline);
		
		Map<String, CoastlineInfo> map = new HashMap<String, CoastlineInfo>();
		map.put("coastline", coastline);
		
		JSONObject json = JSONObject.fromObject(map);
		
		HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(json.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 海岸线时空分析
	 * 根据ID删除数据
	 */
	public void removeAnalyzeById(){
		
		String result = "0";
		
		if ( coastlineDefineService.delCoastlineInfo(coastline) ) result = "1";
		
		HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 海岸线时空分析
	 * 修改信息
	 */
	public void editDefine(){
		System.out.println("海岸线时空分析修改信息");
		System.out.println("id="+coastlineU.getId());
		System.out.println("getLineName="+coastlineU.getLineName());
		System.out.println("getLineGeo="+coastlineU.getLineGeo());
		
		CoastlineInfo coastlineInfo = coastlineDefineService.loadCoastlineById(coastlineU);
		
		if ( StringUtil.isNotBlank(coastlineU.getLineGeo()) ) {
			coastlineInfo.setLineGeo(coastlineU.getLineGeo());
		}
		if ( StringUtil.isNotBlank(coastlineU.getLineName()) ) {
			coastlineInfo.setLineName(coastlineU.getLineName());
		}
		if ( StringUtil.isNotBlank(coastlineU.getLineUpdatePerson()) ) {
			coastlineInfo.setLineUpdatePerson(coastlineU.getLineUpdatePerson());
		}
		if ( StringUtil.isNotBlank(coastlineU.getLineUpdateReason()) ) {
			coastlineInfo.setLineUpdateReason(coastlineU.getLineUpdateReason());
		}
		if ( null != coastlineU.getLineLength() ) {
			coastlineInfo.setLineLength(coastlineU.getLineLength());
		}
		coastlineInfo = common4UpdateCl(coastlineInfo);
		
		String result = "0";
		
		System.out.println("id="+coastlineInfo.getId());
		System.out.println("getLineName="+coastlineInfo.getLineName());
		System.out.println("getLineGeo="+coastlineInfo.getLineGeo());
		
		if ( coastlineDefineService.editCoastlineInfo(coastlineInfo) ) result = "1";
		
		HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*****************************海岸线时空分析END*****************************************/
	
	
	
	
	/*****************************划界方案START*****************************************/
	/**
	 * 划界方案
	 * 添加
	 */
	public void saveClDefine(){
		
		String result = "{'result':0}";
		
		coastline = common4AddCl(coastline);
		if ( coastlineAnalyzeService.addCoastlineInfo(coastline) ) {
			result = "{'result':0,'id':" + coastline.getId() + "}";
		}
		
		HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 划界方案
	 * 查询所有数据
	 */
	public void loadAllDefine(){
		
		coastlines = coastlineAnalyzeService.loadAllCoastline();
		
		Map<String, List<CoastlineInfo>> map = new HashMap<String, List<CoastlineInfo>>();
		map.put("coastlines", coastlines);
		
		JSONObject json = JSONObject.fromObject(map);
		
		HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(json.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 划界方案
	 * 根据ID查询数据
	 */
	public void loadDefineById(){
		
		coastline = coastlineAnalyzeService.loadCoastlineById(coastline);
		
		Map<String, CoastlineInfo> map = new HashMap<String, CoastlineInfo>();
		map.put("coastline", coastline);
		
		JSONObject json = JSONObject.fromObject(map);
		
		HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(json.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 划界方案
	 * 根据ID删除数据
	 */
	public void removeDefineById(){
		
		String result = "0";
		
		if ( coastlineAnalyzeService.delCoastlineInfo(coastline) ) result = "1";
		
		HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 划界方案
	 * 修改信息
	 */
	public void editAnalyze(){
		
		System.out.println("划界方案修改信息");
		System.out.println("id="+coastlineU.getId());
		System.out.println("getLineName="+coastlineU.getLineName());
		System.out.println("getLineGeo="+coastlineU.getLineGeo());

		
		CoastlineInfo coastlineInfo = coastlineAnalyzeService.loadCoastlineById(coastlineU);
		
		if ( StringUtil.isNotBlank(coastlineU.getLineGeo()) ) {
			coastlineInfo.setLineGeo(coastlineU.getLineGeo());
		}
		if ( StringUtil.isNotBlank(coastlineU.getLineName()) ) {
			coastlineInfo.setLineName(coastlineU.getLineName());
		}
		if ( StringUtil.isNotBlank(coastlineU.getLineUpdatePerson()) ) {
			coastlineInfo.setLineUpdatePerson(coastlineU.getLineUpdatePerson());
		}
		if ( StringUtil.isNotBlank(coastlineU.getLineUpdateReason()) ) {
			coastlineInfo.setLineUpdateReason(coastlineU.getLineUpdateReason());
		}
		if ( null != coastlineU.getLineLength() ) {
			coastlineInfo.setLineLength(coastlineU.getLineLength());
		}
		coastlineInfo = common4UpdateCl(coastlineInfo);
		
		String result = "0";
		
		System.out.println("id="+coastlineInfo.getId());
		System.out.println("getLineName="+coastlineInfo.getLineName());
		System.out.println("getLineGeo="+coastlineInfo.getLineGeo());
		
		if ( coastlineAnalyzeService.editCoastlineInfo(coastlineInfo) ) result = "1";
		
		HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*****************************划界方案END*****************************************/
	
	
	
	
	private CoastlineInfo common4AddCl(CoastlineInfo coastlineInfo){
		
		coastlineInfo.setAddtime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		coastlineInfo.setLastupdatetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		coastlineInfo.setAdduserid(this.getSessionUser().getId());
		coastlineInfo.setAddusername(this.getSessionUser().getName());
		return coastlineInfo;
	}
	
	private CoastlineInfo common4UpdateCl(CoastlineInfo coastlineInfo){
		
		coastlineInfo.setLastupdatetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		return coastlineInfo;
	}

	public CoastlineInfo getCoastlineU() {
		return coastlineU;
	}
	public void setCoastlineU(CoastlineInfo coastlineU) {
		this.coastlineU = coastlineU;
	}
	public CoastlineInfoService getCoastlineAnalyzeService() {
		return coastlineAnalyzeService;
	}
	public void setCoastlineAnalyzeService(
			CoastlineInfoService coastlineAnalyzeService) {
		this.coastlineAnalyzeService = coastlineAnalyzeService;
	}
	public CoastlineInfoService getCoastlineDefineService() {
		return coastlineDefineService;
	}
	public void setCoastlineDefineService(
			CoastlineInfoService coastlineDefineService) {
		this.coastlineDefineService = coastlineDefineService;
	}
	
	
}
