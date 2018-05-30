package com.htcf.service;

import java.util.List;

import com.htcf.entity.PatorlSearchForm;
import com.htcf.entity.THyxcHdxcFkfj;
import com.htcf.entity.THyxcHdxcFkjcxx;
import com.htcf.entity.THyxcHdxcFxwt;
import com.htcf.entity.ThyxcHdxcXcjhEntity;
import com.htcf.util.PageBean;

/**
 * 巡查上报
 * @author yinying
 *
 */
public interface IPatorlReportService {
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
	public List<?> fetchPatorlReportList(PatorlSearchForm patorlSearchForm, PageBean pageBean);
	
	/**
	 * 
	Description :保存实体
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午07:14:00
	 */
	public void addObject(Object obj);
	
	/**
	 * 
	Description :修改实体
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午06:58:37
	 */
	public void updateObject(Object obj);
	
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
	public THyxcHdxcFxwt fetchReportDetail(String prID);
	
	/**
	 * 
	Description :巡查上报:删除
	@param:@param prID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:01:43
	 */
	public void deleteReport(String prID);
	
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
	public List<?> fetchPatorlFkList(PatorlSearchForm patorlSearchForm, PageBean pageBean, String xcjhID);
	
	/**
	 * 
	Description :巡查信息反馈：删除
	@param:@param fkID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-3-28 下午04:48:05
	 */
	public void deletePatorlFk(String fkID);
	
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
	public THyxcHdxcFkjcxx fetchXcxxfkDeatil(String fkID);
	
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
	public List<?> fetchXcxxfkfj(String fkID, String xcjhID);
	
	
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
	public THyxcHdxcFkfj fetchXcxxfkfjDeatil(String fkfjID);
	
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
	public void deleteFkfj(String fkID, String xcjhID, String fkfjID);
	
	
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
	public List<?> fetchPatorlJhList(PatorlSearchForm patorlSearchForm, PageBean pageBean);
	
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
	public String fetchFkxxId(String xcjhID, String dqsj);
	
	/**
	 * 
	Description :更改计划状态
	@param:@param xcjhID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-4-23 下午03:04:29
	 */
	public void updateXcjhZt(String xcjhID);
	
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
                                                   String userRoleName);
	
	
	
	
	
	
	
}
