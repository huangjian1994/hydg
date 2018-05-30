package com.htcf.service.impl;

import com.htcf.dao.HdgxDbldxxDao;
import com.htcf.entity.HdgxDbldxxEntity;
import com.htcf.service.HdgxDbldxxService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author by hj on 2017-12-27.
 */
@Service("dbldService")
public class HdgxDbldxxServiceImpl implements HdgxDbldxxService {

    @Autowired
    private HdgxDbldxxDao dbldxxDao;

    /**
     * Description :查询地波雷达信息
     *
     * @param dbldxxEntity 地波雷达信息
     * @param pageBean     分页
     * @return 地波雷达列表
     * @author：hj
     * @Create 2017-12-27 14:33
     */
    @Operate(description = "地波雷达信息模块，查询地波雷达新")
    @Override
    public List<HdgxDbldxxEntity> fetchDbldxx(HdgxDbldxxEntity dbldxxEntity, PageBean pageBean) {
        return this.dbldxxDao.fetchDbldxx(dbldxxEntity,pageBean);
    }

    /**
     * Description :根据id查出地波雷达传过来的详细信息
     * @param dbldxxEntity 地波雷达详细信息
     * @return dbldxxEntity 地波雷达详细信息
     * @author：hj
     * @Create 2017-12-27 14:53
     */
    @Operate(description = "地波雷达信息模块，根据id查询地波雷达详细信息")
    @Override
    public HdgxDbldxxEntity fetchDbldxxDetailById(HdgxDbldxxEntity dbldxxEntity) {
        return dbldxxDao.fetchDbldxxDetailById(dbldxxEntity);
    }

    /**
     * Description :根据时间段查询出新增的地波雷达信息
     *
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @return List
     * @author：hj
     * @Create 2018-1-12 10:30
     */
    @Override
    public List<HdgxDbldxxEntity> fetchDbldByTime(String startTime, String endTime) {
        return dbldxxDao.fetchDbldByTime(startTime,endTime);
    }
}
