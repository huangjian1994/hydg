package com.htcf.action;

import com.htcf.entity.FirstUrlObject;
import com.htcf.entity.Menu;
import com.htcf.entity.OperateLog;
import com.htcf.entity.User;
import com.htcf.service.IMenuService;
import com.htcf.service.IOperateLogService;
import com.htcf.service.IUserService;
import com.htcf.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.util.RequestUtil;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller("SoaAction")
@Scope("prototype")
/**
	 *
	Description :
	@param
	@return
	@author：hj
	@Create 2018-2-6 15:06
	 */
public class SoaAction extends BaseAction{

	@Autowired
	private IUserService userService;

	@Autowired
	private IOperateLogService operateLogService;

	@Autowired
	private IMenuService menuService;

	private String account;
	private String tokenId;

	private int indexNum=0;//

	private User user = new User();
	
	//人家访问你的地址，你的域名/项目名/方法?account=XXX&tokenId=XXX
	//进入到这个方法中0
	/**
		 *
		Description :访问控制
		@return string
		@author：hj
		@Create 2018-2-6 15:07
		 */
	public String goInSys() {
		String  sendMessage = (String)session.get("sendMessage");
		System.out.println("account-----"+account);
		System.out.println("tokenId-----"+tokenId);
		if(account == null || tokenId == null) {
			System.out.println("");
			return "error";
		}
		// 发送get请求,util
		String response = 
			RequestUtil.sendGet("http://31.16.10.180:8080/CXFRest/rest/sample/checkLoginStatus/", String.format("account=%s&tokenId=%s", account, tokenId));
		
		// 分析response
		// 如果那个人是登录状态点击的这个链接，那么会返回。
		// 已登陆：callback({"flag":"login"})
		// 未登陆：callback({"flag":"logout"})
		// 异常：callback({"flag":"error"})
		
		if(response != null && response.contains("login")) {
			// 这个人已经登录到XXX平台了，登录到本系统中
			System.out.println("已登录--------"+response);
			user.setUserName(account);
			System.out.println(user.getUserName());
			User newUser=userService.fetchUsersByName(user);
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
			session.put("user", newUser);
			System.out.println("密码是："+newUser.getPassword());

			return "success";
		} else if(response != null && response.contains("logout")) {
			// 这个人未登录
			System.out.println("未登录--------"+response);
			return "input";
		} else if(response != null && response.contains("error")) {
			// 出现异常
			System.out.println("出错了--------"+response);
			return "input";
		}
		
		//http://31.16.10.80:8080/CXFRest/rest/sample/checkLoginStatus/account=XXX&tokenId=********
		//account=XXX&tokenId=********
		return "login";
	}

	private void addLog(User user){

		HttpServletRequest req= this.getHttpServletRequest();

		String ip =  this.getIpAddr(req);

		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:dd:ss");
		OperateLog opLog=new OperateLog();
		opLog.setOperateCondition("select * from base_user t where t.username='"+user.getUserName()+"' and t.password='"+user.getPassword()+"' ");
		opLog.setOperateName("OA用户登录");
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

	public String test(){
		System.out.println("15555555");
		return null;
	}
	
	
	
	
	

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getTokenId() {
		return tokenId;
	}

	public void setTokenId(String tokenId) {
		this.tokenId = tokenId;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public IOperateLogService getOperateLogService() {
		return operateLogService;
	}

	public void setOperateLogService(IOperateLogService operateLogService) {
		this.operateLogService = operateLogService;
	}

	public IMenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(IMenuService menuService) {
		this.menuService = menuService;
	}

	public int getIndexNum() {
		return indexNum;
	}

	public void setIndexNum(int indexNum) {
		this.indexNum = indexNum;
	}
}
