package com.htcf.action;

import java.text.SimpleDateFormat;
import java.util.Date;


import com.htcf.entity.OperateLog;
import com.htcf.entity.UserEntity;
import com.htcf.service.DguserService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import javax.servlet.http.HttpServletRequest;

import com.htcf.service.IOperateLogService;



/**
 * @author hj
 * @date 2017-8-9
 *
 */

@Controller("dguserAction")
@Scope("prototype")
public class DguserAction extends BaseAction {

    private static final long serialVersionUID = 1L;

    @Autowired
    private DguserService DguserService;
    
  
    
    @Autowired
	private IOperateLogService operateLogService;
    
    
    private UserEntity userEntity = new UserEntity();


    /**
     * 用户登录
     * @author ：
     * @date:日期：2017-8-10下午04:38:16
     * @return
     */
    public String login(){
        session.clear();
        
        System.out.println("用户名登录="+userEntity.getName());
        System.out.printf("密码："+userEntity.getPassword());
        UserEntity newuUserEntity = DguserService.fetchUsersByName(userEntity);
        if(newuUserEntity !=null){
//			if(newuUserEntity.getPassword()==null||"".equals(newuUserEntity.getPassword())){
//				return "licenceExpired";
//			}
			if(!newuUserEntity.getPassword().equals(userEntity.getPassword())){	
				message="密码不正确";	
				return "input";		
			}
			addLog(newuUserEntity);
			
			session.put("user", newuUserEntity);
			
			return "success";
		}
		
		message="用户名不正确";
				
		return "input";
       
        
    }
    
    
	    private void addLog(UserEntity userEntity){
			
			HttpServletRequest req= this.getHttpServletRequest();
			
			String ip =  this.getIpAddr(req); 
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:dd:ss");
			OperateLog opLog=new OperateLog();
			opLog.setOperateCondition("select * from dg_user t where t.name='"+userEntity.getName()+"' and t.password='"+userEntity.getPassword()+"' ");
			opLog.setOperateName("用户登录");
			opLog.setOpTime(sdf.format(new Date()));
			opLog.setOperateType(new Long(0));
			opLog.setTerminalId(ip);
		
			opLog.setOrganization("");
			opLog.setOrganizationId("");
			opLog.setUserName(userEntity.getName());
			opLog.setUserId(userEntity.getId_card());
			opLog.setOperateResult(new Long(1));
		
			operateLogService.add(opLog);
		}

        
        
        public String logOut(){
    		
    		session.clear();
    		
    		return "logOut";
    		
    	}
    	
    	public  String getIpAddr(HttpServletRequest request) { 
    		
    		String ip = request.getHeader("x-forwarded-for");     
    		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     	   
    			ip = request.getHeader("Proxy-Client-IP");     	     }     	
    		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     	    
    			ip = request.getHeader("WL-Proxy-Client-IP");     	      }     	
    		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     	   
    			ip = request.getRemoteAddr();     	  
    			}     	   
    			return ip;     
    		}   
        
       /*------------------------------------------*/ 


	public DguserService getDguserService() {
		return DguserService;
	}


	public void setDguserService(DguserService dguserService) {
		DguserService = dguserService;
	}



	public IOperateLogService getOperateLogService() {
		return operateLogService;
	}


	public void setOperateLogService(IOperateLogService operateLogService) {
		this.operateLogService = operateLogService;
	}


	public UserEntity getUserEntity() {
		return userEntity;
	}


	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
    
    

}
