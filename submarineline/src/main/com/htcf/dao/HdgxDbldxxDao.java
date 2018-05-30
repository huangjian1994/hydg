package com.htcf.dao;

import com.htcf.entity.HdgxDbldxxEntity;
import com.htcf.util.PageBean;

import java.util.List;

/**
 * @author by hj on 2017-12-27.
 */
public interface HdgxDbldxxDao {
    /**
     *
     Description :查询地波雷达信息
     @return 地波雷达列表
     @author：hj
     @Create 2017-12-27 14:33
      * @param dbldxxEntity 地波雷达信息
     * @param pageBean 分页
     */

    List fetchDbldxx(HdgxDbldxxEntity dbldxxEntity, PageBean pageBean);

    /**
     *
     Description :根据id查出地波雷达传过来的详细信息
     @param dbldxxEntity 地波雷达详细信息
     @return dbldxxEntity 地波雷达详细信息
     @author：hj
     @Create 2017-12-27 14:53
     */
    HdgxDbldxxEntity fetchDbldxxDetailById(HdgxDbldxxEntity dbldxxEntity);

    /**
     * Description :根据时间段查询出新增的地波雷达信息
     *
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @return List
     * @author：hj
     * @Create 2018-1-12 10:30
     */
    List fetchDbldByTime(String startTime, String endTime);
}
