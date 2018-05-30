package com.htcf.dao.impl;

import com.htcf.dao.PermitDao;
import com.htcf.entity.Xzxkxx;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;
import org.springframework.stereotype.Repository;
import java.io.Serializable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author by hj on 2017-11-20.
 */
@Repository("permitDao")
public class PermitDaoImpl extends BaseDAOImpl<Xzxkxx, Serializable>  implements PermitDao {

    @Override
    public List<?> fetchXkxxList(Xzxkxx xzxkxx,PageBean pageBean){
        StringBuffer sql = new StringBuffer("select * from swxzsp.v_t_hy_eventinfo s where 1=1");
        Map<String,Object> args = new HashMap<String, Object>();
        if(xzxkxx !=null){
            if(StringUtil.isNotBlank(xzxkxx.getItemname())){
                sql.append(" and s.itemname like :itemname");
                args.put("itemname","%"+xzxkxx.getItemname()+"%");
            }
            if(StringUtil.isNotBlank(xzxkxx.getApplier())){
                sql.append(" and s.applier like :applier");
                args.put("applier","%"+xzxkxx.getApplier()+"%");
            }
            if(StringUtil.isNotBlank(xzxkxx.getProjectname())){
                sql.append(" and s.projectname like :projectname");
                args.put("projectname","%"+xzxkxx.getProjectname()+"%");
            }
            if(StringUtil.isNotBlank(xzxkxx.getDivision())){
                sql.append(" and s.division like :division");
                args.put("division","%"+xzxkxx.getDivision()+"%");
            }
        }

        List<?> l = this.findPageBySQL(sql.toString(),pageBean,args);
        if(l != null && l.size()!=0){
            return l;
        }
        return null;
    }

    /**
     * Description :详情页面
     *
     * @param xzxkxx 行政许可
     * @return
     * @author：hj
     * @Create 2017-11-21 17:25
     */
    @Override
    public List<?> permitDetail(Xzxkxx xzxkxx) {
        StringBuffer sql = new StringBuffer(" select * from swxzsp.v_t_hy_eventinfo s where 1=1");
        Map<String,Object> args = new HashMap<String, Object>();
        if(xzxkxx !=null) {
            if (StringUtil.isNotBlank(xzxkxx.getProjectid())) {
                sql.append(" and s.projectid like :projectid");
                args.put("projectid",  xzxkxx.getProjectid() );
            }
        }
        List<?> l = this.findBySQL(sql.toString(),args);
        if(l != null && l.size()!=0){
            return l;
        }
        return null;
    }


}
