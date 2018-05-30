package com.htcf.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtHysyjForm;
import com.htcf.entity.THysyywHysydtYhxm;
import com.htcf.entity.THysyywHysydtYhxmHysyj;
import com.htcf.entity.THysyywHysydtYhxmHysyjJntz;
import com.htcf.entity.THysyywHysydtYhxmHysyjZsbz;
import com.htcf.entity.THysyywHysydtYhxmZhxx;
import com.htcf.entity.User;
import com.htcf.service.IBusinessService;
import com.htcf.service.ISeaUseGoldService;
/**
 * 海域使用动态管理——海域使用金征收管理
 * T_HYSYYW_HYSYDT_YHXM_HYSYJ
 * @author yinying
 *
 */
@Controller("seaUseGoldAction")
@Scope("prototype")
public class SeaUseGoldAction extends BaseAction{
	@Autowired
	private IBusinessService businessService;
	
	@Autowired
	private ISeaUseGoldService seaUseGoldService;
	
	//实体
	private THysyywHysydtYhxmHysyj hysyywHysydtYhxmHysyj = new THysyywHysydtYhxmHysyj();
	private THysyywHysydtHysyjForm hysyywHysydtHysyjForm = new THysyywHysydtHysyjForm();
	
	private THysyywHysydtYhxm hysyywHysydtYhxm = new THysyywHysydtYhxm();
	private THysyywHysydtYhxmZhxx hysyywHysydtYhxmZsxx = new THysyywHysydtYhxmZhxx();
	private SearchForm searchForm = new SearchForm();
	private THysyywHysydtYhxmHysyjJntz hysyywHysydtYhxmHysyjJntz = new THysyywHysydtYhxmHysyjJntz();
	private THysyywHysydtYhxmHysyjZsbz hysyywHysydtYhxmHysyjZsbz = new THysyywHysydtYhxmHysyjZsbz();
	
	//List
	private List<?> hysyjList;//使用金记录
	private List<?> zsxxList;//宗海信息
	private List<?> jnmxList;//缴纳明细
	private List<?> zhxxList;//缴纳通知
	private List<?> zsbzList;//征收标准
	
	//变量
	private String hysyjID;//使用金ID
	private String xmID;
	private String zsID;
	private String zsbh;
	private String xmmc;
	private String jntzID;
	private String zsbzID;
	
	private String indexNum;
	private String todayDate;
	
	/**
	建立海域使用金征收台账，包括使用金应收款、使用金已收款等，
	并实现海域使用权价格信息的动态更新，实时监测海域使用权价格变化情况。
	可对逾期未缴纳海域使用金的项目进行预警提醒。 
	PDF167
	*/
	
	/**
	 * 
	Description :海域使用金列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-14 下午06:47:14
	 */
	public String fetchHysyjList(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		hysyjList=seaUseGoldService.fetchHysyjList(hysyywHysydtHysyjForm, pageBean,userId, userRoleName);
		
		return "hysjyIndex";
	}
	
	/**
	 * 
	Description :确权项目缴纳明细
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 下午07:10:25
	 */
	public String fetchJnmx(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		//项目信息
		zsxxList = seaUseGoldService.fetchJnmxZsxx(xmID, zsID);
		//缴纳记录
		jnmxList = seaUseGoldService.fetchJnmxList(xmID, zsID,"");
		
		return "hysyjJnmx";
	}
	
	/**
	 * 
	Description :保存海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:27:51
	 */
	public String saveHysyj(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyj.setAddtime(xzsj);
		hysyywHysydtYhxmHysyj.setDjsj(xzsj);
		hysyywHysydtYhxmHysyj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyj.setAddusername(userXm);
		hysyywHysydtYhxmHysyj.setAdduserid(userId);
		hysyywHysydtYhxmHysyj.setXmid(Long.parseLong(xmID));
		hysyywHysydtYhxmHysyj.setZsid(Long.parseLong(zsID));
		businessService.addObject(hysyywHysydtYhxmHysyj);
		return "goFetchHysyj";
	}
	
