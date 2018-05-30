package com.htcf.dao;

import java.util.List;

import com.htcf.entity.SearchForm;
import com.htcf.entity.THyxcXckpDwkh;
import com.htcf.entity.THyxcXckpRykh;
import com.htcf.util.PageBean;
/**
 * 巡查考评管理
 * @author yinying
 *
 */
public interface IPatrolDao {

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
	public List<?> fetchDwkhList(SearchForm searchForm, PageBean pageBean, String pxlx);
	
	/**
	 * 
	Description :删除单位考核记录
	@param:@param dwkhID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-8 下午03:54:57
	 */
	public void deleteDwkh(String dwkhID);
	
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
	public THyxcXckpDwkh fetchDwkhDetail(String dwkhID);
	
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
	public List<?> fetchDwkhTj(SearchForm searchForm, String tjlx);
	
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
	public List<?> fetchXckhRykh(SearchForm searchForm, PageBean pageBean, String pxlx);
	
	/**
	 * 
	Description :删除人员考核
	@param:@param rykhID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-4 下午05:51:45
	 */
	public boolean deleteRykh(String rykhID);
	
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
	public THyxcXckpRykh fetchRykhDetail(String rykhID);
	
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
	public List<?> fetchRykhTj(SearchForm searchForm, String tjlx);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
