package com.htcf.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import com.htcf.service.*;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.htcf.entity.SeawallPatrolFlow;
import com.htcf.entity.SeawallPatrolReport;
import com.htcf.entity.THysyywHysydtYhxmForm;
import com.htcf.entity.THysyywHysydtYhxmphjgYjForm;
import com.htcf.entity.User;
import com.htcf.util.HttpSessionUtil;
import com.htcf.util.MessageFactory;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;
/**
 * 消息推送
 * @author lwb
 *
 */
public class MessagePushAction {
	@Autowired
	private ISeaUseGoldService seaUseGoldService;

	@Autowired
	private SeaIslandPatrolService islandPatrolService;
	
	/**
	 * 海塘巡查上报service
	 */
	@Autowired
	private SeawallPatrolReportService seawallPatrolReportService;
	/**
	 * 海塘巡查流程service
	 */
	@Autowired
	private SeawallPatrolFlowService seawallPatrolFlowService;
	@Autowired
	private IBusinessService businessService;
	
	private static int i = 0;
	private THysyywHysydtYhxmForm hysyywHysydtYhxmForm = new THysyywHysydtYhxmForm();
	
	private List<?> phjgBhyjList;
	
	
	public void testPushMessage(){
		List<User> users = HttpSessionUtil.getLoginedUsers();
		pushMessage(getUserId(), "测试");
	}
	
	public void pushMsgTask(){
		List<User> users = HttpSessionUtil.getLoginedUsers();
		
		if (null == users)
			return;
		for (User user : users) {

			String userId = "";
			String userRoleName="";
			String userName="";
			try{
				userId = user.getId();//登陆人ID
	            userName = user.getName();//用户真实名
				userRoleName = user.getRole().getRoleName();//角色
			}catch(Exception e){
//			    return "dlCs";
			}
			StringBuffer seawallPatrolMsg = new StringBuffer();
			if (StringUtil.isNotBlank(userId)) {
				SeawallPatrolFlow flow = new SeawallPatrolFlow();
				flow.setPerson(userId);
				List<SeawallPatrolFlow> flows = seawallPatrolFlowService.loadNoEndSeawallPatrolFlow(flow);
				if (null != flows) {
				/*	for (SeawallPatrolFlow seawallPatrolFlow : flows) {
						SeawallPatrolReport patrol = new SeawallPatrolReport();
						patrol.setId(seawallPatrolFlow.getStPatrolId());
						patrol = seawallPatrolReportService.loadSeawallPatrolReportByID(patrol, false);
						if (StringUtil.isNotBlank(seawallPatrolMsg.toString())) {
							seawallPatrolMsg.append(",");
						}
						if (null == patrol) 
							continue;
						seawallPatrolMsg.append(patrol.getStEventsn()).append("号");
					}*/
					int ht = flows.size();
					seawallPatrolMsg.append(ht+"条海塘巡查上报信息待处理");

				}
			}
			
			PageBean pageBean=null;
	  		int num1 = 0;
//	  		phjgBhyjList = businessService.fetchXmxxYj2(pageBean, hysyywHysydtYhxmForm,userId, userRoleName);
//	  		System.out.println("phjgBhyjList记录数=="+phjgBhyjList.size());
//	  		if(phjgBhyjList != null && phjgBhyjList.size()!=0){
//	  			for(int i=0;i<phjgBhyjList.size();i++){
//	  				THysyywHysydtYhxmphjgYjForm hysyywHysydtYhxmphjgYjForm = new THysyywHysydtYhxmphjgYjForm();
//	  				hysyywHysydtYhxmphjgYjForm=(THysyywHysydtYhxmphjgYjForm) phjgBhyjList.get(i);
//	  				num1 += Integer.parseInt(hysyywHysydtYhxmphjgYjForm.getYjs());
//	  			}
//	  		}
//
//	  		hysyywHysydtYhxmForm.setSj(this.getTodayDate());
	  		int num2 = 0;
//	  		List<?> phjgBhyjList2 = businessService.fetchXmxxYj2(pageBean, hysyywHysydtYhxmForm,userId, userRoleName);
//	  		if(phjgBhyjList2 != null && phjgBhyjList2.size()!=0){
//	  			for(int i=0;i<phjgBhyjList2.size();i++){
//	  				THysyywHysydtYhxmphjgYjForm hysyywHysydtYhxmphjgYjForm = new THysyywHysydtYhxmphjgYjForm();
//	  				hysyywHysydtYhxmphjgYjForm=(THysyywHysydtYhxmphjgYjForm) phjgBhyjList2.get(i);
//	  				num2 += Integer.parseInt(hysyywHysydtYhxmphjgYjForm.getYjs());
//	  			}
//	  		}
	  		
	  		int num3 = 0;
//	  		int num3 = seaUseGoldService.fetchYjwjn();//海域使用金逾期未缴纳记录数
	  		int xcrws = 0;
//			int xcrws = islandPatrolService.fetchYjrws(userName,userRoleName);

	        StringBuffer msg = new StringBuffer()
	                .append("\t用海项目监管全部预警数为"+num1+"，用海项目监管当日预警数为"+num2+"，" +
	                        "海域使用金逾期未缴纳记录数"+num3+",巡查任务数为"+xcrws+"。 ");
			if (StringUtil.isNotBlank(seawallPatrolMsg.toString())) {
				msg.append("\t").append(seawallPatrolMsg.toString());
			}
			
			this.pushMessage(user.getId(), msg.toString());
		}
	}
	
