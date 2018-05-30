package com.htcf.service;

import com.htcf.entity.ThysyywHysydtHyzrbhqEntity;
import com.htcf.util.PageBean;

import java.util.List;

/**
 * @author by hj on 2018-1-5.
 */
public interface OceanNatureService {
    /**
    	 *
    	Description :
    	@param hyzrbhqEntity 自然保护区实体
    	@param pageBean pageBean
        @return  hyzrbhqEntity
    	@author：hj
    	@Create 2018-1-5 16:36
    	 */
    List<ThysyywHysydtHyzrbhqEntity> fetchZrbhq(ThysyywHysydtHyzrbhqEntity hyzrbhqEntity, PageBean pageBean);

    /**
    	 *
    	Description :根据id删除保护区信息
    	@param hyzrbhqEntity 保护区id
    	@author：hj
    	@Create 2018-1-10 10:20
    	 */
    boolean removeBhqById(ThysyywHysydtHyzrbhqEntity hyzrbhqEntity);

    /**
    	 *
    	Description :根据id查询保护区详细信息
    	@param hyzrbhqEntity 保护区信息
    	@return 保护区信息
    	@author：hj
    	@Create 2018-1-10 10:58
    	 */
    ThysyywHysydtHyzrbhqEntity loadBhqById(ThysyywHysydtHyzrbhqEntity hyzrbhqEntity);
}
