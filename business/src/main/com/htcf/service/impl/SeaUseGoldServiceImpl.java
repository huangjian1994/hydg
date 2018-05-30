package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.ISeaUseGoldDao;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtHysyjForm;
import com.htcf.entity.THysyywHysydtYhxm;
import com.htcf.entity.THysyywHysydtYhxmHysyjJntz;
import com.htcf.entity.THysyywHysydtYhxmHysyjZsbz;
import com.htcf.entity.THysyywHysydtYhxmZhxx;
import com.htcf.service.ISeaUseGoldService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;
/**
 * 海域使用金征收管理 T_HYSYYW_HYSYDT_YHXM_HYSYJ
 * @author yinying
 *
 */
@Service(value = "seaUseGoldService")
public class SeaUseGoldServiceImpl implements ISeaUseGoldService{
	@Autowired
	private ISeaUseGoldDao seaUseGoldDao;

	/**
	 * 
	Description :海域使用金列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-14 下午06:47:14
	 */
	@Operate(description="查询海域使用金列表")
	public List<?> fetchHysyjList(THysyywHysydtHysyjForm hysyywHysydtHysyjForm,PageBean pageBean,String userId,String userRoleName){
		return seaUseGoldDao.fetchHysyjList(hysyywHysydtHysyjForm, pageBean,userId, userRoleName);
	}
	
	
	/**
	 * 
	Description :缴纳明细-证书信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-26 下午08:02:41
	 */
	@Operate(description="查询缴纳明细-证书信息")
	public List<?> fetchJnmxZsxx(String xmID,String zsID){
		return seaUseGoldDao.fetchJnmxZsxx(xmID, zsID);
	}
	
	/**
	 * 
	Description :缴纳明细列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-28 下午04:03:17
	 */
	@Operate(description="查询缴纳明细列表")
	public List<?> fetchJnmxList(String xmID,String zsID,String xmmc){
		return seaUseGoldDao.fetchJnmxList(xmID, zsID,xmmc);
	}
	
	/**
	 * 
	Description :临时用海海域使用金缴纳
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 上午10:47:30
	 */
	@Operate(description="查询临时用海海域使用金缴纳")
	public List<?> fetchHysyjList2(THysyywHysydtHysyjForm hysyywHysydtHysyjForm,PageBean pageBean,String userId,String userRoleName){
		return seaUseGoldDao.fetchHysyjList2(hysyywHysydtHysyjForm, pageBean,userId, userRoleName);
	}
	
	/**
	 * 
	Description :海域使用金缴纳记录
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 下午02:58:31
	 */
	@Operate(description="查询海域使用金缴纳记录")
	public List<?> fetchHysyjList3(THysyywHysydtHysyjForm hysyywHysydtHysyjForm,PageBean pageBean,String userId,String userRoleName){
		return seaUseGoldDao.fetchHysyjList3(hysyywHysydtHysyjForm, pageBean,userId, userRoleName);
	}
	
	/**
	 * 
	Description :缴纳证书信息2
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 下午07:42:35
	 */
	@Operate(description="查询缴纳证书信息2")
	public List<?> fetchJnmxZsxx2(String xmID,String zsID,String xmmc){
		return seaUseGoldDao.fetchJnmxZsxx2(xmID, zsID,xmmc);
	}
	
	/**
	 * 
	Description :证书信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-12 上午11:27:59
	 */
	@Operate(description="查询证书信息")
	public THysyywHysydtYhxmZhxx fetchYhxmZsxxDetail(String xmID,String zsID,String zsbh){
		return seaUseGoldDao.fetchYhxmZsxxDetail(xmID, zsID, zsbh);
	}
	
	/**
	 * 
	Description :项目信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-12 上午11:28:59
	 */
	@Operate(description="查询项目信息")
	public THysyywHysydtYhxm fetchYhxmDetail(String xmID,String xmmc){
		return seaUseGoldDao.fetchYhxmDetail(xmID, xmmc);
	}
	
