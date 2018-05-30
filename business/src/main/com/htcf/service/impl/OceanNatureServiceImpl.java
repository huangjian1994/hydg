package com.htcf.service.impl;

import com.htcf.dao.OceanNatureDao;
import com.htcf.entity.ThysyywHysydtHyzrbhqEntity;
import com.htcf.service.OceanNatureService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author by hj on 2018-1-5.
 */

@Service("natureService")
public class OceanNatureServiceImpl implements OceanNatureService {

    @Autowired
    private OceanNatureDao natureDao;

    /**
     * Description :
     *
     * @param hyzrbhqEntity 自然保护区实体
     * @param pageBean      pageBean
     * @return hyzrbhqEntity
     * @author：hj
     * @Create 2018-1-5 16:36
     */
    @Operate(description = "查询自然保护区信息")
    @Override
    public List<ThysyywHysydtHyzrbhqEntity> fetchZrbhq(ThysyywHysydtHyzrbhqEntity hyzrbhqEntity, PageBean pageBean) {
        return natureDao.fetchZrbhq(hyzrbhqEntity, pageBean);
    }

    /**
     * Description :根据id删除保护区信息
     *
     * @param hyzrbhqEntity 保护区id
     * @author：hj
     * @Create 2018-1-10 10:20
     */
    @Operate(description = "根据id删除自然保护区")
    @Override
    public boolean removeBhqById(ThysyywHysydtHyzrbhqEntity hyzrbhqEntity) {
        return natureDao.removeBhqId(hyzrbhqEntity);
    }

    /**
     * Description :根据id查询保护区详细信息
     *
     * @param hyzrbhqEntity 保护区信息
     * @return 保护区信息
     * @author：hj
     * @Create 2018-1-10 10:58
     */
    @Operate(description = "查询自然保护区详细信息")
    @Override
    public ThysyywHysydtHyzrbhqEntity loadBhqById(ThysyywHysydtHyzrbhqEntity hyzrbhqEntity) {
        return natureDao.loadBhqById(hyzrbhqEntity);
    }
}
