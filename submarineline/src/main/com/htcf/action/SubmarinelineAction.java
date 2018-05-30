package com.htcf.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.SearchForm;
import com.htcf.entity.THdgxAqglWgjb;
import com.htcf.entity.User;
import com.htcf.service.IBusinessService;
import com.htcf.service.ISubmarinelineService;

/**
 * 海底管线：安全管理-违规举报
 * @author yinying
 *
 */
@Controller("submarinelineAction")
@Scope("prototype")
public class SubmarinelineAction extends BaseAction{
	
	@Autowired
	private ISubmarinelineService submarinelineService;

	@Autowired
	private IBusinessService businessService;
	
	//实体
	private THdgxAqglWgjb hdgxAqglWgjb = new THdgxAqglWgjb();
	private SearchForm searchForm = new SearchForm();
	
	//List
	private List<?> wgjbList;
	//变量
	private String wgjbID;
	
	/**
	 * 
	Description :违规举报列表
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:18:24
	 */
	public String fetchWgjbList(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		wgjbList = submarinelineService.fetchAqglWgjb(searchForm, pageBean);
		
		return "goWgjbIndex";
	}
	/**
	 * 
	Description :保存违规举报
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:45:06
	 */
	public String addWgjb(){
		System.out.println("");
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hdgxAqglWgjb.setAddtime(xzsj);
		hdgxAqglWgjb.setAddusername(userXm);
		hdgxAqglWgjb.setAdduserid(userId);
		
		hdgxAqglWgjb.setUpdateuserid(userId);
		hdgxAqglWgjb.setUpdateusername(userXm);
		hdgxAqglWgjb.setLastupdatetime(xzsj);
		businessService.addObject(hdgxAqglWgjb);
		return "addWgjbSuccess";
	}
	/**
	 * 
	Description :删除违规举报
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:48:40
	 */
	public String deleteWgjbxx(){
		System.out.println("wgjbID="+wgjbID);
		Long id = Long.parseLong(wgjbID);
		boolean b = submarinelineService.deleteWgjbById(id);
		System.out.println(b);
		return "addWgjbSuccess";
	}
	/**
	 * 
	Description :违规举报详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:49:33
	 */
	public String fetchWgjbDetail(){
		System.out.println("wgjbID="+wgjbID);
		hdgxAqglWgjb = submarinelineService.fetchWgjbDetail(wgjbID);
		return "goWgjbDetail";
	}
	/**
	 * 
	Description :获取修改的违规举报
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:52:55
	 */
	public String getWgjbForUpdate(){
		System.out.println("wgjbID="+wgjbID);
		hdgxAqglWgjb = submarinelineService.fetchWgjbDetail(wgjbID);
		return "goUpdateWgjb";
	}
	/**
	 * 
	Description :修改违规举报
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:53:07
	 */
	public String updateWgjb(){
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hdgxAqglWgjb.setUpdateuserid(userId);
		hdgxAqglWgjb.setUpdateusername(userXm);
		hdgxAqglWgjb.setLastupdatetime(xzsj);
//		businessService.updateObject(hdgxAqglWgjb);
		boolean b = submarinelineService.updateWgjb(hdgxAqglWgjb);
		System.out.println(b);
		return "addWgjbSuccess";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ISubmarinelineService getSubmarinelineService() {
		return submarinelineService;
	}

	public void setSubmarinelineService(ISubmarinelineService submarinelineService) {
		this.submarinelineService = submarinelineService;
	}


	public IBusinessService getBusinessService() {
		return businessService;
	}


	public void setBusinessService(IBusinessService businessService) {
		this.businessService = businessService;
	}


	public THdgxAqglWgjb getHdgxAqglWgjb() {
		return hdgxAqglWgjb;
	}


	public void setHdgxAqglWgjb(THdgxAqglWgjb hdgxAqglWgjb) {
		this.hdgxAqglWgjb = hdgxAqglWgjb;
	}


	public List<?> getWgjbList() {
		return wgjbList;
	}


	public void setWgjbList(List<?> wgjbList) {
		this.wgjbList = wgjbList;
	}


	public String getWgjbID() {
		return wgjbID;
	}


	public void setWgjbID(String wgjbID) {
		this.wgjbID = wgjbID;
	}
	public SearchForm getSearchForm() {
		return searchForm;
	}
	public void setSearchForm(SearchForm searchForm) {
		this.searchForm = searchForm;
	}
	
	
}
