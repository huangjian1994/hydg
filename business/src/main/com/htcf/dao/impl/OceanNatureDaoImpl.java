package com.htcf.dao.impl;

import com.htcf.dao.OceanNatureDao;
import com.htcf.entity.ThysyywHysydtHyzrbhqEntity;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author by hj on 2018-1-5.
 */
@Repository(value="natureDao")
public class OceanNatureDaoImpl extends BaseDAOImpl<Object, Serializable> implements OceanNatureDao{
    /**
     * Description :
     *
     * @param hyzrbhqEntity 自然保护区实体
     * @param pageBean      pageBean
     * @return hyzrbhqEntity
     * @author：hj
     * @Create 2018-1-5 16:36
     */
    @Override
    public List<ThysyywHysydtHyzrbhqEntity> fetchZrbhq(ThysyywHysydtHyzrbhqEntity hyzrbhqEntity, PageBean pageBean) {
        StringBuilder hql = new StringBuilder( "from ThysyywHysydtHyzrbhqEntity b where 1=1 ");
        Map<String,Object> args = new HashMap<String, Object>(16);

        if(null != hyzrbhqEntity){
            if(StringUtil.isNotBlank(hyzrbhqEntity.getBhqmc())){
                hql.append(" and b.bhqmc like :bhqmc");
                args.put("bhqmc","%"+hyzrbhqEntity.getBhqmc()+"%");
            }if(StringUtil.isNotBlank(hyzrbhqEntity.getXzqh())){
                hql.append(" and b.fl like :fl");
                args.put("xzqh","%"+hyzrbhqEntity.getFl()+"%");
            }if(StringUtil.isNotBlank(hyzrbhqEntity.getFl())){
                hql.append(" and b.zgbm like :zgbm");
                args.put("zgbm","%"+hyzrbhqEntity.getZgbm()+"%");
            }if(StringUtil.isNotBlank(hyzrbhqEntity.getPjsj())){
                hql.append(" and b.pjsj like :pjsj");
                args.put("pjsj","%"+hyzrbhqEntity.getPjsj()+"%");
            }
        }
        hql.append(" order by b.id desc") ;
        List<ThysyywHysydtHyzrbhqEntity> l = this.findPageByJPQL(hql.toString(),args,pageBean);
        if(l != null && l.size()!=0){
            return l;
        }
        return null;
    }

    /**
     * Description :根据id删除保护区信息
     *
     * @param hyzrbhqEntity 保护区id
     * @author：hj
     * @Create 2018-1-10 10:20
     */
    @Override
    public boolean removeBhqId(ThysyywHysydtHyzrbhqEntity hyzrbhqEntity) {
        if(null == hyzrbhqEntity  ){
            return false;
        }
        String hql = "delete from ThysyywHysydtHyzrbhqEntity b where b.id = :id ";
        Map<String, Object> args = new HashMap<String, Object>(16);
        args.put("id", hyzrbhqEntity.getId());
        try {
            int n = this.updateByJPQL(hql, args);
            return n > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Description :根据id查询保护区详细信息
     *
     * @param hyzrbhqEntity 保护区信息
     * @return 保护区信息
     * @author：hj
     * @Create 2018-1-10 10:58
     */
    @Override
    public ThysyywHysydtHyzrbhqEntity loadBhqById(ThysyywHysydtHyzrbhqEntity hyzrbhqEntity) {
        System.out.println("保护区的id"+hyzrbhqEntity.getId());
        String hql = "from ThysyywHysydtHyzrbhqEntity b where b.id = :id ";
        Map<String, Object> args = new HashMap<String, Object>(16);
        args.put("id", hyzrbhqEntity.getId());
        return (ThysyywHysydtHyzrbhqEntity) this.findUniqueResultByHql(hql, args);
    }
}