	public void loginSuccess(){
		User user = (User)getHttpSession().getAttribute("user");
		
		String userId = "";
		String userRoleName="";
		String userName="";
		try{
			userId = user.getId();//登陆人ID
            userName = user.getName();//用户真实名
			userRoleName = user.getRole().getRoleName();//角色
		}catch(Exception e){
//		    return "dlCs";
		}
		StringBuffer seawallPatrolMsg = new StringBuffer();
		if (StringUtil.isNotBlank(userId)) {
			SeawallPatrolFlow flow = new SeawallPatrolFlow();
			flow.setPerson(userId);
			List<SeawallPatrolFlow> flows = seawallPatrolFlowService.loadNoEndSeawallPatrolFlow(flow);
			if (null != flows) {
			/*	for (SeawallPatrolFlow seawallPatrolFlow : flows) {
					SeawallPatrolReport patrol = new SeawallPatrolReport();
					patrol.setId(seawallPatrolFlow.getStPatrolId());
					patrol = seawallPatrolReportService.loadSeawallPatrolReportByID(patrol, false);
					if (StringUtil.isNotBlank(seawallPatrolMsg.toString())) {
						seawallPatrolMsg.append(",");
					}
					seawallPatrolMsg.append(patrol.getStEventsn()).append("号");
				}*/
			int ht = flows.size();
				seawallPatrolMsg.append(ht+"条海塘巡查上报信息待处理");
			}
		}
		
		PageBean pageBean=null;
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


		int xcrws = islandPatrolService.fetchYjrws(userName,userRoleName);

        StringBuffer msg = new StringBuffer(user.getUserName()).append("登陆成功！")
                .append("\t用海项目监管全部预警数为"+num1+"，用海项目监管当日预警数为"+num2+"，" +
                        "海域使用金逾期未缴纳记录数"+num3+",巡查任务数为"+xcrws+"。 ");
		if (StringUtil.isNotBlank(seawallPatrolMsg.toString())) {
			msg.append("\t").append(seawallPatrolMsg.toString());
		}
  		pushMessage(getUserId(), msg.toString());
  		
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
	
	private void pushMessage(String userId, String message) {
		i++;
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("msg", message);
		args.put("i", i);
		JSONObject json = JSONObject.fromObject(args);
		MessageFactory mc = new MessageFactory();
		mc.sendMessageAuto(userId, json.toString());
	}
	
	protected final HttpSession getHttpSession() {
		return ServletActionContext.getRequest().getSession();
	}
	
	protected final String getUserId() {
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		if ( user == null ) {
			return "";
		}
		return user.getId();
	}
}
