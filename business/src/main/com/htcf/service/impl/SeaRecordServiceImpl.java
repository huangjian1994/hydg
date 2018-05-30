package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.ISeaRecordDao;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtYhxmXmfj;
import com.htcf.entity.TjfxForm;
import com.htcf.service.ISeaRecordService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;

/**
 * 海籍管理
 * @author yinying
 *
 */
@Service(value = "seaRecordService")
public class SeaRecordServiceImpl implements ISeaRecordService{
	@Autowired
	private ISeaRecordDao seaRecordDao;

	/**
	 * 
	Description :文件列表
	@param:@param pageBean
	@param:@param searchForm
	@param:@param userId
	@param:@param userRoleName
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-16 上午10:21:03
	 */
	@Operate(description="查询文件列表")
	public List<?> fetchFileList(PageBean pageBean,SearchForm searchForm,String userId,String userRoleName){
		return seaRecordDao.fetchFileList(pageBean, searchForm, userId, userRoleName);
	}
	
	/**
	 * 
	Description :图片列表
	@param:@param pageBean
	@param:@param searchForm
	@param:@param userId
	@param:@param userRoleName
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-16 上午10:21:13
	 */
	@Operate(description="查询图片列表")
	public List<?> fetchZpList(PageBean pageBean,SearchForm searchForm,String userId,String userRoleName){
		return seaRecordDao.fetchZpList(pageBean, searchForm, userId, userRoleName);
	}
	/**
	 * 
	Description :附件详情
	@param:@param xmfjID
	@param:@return
	@return:THysyywHysydtYhxmXmfj
	@throws
	@Author：yinying
	@Create 2017-11-17 下午02:58:34
	 */
	@Operate(description="查询附件详情")
	public THysyywHysydtYhxmXmfj fetchXmfjDetail(String xmfjID){
		return seaRecordDao.fetchXmfjDetail(xmfjID);
	}
	
	/**
	 * 
	Description :海籍综合分析
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-23 下午04:37:59
	 */
	@Operate(description="查询海籍综合分析")
	public List<?> fetchHjzhfx(TjfxForm tjfxForm){
		return seaRecordDao.fetchHjzhfx(tjfxForm);
	}
	
	public ISeaRecordDao getSeaRecordDao() {
		return seaRecordDao;
	}

	public void setSeaRecordDao(ISeaRecordDao seaRecordDao) {
		this.seaRecordDao = seaRecordDao;
	}
	
	
}
