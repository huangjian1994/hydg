package com.htcf.service.impl;

import com.htcf.dao.PiplineSafetyDao;
import com.htcf.entity.ThdgxGxyjtjEntity;
import com.htcf.entity.ThysyywWgcbEntity;
import com.htcf.service.PipelineSafetyService;
import com.htcf.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author by hj on 2017-12-18.
 */
@Service("piplineSafetyService")
public class PipelineSafetyServiceImpl implements PipelineSafetyService{
    @Autowired
    private PiplineSafetyDao piplineSafetyDao;

    /**
     * Description :保存违规船舶信息
     * @param wgcbEntity 违规船舶
     * @return ture false
     * @author：hj
     * @Create 2017-12-18 17:19
     */
    @Override
    public boolean saveWgcbInfo(ThysyywWgcbEntity wgcbEntity) {
        return piplineSafetyDao.saveWgcb(wgcbEntity);
    }

    /**
     * Description :查询违规船舶记录
     * @param wgcbEntity 船舶信息
     * @param pageBean   分页
     * @return 违规页面
     * @author：hj
     * @Create 2017-12-21 16:25
     */
    @Override
    public List<ThysyywWgcbEntity> fetchWgcb(ThysyywWgcbEntity wgcbEntity, PageBean pageBean) {
        return piplineSafetyDao.fetchWgcb(wgcbEntity,pageBean);
    }

    /**
     *
     Description :删除违规船舶
     @param wgcbEntity 违规船舶id
     @return true false
     @author：hj
     @Create 2017-12-25 10:14
     */
    @Override
    public boolean removeWgcbId(ThysyywWgcbEntity wgcbEntity) {
        return piplineSafetyDao.removeWgxcbId(wgcbEntity);
    }

    /**
     * Description :查询所有管线预警条件信息
     *
     * @param gxyjtjEntity 管线预警信息
     * @return 管线预警信息
     * @author：hj
     * @Create 2018-1-4 13:55
     */
    @Override
    public List<ThdgxGxyjtjEntity> fetchYjtj(ThdgxGxyjtjEntity gxyjtjEntity) {
        return piplineSafetyDao.fetchYjtj(gxyjtjEntity);
    }

    /**
     * Description :统计预警信息-报警来源
     *
     * @param bTime 统计开始时间
     * @param eTime 统计结束时间
     * @return
     * @author：hj
     * @Create 2018-1-22 16:12
     */
    @Override
    public List<Object[]> tjBjly(String bTime, String eTime) {
        return piplineSafetyDao.tjBjly(bTime,eTime);
    }

    /**
     * Description :统计预警信息-按管线附近统计
     *
     * @param bTime 统计开始时间
     * @param eTime 统计结束时间
     * @return
     * @author：hj
     * @Create 2018-1-22 16:12
     */
    @Override
    public List<Object[]> tjGxmc(String bTime, String eTime) {
        return piplineSafetyDao.tjGxmc(bTime,eTime);
    }


    /**
     *Description :查询所有的违规船舶
     *@return List
     *@author：hj
     *@Create 2018-6-11 17:02
     */
    @Override
    public List<ThysyywWgcbEntity> fetchWgcbAll() {
        return piplineSafetyDao.fetchWgcbAll();
    }


}
