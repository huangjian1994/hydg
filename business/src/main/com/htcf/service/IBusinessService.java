package com.htcf.service;

import java.util.List;

import com.htcf.entity.THysyywHysydtYhxm;
import com.htcf.entity.THysyywHysydtYhxmForm;
import com.htcf.entity.THysyywHysydtYhxmHysyj;
import com.htcf.entity.THysyywHysydtYhxmYhfs;
import com.htcf.entity.THysyywHysydtYhxmZht;
import com.htcf.entity.THysyywHysydtYhxmZhxx;
import com.htcf.entity.THysyywHysydtYhxmphjgDt;
import com.htcf.entity.THysyywHysydtYhxmphjgDtForm;
import com.htcf.entity.THysyywHysydtYhxmphjgDtfj;
import com.htcf.entity.THysyywHysydtYhxmphjgYj;
import com.htcf.util.PageBean;
/**
 * 海域动态管理——用海项目信息管理、用海项目批后监管
 * @author yinying
 *
 */
public interface IBusinessService {

	/**
	 * 
	Description :用海项目信息列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午06:34:48
	 */
	public List<?> fetchYhxmList(PageBean pageBean, THysyywHysydtYhxm hysyywHysydtYhxm, String userId, String userRoleName);
	
	/**
	 * 
	Description :项目信息详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:31:26
	 */
	public THysyywHysydtYhxm fetchYhxmDetail(String xmID);
	public List<?> fetchYhxmDetailJson(String xmID);
	/**
	 * 
	Description :项目信息删除
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:32:45
	 */
	public void deleteYhxm(String xmID);
	
	/**
	 * 
	Description :项目信息修改
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:33:30
	 */
	public void updateYhxm(THysyywHysydtYhxm hysyywHysydtYhxm);
	
	
	/**
	 * 
	Description :用海项目-项目附件详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 上午10:26:47
	 */
	public List<?> fetchYhxmXmfj(String xmID, String zsID);
	
	
	/**
	 * 
	Description :证书信息列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 上午10:57:35
	 */
	public List<?> fetchYhxmZsxx(String xmID);
	
	/**
	 * 
	Description :证书信息详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 下午02:55:38
	 */
	public THysyywHysydtYhxmZhxx fetchYhxmZsxxDetail(String xmID, String zsID);
	
	/**
	 * 
	Description :用海方式列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午02:08:30
	 */
	public List<?> fetchYhxmYhfs(String xmID, String zsID);
	
	/**
	 * 
	Description :用海方式详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 下午03:23:51
	 */
	public THysyywHysydtYhxmYhfs fetchYhxmYhfsDetail(String xmID, String zsID, String yhfsID);
	
	/**
	 * 
	Description :用海方式 界址点坐标
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午04:13:59
	 */
	public List<?> fetchYhxmYhfsJzdzb(String xmID, String zsID);
	
	/**
	 * 
	Description :海域使用金列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午02:08:30
	 */
	public List<?> fetchYhxmHysyj(String xmID, String zsID);
	
	/**
	 * 
	Description :海域使用金详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午02:13:45
	 */
	public THysyywHysydtYhxmHysyj fetchYhxmHysyjDetail(String xmID, String zsID, String hysyjID);
	
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
	Description :保存时查出用海项目ID
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午07:22:28
	 */
	public String fetchYhxmID(String tablename, String xzsj, String userid);
	
	/**
	 * 
	Description :删除附件
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午04:48:21
	 */
	public void deleteYhxmFj(String xmfjID);
	
	/**
	 * 
	Description :删除证书
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午08:21:31
	 */
	public void deleteYhxmZhxx(String zsID);
	
	/**
	 * 
	Description :删除用海方式
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午05:22:05
	 */
	public void deleteYhxmYhfs(String yhfsID);
	
	/**
	 * 
	Description :删除界址点
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午07:45:15
	 */
	public void deleteYhxmJzdzb(String jzdID);
	
	/**
	 * 
	Description :删除界址点-所有
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午07:45:15
	 */
	public void deleteYhxmJzdzb(String xmID, String zsID);
	
	/**
	 * 
	Description :删除海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:29:38
	 */
	public void deleteYhxmHysyj(String hysyjID);
	
	/**
	 * 
	Description :查出代码表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午06:53:14
	 */
	public List<?> fetchDictionary(String dmlx, String tjz);
	
	/**
	 * 
	Description :宗海图
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午04:33:26
	 */
	public List<?> fetchYhxmZht(String xmID, String zsID);
	/**
	 * 
	Description :宗海图详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午05:12:36
	 */
	public THysyywHysydtYhxmZht fetchYhxmZhtDetail(String zhtID);
	/**
	 * 
	Description :申请材料
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午04:33:12
	 */
	public List<?> fetchYhxmSqcl(String xmID, String zsID);
	
