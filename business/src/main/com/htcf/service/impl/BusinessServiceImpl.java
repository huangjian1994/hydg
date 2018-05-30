package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.IBusinessDao;
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
import com.htcf.service.IBusinessService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;
/**
 * 海域动态管理——用海项目信息管理、用海项目批后监管
 * @author yinying
 *
 */
@Service(value = "businessService")
public class BusinessServiceImpl implements IBusinessService{
	@Autowired
	private IBusinessDao businessDao;

	/**
	 * 
	Description :用海项目信息列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午06:34:48
	 */
	@Operate(description="查询用海项目信息列表")
	public List<?> fetchYhxmList(PageBean pageBean,THysyywHysydtYhxm hysyywHysydtYhxm,String userId,String userRoleName){
		return businessDao.fetchYhxmList(pageBean, hysyywHysydtYhxm,userId,userRoleName);
	}
	
	/**
	 * 
	Description :项目信息详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:31:26
	 */
	@Operate(description="查询项目信息详情")
	public THysyywHysydtYhxm fetchYhxmDetail(String xmID){
		return businessDao.fetchYhxmDetail(xmID);
	}
	@Operate(description="查询项目信息详情")
	public List<?> fetchYhxmDetailJson(String xmID){
		return businessDao.fetchYhxmDetailJson(xmID);
	}
	/**
	 * 
	Description :项目信息删除
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:32:45
	 */
	@Operate(description="删除项目信息")
	public void deleteYhxm(String xmID){
		businessDao.deleteYhxm(xmID);
	}
	
	/**
	 * 
	Description :项目信息修改
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:33:30
	 */
	@Operate(description="修改项目信息")
	public void updateYhxm(THysyywHysydtYhxm hysyywHysydtYhxm){
		businessDao.updateYhxm(hysyywHysydtYhxm);
	}
	
	/**
	 * 
	Description :用海项目-项目附件详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 上午10:26:47
	 */
	@Operate(description="查询用海项目-项目附件详情")
	public List<?> fetchYhxmXmfj(String xmID,String zsID){
//		return businessDao.fetchYhxmXmfj(xmID,zsID);
		return businessDao.fetchYhxmXmfj2(xmID,zsID);
	}

	
	/**
	 * 
	Description :证书信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 上午10:57:35
	 */
	@Operate(description="查询证书信息")
	public List<?> fetchYhxmZsxx(String xmID){
		return businessDao.fetchYhxmZsxx(xmID);
	}

	/**
	 * 
	Description :证书信息详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 下午02:55:38
	 */
	@Operate(description="查询证书信息详情")
	public THysyywHysydtYhxmZhxx fetchYhxmZsxxDetail(String xmID,String zsID){
		return businessDao.fetchYhxmZsxxDetail(xmID, zsID);
	}
	
	/**
	 * 
	Description :用海方式列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午02:08:30
	 */
	@Operate(description="查询用海方式列表")
	public List<?> fetchYhxmYhfs(String xmID,String zsID){
		return businessDao.fetchYhxmYhfs(xmID, zsID);
	}
	
	
	/**
	 * 
	Description :用海方式详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 下午03:23:51
	 */
	@Operate(description="查询用海方式详情")
	public THysyywHysydtYhxmYhfs fetchYhxmYhfsDetail(String xmID,String zsID,String yhfsID){
		return businessDao.fetchYhxmYhfsDetail(xmID, zsID,yhfsID);
	}
	
	/**
	 * 
	Description :用海方式 界址点坐标
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午04:13:59
	 */
	@Operate(description="查询用海方式 界址点坐标")
	public List<?> fetchYhxmYhfsJzdzb(String xmID,String zsID){
		return businessDao.fetchYhxmYhfsJzdzb(xmID, zsID);
	}
	
	/**
	 * 
	Description :海域使用金列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午02:08:30
	 */
	@Operate(description="查询海域使用金列表")
	public List<?> fetchYhxmHysyj(String xmID,String zsID){
		return businessDao.fetchYhxmHysyj(xmID, zsID);
	}
	
	/**
	 * 
	Description :海域使用金详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午02:13:45
	 */
	@Operate(description="查询海域使用金详情")
	public THysyywHysydtYhxmHysyj fetchYhxmHysyjDetail(String xmID,String zsID,String hysyjID){
		return businessDao.fetchYhxmHysyjDetail(xmID, zsID, hysyjID);
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
		businessDao.addObject(obj);
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
		businessDao.updateObject(obj);
	}
	/**
	 * 
	Description :保存时查出用海项目ID
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午07:22:28
	 */
	@Operate(description="保存时查出用海项目ID")
	public String fetchYhxmID(String tablename,String xzsj,String userid){
		return businessDao.fetchYhxmID(tablename,xzsj, userid);
	}
	
