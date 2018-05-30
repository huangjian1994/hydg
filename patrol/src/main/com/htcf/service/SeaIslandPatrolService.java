package com.htcf.service;

import com.htcf.entity.ThyxcHdxcXcjhEntity;
import com.htcf.util.PageBean;
import sun.misc.Unsafe;

import java.util.List;

/**
 * 海域海岛计划
 * @author by hj on 2018-4-2.
 */
public interface SeaIslandPatrolService {

    /**
    *Description :查询巡查计划
    *@param xcjhEntity 巡查计划
    *@param pageBean 10
    *@return List
    *@author：hj
    *@Create 2018-4-2 18:35
    */
    List<ThyxcHdxcXcjhEntity> fetchXcjhtList(ThyxcHdxcXcjhEntity xcjhEntity,
                                             PageBean pageBean,
                                             String userId,
                                             String userRoleName);

    /**
     *Description :删除巡查计划
     *@param jhId 巡查计划
     *@return String
     *@author：hj
     *@Create 2018-4-2 20:10
     */
    void deleteXcjh(String jhId);

    /**
     *Description :巡查计划详情
     *@param jhId 巡查计划
     *@return String
     *@author：hj
     *@Create 2018-4-2 20:30
     */
    ThyxcHdxcXcjhEntity fetchXcjhDetail(String jhId);

    /**
    *Description :审核页面查询
    *@param xcjhEntity 任务计划
    *@param pageBean 分页
    *@return String
    *@author：hj
    *@Create 2018-4-10 9:30
    */
    List<ThyxcHdxcXcjhEntity> fetchXcjhtShList(ThyxcHdxcXcjhEntity xcjhEntity,
                                               PageBean pageBean,
                                               String userId,
                                               String userRoleName);

    /**
    *Description :出海巡查任务-权限
    *@param xcjhEntity 任务计划
     * @param pageBean 分页
     * @param userName  用户id
     * @param userRoleName  用户角色
    *@return String
    *@author：hj
    *@Create 2018-4-18 15:13
    */
    List<ThyxcHdxcXcjhEntity> fetchChxctShList(ThyxcHdxcXcjhEntity xcjhEntity, PageBean pageBean, String userName, String userRoleName);

    /**
    *Description :统计该用户已审核但未巡查的任务数
    *@param
    *@return
    *@author：hj
    *@Create 2018-4-23 15:24
    */
    int fetchYjrws(String userName,String userRoleName);

}
