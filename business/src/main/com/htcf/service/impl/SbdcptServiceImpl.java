package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.ISbdcptDao;
import com.htcf.entity.SbdcptFkbdForm;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtYhxmForm;
import com.htcf.entity.THysyywNwbjkSbdcptFk;
import com.htcf.service.ISbdcptService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;
/**
 * 内外部接口——市不动产平台接口
 * @author yinying
 *
 */
@Service(value = "sbdcptService")
public class SbdcptServiceImpl implements ISbdcptService {
	@Autowired
	private ISbdcptDao sbdcptDao;
	
	/**
	 * 
	Description :项目信息列表
	@param:@param pageBean
	@param:@param hysyywHysydtYhxm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 上午10:43:08
	 */
	@Operate(description="查询项目信息列表")
	public List<?> fetchYhxmList(PageBean pageBean,THysyywHysydtYhxmForm hysyywHysydtYhxmForm){
		return sbdcptDao.fetchYhxmList(pageBean, hysyywHysydtYhxmForm);
	}
	
	/**
	 * 
	Description :查出用海批文信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-18 下午04:37:31
	 */
	@Operate(description="查出用海批文信息")
	public List<?> fetchYhpw(String xmID,String zsID){
		return sbdcptDao.fetchYhpw(xmID,zsID);
	}
	
	
	/**
	 * 
	Description :根据项目ID查出批文编号
	@param:@param xmID
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-18 下午06:58:13
	 */
	@Operate(description="根据项目ID查出批文编号")
	public String fetchPwbhByXmid(String xmID,String zsID){
		return sbdcptDao.fetchPwbhByXmid(xmID,zsID);
	}
	
	/**
	 * 
	Description :查出批文编号+1
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-18 下午06:57:55
	 */
	@Operate(description="查出批文编号+1")
	public String fetchPwbh(){
		return sbdcptDao.fetchPwbh();
	}
	
	/**
	 * 
	Description :新增批文编号
	@param:@param xmID
	@param:@param pwbh
	@return:void
	@throws
	@Author：yinying
	@Create 2017-10-18 下午07:01:43
	 */
	@Operate(description="新增批文编号")
	public void addPwbh(String xmID,String pwbh,String zsID){
		sbdcptDao.addPwbh(xmID, pwbh,zsID);
	}
	
	/**
	 * 
	Description :更新项目状态
	@param:@param xmID
	@param:@param xmzt
	@return:void
	@throws
	@Author：yinying
	@Create 2017-10-18 下午07:26:09
	 */
	@Operate(description="更新项目状态")
	public void updateXmzt(String xmID,String zsID,String xmzt){
		sbdcptDao.updateXmzt(xmID,zsID,xmzt);
	}
	
	/**
	 * 
	Description :宗海信息
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-18 下午08:01:58
	 */
	@Operate(description="查询宗海信息")
	public List<?> fetchZhxx(String xmID,String zsID){
		return sbdcptDao.fetchZhxx(xmID, zsID);
	}

	/**
	 * 
	Description :宗海附图
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 上午11:55:16
	 */
	@Operate(description="查询宗海附图")
	public List<?> fetchZhft(String xmID,String zsID){
		return sbdcptDao.fetchZhft(xmID, zsID);
	}
	
	/**
	 * 
	Description :用海情况
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 下午03:17:10
	 */
	@Operate(description="查询用海情况")
	public List<?> fetchYhqk(String xmID,String zsID){
		return sbdcptDao.fetchYhqk(xmID, zsID);
	}
	
	/**
	 * 
	Description : 海域坐标
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 下午04:55:57
	 */
	@Operate(description="查询海域坐标")
	public List<?> fetchHyzb(String xmID,String zsID){
		return sbdcptDao.fetchHyzb(xmID, zsID);
	}
	