	/**
	 * 
	Description :删除附件
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午04:48:21
	 */
	@Operate(description="删除附件")
	public void deleteYhxmFj(String xmfjID){
		businessDao.deleteYhxmFj(xmfjID);
	}
	
	/**
	 * 
	Description :删除证书
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午08:21:31
	 */
	@Operate(description="删除证书")
	public void deleteYhxmZhxx(String zsID){
		businessDao.deleteYhxmZhxx(zsID);
	}
	
	/**
	 * 
	Description :删除用海方式
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午05:22:05
	 */
	@Operate(description="删除用海方式")
	public void deleteYhxmYhfs(String yhfsID){
		businessDao.deleteYhxmYhfs(yhfsID);
	}
	
	/**
	 * 
	Description :删除界址点
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午07:45:15
	 */
	@Operate(description="删除界址点")
	public void deleteYhxmJzdzb(String jzdID){
		businessDao.deleteYhxmJzdzb(jzdID);
	}
	
	/**
	 * 
	Description :删除界址点-所有
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午07:45:15
	 */
	@Operate(description="删除界址点-所有")
	public void deleteYhxmJzdzb(String xmID,String zsID){
		businessDao.deleteYhxmJzdzb(xmID,zsID);
	}
	
	/**
	 * 
	Description :删除海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:29:38
	 */
	@Operate(description="删除海域使用金")
	public void deleteYhxmHysyj(String hysyjID){
		businessDao.deleteYhxmHysyj(hysyjID);
	}
	
	/**
	 * 
	Description :查出代码表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午06:53:14
	 */
	@Operate(description="查出代码表")
	public List<?> fetchDictionary(String dmlx,String tjz){
		return  businessDao.fetchDictionary(dmlx,tjz);
	}
	
	/**
	 * 
	Description :宗海图
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午04:33:26
	 */
	@Operate(description="查询宗海图")
	public List<?> fetchYhxmZht(String xmID,String zsID){
		return  businessDao.fetchYhxmZht(xmID, zsID);
	}
	/**
	 * 
	Description :宗海图详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午05:12:36
	 */
	@Operate(description="查询宗海图详情")
	public THysyywHysydtYhxmZht fetchYhxmZhtDetail(String zhtID){
		return  businessDao.fetchYhxmZhtDetail(zhtID);
	}
	/**
	 * 
	Description :申请材料
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午04:33:12
	 */
	@Operate(description="查出申请材料")
	public List<?> fetchYhxmSqcl(String xmID,String zsID){
		return  businessDao.fetchYhxmSqcl(xmID, zsID);
	}
	
	/**
	 * 
	Description :查出项目信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:55:43
	 */
	@Operate(description="查出项目信息")
	public List<?> fetchXmxx(PageBean pageBean,THysyywHysydtYhxmForm hysyywHysydtYhxmForm,String userId,String userRoleName){
		return  businessDao.fetchXmxx(pageBean, hysyywHysydtYhxmForm,userId, userRoleName);
	}
	
