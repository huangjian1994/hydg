package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.IPatorlReportDao;
import com.htcf.entity.PatorlSearchForm;
import com.htcf.entity.THyxcHdxcFkfj;
import com.htcf.entity.THyxcHdxcFkjcxx;
import com.htcf.entity.THyxcHdxcFxwt;
import com.htcf.entity.ThyxcHdxcXcjhEntity;
import com.htcf.service.IPatorlReportService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;

/**
 * 巡查上报
 * @author yinying
 *
 */
@Service(value = "patorlReportService")
public class PatorlReportServiceImpl implements IPatorlReportService{
	@Autowired
	private IPatorlReportDao patorlReportDao;

	
	/**
	 * 
	Description :巡查上报:查询
	@param:@param patorlSearchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:01:19
	 */
	@Operate(description="巡查上报:查询")
	public List<?> fetchPatorlReportList(PatorlSearchForm patorlSearchForm,PageBean pageBean){
		return patorlReportDao.fetchPatorlReportList(patorlSearchForm, pageBean);
	}
	
	/**
	 * 
	Description :保存实体
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午07:14:00
	 */
	@Operate(description="保存实体")
	public void addObject(Object obj){
		patorlReportDao.addObject(obj);
	}
	
	/**
	 * 
	Description :修改实体
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午06:58:37
	 */
	@Operate(description="修改实体")
	public void updateObject(Object obj){
		patorlReportDao.updateObject(obj);
	}
	
	/**
	 * 
	Description :巡查上报:详情
	@param:@param prID
	@param:@return
	@return:THyxcHdxcFxwt
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:01:34
	 */
	@Operate(description="查询巡查上报:详情")
	public THyxcHdxcFxwt fetchReportDetail(String prID){
		return patorlReportDao.fetchReportDetail(prID);
	}
	
	/**
	 * 
	Description :巡查上报:删除
	@param:@param prID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:01:43
	 */
	@Operate(description="巡查上报:删除")
	public void deleteReport(String prID){
		patorlReportDao.deleteReport(prID);
	}
	
	
	/**
	 * 
	Description :巡查信息反馈:查询
	@param:@param patorlSearchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-3-28 下午04:39:42
	 */
	@Operate(description="巡查信息反馈:查询")
	public List<?> fetchPatorlFkList(PatorlSearchForm patorlSearchForm,PageBean pageBean,String xcjhID){
		return patorlReportDao.fetchPatorlFkList(patorlSearchForm, pageBean,xcjhID);
	}
	
	/**
	 * 
	Description :巡查信息反馈：删除
	@param:@param fkID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-3-28 下午04:48:05
	 */
	@Operate(description="巡查信息反馈：删除")
	public void deletePatorlFk(String fkID){
		patorlReportDao.deletePatorlFk(fkID);
	}
	
	/**
	 * 
	Description :巡查信息反馈：详情
	@param:@param fkID
	@param:@return
	@return:THyxcHdxcFkjcxx
	@throws
	@Author：yinying
	@Create 2018-3-28 下午05:07:35
	 */
	@Operate(description="查询巡查信息反馈：详情")
	public THyxcHdxcFkjcxx fetchXcxxfkDeatil(String fkID){
		return patorlReportDao.fetchXcxxfkDeatil(fkID);
	}
	
	/**
	 * 
	Description :巡查信息反馈：附件
	@param:@param fkID
	@param:@param xcjhID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-3-28 下午05:15:55
	 */
	@Operate(description="查询巡查信息反馈：附件")
	public List<?> fetchXcxxfkfj(String fkID,String xcjhID){
		return patorlReportDao.fetchXcxxfkfj(fkID, xcjhID);
	}
	
	/**
	 * 
	Description :反馈附件：详情
	@param:@param fkfjID
	@param:@return
	@return:THyxcHdxcFkfj
	@throws
	@Author：yinying
	@Create 2018-3-28 下午05:25:52
	 */
	@Operate(description="查询反馈附件：详情")
	public THyxcHdxcFkfj fetchXcxxfkfjDeatil(String fkfjID){
		return patorlReportDao.fetchXcxxfkfjDeatil(fkfjID);
	}
	
	/**
	 * 
	Description :删除反馈附件
	@param:@param fkID
	@param:@param xcjhID
	@param:@param fkfjID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-3-28 下午05:31:54
	 */
	@Operate(description="删除反馈附件")
	public void deleteFkfj(String fkID,String xcjhID,String fkfjID){
		patorlReportDao.deleteFkfj(fkID, xcjhID, fkfjID);
	}
	
	/**
	 * 
	Description :巡查计划
	@param:@param patorlSearchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-4-2 下午04:34:06
	 */
	@Operate(description="查询巡查计划")
	public List<?> fetchPatorlJhList(PatorlSearchForm patorlSearchForm,PageBean pageBean){
		return patorlReportDao.fetchPatorlJhList(patorlSearchForm, pageBean);
	}
	
	
	/**
	 * 
	Description :查出主键
	@param:@param xcjhID
	@param:@param dqsj
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-4-4 下午03:41:49
	 */
	@Operate(description="查出反馈信息主键")
	public String fetchFkxxId(String xcjhID,String dqsj){
		return patorlReportDao.fetchFkxxId(xcjhID, dqsj);
	}
	
	/**
	 * 
	Description :更改计划状态
	@param:@param xcjhID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-4-23 下午03:04:29
	 */
	@Operate(description="更改巡查计划状态")
	public void updateXcjhZt(String xcjhID){
		patorlReportDao.updateXcjhZt(xcjhID);
	}
	
	/**
	 * 
	Description :巡查计划
	@param:@param patorlSearchForm
	@param:@param pageBean
	@param:@param userName
	@param:@param userRoleName
	@param:@return
	@return:List<ThyxcHdxcXcjhEntity>
	@throws
	@Author：yinying
	@Create 2018-4-23 下午03:11:48
	 */
	public List<ThyxcHdxcXcjhEntity> fetchChxcList(PatorlSearchForm patorlSearchForm,
            PageBean pageBean,
            String userName,
            String userRoleName){
		return patorlReportDao.fetchChxcList(patorlSearchForm, pageBean, userName, userRoleName);
	}
	
	
	
	
	
	
	public IPatorlReportDao getPatorlReportDao() {
		return patorlReportDao;
	}

	public void setPatorlReportDao(IPatorlReportDao patorlReportDao) {
		this.patorlReportDao = patorlReportDao;
	}
	
	
}
