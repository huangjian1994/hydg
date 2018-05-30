package com.htcf.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import com.htcf.entity.FirstUrlObject;
import com.htcf.entity.Menu;
import com.htcf.entity.OperateLog;
import com.htcf.entity.Role;
import com.htcf.entity.User;
import com.htcf.entity.UserRole;
import com.htcf.service.IMenuService;
import com.htcf.service.IOperateLogService;
import com.htcf.service.IRoleService;
import com.htcf.service.IUserService;
import com.htcf.util.StringUtil;


@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction {
	
	private static long serialVersionUID = 1L;
	

	@Autowired
	private IUserService userService;
	
	@Autowired
	private IRoleService roleService;
	
	@Autowired
	private IMenuService menuService;
	
	@Autowired
	private IOperateLogService operateLogService;
	
	private User user=new User();
	private UserRole ur=new UserRole();
	
	private List<User> userList=new ArrayList<User>();
	
	private List<Role> roleList=new ArrayList<Role>();
	
	
	private String roleIds;
	private String dataTjsy;	
	private String dataTjsyZ;
	
	private String content;//车牌号码
	
	//导航栏
	private List<String[]> ykllList;
	private List<String[]> sfryList;
	private List<String[]> hcryList;
	private List<String[]> qbxsList;
	private List<String[]> tdyyList;
	private List<String[]> spjwList;
	private List<String[]> dqqwList;
	private List<String[]> xtglList;
	
	private int indexNum=0;//
	
	//黄健-废弃
	public String login2(){
        session.clear();
        System.out.println("用户名登录="+user.getUserName());
        System.out.printf("密码："+user.getPassword());
        User newUser=userService.fetchUsersByName(user);
        if(newUser !=null){
        	System.out.println();
			if(!newUser.getPassword().equals(user.getPassword())){	
				message="密码不正确";	
				return "input";		
			}
			addLog(newUser);
			
			session.put("user", newUser);
			
			return "success";
		}
		message="用户名不正确";
		return "input";
    }
	
	/**
	 * 用户code加载
	 */
	public void loadUserCode(){
		userList = userService.fetchAllUsers();
		List<Map<String, String>> codes = new ArrayList<Map<String,String>>();
		for (User u : userList) {
			Map<String, String> code = new HashMap<String, String>();
			code.put("id", u.getId());
			code.put("text", u.getName());
			codes.add(code);
		}
		JSONArray json = JSONArray.fromObject(codes);
		
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

	
	public String login(){
		
		String  sendMessage = (String)session.get("sendMessage");
		
		session.clear();
		User newUser=userService.fetchUsersByName(user);
		if(newUser !=null){
			if(!newUser.getPassword().equals(user.getPassword())){
				message="用户名或密码不正确！";
				return "input";
			}
			addLog(newUser);
			List<Menu> menuList=menuService.retrieveMenusByUser(newUser);
			//第一个链接列表
			List<FirstUrlObject> firstUrlList=new ArrayList<FirstUrlObject>();
			
			Map<String,List<Menu>> menusMap=new HashMap<String,List<Menu>>();
			
			for (Menu menu : menuList) {
				System.out.println("code=="+menu.getCode());
			  if(menu.getSubList().size()!=0){
				System.out.println("SubList_FirstResourceURL:"+menu.getSubList().get(0).getResourceURL());
			  
				FirstUrlObject o=new FirstUrlObject();
				o.setCode(menu.getCode());
				o.setFirsturl(menu.getSubList().get(0).getResourceURL());
				o.setFirsturlname(menu.getSubList().get(0).getMenuName());
				firstUrlList.add(o);
				menusMap.put(menu.getCode(), menu.getSubList());
			  }
			}
			
			this.session.put("indexNum", indexNum);
			
			if ( StringUtil.isBlank(sendMessage) ) {
				session.put("sendMessage", "1");
			}
			session.put("user", newUser);
			session.put("menuList", menuList);
			session.put("menusMap", menusMap);
			session.put("firsturlList", firstUrlList);
			
			//获取测试
			List<FirstUrlObject> l=new ArrayList<FirstUrlObject>();
			l=(List<FirstUrlObject>)session.get("firsturlList");
			System.out.println("TEST======================================");
			for(int j=0;j<l.size();j++){
				System.out.println("firsturlList===firsturlname="+l.get(j).getFirsturlname());
				System.out.println("firsturlList===code="+l.get(j).getCode());
				System.out.println("firsturlList===Firsturl="+l.get(j).getFirsturl());
			}
			return "success";
		}
		
		message="用户名或密码不正确！";
		return "input";
	}
	//数据证书登录
	public String loginuk(){
		String v=(String) session.get("ukinfo");
		String a[]=v.split(",");
		String m=a[0];
//		String m1[]=m.split("=");
		String m2[]=m.split(" ");
		System.out.println(m2[1]);
		user.setUserId(m2[1]);
		User newUser=userService.fetchUsersByUserID(user);
		
		List<Menu> menuList=menuService.retrieveMenusByUser(newUser);
		Map<String,List<Menu>> menusMap=new HashMap<String,List<Menu>>();		
		for (Menu menu : menuList) {
			System.out.println("code=="+menu.getCode());
			menusMap.put(menu.getCode(), menu.getSubList());
		}	
		session.put("user", newUser);
		session.put("menuList", menuList);
		session.put("menusMap", menusMap);
		this.session.put("indexNum", indexNum);
		
		
		return "success";
	}
	
	
	private void addLog(User user){
		
		HttpServletRequest req= this.getHttpServletRequest();
		
		String ip =  this.getIpAddr(req); 
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:dd:ss");
		OperateLog opLog=new OperateLog();
		opLog.setOperateCondition("select * from base_user t where t.username='"+user.getUserName()+"' and t.password='"+user.getPassword()+"' ");
		opLog.setOperateName("用户登录");
		opLog.setOpTime(sdf.format(new Date()));
		opLog.setOperateType(new Long(0));
		opLog.setTerminalId(ip);
	
		opLog.setOrganization("");
		opLog.setOrganizationId("");
		opLog.setUserName(user.getName());
		opLog.setUserId(user.getUserId());
		opLog.setOperateResult(new Long(1));
	
		operateLogService.add(opLog);
	}
	
	
	public String add(){
		
		if(StringUtils.hasLength(method)){
			
			roleList=roleService.retrieveAllRoles();
			
			//设置初始密码
			user.setPassword("000000");
			
			return "toUserAdd";
			
		}
		userService.addUser(user);
		
		return "toUserList";
		
	}
	
	
	public String list(){
		
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		
		roleList =roleService.retrieveAllRoles();
		userList=this.userService.retrieveUsersByCondtions(user, pageBean);
		
		return "userList";
		
	}
	
	
	public String checkUserName(){
				
		
		user=userService.fetchUsersByName(user);
		 
		String result="";
		 
	 	HttpServletResponse response=this.getHttpServletResponse();
	 
		response.setContentType("text/plain;charset=utf-8");
		
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		result=(user ==null)?"1":"0";
		out.print(result);
		out.flush();
		return null;
		
	}
	
	
	public String showDetail(){	
		user=userService.fetchUserById(user);		
		roleList=roleService.retrieveRolesByUser(user);
		return "toUserDetail";
	}
	
	
	public String edit(){
		if(StringUtils.hasLength(method)){
			user=userService.fetchUserById(user);
			roleList=roleService.retrieveAllRoles();
			return "toUserEdit";
		}
		userService.editUser(user);
		return "toUserList";
	}
	
	public String edit_maintop(){		
		if(StringUtils.hasLength(method)){
			//查找userid
			String userid=((User) session.get("user")).getId();
			user.setId(userid);	
			user=userService.fetchUserById(user);
			roleList=roleService.retrieveAllRoles();
			return "toUserEdit2";
		}
		userService.editUser(user);
		//返回登录后首页toUserList-退出重新登录
		return "toUserEdit2";
	}
	
	public String userEdit(){
		if(StringUtils.hasLength(method)){
			user=userService.fetchUserById(user);
			roleList=roleService.retrieveAllRoles();
			return "toUserEdit_user";
		}
		userService.editUser(user);
		return "editSuc";
	}
	
	public String delete(){
		
		userService.deleteUser(user);
		
		return "toUserList";
		
		
	}

	public String checkUser(){
		
		 try {
			 
			 user.setUserName(new String(user.getUserName().getBytes("ISO8859-1"),"UTF-8"));
				
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		
		 User newUser=userService.fetchUser(user);
		 
		
		 String result="";
		 
		 
	 	HttpServletResponse response=this.getHttpServletResponse();
	 
		response.setContentType("text/plain;charset=utf-8");
		
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		result=(newUser ==null)?"1":"0";
		out.print(result);
		out.flush();
		return null;
		
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
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}



	public IMenuService getMenuService() {
		return menuService;
	}



	public void setMenuService(IMenuService menuService) {
		this.menuService = menuService;
	}


	public List<User> getUserList() {
		return userList;
	}


	public void setUserList(List<User> userList) {
		this.userList = userList;
	}


	public UserRole getUr() {
		return ur;
	}


	public void setUr(UserRole ur) {
		this.ur = ur;
	}


	public IRoleService getRoleService() {
		return roleService;
	}


	public void setRoleService(IRoleService roleService) {
		this.roleService = roleService;
	}




	public String getRoleIds() {
		return roleIds;
	}




	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}


	public List<Role> getRoleList() {
		return roleList;
	}


	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}




	public IOperateLogService getOperateLogService() {
		return operateLogService;
	}




	public void setOperateLogService(IOperateLogService operateLogService) {
		this.operateLogService = operateLogService;
	}

	

	

	public String getDataTjsy() {
	    return dataTjsy;
	}

	public void setDataTjsy(String dataTjsy) {
	    this.dataTjsy = dataTjsy;
	}

	public String getDataTjsyZ() {
	    return dataTjsyZ;
	}

	public void setDataTjsyZ(String dataTjsyZ) {
	    this.dataTjsyZ = dataTjsyZ;
	}

	

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public static void setSerialVersionUID(long serialVersionUID) {
		UserAction.serialVersionUID = serialVersionUID;
	}

	

	

	public List<String[]> getYkllList() {
		return ykllList;
	}

	public void setYkllList(List<String[]> ykllList) {
		this.ykllList = ykllList;
	}

	public List<String[]> getSfryList() {
		return sfryList;
	}

	public void setSfryList(List<String[]> sfryList) {
		this.sfryList = sfryList;
	}

	public List<String[]> getHcryList() {
		return hcryList;
	}

	public void setHcryList(List<String[]> hcryList) {
		this.hcryList = hcryList;
	}

	public List<String[]> getQbxsList() {
		return qbxsList;
	}

	public void setQbxsList(List<String[]> qbxsList) {
		this.qbxsList = qbxsList;
	}

	public List<String[]> getTdyyList() {
		return tdyyList;
	}

	public void setTdyyList(List<String[]> tdyyList) {
		this.tdyyList = tdyyList;
	}

	public List<String[]> getSpjwList() {
		return spjwList;
	}

	public void setSpjwList(List<String[]> spjwList) {
		this.spjwList = spjwList;
	}

	public List<String[]> getDqqwList() {
		return dqqwList;
	}

	public void setDqqwList(List<String[]> dqqwList) {
		this.dqqwList = dqqwList;
	}

	public List<String[]> getXtglList() {
		return xtglList;
	}

	public void setXtglList(List<String[]> xtglList) {
		this.xtglList = xtglList;
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getIndexNum() {
		return indexNum;
	}

	public void setIndexNum(int indexNum) {
		this.indexNum = indexNum;
	}
	
	
	
}