	/**
	 * 
	Description :用海（岛）面域定点顺序表
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 下午04:58:11
	 */
	@Operate(description="查询用海（岛）面域定点顺序表")
	public List<?> fetchYhmyddsxb(String xmID,String zsID){
		return sbdcptDao.fetchYhmyddsxb(xmID, zsID);
	}
	
	/**
	 * 
	Description :海域使用金缴纳情况
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 下午05:46:09
	 */
	@Operate(description="查询海域使用金缴纳情况")
	public List<?> fetchHysyjjnqk(String xmID,String zsID){
		return sbdcptDao.fetchHysyjjnqk(xmID, zsID);
	}
	
	/**
	 * 
	Description :配号表
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 下午07:08:39
	 */
	@Operate(description="查询配号表")
	public List<?> fetchPhb(String xmID,String zsID){
		return sbdcptDao.fetchPhb(xmID, zsID);
	}
	
	/**
	 * 
	Description :删除市不动产平台反馈数据
	@param:@param approvalNum
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-16 下午05:37:06
	 */
	@Operate(description="删除市不动产平台反馈数据")
	public void deleteSbdcptFk(String approvalNum){
		sbdcptDao.deleteSbdcptFk(approvalNum);
	}
	
	/**
	 * 
	Description :查出反馈数据
	@param:@param pageBean
	@param:@param searchForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-16 下午06:04:59
	 */
	@Operate(description="查出反馈数据")
	public List<?> fetchSbdcptFk(PageBean pageBean,SearchForm searchForm){
		return sbdcptDao.fetchSbdcptFk(pageBean, searchForm);
	}
	
	/**
	 * 
	Description :反馈信息详情
	@param:@param fkID
	@param:@return
	@return:THysyywNwbjkSbdcptFk
	@throws
	@Author：yinying
	@Create 2018-1-16 下午06:06:40
	 */
	@Operate(description="查询反馈信息详情")
	public THysyywNwbjkSbdcptFk fetchSbdcptFkDetail(String fkID){
		return sbdcptDao.fetchSbdcptFkDetail(fkID);
	}
	
	/**
	 * 
	Description :查出是否已存在
	@param:@param approvalNum
	@param:@return
	@return:int
	@throws
	@Author：yinying
	@Create 2018-1-18 下午05:07:00
	 */
	@Operate(description="查出是否已存在")
	public int fetchSbdcptFkIs(String approvalNum){
		return sbdcptDao.fetchSbdcptFkIs(approvalNum);
	}
	
	/**
	 * 
	Description :修改反馈信息
	@param:@param approvalNum
	@param:@param hysyywNwbjkSbdcptFk
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-18 下午05:17:06
	 */
	@Operate(description="修改反馈信息")
	public void updateSbdcptFk(String approvalNum,THysyywNwbjkSbdcptFk hysyywNwbjkSbdcptFk){
		sbdcptDao.updateSbdcptFk(approvalNum, hysyywNwbjkSbdcptFk);
	}
	
	/**
	 * 
	Description :查出进行比对
	@param:@param approvalNum
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-19 下午03:38:22
	 */
	@Operate(description="查出进行比对")
	public SbdcptFkbdForm fetchYhxmZhxxBd(String approvalNum){
		return sbdcptDao.fetchYhxmZhxxBd(approvalNum);
	}
	
	/**
	 * 
	Description :更新比对结果-字段
	@param:@param tableName
	@param:@param zdName
	@param:@param zdValue
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:int
	@throws
	@Author：yinying
	@Create 2018-1-19 下午05:54:22
	 */
	@Operate(description="更新比对结果-字段")
	public int updateFkbd(String tableName,String zdName,String zdValue,String xmID,String zsID){
		return sbdcptDao.updateFkbd(tableName, zdName, zdValue, xmID, zsID);
	}
	
	
	
	
	
	
	
	
	
	public ISbdcptDao getSbdcptDao() {
		return sbdcptDao;
	}

	public void setSbdcptDao(ISbdcptDao sbdcptDao) {
		this.sbdcptDao = sbdcptDao;
	}
	
}
