package com.htcf.service;

import com.htcf.entity.ThdgxGxyjtjEntity;
import com.htcf.entity.ThysyywWgcbEntity;
import com.htcf.util.PageBean;

import java.util.List;

/**
 * @author by hj on 2017-12-18.
 */
public interface PipelineSafetyService {

    /**
    	 *
    	Description :保存违规船舶信息
    	@param wgcbEntity
    	@return ture false
    	@author：hj
    	@Create 2017-12-18 17:19
    	 */
    boolean saveWgcbInfo(ThysyywWgcbEntity wgcbEntity);

    /**
    	 *
    	Description :查询违规船舶记录
    	@param wgcbEntity 船舶信息
    	@param pageBean 分页
    	@return 违规页面
    	@author：hj
    	@Create 2017-12-21 16:25
    	 */
    List<ThysyywWgcbEntity> fetchWgcb(ThysyywWgcbEntity wgcbEntity, PageBean pageBean);

    /**
    	 *
    	Description :删除违规船舶
    	@param wgcbEntity 违规船舶id
    	@return true false
    	@author：hj
    	@Create 2017-12-25 10:14
    	 */
    boolean removeWgcbId(ThysyywWgcbEntity wgcbEntity);

    /**
    	 *
    	Description :查询所有管线预警条件信息
    	@param gxyjtjEntity 管线预警信息
    	@return 管线预警信息
    	@author：hj
    	@Create 2018-1-4 13:55
    	 */
    List<ThdgxGxyjtjEntity> fetchYjtj(ThdgxGxyjtjEntity gxyjtjEntity);

    /**
    	 *
    	Description :统计预警信息-报警来源
    	@param bTime 统计开始时间
	 	@param eTime 统计结束时间
    	@return
    	@author：hj
    	@Create 2018-1-22 16:12
    	 */
    List<Object[]> tjBjly(String bTime,String eTime);

	/**
	 *
	 Description :统计预警信息-按管线附近统计
	 @param bTime 统计开始时间
	 @param eTime 统计结束时间
	 @return
	 @author：hj
	 @Create 2018-1-22 16:12
	 */
	List<Object[]> tjGxmc(String bTime,String eTime);

	/**
	*Description :查询所有的违规船舶
	*@return List
	*@author：hj
	*@Create 2018-6-11 17:02
	*/
	List<ThysyywWgcbEntity> fetchWgcbAll();
}
