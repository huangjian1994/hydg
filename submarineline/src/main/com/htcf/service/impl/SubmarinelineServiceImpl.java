package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.ISubmarinelineDao;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THdgxAqglWgjb;
import com.htcf.service.ISubmarinelineService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;
/**
 * 海底管线：安全管理-违规举报
 * @author yinying
 *
 */
@Service(value = "submarinelineService")
public class SubmarinelineServiceImpl implements ISubmarinelineService{
	@Autowired
	private ISubmarinelineDao submarinelineDao;

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
	@Operate(description="查询违规举报管理列表")
	public List<?> fetchAqglWgjb(SearchForm searchForm,PageBean pageBean){
		return submarinelineDao.fetchAqglWgjb(searchForm, pageBean);
	}
	
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
	@Operate(description="修改违规举报")
	public boolean updateWgjb(THdgxAqglWgjb hdgxAqglWgjb){
		return submarinelineDao.updateWgjb(hdgxAqglWgjb);
	}
	
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
	@Operate(description="删除违规举报")
	public boolean deleteWgjbById(Long id){
		return submarinelineDao.deleteWgjbById(id);
	}
	
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
	@Operate(description="查询违规举报详情")
	public THdgxAqglWgjb fetchWgjbDetail(String wgjbID){
		return submarinelineDao.fetchWgjbDetail(wgjbID);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ISubmarinelineDao getSubmarinelineDao() {
		return submarinelineDao;
	}

	public void setSubmarinelineDao(ISubmarinelineDao submarinelineDao) {
		this.submarinelineDao = submarinelineDao;
	}
	
	
}
