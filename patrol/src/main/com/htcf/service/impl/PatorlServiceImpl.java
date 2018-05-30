package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.IPatrolDao;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THyxcXckpDwkh;
import com.htcf.entity.THyxcXckpRykh;
import com.htcf.service.IPatrolService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;
/**
 * 巡查考评管理
 * @author yinying
 *
 */
@Service(value = "patrolService")
public class PatorlServiceImpl implements IPatrolService{
	@Autowired
	private IPatrolDao patorlDao;

	/**
	 * 
	Description :单位考核查询列表
	@param:@param searchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-12-8 下午03:52:42
	 */
	@Operate(description="查询单位考核查询列表")
	public List<?> fetchDwkhList(SearchForm searchForm,PageBean pageBean,String pxlx){
		return patorlDao.fetchDwkhList(searchForm, pageBean,pxlx);
	}
	
	/**
	 * 
	Description :删除单位考核记录
	@param:@param dwkhID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-8 下午03:54:57
	 */
	@Operate(description="删除单位考核记录")
	public void deleteDwkh(String dwkhID){
		patorlDao.deleteDwkh(dwkhID);
	}
	
	/**
	 * 
	Description :单位考核详情
	@param:@param dwkhID
	@param:@return
	@return:THyxcXckpDwkh
	@throws
	@Author：yinying
	@Create 2017-12-8 下午04:00:35
	 */
	@Operate(description="查询单位考核详情")
	public THyxcXckpDwkh fetchDwkhDetail(String dwkhID){
		return patorlDao.fetchDwkhDetail(dwkhID);
	}
	
	/**
	 * 
	Description :单位考核统计
	@param:@param searchForm
	@param:@param tjlx
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-12-8 下午07:13:14
	 */
	@Operate(description="查询单位考核统计")
	public List<?> fetchDwkhTj(SearchForm searchForm,String tjlx){
		return patorlDao.fetchDwkhTj(searchForm, tjlx);
	}
	
	/**
	 * 
	Description :巡查考核-人员考核
	@param:@param searchForm
	@param:@param pageBean
	@param:@param pxlx
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-4 下午05:50:33
	 */
	@Operate(description="查询巡查考核-人员考核")
	public List<?> fetchXckhRykh(SearchForm searchForm,PageBean pageBean,String pxlx){
		return patorlDao.fetchXckhRykh(searchForm, pageBean, pxlx);
	}
	
	/**
	 * 
	Description :删除人员考核
	@param:@param rykhID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-4 下午05:51:45
	 */
	@Operate(description="删除人员考核")
	public boolean deleteRykh(String rykhID){
		return patorlDao.deleteRykh(rykhID);
	}
	
	/**
	 * 
	Description :人员考核详情
	@param:@param rykhID
	@param:@return
	@return:THyxcXckpRykh
	@throws
	@Author：yinying
	@Create 2018-1-4 下午05:51:57
	 */
	@Operate(description="查询人员考核详情")
	public THyxcXckpRykh fetchRykhDetail(String rykhID){
		return patorlDao.fetchRykhDetail(rykhID);
	}
	
	/**
	 * 
	Description :人员考核统计
	@param:@param searchForm
	@param:@param tjlx
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-5 下午06:53:38
	 */
	@Operate(description="查询人员考核统计")
	public List<?> fetchRykhTj(SearchForm searchForm,String tjlx){
		return patorlDao.fetchRykhTj(searchForm, tjlx);
	}
	
	
	
	
	
	
	
	
	
	
	public IPatrolDao getPatorlDao() {
		return patorlDao;
	}

	public void setPatorlDao(IPatrolDao patorlDao) {
		this.patorlDao = patorlDao;
	}
	
	
}
