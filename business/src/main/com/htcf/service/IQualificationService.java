package com.htcf.service;

import java.util.List;

import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywNwbjkZzgl;
import com.htcf.util.PageBean;

/**
 * 内外部接口——资质管理接口
 * @author yinying
 *
 */
public interface IQualificationService {
	/**
	 * 
	Description :查询资质列表
	@param:@param pageBean
	@param:@param searchForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:34:59
	 */
	public List<?> fetchZzglList(PageBean pageBean, SearchForm searchForm);
	
	/**
	 * 
	Description :资质详情
	@param:@param zzID
	@param:@return
	@return:THysyywNwbjkZzgl
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:35:05
	 */
	public THysyywNwbjkZzgl fetchZzglDetail(String zzID);
	
	/**
	 * 
	Description :删除资质
	@param:@param zzID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:33:49
	 */
	public void deleteZzgl(String zzID);
	
	
	
}
