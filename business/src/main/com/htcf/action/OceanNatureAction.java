package com.htcf.action;

import com.alibaba.fastjson.JSON;
import com.htcf.entity.HysyywHysydtHyzrbhq;
import com.htcf.entity.ThysyywHysydtHyzrbhqEntity;
import com.htcf.service.IBusinessService;
import com.htcf.service.IZonService;
import com.htcf.service.OceanNatureService;
import com.htcf.util.DateUtil;
import com.htcf.util.RequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

/**
	 *
	Description :自然保护区信息
	@author：hj
	@Create 2017-10-21 15:10
	 */
@Controller("oceanNatureAction")
@Scope("prototype")
public class OceanNatureAction extends BaseAction {

	@Autowired
	private OceanNatureService natureService;

	@Autowired
	private IBusinessService businessService;

	@Autowired
	private IZonService zonService;

	private ThysyywHysydtHyzrbhqEntity hyzrbhqEntity;

	private String oceanNature;
	private List<HysyywHysydtHyzrbhq> hysydtHyzrbhqs;

	private List<ThysyywHysydtHyzrbhqEntity> hyzrbhqEntityList;

	/**
	 * 标识操作类型 0：查看详情
	 */
	private String operate;



	/**
		 *
		Description :请求自然保护区接口
		@author：hj
		@Create 2017-10-21 20:48
		 */
	public String oceanNature(){
		oceanNature =RequestUtil.sendGet
				("http://31.16.10.26:8015/Service/BHJS/data_JBXX.ashx?action=Select","") ;

		System.out.println("获取到的信息"+oceanNature);
		hysydtHyzrbhqs = JSON.parseArray(oceanNature,HysyywHysydtHyzrbhq.class);
        System.out.println("-=-=-=-=-="+hysydtHyzrbhqs);
        return "oceanJsp";
	}

	/**
		 *
		Description :查询自然保护区
		@return String
		@author：hj
		@Create 2018-1-5 16:44
		 */
	public String fetchZrbhq(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		hyzrbhqEntityList = natureService.fetchZrbhq(hyzrbhqEntity,pageBean);
		return "zrbhqIndex";
	}

	/**
		 *
		Description :跳转到新增页面
		@return String
		@author：hj
		@Create 2018-1-8 14:15
		 */
	public String toaddBhq(){
		System.out.println("新增页面。。");
		return "toaddBhq";
	}

	/**
		 *
		Description :新增保护区
		@return String
		@author：hj
		@Create 2018-1-10 15:03
		 */
	public String addBhq(){

		String xzsj=this.getDateTime();
		hyzrbhqEntity.setCjsj(xzsj);
		//调用保存实体
		businessService.addObject(hyzrbhqEntity);
		return "toBhqhList";
	}

	/**
		 *
		Description :删除保护区
		@author：hj
		@Create 2018-1-10 15:03
		 */
	public void removeBhq(){
		String result = "0";
		if (this.natureService.removeBhqById(this.hyzrbhqEntity)) {
			result = "1";
		}
		HttpServletResponse response = this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
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
		 *
		Description :跳转去修改页面
		@return String
		@author：hj
		@Create 2018-1-10 10:50
		 */
	public String toEditBhq(){
		this.hyzrbhqEntity = this.natureService.loadBhqById(this.hyzrbhqEntity);
		return "toEditBhq";
	}

	/**
	 *
	 Description :修改保护区
	 @return xzgz
	 @author：hj
	 @Create 2017-11-28 13:50
	 */
	public String updateBhq(){
		this.hyzrbhqEntity.setXgsj(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		hyzrbhqEntity.setXgr(this.getSessionUser().getUserName());
		zonService.UpdateObj(hyzrbhqEntity);
		return "toBhqhList";
	}

	/* -------------------------getset ------------------*/

	public String getOceanNature() {
		return oceanNature;
	}

	public void setOceanNature(String oceanNature) {
		this.oceanNature = oceanNature;
	}

	public List<HysyywHysydtHyzrbhq> getHysydtHyzrbhqs() {
		return hysydtHyzrbhqs;
	}

	public void setHysydtHyzrbhqs(List<HysyywHysydtHyzrbhq> hysydtHyzrbhqs) {
		this.hysydtHyzrbhqs = hysydtHyzrbhqs;
	}

	public List<ThysyywHysydtHyzrbhqEntity> getHyzrbhqEntityList() {
		return hyzrbhqEntityList;
	}

	public void setHyzrbhqEntityList(List<ThysyywHysydtHyzrbhqEntity> hyzrbhqEntityList) {
		this.hyzrbhqEntityList = hyzrbhqEntityList;
	}

	public OceanNatureService getNatureService() {
		return natureService;
	}

	public void setNatureService(OceanNatureService natureService) {
		this.natureService = natureService;
	}

	public ThysyywHysydtHyzrbhqEntity getHyzrbhqEntity() {
		return hyzrbhqEntity;
	}

	public void setHyzrbhqEntity(ThysyywHysydtHyzrbhqEntity hyzrbhqEntity) {
		this.hyzrbhqEntity = hyzrbhqEntity;
	}

	public IBusinessService getBusinessService() {
		return businessService;
	}

	public void setBusinessService(IBusinessService businessService) {
		this.businessService = businessService;
	}

	public String getOperate() {
		return operate;
	}

	public void setOperate(String operate) {
		this.operate = operate;
	}

	public IZonService getZonService() {
		return zonService;
	}

	public void setZonService(IZonService zonService) {
		this.zonService = zonService;
	}
}
