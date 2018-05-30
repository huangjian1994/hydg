package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.DgIffDao;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtHaxDctj;
import com.htcf.entity.THysyywHysydtHaxGhxx;
import com.htcf.entity.THysyywHysydtHaxJcxx;
import com.htcf.entity.THysyywHysydtHaxJsjc;
import com.htcf.entity.THysyywHysydtHaxZzxf;
import com.htcf.service.DgIffService;
import com.htcf.util.Operate;
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
@Service(value = "dgiffService")
public class DgIffServiceImpl implements DgIffService{

	@Autowired
	private DgIffDao dgIffDao;
	
	@Operate(description="查询海岸线信息")
	public List<?> getHaxJcxxList1(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx,PageBean pageBean){
		return dgIffDao.getHaxJcxxList1(thysyywHysydtHaxJcxx, pageBean);
	}
	
	@Operate(description="查询海岸线信息")
	public List<THysyywHysydtHaxJcxx> getHaxJcxxList(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx,PageBean pageBean){
		return dgIffDao.getHaxJcxxList(thysyywHysydtHaxJcxx, pageBean);
	}
	@Operate(description="保存海岸线信息")
	public boolean saveHaxInfoByHax(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx){
		return dgIffDao.saveHaxInfoByHax(thysyywHysydtHaxJcxx);
	}
	@Operate(description="查询海岸线信息")
	public List<?> getHaxJcxxListByEntity(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx,PageBean pageBean){
		return dgIffDao.getHaxJcxxListByEntity(thysyywHysydtHaxJcxx, pageBean);
	}
	@Operate(description="查询海岸线信息详情")
	public THysyywHysydtHaxJcxx getHaxJcxxInfoById(String id){
		return dgIffDao.getHaxJcxxInfoById(id);
	}
	@Operate(description="修改海岸线信息")
	public void saveUpdateHaxInfo(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx){
		dgIffDao.saveUpdateHaxInfo(thysyywHysydtHaxJcxx);
	}
	@Operate(description="删除海岸线信息")
	public void deleteHaxInfoById(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx){
		dgIffDao.deleteHaxInfoById(thysyywHysydtHaxJcxx);
	}
	@Operate(description="查询监视监测")
	public List<THysyywHysydtHaxJsjc> getJsjcListByIdOrNull(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc,PageBean pageBean){
		return this.dgIffDao.getJsjcListByIdOrNull(thysyywHysydtHaxJsjc, pageBean);
	}
	@Operate(description="保存监视监测")
	public void saveJsjcInfo(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc){
		this.dgIffDao.saveJsjcInfo(thysyywHysydtHaxJsjc);
	}
	@Operate(description="查询监视监测详情")
	public THysyywHysydtHaxJsjc getJsjcInfoById(String id){
		return this.dgIffDao.getJsjcInfoById(id);
	}
	@Operate(description="修改监视监测")
	public void saveUpdateJsjcInfo(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc){
		this.dgIffDao.saveUpdateJsjcInfo(thysyywHysydtHaxJsjc);
	}
	@Operate(description="删除监视监测")
	public void deleteJsjcInfoById(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc){
		this.dgIffDao.deleteJsjcInfoById(thysyywHysydtHaxJsjc);
	}
	@Operate(description="查询监视监测")
	public List<THysyywHysydtHaxJsjc> getHaxJsjcListByEntity(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc,PageBean pageBean){
		return this.dgIffDao.getHaxJsjcListByEntity(thysyywHysydtHaxJsjc, pageBean);
	}
	@Operate(description="查询海岸线调查统计")
	public List<?> getDctjListByIdOrNull(THysyywHysydtHaxDctj thysyywHysydtHaxDctj,PageBean pageBean){
		return this.dgIffDao.getDctjListByIdOrNull(thysyywHysydtHaxDctj, pageBean);
	}
	@Operate(description="查询字典")
	public List<?> getDictionaryListByKey(String key){
		return this.dgIffDao.getDictionaryListByKey(key);
	}
	@Operate(description="保存海岸线调查统计")
	public void saveDctjInfo(THysyywHysydtHaxDctj thysyywHysydtHaxDctj){
		this.dgIffDao.saveDctjInfo(thysyywHysydtHaxDctj);
	}
	@Operate(description="查询海岸线调查统计详情")
	public THysyywHysydtHaxDctj getDctjById(String id){
		return this.dgIffDao.getDctjById(id);
	}
	@Operate(description="修改海岸线调查统计")
	public void saveUpdateDctjInfo(THysyywHysydtHaxDctj thysyywHysydtHaxDctj){
		this.dgIffDao.saveUpdateDctjInfo(thysyywHysydtHaxDctj);
	}
	@Operate(description="删除海岸线调查统计")
	public void deleteDctjInfoById(THysyywHysydtHaxDctj thysyywHysydtHaxDctj){
		this.dgIffDao.deleteDctjInfoById(thysyywHysydtHaxDctj);
	}
	@Operate(description="查询海岸线调查统计")
	public List<?> getHaxDctjListByEntity(THysyywHysydtHaxDctj thysyywHysydtHaxDctj,PageBean pageBean){
		return this.dgIffDao.getHaxDctjListByEntity(thysyywHysydtHaxDctj, pageBean);
	}
	
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
	@Operate(description="查询规划信息列表")
	public List<?> fetchHaxGhxxList(SearchForm searchForm,PageBean pageBean){
		return this.dgIffDao.fetchHaxGhxxList(searchForm, pageBean);
	}
	
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
	@Operate(description="查询规划信息详情")
	public THysyywHysydtHaxGhxx fetchHaxGhxxDetail(String ghID){
		return this.dgIffDao.fetchHaxGhxxDetail(ghID);
	}
	
	/**
	 * 
	Description :删除规划信息
	@param:@param ghID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:03:06
	 */
	@Operate(description="删除规划信息")
	public void deleteHaxGhxx(String ghID){
		this.dgIffDao.deleteHaxGhxx(ghID);
	}
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
	@Operate(description="查询整治修复列表")
	public List<?> fetchHaxZzxfList(SearchForm searchForm,PageBean pageBean){
		return this.dgIffDao.fetchHaxZzxfList(searchForm, pageBean);
	}
	
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
	@Operate(description="查询整治修复详情")
	public THysyywHysydtHaxZzxf fetchHaxZzxfDetail(String zzID){
		return this.dgIffDao.fetchHaxZzxfDetail(zzID);
	}
	
	/**
	 * 
	Description :删除整治修复
	@param:@param zzID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-11-13 上午11:28:27
	 */
	@Operate(description="删除整治修复")
	public void deleteHaxZzxf(String zzID){
		this.dgIffDao.deleteHaxZzxf(zzID);
	}
	
}