	/**
	 * 
	Description :查出证书列表（缴纳通知）
	@param:@param pageBean
	@param:@param userId
	@param:@param userRoleName
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-31 下午04:55:21
	 */
	@Operate(description="查出证书列表（缴纳通知）")
	public List<?> fetchZhxxList(PageBean pageBean,String userId,String userRoleName,SearchForm searchForm){
		return seaUseGoldDao.fetchZhxxList(pageBean, userId, userRoleName, searchForm);
	}
	
	/**
	 * 
	Description :删除缴纳通知
	@param:@param jntzID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-10-31 下午07:48:40
	 */
	@Operate(description="删除缴纳通知")
	public void deleteJntz(String jntzID){
		seaUseGoldDao.deleteJntz(jntzID);
	}
	
	/**
	 * 
	Description :缴纳通知详情
	@param:@param jntzID
	@param:@return
	@return:THysyywHysydtYhxmHysyjJntz
	@throws
	@Author：yinying
	@Create 2017-10-31 下午07:52:13
	 */
	@Operate(description="查询缴纳通知详情")
	public THysyywHysydtYhxmHysyjJntz fetchJntzDetail(String jntzID){
		return seaUseGoldDao.fetchJntzDetail(jntzID);
	}
	
	/**
	 * 
	Description :缴纳通知记录
	@param:@param pageBean
	@param:@param userId
	@param:@param userRoleName
	@param:@param searchForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-1 上午11:22:09
	 */
	@Operate(description="查询缴纳通知记录")
	public List<?> fetchZhxxList2(PageBean pageBean,String userId,String userRoleName,SearchForm searchForm){
		return seaUseGoldDao.fetchZhxxList2(pageBean, userId, userRoleName, searchForm);
	}
	
	/**
	 * 
	Description :根据项目id、证书ID查缴纳记录
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-1 下午05:10:44
	 */
	@Operate(description="根据项目id、证书ID查缴纳记录")
	public List<?> fetchJntzListByXmid(String xmID,String zsID){
		return seaUseGoldDao.fetchJntzListByXmid(xmID, zsID);
	}
	
	/**
	 * 
	Description :查出项目信息
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-1 下午05:40:55
	 */
	@Operate(description="查出项目信息")
	public List<?> fetchXmxxZhxx(String xmID,String zsID){
		return seaUseGoldDao.fetchXmxxZhxx(xmID, zsID);
	}
	
	/**
	 * 
	Description :逾期未缴纳
	@param:@return
	@return:int
	@throws
	@Author：yinying
	@Create 2017-11-1 下午06:52:16
	 */
	@Operate(description="查询逾期未缴纳")
	public int fetchYjwjn(){
		return seaUseGoldDao.fetchYjwjn();
	}
	
	/**
	 * 
	Description :征收标准列表
	@param:@param pageBean
	@param:@param searchForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-1 下午07:08:39
	 */
	@Operate(description="查询征收标准列表")
	public List<?> fetchHysyjZsbz(PageBean pageBean,SearchForm searchForm){
		return seaUseGoldDao.fetchHysyjZsbz(pageBean, searchForm);
	}
	
	/**
	 * 
	Description :删除征收标准
	@param:@param zsbzID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-11-1 下午07:32:01
	 */
	@Operate(description="删除征收标准")
	public void deleteZsbz(String zsbzID){
		seaUseGoldDao.deleteZsbz(zsbzID);
	}
	
	/**
	 * 
	Description :征收标准详情
	@param:@param zsbzID
	@param:@return
	@return:THysyywHysydtYhxmHysyjZsbz
	@throws
	@Author：yinying
	@Create 2017-11-1 下午07:33:12
	 */
	@Operate(description="查询征收标准详情")
	public THysyywHysydtYhxmHysyjZsbz fetchZsbzDetail(String zsbzID){
		return seaUseGoldDao.fetchZsbzDetail(zsbzID);
	}
	
	
	
	
	public ISeaUseGoldDao getSeaUseGoldDao() {
		return seaUseGoldDao;
	}

	public void setSeaUseGoldDao(ISeaUseGoldDao seaUseGoldDao) {
		this.seaUseGoldDao = seaUseGoldDao;
	}
	
	
}
