package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.IStatisticalAnalysisDao;
import com.htcf.entity.TjfxForm;
import com.htcf.service.IStatisticalAnalysisService;
import com.htcf.util.Operate;

@Service(value = "statisticalAnalysisService")
public class StatisticalAnalysisServiceImpl implements IStatisticalAnalysisService{
	@Autowired
	private IStatisticalAnalysisDao statisticalAnalysisDao;

	/**
	 * 
	Description :查出海域使用统计
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-3 上午10:41:40
	 */
	@Operate(description="查出海域使用统计")
	public List<?> fetchHysytj(TjfxForm tjfxForm){
		return statisticalAnalysisDao.fetchHysytj(tjfxForm);
	}
	
	/**
	 * 
	Description :统计分析——海域资源价值指标统计汇总
	@param:@param qsYear
	@param:@param zzYear
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-7 下午02:32:06
	 */
	@Operate(description="查询统计分析——海域资源价值指标统计汇总")
	public List<?> fetchHyzyjzzb(TjfxForm tjfxForm){
		return statisticalAnalysisDao.fetchHyzyjzzb(tjfxForm);
	}
	
	/**
	 * 
	Description :海域资源价值指标统计汇总-二维交叉表
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-7 下午04:04:50
	 */
	@Operate(description="查询海域资源价值指标统计汇总-二维交叉表")
	public List<?> fetchHyzyjzzbEwjcb(TjfxForm tjfxForm){
		return statisticalAnalysisDao.fetchHyzyjzzbEwjcb(tjfxForm);
	}
	
	/**
	 * 
	Description :地面监视监测计划执法情况
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-10 上午11:42:52
	 */
	@Operate(description="查询地面监视监测计划执法情况")
	public List<?> fetchDmjsjcTj(TjfxForm tjfxForm){
		return statisticalAnalysisDao.fetchDmjsjcTj(tjfxForm);
	}
	
	/**
	 * 
	Description :海域使用新增或变更动态
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-10 下午03:40:01
	 */
	@Operate(description="查询海域使用新增或变更动态")
	public List<?> fetchDmjsjcHysydtTj(TjfxForm tjfxForm){
		return statisticalAnalysisDao.fetchDmjsjcHysydtTj(tjfxForm);
	}
	
	/**
	 * 
	Description :监测监测成果数据质量评价
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-10 下午03:42:11
	 */
	@Operate(description="查询监测监测成果数据质量评价")
	public List<?> fetchDmjsjcCgsjzlpj(TjfxForm tjfxForm){
		return statisticalAnalysisDao.fetchDmjsjcCgsjzlpj(tjfxForm);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	public IStatisticalAnalysisDao getStatisticalAnalysisDao() {
		return statisticalAnalysisDao;
	}

	public void setStatisticalAnalysisDao(
			IStatisticalAnalysisDao statisticalAnalysisDao) {
		this.statisticalAnalysisDao = statisticalAnalysisDao;
	}
	
	
}
