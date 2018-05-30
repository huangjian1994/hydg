package com.htcf.dao;

import java.util.List;

import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtHaxDctj;
import com.htcf.entity.THysyywHysydtHaxGhxx;
import com.htcf.entity.THysyywHysydtHaxJcxx;
import com.htcf.entity.THysyywHysydtHaxJsjc;
import com.htcf.entity.THysyywHysydtHaxZzxf;
import com.htcf.util.PageBean;
/**
 * 海岸线管理
 * 
 * 海岸线基础信息管理、海岸线动态监视监测管理、海岸线调查统计
 * @author zxf
 *
 *海岸线规划信息管理
 *@author yinying
 *
 */
public interface DgIffDao {
	public List<?> getHaxJcxxList1(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx, PageBean pageBean);
	public List<THysyywHysydtHaxJcxx> getHaxJcxxList(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx, PageBean pageBean);
	
	public boolean saveHaxInfoByHax(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx);
	
	public List<?> getHaxJcxxListByEntity(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx, PageBean pageBean);
	
	public THysyywHysydtHaxJcxx getHaxJcxxInfoById(String id);
	
	public void saveUpdateHaxInfo(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx);
	
	public void deleteHaxInfoById(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx);
	
	public List<THysyywHysydtHaxJsjc> getJsjcListByIdOrNull(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc, PageBean pageBean);
	
	public void saveJsjcInfo(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc);
	
	public THysyywHysydtHaxJsjc getJsjcInfoById(String id);
	
	public void saveUpdateJsjcInfo(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc);
	
	public void deleteJsjcInfoById(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc);
	
	public List<THysyywHysydtHaxJsjc> getHaxJsjcListByEntity(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc, PageBean pageBean);
	
	public List<?> getDctjListByIdOrNull(THysyywHysydtHaxDctj thysyywHysydtHaxDctj, PageBean pageBean);
	
	public List<?> getDictionaryListByKey(String key);
	
	public void saveDctjInfo(THysyywHysydtHaxDctj thysyywHysydtHaxDctj);
	
	public THysyywHysydtHaxDctj getDctjById(String id);
	
	public void saveUpdateDctjInfo(THysyywHysydtHaxDctj thysyywHysydtHaxDctj);
	
	public void deleteDctjInfoById(THysyywHysydtHaxDctj thysyywHysydtHaxDctj);
	
	public List<?> getHaxDctjListByEntity(THysyywHysydtHaxDctj thysyywHysydtHaxDctj, PageBean pageBean);
	
	/********海岸线规划信息管理******开始************/
	
	/**
	 * 
	Description :规划信息列表
	@param:@param searchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:02:01
	 */
	public List<?> fetchHaxGhxxList(SearchForm searchForm, PageBean pageBean);
	
	/**
	 * 
	Description :规划信息详情
	@param:@param ghID
	@param:@return
	@return:THysyywHysydtHaxGhxx
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:01:55
	 */
	public THysyywHysydtHaxGhxx fetchHaxGhxxDetail(String ghID);
	
	/**
	 * 
	Description :删除规划信息
	@param:@param ghID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:03:06
	 */
	public void deleteHaxGhxx(String ghID);
	
	/**
	 * 
	Description :整治修复列表
	@param:@param searchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-13 上午11:22:58
	 */
	public List<?> fetchHaxZzxfList(SearchForm searchForm, PageBean pageBean);
	
	/**
	 * 
	Description :整治修复详情
	@param:@param ghID
	@param:@return
	@return:THysyywHysydtHaxZzxf
	@throws
	@Author：yinying
	@Create 2017-11-13 上午11:27:34
	 */
	public THysyywHysydtHaxZzxf fetchHaxZzxfDetail(String zzID);
	
	/**
	 * 
	Description :删除整治修复
	@param:@param zzID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-11-13 上午11:28:27
	 */
	public void deleteHaxZzxf(String zzID);
	
	
	
}