	/**
	 * 
	Description :查出项目信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:55:43
	 */
	public List<?> fetchXmxx(PageBean pageBean, THysyywHysydtYhxmForm hysyywHysydtYhxmForm, String userId, String userRoleName);
	
	/**
	 * 
	Description :用海项目动态管理
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:37:37
	 */
	public List<?> fetchYhxmdtglList(PageBean pageBean, THysyywHysydtYhxmphjgDtForm hysyywHysydtYhxmphjgDtForm, String jgsf, String xmID, String tj);
	
	/**
	 * 
	Description :删除动态管理
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:39:46
	 */
	public void deleteYhxmdtgl(String xmID, String dtglID);
	
	/**
	 * 
	Description :动态管理详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:41:03
	 */
	public THysyywHysydtYhxmphjgDt fetchYhxmdtglDetail(String xmID, String dtglID);
	
	/**
	 * 
	Description :选择项目名称
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午02:26:05
	 */
	public List<?> fetchXmmc(String userId, String userRoleName);
	
	/**
	 * 
	Description :删除宗海图
	@param:@param zhtID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-10-21 下午05:12:36
	 */
	public void deleteZht(String zhtID);
	
	/**
	 * 
	Description :用海项目变化预警：查出所有的用海项目
	@param:@param pageBean
	@param:@param hysyywHysydtYhxmForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-27 下午03:41:31
	 */
	public List<?> fetchXmxxYj(PageBean pageBean, THysyywHysydtYhxmForm hysyywHysydtYhxmForm);
	
	/**
	 * 
	Description :用海项目变化预警：项目改变数
	@param:@param pageBean
	@param:@param hysyywHysydtYhxmForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-28 下午01:18:42
	 */
	public List<?> fetchXmxxYj2(PageBean pageBean, THysyywHysydtYhxmForm hysyywHysydtYhxmForm, String userId, String userRoleName);
	
	/**
	 * 
	Description :查出监管预警数
	@param:@param todayDate
	@param:@return
	@return:int
	@throws
	@Author：yinying
	@Create 2017-10-28 下午03:12:57
	 */
	public int fetchJggbCount(String todayDate);
	
	/**
	 * 
	Description :预警信息详情
	@param:@param bhyjID
	@param:@return
	@return:THysyywHysydtYhxmphjgYj
	@throws
	@Author：yinying
	@Create 2017-10-28 下午04:14:47
	 */
	public THysyywHysydtYhxmphjgYj fetchYjxxDetail(String bhyjID);
	
	/**
	 * 
	Description :删除预警信息
	@param:@param bhyjID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-10-28 下午04:16:02
	 */
	public void deleteYjxx(String bhyjID);
	
	
	/**
	 * 
	Description :宗海信息-项目信息
	@param:@param xmID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-30 下午06:58:56
	 */
	public List<?> fetchXmxx(String xmID);
	
	/**
	 * 
	Description :查出项目数量
	@param:@param xmID
	@param:@return
	@return:int
	@throws
	@Author：yinying
	@Create 2017-10-30 下午07:14:53
	 */
	public int fetchXmzsCount(String xmID);
	
	/**
	 * 
	Description :查出海域管理号
	@param:@param userId
	@param:@param userRoleName
	@param:@param xmID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-1 下午04:14:57
	 */
	public List<?> fetchHyglh(String userId, String userRoleName, String xmID);
	
	/**
	 * 
	Description :删除该监测任务下的所有界址点
	@param:@param dtglID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-1 下午04:45:09
	 */
	public void deleteJgxxJzdzb(String dtglID);
	
	/**
	 * 
	Description :删除监测任务下的一个界址点
	@param:@param jzdID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-1 下午04:45:25
	 */
	public void deleteJgxxJzdzbById(String jzdID);
	
	/**
	 * 
	Description :查出监测任务界址点列表
	@param:@param dtglID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-12-1 下午04:51:21
	 */
	public List<?> fetchJgxxJzdzb(String dtglID);
	
	/**
	 * 
	Description :删除监管信息附件
	@param:@param dtglFjID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-4 下午03:54:47
	 */
	public void deleteJgxxFj(String dtglFjID);
	
	/**
	 * 
	Description :监管信息附件
	@param:@param dtglID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-12-4 下午04:09:55
	 */
	public List<?> fetchJgxxFj(String dtglID);
	
	/**
	 * 
	Description :监管信息-附件详情
	@param:@param dtglFjID
	@param:@return
	@return:THysyywHysydtYhxmphjgDtfj
	@throws
	@Author：yinying
	@Create 2017-12-4 下午05:58:51
	 */
	public THysyywHysydtYhxmphjgDtfj fetchJgxxFjDetail(String dtglFjID);
	
	/**
	 * 
	Description :保存List
	@param:@param dataList
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-22 下午04:43:19
	 */
	public void addDataList(List<Object> dataList);
	
	/**
	 * 
	Description :用海方式 界址点坐标-所有
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-2-2 下午03:30:54
	 */
	public List<?> fetchYhxmJzdzb();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
