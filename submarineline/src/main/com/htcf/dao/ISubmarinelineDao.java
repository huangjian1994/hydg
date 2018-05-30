package com.htcf.dao;

import java.util.List;

import com.htcf.entity.SearchForm;
import com.htcf.entity.THdgxAqglWgjb;
import com.htcf.util.PageBean;
/**
 * 海底管线：安全管理-违规举报
 * @author yinying
 *
 */
public interface ISubmarinelineDao {

	/**
	 * 
	Description :违规举报管理列表
	@param:@param searchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:02:11
	 */
	public List<?> fetchAqglWgjb(SearchForm searchForm, PageBean pageBean);
	
	/**
	 * 
	Description :修改违规举报
	@param:@param hdgxAqglWgjb
	@param:@return
	@return:boolean
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:03:07
	 */
	public boolean updateWgjb(THdgxAqglWgjb hdgxAqglWgjb);
	
	/**
	 * 
	Description :删除违规举报
	@param:@param id
	@param:@return
	@return:boolean
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:04:24
	 */
	public boolean deleteWgjbById(Long id);
	
	/**
	 * 
	Description :违规举报详情
	@param:@param wgjbID
	@param:@return
	@return:THdgxAqglWgjb
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:05:59
	 */
	public THdgxAqglWgjb fetchWgjbDetail(String wgjbID);
	
	
	
	
	
	
	
}