	/**
	 * 
	Description :用海项目动态管理
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:37:37
	 */
	@Operate(description="查出用海项目动态管理")
	public List<?> fetchYhxmdtglList(PageBean pageBean,THysyywHysydtYhxmphjgDtForm hysyywHysydtYhxmphjgDtForm ,String jgsf,String xmID,String tj){
		return  businessDao.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,jgsf,xmID,tj);
	}
	
	/**
	 * 
	Description :删除动态管理
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:39:46
	 */
	@Operate(description="删除动态管理")
	public void deleteYhxmdtgl(String xmID,String dtglID){
		businessDao.deleteYhxmdtgl(xmID,dtglID);
	}
	
	/**
	 * 
	Description :动态管理详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:41:03
	 */
	@Operate(description="查出动态管理详情")
	public THysyywHysydtYhxmphjgDt fetchYhxmdtglDetail(String xmID,String dtglID){
		return  businessDao.fetchYhxmdtglDetail(xmID, dtglID);
	}
	
	/**
	 * 
	Description :选择项目名称
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午02:26:05
	 */
	@Operate(description="查出可选择的项目名称")
	public List<?> fetchXmmc(String userId,String userRoleName){
		return  businessDao.fetchXmmc(userId, userRoleName);
	}
	
	/**
	 * 
	Description :删除宗海图
	@param:@param zhtID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-10-21 下午05:12:36
	 */
	@Operate(description="删除宗海图")
	public void deleteZht(String zhtID){
		businessDao.deleteZht(zhtID);
	}
	
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
	@Operate(description="用海项目变化预警：查出所有的用海项目")
	public List<?> fetchXmxxYj(PageBean pageBean,THysyywHysydtYhxmForm hysyywHysydtYhxmForm){
		return businessDao.fetchXmxxYj(pageBean, hysyywHysydtYhxmForm);
	}
	
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
	@Operate(description="查询用海项目变化预警：项目改变数")
	public List<?> fetchXmxxYj2(PageBean pageBean,THysyywHysydtYhxmForm hysyywHysydtYhxmForm,String userId,String userRoleName){
		return businessDao.fetchXmxxYj2(pageBean, hysyywHysydtYhxmForm,userId, userRoleName);
	}
	
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
	@Operate(description="查出监管预警数")
	public int fetchJggbCount(String todayDate){
		return businessDao.fetchJggbCount(todayDate);
	}
	
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
	@Operate(description="查询预警信息详情")
	public THysyywHysydtYhxmphjgYj fetchYjxxDetail(String bhyjID){
		return businessDao.fetchYjxxDetail(bhyjID);
	}
	
	/**
	 * 
	Description :删除预警信息
	@param:@param bhyjID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-10-28 下午04:16:02
	 */
	@Operate(description="删除预警信息")
	public void deleteYjxx(String bhyjID){
		businessDao.deleteYjxx(bhyjID);
	}
	
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
	@Operate(description="查出宗海信息-项目信息")
	public List<?> fetchXmxx(String xmID){
		return businessDao.fetchXmxx(xmID);
	}
	
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
	@Operate(description="查出项目数量")
	public int fetchXmzsCount(String xmID){
		return businessDao.fetchXmzsCount(xmID);
	}
	
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
	@Operate(description="查出海域管理号")
	public List<?> fetchHyglh(String userId,String userRoleName,String xmID){
		return businessDao.fetchHyglh(userId, userRoleName, xmID);
	}
	
	
	/**
	 * 
	Description :删除该监测任务下的所有界址点
	@param:@param dtglID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-1 下午04:45:09
	 */
	@Operate(description="删除该监测任务下的所有界址点")
	public void deleteJgxxJzdzb(String dtglID){
		businessDao.deleteJgxxJzdzb(dtglID);
	}
	
	/**
	 * 
	Description :删除监测任务下的一个界址点
	@param:@param jzdID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-1 下午04:45:25
	 */
	@Operate(description="删除监测任务下的一个界址点")
	public void deleteJgxxJzdzbById(String jzdID){
		businessDao.deleteJgxxJzdzbById(jzdID);
	}
	
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
	@Operate(description="查出监测任务界址点列表")
	public List<?> fetchJgxxJzdzb(String dtglID){
		return businessDao.fetchJgxxJzdzb(dtglID);
	}
	
	
	/**
	 * 
	Description :删除监管信息附件
	@param:@param dtglFjID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-4 下午03:54:47
	 */
	@Operate(description="删除监管信息附件")
	public void deleteJgxxFj(String dtglFjID){
		businessDao.deleteJgxxFj(dtglFjID);
	}
	
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
	@Operate(description="查询监管信息附件")
	public List<?> fetchJgxxFj(String dtglID){
		return businessDao.fetchJgxxFj(dtglID);
	}
	
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
	@Operate(description="查询监管信息-附件详情")
	public THysyywHysydtYhxmphjgDtfj fetchJgxxFjDetail(String dtglFjID){
		return businessDao.fetchJgxxFjDetail(dtglFjID);
	}
	
	/**
	 * 
	Description :保存List
	@param:@param dataList
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-22 下午04:43:19
	 */
	@Operate(description="保存List实体")
	public void addDataList(List<Object> dataList){
		businessDao.addDataList(dataList);
	}
	
	
	/**
	 * 
	Description :用海方式 界址点坐标-所有
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-2-2 下午03:30:54
	 */
	@Operate(description="查出用海方式 界址点坐标-所有")
	public List<?> fetchYhxmJzdzb(){
		return businessDao.fetchYhxmJzdzb();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	public IBusinessDao getBusinessDao() {
		return businessDao;
	}

	public void setBusinessDao(IBusinessDao businessDao) {
		this.businessDao = businessDao;
	}
	
	
}
