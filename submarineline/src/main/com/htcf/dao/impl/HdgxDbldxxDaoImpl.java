package com.htcf.dao.impl;

import com.htcf.dao.HdgxDbldxxDao;
import com.htcf.entity.HdgxDbldxxEntity;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author by hj on 2017-12-27.
 */
@Repository("dbldDao")
public class HdgxDbldxxDaoImpl extends BaseDAOImpl<Object,Serializable> implements HdgxDbldxxDao  {
    /**
     * Description :查询地波雷达信息
     *
     * @param dbldxxEntity 地波雷达信息
     * @param pageBean     分页
     * @return 地波雷达列表
     * @author：hj
     * @Create 2017-12-27 14:33
     */
    @Override
    public List<HdgxDbldxxEntity> fetchDbldxx(HdgxDbldxxEntity dbldxxEntity, PageBean pageBean) {
        StringBuilder sql = new StringBuilder(" from HdgxDbldxxEntity d where 1=1  ");
        Map<String,Object> args = new HashMap<String, Object>(16);
        if(null != dbldxxEntity){
            if(StringUtil.isNotBlank(dbldxxEntity.getRadarareacode())){
                sql.append(" and d.radarareacode like :radarareacode");
                args.put("radarareacode","%"+dbldxxEntity.getRadarareacode()+"%");
            }if(StringUtil.isNotBlank(dbldxxEntity.getMmsi())){
                sql.append(" and d.mmsi like :mmsi ");
                args.put("mmsi","%"+dbldxxEntity.getMmsi()+"%");
            }if(StringUtil.isNotBlank(dbldxxEntity.getHhShip())){
                sql.append(" and d.hhShip like :hhShip ");
                args.put("hhShip","%"+dbldxxEntity.getHhShip()+"%");
            }if(StringUtil.isNotBlank(dbldxxEntity.getDeipTime())){
                sql.append(" and d.deipTime like :deipTime ");
                args.put("deipTime","%"+dbldxxEntity.getDeipTime()+"%");
            }
        }
        sql.append(" order by d.deipTime desc");
        return this.findPageByJPQL(sql.toString(),args,pageBean);
    }

    /**
     * Description :根据id查出地波雷达传过来的详细信息
     *
     * @param dbldxxEntity 地波雷达详细信息
     * @return dbldxxEntity 地波雷达详细信息
     * @author：hj
     * @Create 2017-12-27 14:53
     */
    @Override
    public HdgxDbldxxEntity fetchDbldxxDetailById(HdgxDbldxxEntity dbldxxEntity) {
        String hql = "from HdgxDbldxxEntity db where db.id = :id ";
        Map<String, Object> args = new HashMap<String, Object>(16);
        args.put("id", dbldxxEntity.getId());
        return (HdgxDbldxxEntity) this.findUniqueResultByHql(hql,args);
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
        StringBuilder hql = new StringBuilder("from HdgxDbldxxEntity d "+
                "where d.deipTime between :startTime and :endTime"
                );
        Map<String,Object> args = new HashMap<String, Object>(16);
        args.put("startTime",startTime);
        args.put("endTime",endTime);
        hql.append(" order by d.deipTime desc");
        return this.findByJPQL(hql.toString(),args);
    }

}