	/**
	 * 
	Description :修改海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:32:05
	 */
	public String updateHysyj(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",hysyjID="+hysyywHysydtYhxmHysyj.getId());
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyj.setDjsj(xzsj);
		businessService.updateObject(hysyywHysydtYhxmHysyj);
		return "goFetchHysyj";
	}
	
	/**
	 * 
	Description :删除海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:29:10
	 */
	public String deleteHysyj(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",hysyjID="+hysyjID);
		businessService.deleteYhxmHysyj(hysyjID);
		return "goFetchHysyj";
	}
	
	/**
	 * 
	Description :证书详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-12 上午11:31:32
	 */
	public String fetchZsxxDetail(){
		System.out.println("zsID="+zsID+",zsbh="+zsbh+",indexNum="+indexNum);
		hysyywHysydtYhxmZsxx = seaUseGoldService.fetchYhxmZsxxDetail(xmID, zsID, zsbh);
		return "goZsxxDetail";
	}
	
	
	/**
	 * 
	Description :项目详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-12 上午11:31:37
	 */
	public String fetchXmxxDetail(){
		System.out.println("xmID="+xmID+",xmmc="+xmmc+",indexNum="+indexNum);
		hysyywHysydtYhxm = seaUseGoldService.fetchYhxmDetail(xmID, xmmc);
		return "goXmxxDetail";
	}
	
	
	/**
	 * 
	Description :临时用海海域使用金缴纳
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 上午10:46:06
	 */
	public String fetchHysyjList2(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		hysyjList=seaUseGoldService.fetchHysyjList2(hysyywHysydtHysyjForm, pageBean,userId, userRoleName);
		
		return "hysjyIndex2";
	}
	
	
	/**
	 * 
	Description :临时用海海域使用金缴纳-缴纳明细2
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 下午07:10:43
	 */
	public String fetchJnmx2(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",xmmc="+xmmc);
		session.put("xmmcS", xmmc);
		//项目信息
		zsxxList = seaUseGoldService.fetchJnmxZsxx2(xmID, zsID,xmmc);
		
		//缴纳记录
		jnmxList = seaUseGoldService.fetchJnmxList(xmID, zsID,xmmc);
		
		return "hysyjJnmx2";
	}
	public String fetchJnmx22(){
		xmmc = (String) session.get("xmmcS");
		System.out.println("xmID="+xmID+",zsID="+zsID+",xmmc="+xmmc);
		
		//项目信息
		zsxxList = seaUseGoldService.fetchJnmxZsxx2(xmID, zsID,xmmc);
		
		//缴纳记录
		jnmxList = seaUseGoldService.fetchJnmxList(xmID, zsID,xmmc);
		
		return "hysyjJnmx2";
	}
	
	/**
	 * 
	Description :临时用海海域使用金缴纳-保存海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:27:51
	 */
	public String saveHysyj2(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyj.setAddtime(xzsj);
		hysyywHysydtYhxmHysyj.setDjsj(xzsj);
		hysyywHysydtYhxmHysyj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyj.setAddusername(userXm);
		hysyywHysydtYhxmHysyj.setAdduserid(userId);
//		hysyywHysydtYhxmHysyj.setXmid(Long.parseLong(xmID));
//		hysyywHysydtYhxmHysyj.setZsid(Long.parseLong(zsID));
		businessService.addObject(hysyywHysydtYhxmHysyj);
		return "goHysyjJnmx2";
	}
	
	/**
	 * 
	Description :临时用海海域使用金缴纳-修改海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:32:05
	 */
	public String updateHysyj2(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",hysyjID="+hysyywHysydtYhxmHysyj.getId());
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyj.setDjsj(xzsj);
		businessService.updateObject(hysyywHysydtYhxmHysyj);
		return "goHysyjJnmx2";
	}
	
	/**
	 * 
	Description :临时用海海域使用金缴纳-删除海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:29:10
	 */
	public String deleteHysyj2(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",hysyjID="+hysyjID);
		businessService.deleteYhxmHysyj(hysyjID);
		return "goHysyjJnmx2";
	}
	
	
	
	
	
	/**
	 * 
	Description :海域使用金缴纳记录
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 下午02:39:51
	 */
	public String fetchHysyjList3(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		hysyjList=seaUseGoldService.fetchHysyjList3(hysyywHysydtHysyjForm, pageBean,userId, userRoleName);
		
		return "hysjyIndex3";
	}
	
	/**
	 * 
	Description :未入库项目海域使用金新增
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 下午06:16:13
	 */
	public String saveHysyjWrk(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyj.setAddtime(xzsj);
		hysyywHysydtYhxmHysyj.setDjsj(xzsj);
		hysyywHysydtYhxmHysyj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyj.setAddusername(userXm);
		hysyywHysydtYhxmHysyj.setAdduserid(userId);
//		hysyywHysydtYhxmHysyj.setXmid(Long.parseLong(xmID));
//		hysyywHysydtYhxmHysyj.setZsid(Long.parseLong(zsID));
		businessService.addObject(hysyywHysydtYhxmHysyj);
		return "goHysjyIndex3";
	}
	
	/**
	 * 
	Description :确权项目缴纳明细
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 下午07:10:25
	 */
	public String fetchJnmx31(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		//项目信息
		zsxxList = seaUseGoldService.fetchJnmxZsxx(xmID, zsID);
		//缴纳记录
		jnmxList = seaUseGoldService.fetchJnmxList(xmID, zsID,"");
		
		return "hysyjJnmx31";
	}
	/**
	 * 
	Description :临时用海海域使用金缴纳-缴纳明细2
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 下午07:10:43
	 */
	public String fetchJnmx32(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",xmmc="+xmmc);
		session.put("xmmcS", xmmc);
		//项目信息
		zsxxList = seaUseGoldService.fetchJnmxZsxx2(xmID, zsID,xmmc);
		
		//缴纳记录
		jnmxList = seaUseGoldService.fetchJnmxList(xmID, zsID,xmmc);
		
		return "hysyjJnmx32";
	}
	public String fetchJnmx322(){
		xmmc = (String) session.get("xmmcS");
		System.out.println("xmID="+xmID+",zsID="+zsID+",xmmc="+xmmc);
		
		//项目信息
		zsxxList = seaUseGoldService.fetchJnmxZsxx2(xmID, zsID,xmmc);
		
		//缴纳记录
		jnmxList = seaUseGoldService.fetchJnmxList(xmID, zsID,xmmc);
		
		return "hysyjJnmx32";
	}
	/**
	 * 
	Description :海域使用金缴纳记录-保存海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:27:51
	 */
	public String saveHysyj32(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyj.setAddtime(xzsj);
		hysyywHysydtYhxmHysyj.setDjsj(xzsj);
		hysyywHysydtYhxmHysyj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyj.setAddusername(userXm);
		hysyywHysydtYhxmHysyj.setAdduserid(userId);
//		hysyywHysydtYhxmHysyj.setXmid(Long.parseLong(xmID));
//		hysyywHysydtYhxmHysyj.setZsid(Long.parseLong(zsID));
		businessService.addObject(hysyywHysydtYhxmHysyj);
		return "goHysyjJnmx32";
	}
	
	/**
	 * 
	Description :海域使用金缴纳记录-修改海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:32:05
	 */
	public String updateHysyj32(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",hysyjID="+hysyywHysydtYhxmHysyj.getId());
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyj.setDjsj(xzsj);
		businessService.updateObject(hysyywHysydtYhxmHysyj);
		return "goHysyjJnmx32";
	}
	
	/**
	 * 
	Description :海域使用金缴纳记录-删除海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:29:10
	 */
	public String deleteHysyj32(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",hysyjID="+hysyjID);
		businessService.deleteYhxmHysyj(hysyjID);
		return "goHysyjJnmx32";
	}
	
	/**
	 * 
	Description :保存海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:27:51
	 */
	public String saveHysyj31(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyj.setAddtime(xzsj);
		hysyywHysydtYhxmHysyj.setDjsj(xzsj);
		hysyywHysydtYhxmHysyj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyj.setAddusername(userXm);
		hysyywHysydtYhxmHysyj.setAdduserid(userId);
		hysyywHysydtYhxmHysyj.setXmid(Long.parseLong(xmID));
		hysyywHysydtYhxmHysyj.setZsid(Long.parseLong(zsID));
		businessService.addObject(hysyywHysydtYhxmHysyj);
		return "goHysyjJnmx31";
	}
	
	/**
	 * 
	Description :修改海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:32:05
	 */
	public String updateHysyj31(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",hysyjID="+hysyywHysydtYhxmHysyj.getId());
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyj.setDjsj(xzsj);
		businessService.updateObject(hysyywHysydtYhxmHysyj);
		return "goHysyjJnmx31";
	}
	
	/**
	 * 
	Description :删除海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:29:10
	 */
	public String deleteHysyj31(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",hysyjID="+hysyjID);
		businessService.deleteYhxmHysyj(hysyjID);
		return "goHysyjJnmx31";
	}
	
	/*****************************海域使用金缴纳通知****************************/
	/**
	 * 
	Description :宗海信息-证书列表
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-31 下午05:05:42
	 */
	public String fetchZhxxList(){
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		zhxxList = seaUseGoldService.fetchZhxxList(pageBean, userId, userRoleName, searchForm);
		
		return "syjzsJntzIndex";
	}
	/**
	 * 
	Description :缴纳通知记录
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-1 上午11:26:50
	 */
	public String fetchZhxxList2(){
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		zhxxList = seaUseGoldService.fetchZhxxList2(pageBean, userId, userRoleName, searchForm);
		
		todayDate = getTodayDate();
		
		return "syjzsJntzIndex2";
	}
	/**
	 * 
	Description :获取当前日期
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-28 下午03:14:33
	 */
	public String getTodayDate(){
		Calendar c = Calendar.getInstance();
		Date date = c.getTime();
		System.out.println("系统当前时间："+date);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
		String datetime = dateFormat.format(date);
	    return datetime;
	}
	/**
	 * 
	Description :到缴纳通知新增页面
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-31 下午08:01:32
	 */
	public String goJntzaddJsp(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",zsbh="+zsbh);
		//查出该证书信息
		zsxxList = seaUseGoldService.fetchXmxxZhxx(xmID, zsID);
		
		return "jntzAdd";
	}
	/**
	 * 
	Description :查出项目信息
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-1 下午06:00:45
	 */
	public String fetchXmxx(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		List xmList = seaUseGoldService.fetchXmxxZhxx(xmID, zsID);
//		System.out.println("xmList="+xmList.size());
		HttpServletResponse response=this.getHttpServletResponse();		 
		response.setContentType("text/plain;charset=utf-8");		
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}	
		JsonConfig config=new JsonConfig();
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);  //自动为我排除circle
		JSONArray arr=JSONArray.fromObject(xmList,config);
		out.print(arr.toString());		
		out.flush();		
		return null;
	}
	
	/**
	 * 
	Description :新增缴纳通知
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-31 下午07:55:06
	 */
	public String addJntz(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",zsbh="+zsbh);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyjJntz.setAddtime(xzsj);
		hysyywHysydtYhxmHysyjJntz.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyjJntz.setAddusername(userXm);
		hysyywHysydtYhxmHysyjJntz.setAdduserid(userId);
		hysyywHysydtYhxmHysyjJntz.setXmid(Long.parseLong(xmID));
		hysyywHysydtYhxmHysyjJntz.setZsid(Long.parseLong(zsID));
		hysyywHysydtYhxmHysyjJntz.setHyglh(zsbh);
		hysyywHysydtYhxmHysyjJntz.setZt("未缴纳");
		businessService.addObject(hysyywHysydtYhxmHysyjJntz);
		return "addJntzSuccess";
	}
	/**
	 * 
	Description :缴纳通知-新增
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-1 下午04:24:07
	 */
	public String addJntz2(){
		System.out.println("xmID="+hysyywHysydtYhxmHysyjJntz.getXmid()+
				",zsID="+hysyywHysydtYhxmHysyjJntz.getZsid()+",zsbh="+hysyywHysydtYhxmHysyjJntz.getHyglh());
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyjJntz.setAddtime(xzsj);
		hysyywHysydtYhxmHysyjJntz.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyjJntz.setAddusername(userXm);
		hysyywHysydtYhxmHysyjJntz.setAdduserid(userId);
		hysyywHysydtYhxmHysyjJntz.setZt("未缴纳");
		businessService.addObject(hysyywHysydtYhxmHysyjJntz);
		return "addJntzSuccess2";
	}
	
	/**
	 * 
	Description :缴纳通知详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-31 下午07:53:51
	 */
	public String fetchJntzDetail(){
		System.out.println("jntzID="+jntzID+",indexNum="+indexNum);
		hysyywHysydtYhxmHysyjJntz = seaUseGoldService.fetchJntzDetail(jntzID);
		return "jntzDetail";
	}
	
	/**
	 * 
	Description :获取修改缴纳通知
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-31 下午07:53:31
	 */
	public String getJntzUpdate(){
		System.out.println("jntzID="+jntzID+",indexNum="+indexNum);
		hysyywHysydtYhxmHysyjJntz = seaUseGoldService.fetchJntzDetail(jntzID);
		return "jntzUpdate";
	}
	
	/**
	 * 
	Description :修改缴纳通知
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-31 下午07:53:23
	 */
	public String updateJntz(){
		System.out.println("jntzID="+hysyywHysydtYhxmHysyjJntz.getId()+",indexNum="+indexNum);
		System.out.println("xmID="+xmID+",zsID="+zsID+",zsbh="+zsbh);
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyjJntz.setLastupdatetime(xzsj);
		businessService.updateObject(hysyywHysydtYhxmHysyjJntz);
		if(indexNum.equals("1")){
			return "JntzList";
		}else{
			return "addJntzSuccess2";
		}
	}
	
	
	/**
	 * 
	Description :删除缴纳通知
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-31 下午07:50:44
	 */
	public String deleteJntz(){
		System.out.println("jntzID="+jntzID+",indexNum="+indexNum);
		System.out.println("xmID="+xmID+",zsID="+zsID+",zsbh="+zsbh);
		seaUseGoldService.deleteJntz(jntzID);
		if(indexNum.equals("1")){
			return "JntzList";
		}else{
			return "addJntzSuccess2";
		}
	}
	/**
	 * 
	Description :根据项目id、证书ID查缴纳记录
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-1 下午04:46:35
	 */
	public String fetchJnjlByXmid(){
//		String userId = "";
//		String userRoleName="";
//		try{
//			userId = ((User)session.get("user")).getId();//登陆人ID
//			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
//		}catch(Exception e){
//		    return "dlCs";
//		}
//		HttpServletRequest request= this.getHttpServletRequest();
//		pageBean=this.processPageBean(request);
//		pageBean.setPageRecord(10);
		System.out.println("xmID="+xmID+",zsID="+zsID+",zsbh="+zsbh);
		zhxxList = seaUseGoldService.fetchJntzListByXmid(xmID, zsID);
		
		return "syjzsJntzList";
	}
	
	//登录之后弹出提示信息
  	public String openZdclIndexDialog(){
//  	String userId = "";
//		String userRoleName="";
//		try{
//			userId = ((User)session.get("user")).getId();//登陆人ID
//			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
//		}catch(Exception e){
//		    return "dlCs";
//		}
		
  		int num1 = seaUseGoldService.fetchYjwjn();
  		System.out.println("num1="+num1);
//  	int num3 = 1;
//  	int num4 = 2;
  		int[] num = {num1};//,num3,num4
  		
  		HttpServletResponse response = this.getHttpServletResponse();
  		response.setContentType("text/plain;charset=utf-8");
  		PrintWriter out = null;
  		try {
  			out = response.getWriter();
  		} catch (IOException e) {
  			e.printStackTrace();
  		}
  		JsonConfig config = new JsonConfig();
  		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT); // 自动为我排除circle
  		JSONArray arr = JSONArray.fromObject(num, config);
  		out.print(arr.toString());
  		out.flush();
  		
  		return null;
  	}
	
	/****************************海域使用金征收标准*******************************/
  	/**
	 * 
	Description :征收标准列表
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-1 下午07:12:30
	 */
  	public String fetchHysyjZsbz(){
  		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
  		zsbzList = seaUseGoldService.fetchHysyjZsbz(pageBean, searchForm);
  		
  		return "zsbzList";
  	}
	
  	/**
  	 * 
  	Description :新增征收标准
  	@param:@return
  	@return:String
  	@throws
  	@Author：yinying
  	@Create 2017-11-1 下午07:29:31
  	 */
  	public String addZsbz(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",zsbh="+zsbh);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyjZsbz.setAddtime(xzsj);
		hysyywHysydtYhxmHysyjZsbz.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyjZsbz.setAddusername(userXm);
		hysyywHysydtYhxmHysyjZsbz.setAdduserid(userId);
		businessService.addObject(hysyywHysydtYhxmHysyjZsbz);
		return "addZsbzSuccess";
	}
  	/**
  	 * 
  	Description :征收标准详情
  	@param:@return
  	@return:String
  	@throws
  	@Author：yinying
  	@Create 2017-11-1 下午07:36:37
  	 */
  	public String fetchZsbzDetail(){
		System.out.println("zsbzID="+zsbzID);
		hysyywHysydtYhxmHysyjZsbz = seaUseGoldService.fetchZsbzDetail(zsbzID);
		return "zsbzDetail";
	}
  	/**
  	 * 
  	Description :获取修改的征收标准
  	@param:@return
  	@return:String
  	@throws
  	@Author：yinying
  	@Create 2017-11-1 下午07:36:10
  	 */
  	public String getZsbzUpdate(){
		System.out.println("zsbzID="+zsbzID);
		hysyywHysydtYhxmHysyjZsbz = seaUseGoldService.fetchZsbzDetail(zsbzID);
		return "zsbzUpdate";
	}
	
	/**
	 * 
	Description :修改征收标准
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-1 下午07:36:01
	 */
	public String updateZsbz(){
		System.out.println("zsbzID="+hysyywHysydtYhxmHysyjZsbz.getId());
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyjZsbz.setLastupdatetime(xzsj);
		businessService.updateObject(hysyywHysydtYhxmHysyjZsbz);
		return "addZsbzSuccess";
	}
	
	
	/**
	 * 
	Description :删除征收标准
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-1 下午07:35:53
	 */
	public String deleteZsbz(){
		System.out.println("zsbzID="+zsbzID);
		seaUseGoldService.deleteZsbz(zsbzID);
		return "addZsbzSuccess";
	}
  	
	/**
	 * 
	Description :默认表格页面：排版
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-1 下午08:09:02
	 */
  	public String fetchZsbzIndex(){
//  	HttpServletRequest request= this.getHttpServletRequest();
//		pageBean=this.processPageBean(request);
//		pageBean.setPageRecord(10);
  		zsbzList = seaUseGoldService.fetchHysyjZsbz(pageBean, searchForm);
  		return "zsbzIndex";
  	}
	
  	//按图片录入信息
  	
  	
	
	
	
	public IBusinessService getBusinessService() {
		return businessService;
	}

	public void setBusinessService(IBusinessService businessService) {
		this.businessService = businessService;
	}

	public ISeaUseGoldService getSeaUseGoldService() {
		return seaUseGoldService;
	}

	public void setSeaUseGoldService(ISeaUseGoldService seaUseGoldService) {
		this.seaUseGoldService = seaUseGoldService;
	}

	public List<?> getHysyjList() {
		return hysyjList;
	}

	public void setHysyjList(List<?> hysyjList) {
		this.hysyjList = hysyjList;
	}

	public THysyywHysydtHysyjForm getHysyywHysydtHysyjForm() {
		return hysyywHysydtHysyjForm;
	}

	public void setHysyywHysydtHysyjForm(
			THysyywHysydtHysyjForm hysyywHysydtHysyjForm) {
		this.hysyywHysydtHysyjForm = hysyywHysydtHysyjForm;
	}

	public List<?> getZsxxList() {
		return zsxxList;
	}

	public void setZsxxList(List<?> zsxxList) {
		this.zsxxList = zsxxList;
	}

	public List<?> getJnmxList() {
		return jnmxList;
	}

	public void setJnmxList(List<?> jnmxList) {
		this.jnmxList = jnmxList;
	}


	public String getXmID() {
		return xmID;
	}

	public void setXmID(String xmID) {
		this.xmID = xmID;
	}

	public String getZsID() {
		return zsID;
	}

	public void setZsID(String zsID) {
		this.zsID = zsID;
	}

	public THysyywHysydtYhxmHysyj getHysyywHysydtYhxmHysyj() {
		return hysyywHysydtYhxmHysyj;
	}

	public void setHysyywHysydtYhxmHysyj(
			THysyywHysydtYhxmHysyj hysyywHysydtYhxmHysyj) {
		this.hysyywHysydtYhxmHysyj = hysyywHysydtYhxmHysyj;
	}

	public String getHysyjID() {
		return hysyjID;
	}

	public void setHysyjID(String hysyjID) {
		this.hysyjID = hysyjID;
	}

	public String getXmmc() {
		return xmmc;
	}

	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}

	public String getZsbh() {
		return zsbh;
	}

	public void setZsbh(String zsbh) {
		this.zsbh = zsbh;
	}

	public THysyywHysydtYhxm getHysyywHysydtYhxm() {
		return hysyywHysydtYhxm;
	}

	public void setHysyywHysydtYhxm(THysyywHysydtYhxm hysyywHysydtYhxm) {
		this.hysyywHysydtYhxm = hysyywHysydtYhxm;
	}

	public THysyywHysydtYhxmZhxx getHysyywHysydtYhxmZsxx() {
		return hysyywHysydtYhxmZsxx;
	}

	public void setHysyywHysydtYhxmZsxx(THysyywHysydtYhxmZhxx hysyywHysydtYhxmZsxx) {
		this.hysyywHysydtYhxmZsxx = hysyywHysydtYhxmZsxx;
	}

	public String getIndexNum() {
		return indexNum;
	}

	public void setIndexNum(String indexNum) {
		this.indexNum = indexNum;
	}

	public SearchForm getSearchForm() {
		return searchForm;
	}

	public void setSearchForm(SearchForm searchForm) {
		this.searchForm = searchForm;
	}

	public List<?> getZhxxList() {
		return zhxxList;
	}

	public void setZhxxList(List<?> zhxxList) {
		this.zhxxList = zhxxList;
	}

	public THysyywHysydtYhxmHysyjJntz getHysyywHysydtYhxmHysyjJntz() {
		return hysyywHysydtYhxmHysyjJntz;
	}

	public void setHysyywHysydtYhxmHysyjJntz(
			THysyywHysydtYhxmHysyjJntz hysyywHysydtYhxmHysyjJntz) {
		this.hysyywHysydtYhxmHysyjJntz = hysyywHysydtYhxmHysyjJntz;
	}

	public String getJntzID() {
		return jntzID;
	}

	public void setJntzID(String jntzID) {
		this.jntzID = jntzID;
	}

	public void setTodayDate(String todayDate) {
		this.todayDate = todayDate;
	}

	public List<?> getZsbzList() {
		return zsbzList;
	}

	public void setZsbzList(List<?> zsbzList) {
		this.zsbzList = zsbzList;
	}

	public String getZsbzID() {
		return zsbzID;
	}

	public void setZsbzID(String zsbzID) {
		this.zsbzID = zsbzID;
	}

	public THysyywHysydtYhxmHysyjZsbz getHysyywHysydtYhxmHysyjZsbz() {
		return hysyywHysydtYhxmHysyjZsbz;
	}

	public void setHysyywHysydtYhxmHysyjZsbz(
			THysyywHysydtYhxmHysyjZsbz hysyywHysydtYhxmHysyjZsbz) {
		this.hysyywHysydtYhxmHysyjZsbz = hysyywHysydtYhxmHysyjZsbz;
	}
	
	
	
	
	
}
