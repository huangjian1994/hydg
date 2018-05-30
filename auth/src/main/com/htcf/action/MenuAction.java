package com.htcf.action;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.FirstUrlObject;
import com.htcf.entity.Menu;
import com.htcf.entity.RoleMenu;
import com.htcf.service.IMenuService;


@Controller("menuAction")
@Scope("prototype")
public class MenuAction  extends BaseAction {
	
	private static long serialVersionUID = 2139118283928760510L;

	private Menu menu=new Menu();
	
	private RoleMenu roleMenu=new RoleMenu();
	
	private List<Menu> menuList=new ArrayList<Menu>();
	
	@Autowired
	private IMenuService menuService;
	

	private String code;
	private String Firsturl;
	
	
	
	public String list(){
		
		
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		
		
		menuList=menuService.retrieveMenusByConditions(menu,pageBean);
		
		if(null !=method && method.equals("select")){
			
			return "selectMenuList";
		}
		 
		return "menuList";
		
		
	}
	
	public String edit(){
		
		if(method !=null && method.equals("init")){
			
			menuList=menuService.retrieveParentMenus(menu);
			
			menu=menuService.fetchMenuById(menu);
			menu.setPreOrderIndex(menu.getOrderIndex());
			menu.setPreOrderIndex(menu.getOrderIndex());
			return "menuEdit";
			
		}else{
			
			menuService.eidtMenu(menu);
			
			return "toMenuList";
			
			
		}
		
		
	}
	
	public String checkMenu(){
		
		menu=menuService.fetchMenu(menu);
		
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
		
		result=(menu ==null)?"1":"0";
		
		out.print(result);
		
		out.flush();
		return null;
	}
	
	

	public String add(){
		
			if(method != null){
				
				menuList=menuService.retrieveParentMenus(menu);
				
				return "menuAdd";
			}
			
			//User user=this.getSessionUser();
			
			menuService.addMenu(menu);
			
			return "toMenuList";

		
	}
	
	public String getPatents(){
		
		menuList=menuService.retrieveMenusByLevel(menu);
		
		HttpServletResponse response=this.getHttpServletResponse();
		 
		response.setContentType("text/plain;charset=utf-8");
		
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JsonConfig config=new JsonConfig();
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);  //自动为我排除circle
		
		
		JSONArray arr=JSONArray.fromObject(menuList,config);
		
		
		
		out.print(arr.toString());
		
		out.flush();
		
		return null;
		
		
	}
	
	public String delete(){
		
		menuService.deleteMenu(menu);
		
		return "toMenuList";
		
		
	}

	
	
	public String firstUrl_cllrjk(){
		code="cllrjk";
		List<FirstUrlObject> l=new ArrayList<FirstUrlObject>();
		l=(List<FirstUrlObject>)session.get("firsturlList");
		System.out.println("进入车辆录入监控页面=================");
		//for(int j=0;j<l.size();j++){
		//	System.out.println("code="+l.get(j).getCode());
			//System.out.println("Firsturl="+l.get(j).getFirsturl());
		//}
		System.out.println("code==========="+code);
		
		if(code!=null && !code.equals("")){
			for(int j=0;j<l.size();j++){
				if(l.get(j).getCode().equals(code)){
					Firsturl=l.get(j).getFirsturl();
					
				}
			}
			
		}
		if(Firsturl==null ||Firsturl.equals("")){
			Firsturl="jsp/noAuth.jsp";
			
		}
		System.out.println("Firsturl==========="+Firsturl);
		return "firstUrl_cllrjk";
		
	}
	
	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public List<Menu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}

	public IMenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(IMenuService menuService) {
		this.menuService = menuService;
	}

	public RoleMenu getRoleMenu() {
		return roleMenu;
	}

	public void setRoleMenu(RoleMenu roleMenu) {
		this.roleMenu = roleMenu;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public static void setSerialVersionUID(long serialVersionUID) {
		MenuAction.serialVersionUID = serialVersionUID;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getFirsturl() {
		return Firsturl;
	}

	public void setFirsturl(String firsturl) {
		Firsturl = firsturl;
	}

	
	
}
