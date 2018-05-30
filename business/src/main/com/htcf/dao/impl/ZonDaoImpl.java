package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.htcf.entity.*;
import com.htcf.util.StringUtil;
import org.springframework.stereotype.Repository;

import com.htcf.dao.IZonDao;
import com.htcf.util.PageBean;

/**
 * @author hj
 * @date 2017-8-24
 *
 */
@Repository(value="zonDao")
public class ZonDaoImpl extends BaseDAOImpl<Object, Serializable> implements IZonDao {

	/**
	 * 
	Description :用海项目信息列表
	@param hygnqhXxgl THYsyywHygnqhXxgl
	@return List
	@Author：yinying
	@Create 2017-8-15 下午06:34:48
	 */
	@Override
	public List<?> fetchGnqhList(PageBean pageBean, THYsyywHygnqhXxgl hygnqhXxgl) {
		StringBuffer hql = new StringBuffer("select r.id,r.addtime,r.lastupdatetime,r.addusername, r.adduserid,\n" +
				"(select d.value from base_dictionary d where d.key='功能区划分级' and d.dm=r.yjlmc) yjlmc,\n" +
				"(select d.value from base_dictionary d where d.key='功能区划二级' and d.dm=r.ejlmc) ejlmc,\n" +
				"r.gnqhmc,r.ghmj,r.kzldm,r.dlfwmc,r.syyq,r.hjbhyq,r.szd,r.axcd,\n" +
				"(select d.value from base_dictionary d where d.key='项目位置' and d.dm=r.xzqy) xzqy,r.updateusername,r.updateuserid\n" +
				"from T_HYSYYW_HYGNQH_XXGL r where 1=1 ");
		Map<String, Object> args = new HashMap<String, Object>(16);

		if( null != hygnqhXxgl){
			if ( StringUtil.isNotBlank(hygnqhXxgl.getGnqhmc()) ) {
				hql.append(" and r.gnqhmc like :gnqhmc ");
				args.put("gnqhmc", "%" + hygnqhXxgl.getGnqhmc() + "%");
			}
			if ( StringUtil.isNotBlank(hygnqhXxgl.getXzqy()) ) {
				hql.append(" and r.xzqy like :xzqy ");
				args.put("xzqy", "%" + hygnqhXxgl.getXzqy() + "%");
			}
			if ( StringUtil.isNotBlank(hygnqhXxgl.getYjlmc()) ) {
				hql.append(" and r.yjlmc like :yjlmc ");
				args.put("yjlmc", "%" + hygnqhXxgl.getYjlmc() + "%");
			}
			if ( StringUtil.isNotBlank(hygnqhXxgl.getEjlmc()) ) {
				hql.append(" and r.ejlmc like :ejlmc ");
				args.put("ejlmc", "%" + hygnqhXxgl.getEjlmc() + "%");
			}
		}
		hql.append("order by r.id desc");
		System.out.println("=-=-=-======"+hql);
		List<?> l = null;
		try{
			l = this.findBySQL(hql.toString(),args);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
		
	}

	/**
	 * 查询功能区界址点坐标信息
	 *
	 * @param xmID 项目id
	 * @return
	 */
	@Override
	public List<XxglKjxxEntity> fetchXxglJzd(String xmID) {
		String hql="from XxglKjxxEntity where 1=1";
		if(xmID != null && !xmID.equals("")){
			hql += " and gnqhid = '"+xmID+"'";
		}
		hql+="order by xsxx";
		List<XxglKjxxEntity> l = this.findByJPQL(hql,null);
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}

	/**
	 * 删除界址点
	 *
	 * @param jzdID
	 */
	@Override
	public void deleteXxglJzd(String jzdID) {
		String sql1 = " delete from T_HYSYYW_HYGNQH_XXGL_KJXX where id = '"+jzdID+"' ";
		try{
			int num1 = this.updateBySql(sql1);
			System.out.println("num1="+num1);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}

	/**
	 * 删除界址点all
	 *
	 * @param xmID
	 */
	@Override
	public void deleteXxglJzdAll(String xmID) {
		String sql1 = " delete from T_HYSYYW_HYGNQH_XXGL_KJXX where gnqhid = '"+xmID+"'";

		try{
			int num1 = this.updateBySql(sql1);
			System.out.println("num1="+num1);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}

	/**
	 *
	Description :查询功能区划详情
	@param xmID 功能区id
	@return 功能区
	@Author：hj
	@Create 2017-8-29下午03:06:06
	 */
	@Override
	public THYsyywHygnqhXxgl fetchGnqhDetail(String xmID) {
		String sql = "from THYsyywHygnqhXxgl where 1=1 ";
		
		if(xmID != null && !"".equals(xmID)){
			sql += " and id = '"+xmID+"'";
		}

		THYsyywHygnqhXxgl hygnqhXxgl = new THYsyywHygnqhXxgl();
		List<?> l = this.findByJPQL(sql, null);
		if(l != null && l.size()!=0){
			hygnqhXxgl = (THYsyywHygnqhXxgl) l.get(0);
		}
		
		return hygnqhXxgl;
		
	}

	/**
	 * Description :更新功能区划信息
	 *
	 * @param hygnqhXxgl  功能区划信息
	 * @return 功能区划信息
	 * @author：hj
	 * @Create 2017-8-31 16:22
	 */
	@Override
	public void UpdateGnqh(THYsyywHygnqhXxgl hygnqhXxgl) {
		this.update(hygnqhXxgl);
	}

	/**
	 * Description :修改实体
	 *
	 * @param obj 实体
	 * @return 实体
	 * @Author：hj
	 * @Create 2017-8-31 16:36
	 */
	@Override
	public void UpdateObj(Object obj) {
		try {
			this.update(obj);
		}catch (Exception e){
			e.printStackTrace();
		}

	}

	/**
	 * Description :s删除功能区划
	 * @Author：hj
	 * @Create 2017-8-31 18:10
	 */
	@Override
	public void deleteGnqh(String xmID) {
		String sql1 = " delete from T_HYSYYW_HYGNQH_XXGL where id = '"+xmID+"' ";
		try {
			int num1 = this.updateBySql(sql1);
			System.out.println("num1="+num1);
		}catch (Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		String sql2 = " delete from T_HYSYYW_HYGNQH_XXGL_KJXX where gnqhid = '"+xmID+"' ";

		try{
			int num2 = this.updateBySql(sql2);
			System.out.println("删除*****界址点坐标num2="+num2);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}

	/**
	 * Description :查询功能区辅助划分信息
	 *
	 * @param hysyywHygnqhFzhf  划分信息
	 * @Author：hj
	 * @Create 2017-9-6 18:41
	 */
	@Override
	public List<?> fetchFzhf(THysyywHygnqhFzhf hysyywHygnqhFzhf,PageBean pageBean) {
		StringBuffer hql = new StringBuffer("from THysyywHygnqhFzhf f where 1=1 ");
		Map<String,Object> args = new HashMap<String,Object>(16);
		System.out.println("====================="+hql);

		if( null!=hysyywHygnqhFzhf ){
			if ( StringUtil.isNotBlank(hysyywHygnqhFzhf.getGnqhmc()) ) {
				hql.append("and f.gnqhmc like :gnqhmc");
				args.put("gnqhmc","%"+hysyywHygnqhFzhf.getGnqhmc()+"%");
			}
			if ( StringUtil.isNotBlank(hysyywHygnqhFzhf.getFzhfmc()) ) {
				hql.append("and f.fzhfmc like :fzhfmc");
				args.put("fzhfmc","%"+hysyywHygnqhFzhf.getFzhfmc()+"%");
			}
			if ( StringUtil.isNotBlank(hysyywHygnqhFzhf.getBz()) ) {
				hql.append("and f.bz like :bz");
				args.put("bz","%"+hysyywHygnqhFzhf.getBz()+"%");
			}

		}
		hql.append(" order by f.id desc") ;
		List<?> l = this.findPageByJPQL(hql.toString(), args,pageBean);
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}

	/**
	 * Description :删除辅助功能区划
	 *
	 * @param xmID  辅助功能区划
	 * @Author：hj
	 * @Create 2017-9-11 9:49
	 */
	@Override
	public void deleteFzqh(String xmID) {

		String sql1 = " delete from T_HYSYYW_HYGNQH_FZHF where id = '"+xmID+"' ";
		int num1 = this.updateBySql(sql1);
		System.out.println("num1="+num1);
	}

	/**
	 * Description :辅助功能区划详情
	 *
	 * @param xmID xmid
	 * @Author：hj
	 * @Create 2017-9-11 17:02
	 */
	@Override
	public THysyywHygnqhFzhf fetchFzhfDetail(String xmID) {
		String sql = "from THysyywHygnqhFzhf where 1=1 ";
		if(xmID != null && !"".equals(xmID)){
			sql += " and id = '"+xmID+"'";
		}
		THysyywHygnqhFzhf hysyywHygnqhFzhf = new THysyywHygnqhFzhf();
		List<?> l = this.findByJPQL(sql,null);
		if(l != null && l.size()!=0){
			hysyywHygnqhFzhf = (THysyywHygnqhFzhf) l.get(0);
		}
		return hysyywHygnqhFzhf;
	}

	/**
	 * Description :选择功能区划名称
	 *
	 * @Author：hj
	 * @Create 2017-9-15 15:00
	 */
	@Override
	public List<?> fetchMcList() {
		String sql="select id,gnqhmc from T_HYSYYW_HYGNQH_XXGL  order by id desc ";
		List<?> l = this.findBySQL(sql);
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}

	/**
	 * Description :
	 *
	 * @param hygnqhFb 发布
	 * @param pageBean pagebean
	 * @return List
	 * @author：hj
	 * @Create 2017-10-25 15:22
	 */
	@Override
	public List<ThysyywHygnqhFb> fetchGnqhfbList(ThysyywHygnqhFb hygnqhFb, PageBean pageBean) {
		StringBuilder hql = new StringBuilder(" from ThysyywHygnqhFb b where 1=1 ");
		Map<String,Object> args = new HashMap<String, Object>(16);

		if(  null !=hygnqhFb){
			if(StringUtil.isNotBlank(hygnqhFb.getBt())){
				hql.append("and b.bt like :bt");
				args.put("bt","%"+hygnqhFb.getBt()+"%");
			}
			if(StringUtil.isNotBlank(hygnqhFb.getFbr())){
				hql.append("and b.fbr like :fbr");
				args.put("fbr","%"+hygnqhFb.getFbr()+"%");
			}
		}
		hql.append(" order by b.id desc");
		List<ThysyywHygnqhFb> l = this.findPageByJPQL(hql.toString(),args,pageBean);
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}

	/**
	 * Description :
	 *
	 * @param xmID 发布编号
	 * @return 发布详情
	 * @author：hj
	 * @Create 2017-10-26 14:07
	 */
	@Override
	public ThysyywHygnqhFb fetchFbDetail(String xmID) {
		String sql = "from ThysyywHygnqhFb where 1=1 ";
		if(xmID != null && !"".equals(xmID)){
			sql += " and id = '"+xmID+"'";
		}
		ThysyywHygnqhFb hygnqhFb = new ThysyywHygnqhFb();
		List<?> l = this.findByJPQL(sql,null);
		if(l != null && l.size()!=0){
			hygnqhFb = (ThysyywHygnqhFb) l.get(0);
		}
		return hygnqhFb;
	}

	/**
	 * Description :删除发布
	 *
	 * @param xmID 发布id

	 * @author：hj
	 * @Create 2017-10-26 19:04
	 */
	@Override
	public void deleteFb(String xmID) {
		String sql1 = " delete from T_HYSYYW_HYGNQH_FB where id = '"+xmID+"' ";
		int num1 = this.updateBySql(sql1);
		System.out.println("num1="+num1);
	}

	/**
	 * Description :查询建立利用与跟踪保护中的功能区名称
	 *
	 * @return list
	 * @author：hj
	 * @Create 2017-11-23 15:45
	 */
	@Override
	public List<?> fetchLybhGnqmc() {
		String sql="select id,gnqhmc from T_HYSYYW_HYGNQH_XZGZ  order by id desc ";
		List<?> l = this.findBySQL(sql);
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}

    @Override
    public List<?> fetchLybh(Xzgz xzgz, PageBean pageBean) {
	    StringBuilder sql = new StringBuilder("select x.id,x.gnqhmc,x.gnqhmcid,(select d.value from base_dictionary d where d.key='开发规模' and d.dm=x.kfgm) kfgm," +
				" x.kfgmbfb,x.kfgmsm,(select d.value from base_dictionary d where d.key='功能区质量变化' and d.dm=x.gnqzlbh) gnqzlbh, " +
				" x.zlbhqksm,x.bz,(select d.value from base_dictionary d where d.key='对邻近功能区影响程度' and d.dm=x.yxcd) yxcd,x.yxcdsm," +
				" x.dw,x.examinetime,x.examineperson from T_HYSYYW_HYGNQH_XZGZ x where 1=1 ") ;
        Map <String,Object> args = new HashMap<String, Object>(16);
	    if( xzgz !=null ){
	        if(StringUtil.isNotBlank(xzgz.getGnqhmc())){
                sql.append(" and x.gnqhmc like :gnqhmc");
                args.put("gnqhmc","%"+xzgz.getGnqhmc()+"%");
            }
            if(StringUtil.isNotBlank(xzgz.getKfgm())){
                sql.append(" and x.kfgm like :kfgm");
                args.put("kfgm","%"+xzgz.getKfgm()+"%");
            }
            if(StringUtil.isNotBlank(xzgz.getGnqzlbh())){
                sql.append(" and x.gnqzlbh like :gnqzlbh");
                args.put("gnqzlbh","%"+xzgz.getGnqzlbh()+"%");
            }
            if(StringUtil.isNotBlank(xzgz.getYxcd())){
                sql.append(" and x.yxcd like :yxcd");
                args.put("yxcd","%"+xzgz.getYxcd()+"%");
            }
        }
        return this.findPageBySQL(sql.toString(),pageBean,args);
    }

    @Override
    public boolean delXzgzById(Xzgz xzgz) {

		if (null != xzgz) {
			String hql = "delete from Xzgz x where x.id = :id ";
			Map<String, Object> args = new HashMap<String, Object>(16);
			args.put("id", xzgz.getId());
			try {
				int n = this.updateByJPQL(hql, args);
				return n > 0;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		} else {
			return false;
		}
    }

	@Override
	public Xzgz fetchXzgzByid(Xzgz xzgz) {
		System.out.println("现状跟踪的id"+xzgz.getId());
		String hql = "from Xzgz x where x.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>(16);
		args.put("id", xzgz.getId());
		return (Xzgz) this.findUniqueResultByHql(hql, args);
	}

	@Override
	public boolean updateXzgz(Xzgz xzgz) {
        try {
            this.update(xzgz);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

	@Override
	public List<?> fetchZxjd(ThysyywHygnqhZxqkjdEntity zxqkjdEntity, PageBean pageBean) {
		StringBuilder sql = new StringBuilder("select x.id,x.gnqhmc,x.gnqhmcid,x.yhxmmc," +
				" x.wgyhmj,x.wgyy,x.fxdw,x.fxr,x.fxsj,x.bz from T_HYSYYW_HYGNQH_ZXQKJD x where 1=1" );
		Map <String,Object> args = new HashMap<String, Object>(16);
		if(null != zxqkjdEntity){
			if(StringUtil.isNotBlank(zxqkjdEntity.getGnqhmc())){
				sql.append(" and x.gnqhmc like :gnqhmc");
				args.put("gnqhmc","%"+zxqkjdEntity.getGnqhmc()+"%");
			}
			if(StringUtil.isNotBlank(zxqkjdEntity.getYhxmmc())){
				sql.append(" and x.yhxmmc like :yhxmmc");
				args.put("yhxmmc","%"+zxqkjdEntity.getYhxmmc()+"%");
			}
			if(StringUtil.isNotBlank(zxqkjdEntity.getFxdw())){
				sql.append(" and x.fxdw like :fxdw");
				args.put("fxdw","%"+zxqkjdEntity.getFxdw()+"%");
			}
			if(StringUtil.isNotBlank(zxqkjdEntity.getFxsj())){
				sql.append(" and x.fxsj like :fxsj");
				args.put("fxsj","%"+zxqkjdEntity.getFxsj()+"%");
			}
		}
		return this.findPageBySQL(sql.toString(),pageBean,args);
	}

	@Override
	public boolean removeZxjdById(ThysyywHygnqhZxqkjdEntity zxqkjdEntity) {
		if(null == zxqkjdEntity  ){
			return false;
		}
		String hql = "delete from ThysyywHygnqhZxqkjdEntity x where x.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>(16);
		args.put("id", zxqkjdEntity.getId());
		try {
			int n = this.updateByJPQL(hql, args);
			return n > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public ThysyywHygnqhZxqkjdEntity loadZxqkjdById(ThysyywHygnqhZxqkjdEntity zxqkjdEntity) {
		System.out.println("执行情况监督的id"+zxqkjdEntity.getId());
		String hql = "from ThysyywHygnqhZxqkjdEntity x where x.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>(16);
		args.put("id", zxqkjdEntity.getId());
		return (ThysyywHygnqhZxqkjdEntity) this.findUniqueResultByHql(hql, args);
	}

    @Override
    public List<Object[]> fetchtj() {
		String sql="select fxdw,count(fxdw)gs,sum(wgyhmj) from T_HYSYYW_HYGNQH_ZXQKJD group by fxdw";
		List<Object[]> l = this.findBySQL(sql);
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
    }

	@Override
	public List<Object[]> fetchtjXzgzKfgm() {
		String sql = "select \n" +
				"(select d.value from base_dictionary d where d.key='开发规模' and d.dm=t.kfgm)kfgm,count(kfgm)\n" +
				" from T_HYSYYW_HYGNQH_XZGZ t group by kfgm ";
		List<Object[]> l = this.findBySQL(sql);
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}

	@Override
	public List<Object[]> fetchtjXzgzZlbh() {
		String sql = "select \n" +
				"(select d.value from base_dictionary d where d.key='功能区质量变化' and d.dm=t.gnqzlbh)gnqzlbh,count(gnqzlbh)\n" +
				" from T_HYSYYW_HYGNQH_XZGZ t group by gnqzlbh order by t.gnqzlbh";
		List<Object[]> l = this.findBySQL(sql);
		if(l != null && l.size()!=0){
			return l;
		}
 		return null;
	}

	@Override
	public List<Object[]> fetchtjXzgzYxcd() {
		String sql = " select \n" +
				"(select d.value from base_dictionary d where d.key='对邻近功能区影响程度' and d.dm=t.yxcd)yxcd,count(yxcd)\n" +
				" from T_HYSYYW_HYGNQH_XZGZ t group by yxcd order by t.yxcd";
		List<Object[]> l = null;
		try{
			 l = this.findBySQL(sql);
		}catch (Exception e){
            System.out.println("SQL语句错误");
            System.out.println("e"+e);
        }
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}

}
