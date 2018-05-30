package com.htcf.dao.impl;

import com.htcf.dao.SeaIslandPatrolDao;
import com.htcf.entity.THyxcHdxcFkjcxx;
import com.htcf.entity.ThyxcHdxcXcjhEntity;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 海域海岛计划
 * @author by hj on 2018-4-2.
 */
@Repository(value="seaIslandPatorlDao")
public class SeaIslandPatorlDaoImpl extends BaseDAOImpl<Object,Serializable> implements SeaIslandPatrolDao {


    /**
     * Description :查询巡查计划
     *
     * @param xcjhEntity 巡查计划
     * @param pageBean   10
     * @return List
     * @author：hj
     * @Create 2018-4-2 18:35
     */
    @Override
    public List<ThyxcHdxcXcjhEntity> fetchXcjhtList(ThyxcHdxcXcjhEntity xcjhEntity,
                                                    PageBean pageBean,
                                                    String userId,
                                                    String userRoleName) {
        StringBuffer hql = new StringBuffer(" from ThyxcHdxcXcjhEntity y where 1=1  ");
        Map<String, Object> args = new HashMap<String, Object>();
        if (xcjhEntity != null) {
            if (xcjhEntity.getPatrolname() != null && !xcjhEntity.getPatrolname().equals("")) {
                hql.append(" and y.patrolname like :patrolname ");
                args.put("patrolname", "" + xcjhEntity.getPatrolname() + "");
            }
            if (xcjhEntity.getFillingdw() != null && !xcjhEntity.getFillingdw().equals("")) {
                hql.append(" and y.fillingdw like :fillingdw ");
                args.put("fillingdw", "" + xcjhEntity.getFillingdw() + "");
            }
            if (xcjhEntity.getLeadername() != null && !xcjhEntity.getLeadername().equals("")) {
                hql.append(" and y.leadername like :leadername ");
                args.put("leadername", "" + xcjhEntity.getLeadername() + "");
            }
            if (xcjhEntity.getDrafetdate() != null && !xcjhEntity.getDrafetdate().equals("")) {
                hql.append(" and y.drafetdate like :drafetdate ");
                args.put("drafetdate", "" + xcjhEntity.getDrafetdate() + "");
            }
//            if (xcjhEntity.getDrafepeoplename() != null && !xcjhEntity.getDrafepeoplename().equals("")) {
//                hql.append(" and y.drafepeoplename like :drafepeoplename ");
//                args.put("drafepeoplename", "" + xcjhEntity.getDrafepeoplename() + "");
//            }
            if (xcjhEntity.getPlanstatus() != null && !xcjhEntity.getPlanstatus().equals("")) {
                hql.append(" and y.planstatus like :planstatus ");
                args.put("planstatus", "" + xcjhEntity.getPlanstatus() + "");
            }
        }
        if(userRoleName != null && !userRoleName.equals("")){
            if(userRoleName.equals("管理员")){

            }else{
                hql.append("and y.drafepeopleid = :drafepeopleid");
                args.put("drafepeopleid",""+userId+"");
            }
        }
        hql.append(" order by y.id desc ");
        List<ThyxcHdxcXcjhEntity> l = null;
        try {
            l = this.findPageByJPQL(hql.toString(), args, pageBean);
        } catch (Exception e) {
            System.out.println("SQL语句错误");
            System.out.println("e" + e);
        }
        if (l != null && l.size() != 0) {
            return l;
        }
        return null;
    }

    /**
     * Description :删除巡查计划
     *
     * @param jhId 巡查计划
     * @return String
     * @author：hj
     * @Create 2018-4-2 20:10
     */
    @Override
    public void deleteXcjh(String jhId) {
        String sql=" delete from T_HYXC_HDXC_XCJH where id = '"+jhId+"' ";
        this.updateBySql(sql);
    }

    /**
     * Description :巡查计划详情
     *
     * @param jhId 巡查计划
     * @return String
     * @author：hj
     * @Create 2018-4-2 20:30
     */
    @Override
    public ThyxcHdxcXcjhEntity fetchXcjhDetail(String jhId) {
        if(StringUtil.isNotBlank(jhId)){
            String sql=" from ThyxcHdxcXcjhEntity y where 1=1  and id='"+jhId+"'";
            ThyxcHdxcXcjhEntity xcjhEntity = new ThyxcHdxcXcjhEntity();
            List<ThyxcHdxcXcjhEntity> l = null;
            try{
                l = this.findByJPQL(sql, null);
            }catch(Exception e){
                System.out.println("SQL语句错误");
                System.out.println("e"+e);
            }
            if(l != null && l.size()!=0){
                xcjhEntity = (ThyxcHdxcXcjhEntity) l.get(0);
            }
            return xcjhEntity;
        }
        return null;
    }

