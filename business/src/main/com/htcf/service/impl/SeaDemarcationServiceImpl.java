package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.ISeaDemarcationDao;
import com.htcf.entity.THysyywHysydtHykjDmtxx;
import com.htcf.entity.THysyywHysydtHykjHjfa;
import com.htcf.entity.THysyywHysydtHykjSlsj;
import com.htcf.service.ISeaDemarcationService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;
/**
 * 海域动态管理——海域勘界管理
 * @author yinying
 *
 */
@Service(value = "seaDemarcationService")
public class SeaDemarcationServiceImpl implements ISeaDemarcationService{
	@Autowired
	private ISeaDemarcationDao seaDemarcationDao;

	/**
	 * 
	Description :查出多媒体信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 上午11:40:26
	 */
	@Operate(description="查出多媒体信息")
	public List<?> fetchDmtxx(THysyywHysydtHykjDmtxx hYsyywHygnqhHykjDmtxx,PageBean pageBean,String userId,String userRoleName){
		return seaDemarcationDao.fetchDmtxx(hYsyywHygnqhHykjDmtxx, pageBean,userId, userRoleName);
	}
	
	/**
	 * 
	Description :删除多媒体信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午04:58:27
	 */
	@Operate(description="删除多媒体信息")
	public void deleteDmtxx(String dmtID){
		seaDemarcationDao.deleteDmtxx(dmtID);
	}
	
	/**
	 * 
	Description :详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午05:00:56
	 */
	@Operate(description="查询多媒体信息详情")
	public THysyywHysydtHykjDmtxx fetchDmtxxDetail(String dmtID){
		return seaDemarcationDao.fetchDmtxxDetail(dmtID);
	}
	
	/**
	 * 
	Description :查出矢量数据
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午07:47:44
	 */
	@Operate(description="查出矢量数据")
	public List<?> fetchSlsj(THysyywHysydtHykjSlsj hysyywHygnqhHykjSlsj,PageBean pageBean,String userId,String userRoleName){
		return seaDemarcationDao.fetchSlsj(hysyywHygnqhHykjSlsj, pageBean,userId, userRoleName);
	}
	
	/**
	 * 
	Description :删除矢量数据
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午07:48:19
	 */
	@Operate(description="删除矢量数据")
	public void deleteSlsj(String slsjID){
		seaDemarcationDao.deleteSlsj(slsjID);
	}
	
	/**
	 * 
	Description :详情矢量数据
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午05:00:56
	 */
	@Operate(description="查询详情矢量数据")
	public THysyywHysydtHykjSlsj fetchSlsjDetail(String slsjID){
		return seaDemarcationDao.fetchSlsjDetail(slsjID);
	}
	
	
	/**
	 * 
	Description :划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午05:22:53
	 */
	@Operate(description="查询划界方案")
	public List<?> fetchHjfaList(THysyywHysydtHykjHjfa hysyywHygnqhHykjHjfa,PageBean pageBean){
		return seaDemarcationDao.fetchHjfaList(hysyywHygnqhHykjHjfa, pageBean);
	}
	
	/**
	 * 
	Description :划界方案详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午05:24:03
	 */
	@Operate(description="查询划界方案详情")
	public THysyywHysydtHykjHjfa fetchHjfaDetail(String hjfaID){
		return seaDemarcationDao.fetchHjfaDetail(hjfaID);
	}
	
	/**
	 * 
	Description :删除划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午05:56:00
	 */
	@Operate(description="删除划界方案")
	public void deleteHjfa(String hjfaID){
		seaDemarcationDao.deleteHjfa(hjfaID);
		
	}
	
	/**
	 * 
	Description :划界方案统计
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午06:47:54
	 */
	@Operate(description="查询划界方案统计")
	public List<?> fetchHjfaTj(){
		return seaDemarcationDao.fetchHjfaTj();
	}
	
	
	
	
	
	
	
	
	
	public ISeaDemarcationDao getSeaDemarcationDao() {
		return seaDemarcationDao;
	}

	public void setSeaDemarcationDao(ISeaDemarcationDao seaDemarcationDao) {
		this.seaDemarcationDao = seaDemarcationDao;
	}
	
	
}
