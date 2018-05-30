package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.IQualificationDao;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywNwbjkZzgl;
import com.htcf.service.IQualificationService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;
/**
 * 内外部接口——资质管理接口
 * @author yinying
 *
 */
@Service(value = "qualificationService")
public class QualificationServiceImpl implements IQualificationService{
	@Autowired
	private IQualificationDao qualificationDao;

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
	@Operate(description="查询资质列表")
	public List<?> fetchZzglList(PageBean pageBean,SearchForm searchForm){
		return qualificationDao.fetchZzglList(pageBean, searchForm);
	}
	
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
	@Operate(description="查询资质详情")
	public THysyywNwbjkZzgl fetchZzglDetail(String zzID){
		return qualificationDao.fetchZzglDetail(zzID);
	}
	
	/**
	 * 
	Description :删除资质
	@param:@param zzID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:33:49
	 */
	@Operate(description="删除资质")
	public void deleteZzgl(String zzID){
		qualificationDao.deleteZzgl(zzID);
	}
	
	public IQualificationDao getQualificationDao() {
		return qualificationDao;
	}

	public void setQualificationDao(IQualificationDao qualificationDao) {
		this.qualificationDao = qualificationDao;
	}
	
	
}
