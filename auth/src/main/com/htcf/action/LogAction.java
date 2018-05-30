package com.htcf.action;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.htcf.entity.OperateLog;
import com.htcf.entity.User;
import com.htcf.service.IOperateLogService;
import com.htcf.service.IUserService;


@Controller("logAction")
@Scope("prototype")
public class LogAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	

	@Autowired
	private IUserService userService;

	@Autowired
	private IOperateLogService operateLogService;
	
	private User user=new User();
	
	private OperateLog opLog=new OperateLog();
	
	List<OperateLog> opLogList=new ArrayList<OperateLog>();

	public String list(){
		
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		
		opLogList=operateLogService.retrieveLogs(user,opLog,pageBean);
				
		return "logList";
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public IOperateLogService getOperateLogService() {
		return operateLogService;
	}

	public void setOperateLogService(IOperateLogService operateLogService) {
		this.operateLogService = operateLogService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public OperateLog getOpLog() {
		return opLog;
	}

	public void setOpLog(OperateLog opLog) {
		this.opLog = opLog;
	}

	public List<OperateLog> getOpLogList() {
		return opLogList;
	}

	public void setOpLogList(List<OperateLog> opLogList) {
		this.opLogList = opLogList;
	}
	
	

	
}
