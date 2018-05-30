package com.htcf.service;

import java.util.List;

import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtYhxmXmfj;
import com.htcf.entity.TjfxForm;
import com.htcf.util.PageBean;

/**
 * 海籍管理
 * @author yinying
 *
 */
public interface ISeaRecordService {

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
	public List<?> fetchFileList(PageBean pageBean, SearchForm searchForm, String userId, String userRoleName);
	
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
	public List<?> fetchZpList(PageBean pageBean, SearchForm searchForm, String userId, String userRoleName);
	
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
	public THysyywHysydtYhxmXmfj fetchXmfjDetail(String xmfjID);
	
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
	public List<?> fetchHjzhfx(TjfxForm tjfxForm);
	
	
}
