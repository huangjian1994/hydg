package com.htcf.service.impl;

import com.htcf.dao.SeaIslandPatrolDao;
import com.htcf.entity.ThyxcHdxcXcjhEntity;
import com.htcf.service.SeaIslandPatrolService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 海域海岛计划
 * @author by hj on 2018-4-2.
 */
@Service(value = "seaIslandPatrolService")
public class SeaIslandPatrolServiceImpl implements SeaIslandPatrolService {

    @Autowired
    private SeaIslandPatrolDao islandPatrolDao;

    @Operate(description = "查询巡查计划")
    @Override
    public List<ThyxcHdxcXcjhEntity> fetchXcjhtList(ThyxcHdxcXcjhEntity xcjhEntity,
                                                    PageBean pageBean,
                                                    String userId,
                                                    String userRoleName) {
        return islandPatrolDao.fetchXcjhtList(xcjhEntity,pageBean,userId,userRoleName);
    }

    /**
     * Description :删除巡查计划
     *
     * @param jhId 巡查计划
     * @return String
     * @author：hj
     * @Create 2018-4-2 20:10
     */
    @Operate(description = "删除巡查计划")
    @Override
    public void deleteXcjh(String jhId) {
        islandPatrolDao.deleteXcjh(jhId);
    }

    /**
     * Description :巡查计划详情
     *
     * @param jhId 巡查计划
     * @return String
     * @author：hj
     * @Create 2018-4-2 20:30
     */
    @Operate(description = "巡查计划详细信息")
    @Override
    public ThyxcHdxcXcjhEntity fetchXcjhDetail(String jhId) {
        return islandPatrolDao.fetchXcjhDetail(jhId);
    }

    /**
     *Description :审核页面查询
     *@param xcjhEntity 任务计划
     *@param pageBean 分页
     *@return String
     *@author：hj
     *@Create 2018-4-10 9:30
     */
    @Operate(description = "审核页面查询-未审核")
    @Override
    public List<ThyxcHdxcXcjhEntity> fetchXcjhtShList(ThyxcHdxcXcjhEntity xcjhEntity,
                                                      PageBean pageBean,
                                                      String userId,
                                                      String userRoleName) {
        return islandPatrolDao.fetchXcjhtShList(xcjhEntity,pageBean,userId,userRoleName);
    }

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
    @Override
    public List<ThyxcHdxcXcjhEntity> fetchChxctShList(ThyxcHdxcXcjhEntity xcjhEntity, PageBean pageBean, String userName, String userRoleName) {
        return islandPatrolDao.fetchChxcList(xcjhEntity,pageBean,userName,userRoleName);
    }

    /**
     *Description :统计该用户已审核但未巡查的任务数
     *@param userName 用户名
     *@param userRoleName 用户角色
     *@return
     *@author：hj
     *@Create 2018-4-23 15:24
     */
    @Operate(description = "统计该用户已审核但未巡查的任务数")
    @Override
    public int fetchYjrws(String userName, String userRoleName) {
        return islandPatrolDao.fetchYjrws(userName,userRoleName);
    }


    public SeaIslandPatrolDao getIslandPatrolDao() {
        return islandPatrolDao;
    }

    public void setIslandPatrolDao(SeaIslandPatrolDao islandPatrolDao) {
        this.islandPatrolDao = islandPatrolDao;
    }
}
