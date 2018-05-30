package com.htcf.dao;

import java.util.List;

import com.htcf.entity.THysyywHysydtHykjDmtxx;
import com.htcf.entity.THysyywHysydtHykjHjfa;
import com.htcf.entity.THysyywHysydtHykjSlsj;
import com.htcf.util.PageBean;
/**
 * 海域动态管理——海域勘界管理
 * @author yinying
 *
 */
public interface ISeaDemarcationDao {

	/**
	 * 
	Description :查出多媒体信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 上午11:40:26
	 */
	public List<?> fetchDmtxx(THysyywHysydtHykjDmtxx hYsyywHygnqhHykjDmtxx, PageBean pageBean, String userId, String userRoleName);
	
	/**
	 * 
	Description :删除多媒体信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午04:58:27
	 */
	public void deleteDmtxx(String dmtID);
	
	/**
	 * 
	Description :详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午05:00:56
	 */
	public THysyywHysydtHykjDmtxx fetchDmtxxDetail(String dmtID);
	
	/**
	 * 
	Description :查出矢量数据
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午07:47:44
	 */
	public List<?> fetchSlsj(THysyywHysydtHykjSlsj hysyywHygnqhHykjSlsj, PageBean pageBean, String userId, String userRoleName);
	
	/**
	 * 
	Description :删除矢量数据
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午07:48:19
	 */
	public void deleteSlsj(String slsjID);
	
	/**
	 * 
	Description :详情矢量数据
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午05:00:56
	 */
	public THysyywHysydtHykjSlsj fetchSlsjDetail(String slsjID);
	
	/**
	 * 
	Description :划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午05:22:53
	 */
	public List<?> fetchHjfaList(THysyywHysydtHykjHjfa hysyywHygnqhHykjHjfa, PageBean pageBean);
	
	/**
	 * 
	Description :划界方案详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午05:24:03
	 */
	public THysyywHysydtHykjHjfa fetchHjfaDetail(String hjfaID);
	
	/**
	 * 
	Description :删除划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午05:56:00
	 */
	public void deleteHjfa(String hjfaID);
	
	/**
	 * 
	Description :划界方案统计
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午06:47:54
	 */
	public List<?> fetchHjfaTj();
	
	
	
	
	
	
	
	
	
	
	
	
}
