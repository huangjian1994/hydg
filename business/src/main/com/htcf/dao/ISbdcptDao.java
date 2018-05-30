package com.htcf.dao;

import java.util.List;

import com.htcf.entity.SbdcptFkbdForm;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtYhxmForm;
import com.htcf.entity.THysyywNwbjkSbdcptFk;
import com.htcf.util.PageBean;
/**
 * 内外部接口——市不动产平台接口
 * @author yinying
 *
 */
public interface ISbdcptDao {

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
	public List<?> fetchYhxmList(PageBean pageBean, THysyywHysydtYhxmForm hysyywHysydtYhxmForm);
	
	/**
	 * 
	Description :查出用海批文信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-18 下午04:37:31
	 */
	public List<?> fetchYhpw(String xmID, String zsID);
	
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
	public String fetchPwbhByXmid(String xmID, String zsID);
	
	/**
	 * 
	Description :查出批文编号+1
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-18 下午06:57:55
	 */
	public String fetchPwbh();
	
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
	public void addPwbh(String xmID, String pwbh, String zsID);
	
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
	public void updateXmzt(String xmID, String zsID, String xmzt);
	
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
	public List<?> fetchZhxx(String xmID, String zsID);
	
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
	public List<?> fetchZhft(String xmID, String zsID);
	
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
	public List<?> fetchYhqk(String xmID, String zsID);
	
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
	public List<?> fetchHyzb(String xmID, String zsID);
	
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
	public List<?> fetchYhmyddsxb(String xmID, String zsID);
	
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
	public List<?> fetchHysyjjnqk(String xmID, String zsID);
	
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
	public List<?> fetchPhb(String xmID, String zsID);
	
	/**
	 * 
	Description :删除市不动产平台反馈数据
	@param:@param approvalNum
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-16 下午05:37:06
	 */
	public void deleteSbdcptFk(String approvalNum);
	
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
	public List<?> fetchSbdcptFk(PageBean pageBean, SearchForm searchForm);
	
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
	public THysyywNwbjkSbdcptFk fetchSbdcptFkDetail(String fkID);
	
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
	public int fetchSbdcptFkIs(String approvalNum);
	
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
	public void updateSbdcptFk(String approvalNum, THysyywNwbjkSbdcptFk hysyywNwbjkSbdcptFk);
	
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
	public SbdcptFkbdForm fetchYhxmZhxxBd(String approvalNum);
	
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
	public int updateFkbd(String tableName, String zdName, String zdValue, String xmID, String zsID);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
