package com.htcf.service;

import java.util.List;

import com.htcf.entity.TjfxForm;

/**
 * 统计分析
 * @author yinying
 *
 */
public interface IStatisticalAnalysisService {

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
	public List<?> fetchHysytj(TjfxForm tjfxForm);
	
	
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
	public List<?> fetchHyzyjzzb(TjfxForm tjfxForm);
	
	
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
	public List<?> fetchHyzyjzzbEwjcb(TjfxForm tjfxForm);
	
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
	public List<?> fetchDmjsjcTj(TjfxForm tjfxForm);
	
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
	public List<?> fetchDmjsjcHysydtTj(TjfxForm tjfxForm);
	
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
	public List<?> fetchDmjsjcCgsjzlpj(TjfxForm tjfxForm);
	
	
	
	
	
	
}
