package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.htcf.dao.DgIffDao;
import com.htcf.entity.THysyywHysydtHaxDctj;
import com.htcf.entity.THysyywHysydtHaxGhxx;
import com.htcf.entity.THysyywHysydtHaxJcxx;
import com.htcf.entity.THysyywHysydtHaxJsjc;
import com.htcf.entity.THysyywHysydtHaxZzxf;
import com.htcf.util.PageBean;
import com.htcf.entity.SearchForm;
/**
 * 海岸线管理
 * 
 * 海岸线基础信息管理、海岸线动态监视监测管理、海岸线调查统计
 * @author zxf
 *
 *海岸线规划信息管理
 *@author yinying
 *
 */
@Repository(value="dgiffDao")
public class DgIffDaoImpl  extends BaseDAOImpl<Object, Serializable> implements DgIffDao{
	
	/*****************海岸线基础信息管理*********************/
	public List<?> getHaxJcxxList1(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx,PageBean pageBean){
		String sql=
			"select id,\n" +
			"       name,\n" + 
			"       xzqh,\n" + 
			"       (select d.value\n" + 
			"          from base_dictionary d\n" + 
			"         where d.key = '行政区划'\n" + 
			"           and d.dm = xzqh),\n" + 
			"       wz,\n" + 
			"       cd,\n" + 
			"       jd,\n" + 
			"       wd\n" + 
			"  from T_HYSYYW_HYSYDT_HAX_JCXX t where 1=1";
		if(thysyywHysydtHaxJcxx != null){
			if(thysyywHysydtHaxJcxx.getId() != null && !thysyywHysydtHaxJcxx.getId().equals("")){
				sql += " and id = '"+thysyywHysydtHaxJcxx.getId()+"'";
			}
		}
		sql += " order by id desc";
		List<?> l = null;
		try{
			l = this.findPageBySQL(sql, pageBean);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	public List<THysyywHysydtHaxJcxx> getHaxJcxxList(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx,PageBean pageBean){
		String sql="from THysyywHysydtHaxJcxx where 1=1";
		if(thysyywHysydtHaxJcxx != null){
			if(thysyywHysydtHaxJcxx.getId() != null && !thysyywHysydtHaxJcxx.getId().equals("")){
				sql += " and id = '"+thysyywHysydtHaxJcxx.getId()+"'";
			}
		}
		sql += " order by id desc";
		List<THysyywHysydtHaxJcxx> l = null;
		try{
			l = this.findPageByJPQL(sql, pageBean);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	public boolean saveHaxInfoByHax(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx){
		try{
			this.save(thysyywHysydtHaxJcxx);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		return true;
	}
	public List<?> getHaxJcxxListByEntity(
			THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx, PageBean pageBean) {
		String sql="select id,\n" +
				"       name,\n" + 
				"       xzqh,\n" + 
				"       (select d.value\n" + 
				"          from base_dictionary d\n" + 
				"         where d.key = '行政区划'\n" + 
				"           and d.dm = xzqh),\n" + 
				"       wz,\n" + 
				"       cd,\n" + 
				"       jd,\n" + 
				"       wd\n" + 
				"  from T_HYSYYW_HYSYDT_HAX_JCXX t where 1=1";
		if(thysyywHysydtHaxJcxx != null){
			if(thysyywHysydtHaxJcxx.getXzqh() != null && !thysyywHysydtHaxJcxx.getXzqh().equals("")){
				sql += " and xzqh = '"+thysyywHysydtHaxJcxx.getXzqh()+"'";
			}
			if(thysyywHysydtHaxJcxx.getName() != null && !thysyywHysydtHaxJcxx.getName().equals("")){
				sql += " and name like '%"+thysyywHysydtHaxJcxx.getName()+"%'";
			}
		}
		sql += " order by id desc ";
		List<?> l = null;
		try{
			l = this.findPageBySQL(sql, pageBean);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	public THysyywHysydtHaxJcxx getHaxJcxxInfoById(String id) {
		String sql="from THysyywHysydtHaxJcxx where 1=1";
		if(id != null && !id.equals("")){
			sql += " and id = '"+id+"'";
		}
		List<THysyywHysydtHaxJcxx> l = null;
		try{
			l = this.findPageByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		THysyywHysydtHaxJcxx th=new THysyywHysydtHaxJcxx();
		if(l != null && l.size()!=0){
			th = (THysyywHysydtHaxJcxx) l.get(0);
		}
		return th;
	}
	public void saveUpdateHaxInfo(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx) {
		try{
			this.update(thysyywHysydtHaxJcxx);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	public void deleteHaxInfoById(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx) {
		String sql1 = " delete from T_HYSYYW_HYSYDT_HAX_JCXX " +
				"where id = '"+thysyywHysydtHaxJcxx.getId()+"' ";
		try{
			int num1 = this.updateBySql(sql1);
			System.out.println("num1="+num1);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		//删除海岸线动态监视监测管理
		String sql2 = " delete from T_HYSYYW_HYSYDT_HAX_JSJC " +
				"where HAXID = '"+thysyywHysydtHaxJcxx.getId()+"' ";
		try{
			int num2 = this.updateBySql(sql2);
			System.out.println("num2="+num2);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		//海岸线调查统计
		String sql3 = " delete from T_HYSYYW_HYSYDT_HAX_DCTJ " +
				"where HAXID = '"+thysyywHysydtHaxJcxx.getId()+"' ";
		try{
			int num3 = this.updateBySql(sql3);
			System.out.println("num3="+num3);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	
	
	
	/*****************海岸线动态监视监测管理*********************/
	
	public List<THysyywHysydtHaxJsjc> getJsjcListByIdOrNull(
			THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc, PageBean pageBean) {
		String sql="from THysyywHysydtHaxJsjc where 1=1";
		if(thysyywHysydtHaxJsjc != null){
			if(thysyywHysydtHaxJsjc.getId() != null && !thysyywHysydtHaxJsjc.getId().equals("")){
				sql += " and id = '"+thysyywHysydtHaxJsjc.getId()+"'";
			}
		}
		sql += " order by id desc ";
		List<THysyywHysydtHaxJsjc> l = null;
		try{
			l = this.findPageByJPQL(sql, pageBean);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	public void saveJsjcInfo(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc) {
		try{
			this.save(thysyywHysydtHaxJsjc);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	public THysyywHysydtHaxJsjc getJsjcInfoById(String id) {
		String sql="from THysyywHysydtHaxJsjc where 1=1";
		if(id != null && !id.equals("")){
			sql += " and id = '"+id+"'";
		}
		List<THysyywHysydtHaxJsjc> l = null;
		try{
			l = this.findPageByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		THysyywHysydtHaxJsjc th=new THysyywHysydtHaxJsjc();
		if(l != null && l.size()!=0){
			th = (THysyywHysydtHaxJsjc) l.get(0);
		}
		return th;
	}
	public void saveUpdateJsjcInfo(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc) {
		try{
			this.update(thysyywHysydtHaxJsjc);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	public void deleteJsjcInfoById(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc) {
		String sql = " delete from T_HYSYYW_HYSYDT_HAX_JSJC where id = '"+thysyywHysydtHaxJsjc.getId()+"' ";
		try{
			int num = this.updateBySql(sql);
			System.out.println("num="+num);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	public List<THysyywHysydtHaxJsjc> getHaxJsjcListByEntity(
			THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc, PageBean pageBean) {
		String sql="from THysyywHysydtHaxJsjc where 1=1";
		if(thysyywHysydtHaxJsjc != null){
			if(thysyywHysydtHaxJsjc.getHaxname() != null && !thysyywHysydtHaxJsjc.getHaxname().equals("")){
				sql += " and haxname like '%"+thysyywHysydtHaxJsjc.getHaxname()+"%'";
			}
		}
		sql += " order by id desc ";
		List<THysyywHysydtHaxJsjc> l = null;
		try{
			l = this.findPageByJPQL(sql, pageBean);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/*****************海岸线调查统计*********************/
	
	public List<?> getDctjListByIdOrNull(
			THysyywHysydtHaxDctj thysyywHysydtHaxDctj, PageBean pageBean) {
		String sql=
			"select t.id,\n" +
			"       haxname,\n" + 
			"       adxh,\n" + 
			"       cd,\n" + 
			"       xzqh,\n" + 
			"       (select d.value\n" + 
			"          from base_dictionary d\n" + 
			"         where d.key = '行政区划'\n" + 
			"           and d.dm = xzqh),\n" + 
			"       wz,\n" + 
			"       byl,DCRQ,DCR\n" + 
			"  from t_hysyyw_hysydt_hax_dctj t where 1=1";
		if(thysyywHysydtHaxDctj != null){
			if(thysyywHysydtHaxDctj.getId() != null && !thysyywHysydtHaxDctj.getId().equals("")){
				sql += " and id = '"+thysyywHysydtHaxDctj.getId()+"'";
			}
		}
		sql += " order by id desc ";
		List<?> l = null;
		try{
			l = this.findPageBySQL(sql, pageBean);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}

	
    public List<?> getDictionaryListByKey(String key){
		String sql="select id,value,key from base_dictionary t where key ='"+key+"' order by id";
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if (l != null && l.size() != 0) {
			return l;
		}
		return null;
    }
	public void saveDctjInfo(THysyywHysydtHaxDctj thysyywHysydtHaxDctj) {
		try{
			this.save(thysyywHysydtHaxDctj);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	public THysyywHysydtHaxDctj getDctjById(String id) {
		String sql="from THysyywHysydtHaxDctj where 1=1";
		if(id != null && !id.equals("")){
			sql += " and id = '"+id+"'";
		}
		List<THysyywHysydtHaxDctj> l = null;
		try{
			l = this.findPageByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		THysyywHysydtHaxDctj dc=new THysyywHysydtHaxDctj();
		if(l != null && l.size()!=0){
			dc = (THysyywHysydtHaxDctj) l.get(0);
		}
		return dc;
	}
	public void saveUpdateDctjInfo(THysyywHysydtHaxDctj thysyywHysydtHaxDctj) {
		try{
			this.update(thysyywHysydtHaxDctj);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	public void deleteDctjInfoById(THysyywHysydtHaxDctj thysyywHysydtHaxDctj) {
		String sql = " delete from T_HYSYYW_HYSYDT_HAX_DCTJ where id = '"+thysyywHysydtHaxDctj.getId()+"' ";
		try{
			int num = this.updateBySql(sql);
			System.out.println("num="+num);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	public List<?> getHaxDctjListByEntity(
			THysyywHysydtHaxDctj thysyywHysydtHaxDctj, PageBean pageBean) {
		String sql=
			"select t.id,\n" +
			"       haxname,\n" + 
			"       adxh,\n" + 
			"       cd,\n" + 
			"       xzqh,\n" + 
			"       (select d.value\n" + 
			"          from base_dictionary d\n" + 
			"         where d.key = '行政区划'\n" + 
			"           and d.dm = xzqh),\n" + 
			"       wz,\n" + 
			"       byl,DCRQ,DCR\n" + 
			"  from t_hysyyw_hysydt_hax_dctj t where 1=1";

//			"from THysyywHysydtHaxDctj where 1=1";
		if(thysyywHysydtHaxDctj != null){
			if(thysyywHysydtHaxDctj.getHaxname() != null && !thysyywHysydtHaxDctj.getHaxname().equals("")){
				sql += " and haxname like '%"+thysyywHysydtHaxDctj.getHaxname()+"%'";
			}
		}
		sql += " order by id desc ";
		List<?> l = null;
		try{
			l = this.findPageBySQL(sql, pageBean);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/********海岸线规划信息管理******开始************/
	
	/**
	 * 
	Description :规划信息列表
	@param:@param searchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:02:01
	 */
	public List<?> fetchHaxGhxxList(SearchForm searchForm,PageBean pageBean){
		String sql=" from THysyywHysydtHaxGhxx where 1=1 ";
		if(searchForm != null){
			if(searchForm.getWjm() != null && !searchForm.getWjm().equals("")){
				sql += " and wjm like '%"+searchForm.getWjm().trim()+"%'";
			}
			if(searchForm.getWjlx() != null && !searchForm.getWjlx().equals("")){
				sql += " and wjlx = '"+searchForm.getWjlx().trim()+"'";
			}
		}
		sql += " order by id desc ";
		List<?> l = null;
		try{
			l = this.findPageByJPQL(sql, pageBean);
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
	 * 
	Description :规划信息详情
	@param:@param ghID
	@param:@return
	@return:THysyywHysydtHaxGhxx
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:01:55
	 */
	public THysyywHysydtHaxGhxx fetchHaxGhxxDetail(String ghID){
		String sql="from THysyywHysydtHaxGhxx where id='"+ghID+"'";
		List<?> l = null;
		try{
			l = this.findPageByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		THysyywHysydtHaxGhxx hysyywHysydtHaxGhxx=new THysyywHysydtHaxGhxx();
		if(l != null && l.size()!=0){
			hysyywHysydtHaxGhxx = (THysyywHysydtHaxGhxx) l.get(0);
		}
		return hysyywHysydtHaxGhxx;
	}
	/**
	 * 
	Description :删除规划信息
	@param:@param ghID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:03:06
	 */
	public void deleteHaxGhxx(String ghID){
		String sql="delete from T_HYSYYW_HYSYDT_HAX_GHXX where id='"+ghID+"'";
		try{
			int num = this.updateBySql(sql);
			System.out.println("num="+num);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	
	
	/**
	 * 
	Description :整治修复列表
	@param:@param searchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-13 上午11:22:58
	 */
	public List<?> fetchHaxZzxfList(SearchForm searchForm,PageBean pageBean){
		String sql=
			"select ID,HAXID,HAXMC,ADXH,SFSTXFYH,SFJAGZWQL,SFQYSJZZ,XFSJ,XFQK,\n" +
			"(select t.value from base_dictionary t where t.key='海岸线修复情况' and t.dm=XFQK)" +
			" from t_hysyyw_hysydt_hax_zzxf t where 1=1 ";

//			" from THysyywHysydtHaxZzxf where 1=1 ";
		if(searchForm != null){
			if(searchForm.getHaxmc() != null && !searchForm.getHaxmc().equals("")){
				sql += " and haxmc like '%"+searchForm.getHaxmc().trim()+"%'";
			}
			if(searchForm.getXfqk() != null && !searchForm.getXfqk().equals("")){
				sql += " and xfqk = '"+searchForm.getXfqk().trim()+"'";
			}
		}
		sql += " order by id desc ";
		List<?> l = null;
		try{
			l = this.findPageBySQL(sql, pageBean);
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
	 * 
	Description :整治修复详情
	@param:@param ghID
	@param:@return
	@return:THysyywHysydtHaxZzxf
	@throws
	@Author：yinying
	@Create 2017-11-13 上午11:27:34
	 */
	public THysyywHysydtHaxZzxf fetchHaxZzxfDetail(String zzID){
		String sql="from THysyywHysydtHaxZzxf where id='"+zzID+"'";
		List<?> l = null;
		try{
			l = this.findPageByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		THysyywHysydtHaxZzxf hysyywHysydtHaxZzxf=new THysyywHysydtHaxZzxf();
		if(l != null && l.size()!=0){
			hysyywHysydtHaxZzxf = (THysyywHysydtHaxZzxf) l.get(0);
		}
		return hysyywHysydtHaxZzxf;
	}
	/**
	 * 
	Description :删除整治修复
	@param:@param zzID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-11-13 上午11:28:27
	 */
	public void deleteHaxZzxf(String zzID){
		String sql="delete from T_HYSYYW_HYSYDT_HAX_ZZXF where id='"+zzID+"'";
		try{
			int num = this.updateBySql(sql);
			System.out.println("num="+num);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	
	
	
	
	
	
}