    @Override
    public List<ThyxcHdxcXcjhEntity> fetchXcjhtShList(ThyxcHdxcXcjhEntity xcjhEntity,
                                                      PageBean pageBean,
                                                      String userId,
                                                      String userRoleName) {
        StringBuffer hql = new StringBuffer(" from ThyxcHdxcXcjhEntity y where 1=1 and y.planstatus ='未审核' ");
        Map<String, Object> args = new HashMap<String, Object>();
        if (xcjhEntity != null) {
            if (xcjhEntity.getPatrolname() != null && !xcjhEntity.getPatrolname().equals("")) {
                hql.append(" and y.patrolname like :patrolname ");
                args.put("patrolname", "" + xcjhEntity.getPatrolname() + "");
            }
            if (xcjhEntity.getFillingdw() != null && !xcjhEntity.getFillingdw().equals("")) {
                hql.append(" and y.fillingdw like :fillingdw ");
                args.put("fillingdw", "" + xcjhEntity.getFillingdw() + "");
            }
            if (xcjhEntity.getLeadername() != null && !xcjhEntity.getLeadername().equals("")) {
                hql.append(" and y.leadername like :leadername ");
                args.put("leadername", "" + xcjhEntity.getLeadername() + "");
            }
            if (xcjhEntity.getDrafetdate() != null && !xcjhEntity.getDrafetdate().equals("")) {
                hql.append(" and y.drafetdate like :drafetdate ");
                args.put("drafetdate", "" + xcjhEntity.getDrafetdate() + "");
            }
            if (xcjhEntity.getDrafepeoplename() != null && !xcjhEntity.getDrafepeoplename().equals("")) {
                hql.append(" and y.drafepeoplename like :drafepeoplename ");
                args.put("drafepeoplename", "" + xcjhEntity.getDrafepeoplename() + "");
            }

        }

        hql.append(" order by y.id desc ");
        List<ThyxcHdxcXcjhEntity> l = null;
        try {
            l = this.findPageByJPQL(hql.toString(), args, pageBean);
        } catch (Exception e) {
            System.out.println("SQL语句错误");
            System.out.println("e" + e);
        }
        if (l != null && l.size() != 0) {
            return l;
        }
        return null;
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
    public List<ThyxcHdxcXcjhEntity> fetchChxcList(ThyxcHdxcXcjhEntity xcjhEntity,
                                                   PageBean pageBean,
                                                   String userName,
                                                   String userRoleName) {
        StringBuffer hql = new StringBuffer(" from ThyxcHdxcXcjhEntity y where 1=1 and y.planstatus ='审核通过' or y.planstatus = '已巡查' ");
        Map<String, Object> args = new HashMap<String, Object>();
        if (xcjhEntity != null) {
            if (xcjhEntity.getPatrolname() != null && !xcjhEntity.getPatrolname().equals("")) {
                hql.append(" and y.patrolname like :patrolname ");
                args.put("patrolname", "" + xcjhEntity.getPatrolname() + "");
            }
            if (xcjhEntity.getFillingdw() != null && !xcjhEntity.getFillingdw().equals("")) {
                hql.append(" and y.fillingdw like :fillingdw ");
                args.put("fillingdw", "" + xcjhEntity.getFillingdw() + "");
            }
            if (xcjhEntity.getLeadername() != null && !xcjhEntity.getLeadername().equals("")) {
                hql.append(" and y.leadername like :leadername ");
                args.put("leadername", "" + xcjhEntity.getLeadername() + "");
            }
            if (xcjhEntity.getDrafetdate() != null && !xcjhEntity.getDrafetdate().equals("")) {
                hql.append(" and y.drafetdate like :drafetdate ");
                args.put("drafetdate", "" + xcjhEntity.getDrafetdate() + "");
            }
            if (xcjhEntity.getDrafepeoplename() != null && !xcjhEntity.getDrafepeoplename().equals("")) {
                hql.append(" and y.drafepeoplename like :drafepeoplename ");
                args.put("drafepeoplename", "" + xcjhEntity.getDrafepeoplename() + "");
            }
            if (xcjhEntity.getPlanstatus() != null && !xcjhEntity.getPlanstatus().equals("")) {
                hql.append(" and y.planstatus like :planstatus ");
                args.put("planstatus", "" + xcjhEntity.getPlanstatus() + "");
            }
        }
        if(userRoleName != null && !userRoleName.equals("")){
            if(("管理员").equals(userRoleName)){

            }else{
                hql.append("and y.leadername like :leadername or y.peoplename like :peoplename");
                args.put("leadername",""+userName+"");
                args.put("peoplename",""+userName+"");
            }
        }
        hql.append(" order by y.id desc ");
        List<ThyxcHdxcXcjhEntity> l = null;
        try {
            l = this.findPageByJPQL(hql.toString(), args, pageBean);
        } catch (Exception e) {
            System.out.println("SQL语句错误");
            System.out.println("e" + e);
        }
        if (l != null && l.size() != 0) {
            return l;
        }
        return null;
    }

    /**
     * Description :统计该用户已审核但未巡查的任务数
     *
     * @param userName     用户名
     * @param userRoleName 用户角色
     * @return
     * @author：hj
     * @Create 2018-4-23 15:24
     */
    @Override
    public int fetchYjrws(String userName, String userRoleName) {
        int count=0;
        String sql="select count(id) from T_HYXC_HDXC_XCJH t " +
                "where 1 =1 ";
        if(StringUtil.isNotBlank(userName) && StringUtil.isNotBlank(userRoleName)){
            if(("管理员").equals(userRoleName)){

            }else {
                sql += "and t.leadername like '%"+userName+"%' or t.peoplename like '%"+userName+"%' ";
            }
            sql += "and t.planstatus ='审核通过'";
        List<?> l = null;
        try{
            l = this.findBySQL(sql);
        }catch(Exception e){
            System.out.println("SQL语句错误");
            System.out.println("e"+e);
        }
        if(l != null && l.size()!=0){
            count = Integer.parseInt(l.get(0).toString());
        }
        return count;
    }
        return 0;
    }


}
