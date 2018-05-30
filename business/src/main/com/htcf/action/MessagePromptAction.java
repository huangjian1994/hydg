package com.htcf.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.THysyywHysydtYhxmForm;
import com.htcf.entity.THysyywHysydtYhxmphjgYjForm;
import com.htcf.entity.User;
import com.htcf.service.IBusinessService;
import com.htcf.service.ISeaUseGoldService;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

/**
 * 消息提示 类
 * @author yinying
 * 20180130
 */
@Controller("messagePromptAction")
@Scope("prototype")
public class MessagePromptAction extends BaseAction{
	@Autowired
	private ISeaUseGoldService seaUseGoldService;
	
	@Autowired
	private IBusinessService businessService;
	
	private THysyywHysydtYhxmForm hysyywHysydtYhxmForm = new THysyywHysydtYhxmForm();
	
	private List<?> phjgBhyjList;
	
	
	/**
	 * 
	Description :登录之后弹出提示信息
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-30 下午04:53:48
	 */
  	public String openDialog(){
  		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		
  		pageBean=null;
  		int num1 = 0;
  		phjgBhyjList = businessService.fetchXmxxYj2(pageBean, hysyywHysydtYhxmForm,userId, userRoleName);
  		System.out.println("phjgBhyjList记录数=="+phjgBhyjList.size());
  		if(phjgBhyjList != null && phjgBhyjList.size()!=0){
  			for(int i=0;i<phjgBhyjList.size();i++){
  				THysyywHysydtYhxmphjgYjForm hysyywHysydtYhxmphjgYjForm = new THysyywHysydtYhxmphjgYjForm();
  				hysyywHysydtYhxmphjgYjForm=(THysyywHysydtYhxmphjgYjForm) phjgBhyjList.get(i);
  				num1 += Integer.parseInt(hysyywHysydtYhxmphjgYjForm.getYjs());
  			}
  		}

  		hysyywHysydtYhxmForm.setSj(this.getTodayDate());
  		int num2 = 0;
  		List<?> phjgBhyjList2 = businessService.fetchXmxxYj2(pageBean, hysyywHysydtYhxmForm,userId, userRoleName);
  		if(phjgBhyjList2 != null && phjgBhyjList2.size()!=0){
  			for(int i=0;i<phjgBhyjList2.size();i++){
  				THysyywHysydtYhxmphjgYjForm hysyywHysydtYhxmphjgYjForm = new THysyywHysydtYhxmphjgYjForm();
  				hysyywHysydtYhxmphjgYjForm=(THysyywHysydtYhxmphjgYjForm) phjgBhyjList2.get(i);
  				num2 += Integer.parseInt(hysyywHysydtYhxmphjgYjForm.getYjs());
  			}
  		}
  		

  		int num3 = seaUseGoldService.fetchYjwjn();//海域使用金逾期未缴纳记录数

  		System.out.println("num1="+num1+",num2="+num2+",num3="+num3);
  		
  		
  		//用海项目监管全部预警数为
  		//用海项目监管当日预警数为
  		//海域使用金逾期未缴纳记录数
  		int[] num = {num1,num2,num3};
  		
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

	public ISeaUseGoldService getSeaUseGoldService() {
		return seaUseGoldService;
	}

	public void setSeaUseGoldService(ISeaUseGoldService seaUseGoldService) {
		this.seaUseGoldService = seaUseGoldService;
	}

	public IBusinessService getBusinessService() {
		return businessService;
	}

	public void setBusinessService(IBusinessService businessService) {
		this.businessService = businessService;
	}

	public THysyywHysydtYhxmForm getHysyywHysydtYhxmForm() {
		return hysyywHysydtYhxmForm;
	}

	public void setHysyywHysydtYhxmForm(THysyywHysydtYhxmForm hysyywHysydtYhxmForm) {
		this.hysyywHysydtYhxmForm = hysyywHysydtYhxmForm;
	}

	public List<?> getPhjgBhyjList() {
		return phjgBhyjList;
	}

	public void setPhjgBhyjList(List<?> phjgBhyjList) {
		this.phjgBhyjList = phjgBhyjList;
	}
	
	
	
}
