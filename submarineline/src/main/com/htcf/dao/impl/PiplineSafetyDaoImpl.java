package com.htcf.dao.impl;

import com.htcf.dao.PiplineSafetyDao;
import com.htcf.entity.ThdgxGxyjtjEntity;
import com.htcf.entity.ThysyywWgcbEntity;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author by hj on 2017-12-19.
 */
@Repository("piplineSafetyDao")
public class PiplineSafetyDaoImpl extends BaseDAOImpl<Object, Serializable> implements PiplineSafetyDao {
    @Override
    public boolean saveWgcb(ThysyywWgcbEntity wgcbEntity) {
        try {
            this.save(wgcbEntity);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
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
        StringBuilder sql = new StringBuilder(" from ThysyywWgcbEntity w where 1 =1 ");
        Map<String,Object> args = new HashMap<String, Object>(16);

        if( null != wgcbEntity){
            if(StringUtil.isNotBlank(wgcbEntity.getMmsi())){
                sql.append(" and w.mmsi like :mmsi");
                args.put("mmsi","%"+wgcbEntity.getMmsi()+"%");
            }
            if(StringUtil.isNotBlank(wgcbEntity.getCablename())){
                sql.append(" and w.cablename like :cablename");
                args.put("cablename","%"+wgcbEntity.getCablename()+"%");
            }
            if(StringUtil.isNotBlank(wgcbEntity.getWarningrank())){
                sql.append(" and w.warningrank like :warningrank");
                args.put("warningrank","%"+wgcbEntity.getWarningrank()+"%");
            }
            if(StringUtil.isNotBlank(wgcbEntity.getAddtime())){
                sql.append(" and w.addtime like :addtime");
                args.put("addtime","%"+wgcbEntity.getAddtime()+"%");
            }
        }
        sql.append(" order by w.addtime desc");
        List<ThysyywWgcbEntity> l = this.findPageByJPQL(sql.toString(),args,pageBean);
        if(l != null && l.size()!=0){
            return l;
        }
        return null;
    }

    /**
     * Description :删除违规船舶
     *
     * @param wgcbEntity 违规船舶id
     * @return true false
     * @author：hj
     * @Create 2017-12-25 10:14
     */
    @Override
    public boolean removeWgxcbId(ThysyywWgcbEntity wgcbEntity) {
        if(null == wgcbEntity  ){
            return false;
        }
        String hql = "delete from ThysyywWgcbEntity w where w.id = :id ";
        Map<String, Object> args = new HashMap<String, Object>(16);
        args.put("id", wgcbEntity.getId());
        try {
            int n = this.updateByJPQL(hql, args);
            return n > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Description :查询所有管线预警条件信息
     * @param gxyjtjEntity 管线预警信息
     * @return 管线预警信息
     * @author：hj
     * @Create 2018-1-4 13:55
     */
    @Override
    public List<ThdgxGxyjtjEntity> fetchYjtj(ThdgxGxyjtjEntity gxyjtjEntity) {
        String hql = " from ThdgxGxyjtjEntity yj where 1 =1 order by yj.updatetime desc";
        return this.findByJPQL(hql,null);
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
        StringBuilder sql = new StringBuilder(" select bjly,count(*) from T_HDGX_AQGL_WGCB t where 1 = 1");
        Map<String,Object> args = new HashMap<String, Object>(16);
        if(StringUtil.isNotBlank(bTime) && StringUtil.isNotBlank(eTime)){
            System.out.println("eTime"+eTime);
            sql.append(" and t.addtime >= :bTime and t.addtime < :eTime ");
            args.put("bTime",bTime);
            args.put("eTime",eTime);
        }
        sql.append(" group by bjly");
        System.out.println(sql.toString());
        List<Object[]> l = this.findBySQL(sql.toString(),args);
        if(l != null && l.size()!=0){
            return l;
        }
        return null;
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
        StringBuilder sql = new StringBuilder(" select cablename,count(*) from T_HDGX_AQGL_WGCB t where 1 = 1");
        Map<String,Object> args = new HashMap<String, Object>(16);
        if(StringUtil.isNotBlank(bTime) && StringUtil.isNotBlank(eTime)){
            sql.append(" and t.addtime >= :bTime and t.addtime < :eTime");
            args.put("bTime",bTime);
            args.put("eTime",eTime);
        }
        sql.append(" group by cablename ");
        System.out.println(sql.toString());
        List<Object[]> l = this.findBySQL(sql.toString(),args);
        if(l != null && l.size()!=0){
            return l;
        }
        return null;
    }


}
