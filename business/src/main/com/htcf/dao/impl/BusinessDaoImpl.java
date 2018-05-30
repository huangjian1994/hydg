package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.htcf.dao.IBusinessDao;
import com.htcf.entity.THysyywHysydtYhxm;
import com.htcf.entity.THysyywHysydtYhxmForm;
import com.htcf.entity.THysyywHysydtYhxmHysyj;
import com.htcf.entity.THysyywHysydtYhxmXmfjForm;
import com.htcf.entity.THysyywHysydtYhxmYhfs;
import com.htcf.entity.THysyywHysydtYhxmYhfsForm;
import com.htcf.entity.THysyywHysydtYhxmZht;
import com.htcf.entity.THysyywHysydtYhxmZhxx;
import com.htcf.entity.THysyywHysydtYhxmphjgDt;
import com.htcf.entity.THysyywHysydtYhxmphjgDtForm;
import com.htcf.entity.THysyywHysydtYhxmphjgDtfj;
import com.htcf.entity.THysyywHysydtYhxmphjgYj;
import com.htcf.entity.THysyywHysydtYhxmphjgYjForm;
import com.htcf.util.PageBean;
/**
 * 海域动态管理——用海项目信息管理、用海项目批后监管
 * @author yinying
 *
 */
@Repository(value="businessDao")
public class BusinessDaoImpl extends BaseDAOImpl<Object, Serializable> implements IBusinessDao{

	/********************************用海项目信息管理**************************/
	/**
	 * 
	Description :用海项目信息列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午06:34:48
	 */
	public List<?> fetchYhxmList(PageBean pageBean,THysyywHysydtYhxm hysyywHysydtYhxm,String userId,String userRoleName){
//		String sql=" from THysyywHysydtYhxm where 1=1 ";
//		String sql=" select r.id,r.yhxmmc,r.hysyqr," +
//				"(select d.value from base_dictionary d where d.key='项目位置' and d.dm=r.xmwz) xmwz," +
//				"r.zssl,r.yhzmj,r.slrq," +
//				"(select d.value from base_dictionary d where d.key='项目状态' and d.dm=r.zt) zt " +
//				"from t_hysyyw_hysydt_yhxm r where 1=1 ";
		
		StringBuffer hql = new StringBuffer("select r.id,r.yhxmmc,r.hysyqr," +
				"(select d.value from base_dictionary d where d.key='项目位置' and d.dm=r.xmwz) xmwz," +
				"r.zssl,r.yhzmj,r.slrq," +
				"(select d.value from base_dictionary d where d.key='项目状态' and d.dm=r.zt) zt " +
				"from t_hysyyw_hysydt_yhxm r where 1=1 ");
		Map<String, Object> args = new HashMap<String, Object>();
		
		if(hysyywHysydtYhxm != null){
			if(hysyywHysydtYhxm.getYhxmmc() != null && !hysyywHysydtYhxm.getYhxmmc().equals("")){
				hql.append(" and r.yhxmmc like :yhxmmc ");
				args.put("yhxmmc", "%" + hysyywHysydtYhxm.getYhxmmc().trim() + "%");
//				sql += " and r.yhxmmc like '%"+hysyywHysydtYhxm.getYhxmmc().trim()+"%' ";
			}
			if(hysyywHysydtYhxm.getXmwz() != null && !hysyywHysydtYhxm.getXmwz().equals("")){
				hql.append(" and r.xmwz like :xmwz ");
				args.put("xmwz", "%" + hysyywHysydtYhxm.getXmwz().trim() + "%");
//				sql += " and r.xmwz like '%"+hysyywHysydtYhxm.getXmwz().trim()+"%' ";
			}
			if(hysyywHysydtYhxm.getSlrq() != null && !hysyywHysydtYhxm.getSlrq().equals("")){
				hql.append(" and r.slrq like :slrq ");
				args.put("slrq", "%" + hysyywHysydtYhxm.getSlrq().trim() + "%");
//				sql += " and r.slrq like '%"+hysyywHysydtYhxm.getSlrq().trim()+"%' ";
			}
			if(hysyywHysydtYhxm.getZt() != null && !hysyywHysydtYhxm.getZt().equals("")){
				hql.append(" and r.zt like :slrq ");
				args.put("zt", "%" + hysyywHysydtYhxm.getZt().trim() + "%");
//				sql += " and r.zt like '%"+hysyywHysydtYhxm.getZt().trim()+"%' ";
			}
		}
		if(userRoleName != null && !userRoleName.equals("")){
			if(userRoleName.equals("管理员")){
				
			}else{
//				sql += " and r.ADDUSERID = '"+userId+"' ";
			}
		}
//		hql += " order by id desc";
		hql.append(" order by id desc ");
		List<?> l = null;
		try{
			l = this.findPageBySQL(hql.toString(), pageBean, args);
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
	Description :项目信息详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:31:26
	 */
	public THysyywHysydtYhxm fetchYhxmDetail(String xmID){
		String sql="from THysyywHysydtYhxm where 1=1";
		if(xmID != null && !xmID.equals("")){
			sql += " and id = '"+xmID+"'";
		}
		THysyywHysydtYhxm hysyywHysydtYhxm = new THysyywHysydtYhxm();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHysydtYhxm = (THysyywHysydtYhxm) l.get(0);
		}
		return hysyywHysydtYhxm;
	}
	
	public List<?> fetchYhxmDetailJson(String xmID){
		String sql=
//			"from THysyywHysydtYhxm where 1=1";
		"select t.id,t.yhxmmc,\n" +
		"(select d.value from base_dictionary d where d.key='项目位置' and d.dm=t.xmwz) xmwz,\n" + 
		"t.yhzmj,\n" + 
		"(select d.value from base_dictionary d where d.key='面积单位' and d.dm=t.mjdw) mjdw,\n" + 
		"(select d.value from base_dictionary d where d.key='海域等别' and d.dm=t.hydb) hydb,\n" + 
		"t.slrq,t.yhpzrq,t.hysyqr\n" + 
		"from T_HYSYYW_HYSYDT_YHXM t where 1=1 ";

		if(xmID != null && !xmID.equals("")){
			sql += " and t.id = '"+xmID+"'";
		}
		List<?> l = null;
		try{
//			l = this.findByJPQL(sql, null);
			l = this.findBySQL(sql);
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
	Description :项目信息删除
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:32:45
	 */
	public void deleteYhxm(String xmID){
		String sql1 = " delete from T_HYSYYW_HYSYDT_YHXM where id = '"+xmID+"' ";
		
		try{
			int num1 = this.updateBySql(sql1);
			System.out.println("删除*****项目信息num1="+num1);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		
		//证书信息
		String sql2 = " delete from T_HYSYYW_HYSYDT_YHXM_ZHXX where xmid = '"+xmID+"' ";
		
		try{
			int num2 = this.updateBySql(sql2);
			System.out.println("删除*****证书信息num2="+num2);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		//用海方式
		String sql3 = " delete from T_HYSYYW_HYSYDT_YHXM_YHFS where xmid = '"+xmID+"' ";
		
		try{
			int num3 = this.updateBySql(sql3);
			System.out.println("删除*****用海方式num3="+num3);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		
		//界址点坐标
		String sql4 = " delete from T_HYSYYW_HYSYDT_YHXM_YHFS_JZD where xmid = '"+xmID+"' ";
		
		try{
			int num4 = this.updateBySql(sql4);
			System.out.println("删除*****界址点坐标num4="+num4);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		
		//海域使用金
		String sql5 = " delete from T_HYSYYW_HYSYDT_YHXM_HYSYJ where xmid = '"+xmID+"' ";
		
		try{
			int num5 = this.updateBySql(sql5);
			System.out.println("删除*****海域使用金num5="+num5);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		
		//宗海图详情
		String sql6 = " delete from T_HYSYYW_HYSYDT_YHXM_ZHT where xmid = '"+xmID+"' ";
		
		try{
			int num6 = this.updateBySql(sql6);
			System.out.println("删除*****宗海图详情num6="+num6);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		
		//申请材料详情
		String sql7 = " delete from T_HYSYYW_HYSYDT_YHXM_XMFJ where xmid = '"+xmID+"' ";
		
		try{
			int num7 = this.updateBySql(sql7);
			System.out.println("删除*****申请材料详情num7="+num7);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		//地图定位详情【GIS】
		
		//监管信息
		String sql8 = " delete from t_hysyyw_hysydt_yhxmphjg_dt where xmid = '"+xmID+"' ";
		
		try{
			int num8 = this.updateBySql(sql8);
			System.out.println("删除*****监管信息num8="+num8);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	
	/**
	 * 
	Description :项目信息修改
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:33:30
	 */
	public void updateYhxm(THysyywHysydtYhxm hysyywHysydtYhxm){
		try{
			this.update(hysyywHysydtYhxm);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}

	/**
	 * 
	Description :用海项目-项目附件列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 上午10:26:47
	 */
	public List<?> fetchYhxmXmfj(String xmID,String zsID){
		String sql="from THysyywHysydtYhxmXmfj where 1=1";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and ( zsid = '"+zsID+"' or zsid is null )";
		}else{
			sql += " and zsid is null";
		}
		sql += " order by id desc";
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
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
	Description :附件列表-详情用
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-30 下午04:28:36
	 */
	public List<?> fetchYhxmXmfj2(String xmID,String zsID){
		String sql=
//			"from THysyywHysydtYhxmXmfj where 1=1";
			"select ID,\n" +
			"       XMID,\n" + 
			"       ZSID,\n" + 
			"       FJMC,\n" + 
			"     FJLX, (select d.value from base_dictionary d where d.key='附件类型' and d.dm=FJLX) FJLXMC,\n" + 
			"       FJ,\n" + 
			"       BZ,\n" + 
			"       WJLX,\n" + 
			"       WJDX,\n" + 
			"       SCR,\n" + 
			"       SCSJ,\n" + 
			"       FJLJ,\n" + 
			"       ADDTIME,LASTUPDATETIME,ADDUSERNAME,ADDUSERID\n" + 
			"  from T_HYSYYW_HYSYDT_YHXM_XMFJ\n" + 
			" where 1 = 1";

		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and ( zsid = '"+zsID+"'  )";//or zsid is null
		}else{
//			sql += " and zsid is null";
		}
		sql += " order by id desc";
		List<Object []> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		List yjList = new ArrayList();
		if(l != null && l.size()!=0){
			for (int i=0;i<l.size();i++){
	    		Object[] obj = l.get(i);
	    		THysyywHysydtYhxmXmfjForm hysyywHysydtYhxmXmfjForm = new THysyywHysydtYhxmXmfjForm();
	    		if(obj[0] != null && !obj[0].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setId(obj[0].toString());
	    		}
	    		if(obj[1] != null && !obj[1].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setXmid(obj[1].toString());
	    		}
	    		if(obj[2] != null && !obj[2].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setZsid(obj[2].toString());
	    		}
	    		if(obj[3] != null && !obj[3].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setFjmc(obj[3].toString());
	    		}
	    		if(obj[4] != null && !obj[4].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setFjlx(obj[4].toString());
	    		}
	    		if(obj[5] != null && !obj[5].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setFjlxmc(obj[5].toString());
	    		}
	    		
	    		if(obj[6] != null && !obj[6].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setFj(obj[6].toString());
	    		}
	    		if(obj[7] != null && !obj[7].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setBz(obj[7].toString());
	    		}
	    		if(obj[8] != null && !obj[8].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setWjlx(obj[8].toString());
	    		}
	    		if(obj[9] != null && !obj[9].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setWjdx(obj[9].toString());
	    		}
	    		
	    		if(obj[10] != null && !obj[10].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setScr(obj[10].toString());
	    		}
	    		if(obj[11] != null && !obj[11].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setScsj(obj[11].toString());
	    		}
	    		if(obj[12] != null && !obj[12].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setFjlj(obj[12].toString());
	    		}
	    		
	    		if(obj[13] != null && !obj[13].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setAddtime(obj[13].toString());
	    		}
	    		if(obj[14] != null && !obj[14].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setLastupdatetime(obj[14].toString());
	    		}
	    		if(obj[15] != null && !obj[15].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setAddusername(obj[15].toString());
	    		}
	    		if(obj[16] != null && !obj[16].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setAdduserid(obj[16].toString());
	    		}
	    		yjList.add(hysyywHysydtYhxmXmfjForm);
			}
		}
		return yjList;
	}
	/**
	 * 
	Description :证书信息列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 上午10:57:35
	 */
	public List<?> fetchYhxmZsxx(String xmID){
		String sql=
//			"from THysyywHysydtYhxmZhxx where 1=1";
			"select r.id,r.xmid,r.hyglh,nvl(y.yhxmmc,r.yhxmmc),nvl(y.hysyqr,r.hysyqr),\n" +
			"r.yhlxa,(select d.value from base_dictionary d where d.key='用海类型A' and d.dm=r.yhlxa),\n" + 
			"r.yhlxb,(select d.value from base_dictionary d where d.key='用海类型B' and d.dm=r.yhlxb),\n" + 
			"r.zhmj,\n" + 
			"r.yhxz,(select d.value from base_dictionary d where d.key='用海性质' and d.dm=r.yhxz)\n" + 
			"from T_HYSYYW_HYSYDT_YHXM_ZHXX r,T_HYSYYW_HYSYDT_YHXM y\n" + 
			"where r.xmid=y.id";
		if(xmID != null && !xmID.equals("")){
			sql += " and r.xmid = '"+xmID+"'";
		}
		sql += " order by r.id desc ";
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
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
	Description :证书信息详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 下午02:55:38
	 */
	public THysyywHysydtYhxmZhxx fetchYhxmZsxxDetail(String xmID,String zsID){
		String sql="from THysyywHysydtYhxmZhxx where 1=1";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and id = '"+zsID+"'";
		}
		THysyywHysydtYhxmZhxx hysyywHysydtYhxmZsxx = new THysyywHysydtYhxmZhxx();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHysydtYhxmZsxx = (THysyywHysydtYhxmZhxx) l.get(0);
		}
		return hysyywHysydtYhxmZsxx;
	}
	
	/**
	 * 
	Description :用海方式列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午02:08:30
	 */
	public List<?> fetchYhxmYhfs(String xmID,String zsID){
		String sql=
//			"from THysyywHysydtYhxmYhfs where 1=1";
			"select ID,\n" +
			"       ADDTIME,\n" + 
			"       LASTUPDATETIME,\n" + 
			"       ADDUSERNAME,\n" + 
			"       ADDUSERID,\n" + 
			"       BS,\n" + 
			"       YHFS,(select d.value from base_dictionary d where d.key='用海方式' and d.dm=YHFS) YHFSMC,\n" + 
			"       MJ,\n" + 
			"       JTYT,\n" + 
			"       XMID,\n" + 
			"       ZSID,\n" + 
			"       MJDW,\n" + 
			"       HYGLH\n" + 
			"  from T_HYSYYW_HYSYDT_YHXM_YHFS where 1=1";
		
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and zsid = '"+zsID+"'";
		}
		List<Object []> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		List yjList = new ArrayList();
		if(l != null && l.size()!=0){
			for (int i=0;i<l.size();i++){
	    		Object[] obj = l.get(i);
	    		THysyywHysydtYhxmYhfsForm hysyywHysydtYhxmYhfsForm = new THysyywHysydtYhxmYhfsForm();
	    		if(obj[0] != null && !obj[0].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setId(obj[0].toString());
	    		}
	    		if(obj[1] != null && !obj[1].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setAddtime(obj[1].toString());
	    		}
	    		if(obj[2] != null && !obj[2].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setLastupdatetime(obj[2].toString());
	    		}
	    		if(obj[3] != null && !obj[3].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setAddusername(obj[3].toString());
	    		}
	    		if(obj[4] != null && !obj[4].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setAdduserid(obj[4].toString());
	    		}
	    		
	    		if(obj[5] != null && !obj[5].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setBs(obj[5].toString());
	    		}
	    		if(obj[6] != null && !obj[6].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setYhfs(obj[6].toString());
	    		}
	    		if(obj[7] != null && !obj[7].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setYhfsmc(obj[7].toString());
	    		}
	    		if(obj[8] != null && !obj[8].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setMj(obj[8].toString());
	    		}
	    		if(obj[9] != null && !obj[9].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setJtyt(obj[9].toString());
	    		}
	    		
	    		if(obj[10] != null && !obj[10].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setXmid(obj[10].toString());
	    		}
	    		if(obj[11] != null && !obj[11].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setZsid(obj[11].toString());
	    		}
	    		if(obj[12] != null && !obj[12].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setMjdw(obj[12].toString());
	    		}
	    		if(obj[13] != null && !obj[13].equals("")){
	    			hysyywHysydtYhxmYhfsForm.setHyglh(obj[13].toString());
	    		}

	    		yjList.add(hysyywHysydtYhxmYhfsForm);
			}
		}
		return yjList;
	}

	/**
	 * 
	Description :用海方式详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 下午03:23:51
	 */
	public THysyywHysydtYhxmYhfs fetchYhxmYhfsDetail(String xmID,String zsID,String yhfsID){
		String sql="from THysyywHysydtYhxmYhfs where 1=1";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and zsid = '"+zsID+"'";
		}
		THysyywHysydtYhxmYhfs hysyywHysydtYhxmYhfs = new THysyywHysydtYhxmYhfs();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHysydtYhxmYhfs = (THysyywHysydtYhxmYhfs) l.get(0);
		}
		return hysyywHysydtYhxmYhfs;
	}
	
	/**
	 * 
	Description :用海方式 界址点坐标
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午04:13:59
	 */
	public List<?> fetchYhxmYhfsJzdzb(String xmID,String zsID){
		String sql="from THysyywHysydtYhxmYhfsJzd where 1=1";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and zsid = '"+zsID+"'";
		}
		sql += " order by xssx ";
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
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
	Description :用海方式 界址点坐标-所有
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-2-2 下午03:30:54
	 */
	public List<?> fetchYhxmJzdzb(){
		String sql="from THysyywHysydtYhxmYhfsJzd where 1=1";
		sql += " order by xmid,xssx ";
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
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
	Description :海域使用金列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午02:08:30
	 */
	public List<?> fetchYhxmHysyj(String xmID,String zsID){
		String sql="from THysyywHysydtYhxmHysyj where 1=1";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and zsid = '"+zsID+"'";
		}
		sql += " order by jnrq desc";
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
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
	Description :海域使用金详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午02:13:45
	 */
	public THysyywHysydtYhxmHysyj fetchYhxmHysyjDetail(String xmID,String zsID,String hysyjID){
		String sql="from THysyywHysydtYhxmHysyj where 1=1";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and zsid = '"+zsID+"'";
		}
		if(hysyjID != null && !hysyjID.equals("")){
			sql += " and id = '"+hysyjID+"'";
		}
		THysyywHysydtYhxmHysyj hysyywHysydtYhxmHysyj = new THysyywHysydtYhxmHysyj();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHysydtYhxmHysyj = (THysyywHysydtYhxmHysyj) l.get(0);
		}
		return hysyywHysydtYhxmHysyj;
	}
	
	/**
	 * 
	Description :保存实体
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午07:14:00
	 */
	public void addObject(Object obj){
		try{
			this.save(obj);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	
	/**
	 * 
	Description :修改实体
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午06:58:37
	 */
	public void updateObject(Object obj){
		try{
			this.update(obj);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	
	/**
	 * 
	Description :保存时查出表的主键ID
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午07:22:28
	 */
	public String fetchYhxmID(String tablename,String xzsj,String userid){
		String sql="select id from "+tablename+" " +
				" where addtime='"+xzsj+"' and adduserid='"+userid+"'";
		String zjID="";
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}	
		if(l != null && l.size()!=0){			
			zjID = l.get(0).toString();
		}
		return zjID;
	}
	
	/**
	 * 
	Description :删除附件
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午04:48:21
	 */
	public void deleteYhxmFj(String xmfjID){
		String sql1 = " delete from t_hysyyw_hysydt_yhxm_xmfj where id = '"+xmfjID+"' ";
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
	Description :删除证书
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午08:21:31
	 */
	public void deleteYhxmZhxx(String zsID){
		String sql1 = " delete from T_HYSYYW_HYSYDT_YHXM_ZHXX where id = '"+zsID+"' ";
		
		try{
			int num1 = this.updateBySql(sql1);
			System.out.println("删除*****证书num1="+num1);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		
		//用海方式
		String sql3 = " delete from T_HYSYYW_HYSYDT_YHXM_YHFS where zsid = '"+zsID+"' ";
		
		try{
			int num3 = this.updateBySql(sql3);
			System.out.println("删除*****用海方式num3="+num3);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		//界址点坐标
		String sql4 = " delete from T_HYSYYW_HYSYDT_YHXM_YHFS_JZD where zsid = '"+zsID+"' ";
		
		try{
			int num4 = this.updateBySql(sql4);
			System.out.println("删除*****界址点坐标num4="+num4);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		//海域使用金
		String sql5 = " delete from T_HYSYYW_HYSYDT_YHXM_HYSYJ where zsid = '"+zsID+"' ";
		
		try{
			int num5 = this.updateBySql(sql5);
			System.out.println("删除*****海域使用金num5="+num5);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		//宗海图详情
		String sql6 = " delete from T_HYSYYW_HYSYDT_YHXM_ZHT where zsid = '"+zsID+"' ";
		
		try{
			int num6 = this.updateBySql(sql6);
			System.out.println("删除*****宗海图详情num6="+num6);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		//申请材料详情
		String sql7 = " delete from T_HYSYYW_HYSYDT_YHXM_XMFJ where zsid = '"+zsID+"' ";
		
		try{
			int num7 = this.updateBySql(sql7);
			System.out.println("删除*****申请材料详情num7="+num7);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		//地图定位详情【GIS】
	}
	
	/**
	 * 
	Description :删除用海方式
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午05:22:05
	 */
	public void deleteYhxmYhfs(String yhfsID){
		String sql1 = " delete from T_HYSYYW_HYSYDT_YHXM_YHFS where id = '"+yhfsID+"' ";
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
	Description :删除界址点
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午07:45:15
	 */
	public void deleteYhxmJzdzb(String jzdID){
		String sql1 = " delete from t_hysyyw_hysydt_yhxm_yhfs_jzd where id = '"+jzdID+"' ";
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
	Description :删除界址点-所有
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午07:45:15
	 */
	public void deleteYhxmJzdzb(String xmID,String zsID){
		String sql1 = " delete from t_hysyyw_hysydt_yhxm_yhfs_jzd where 1=1 ";
		if(xmID != null && !xmID.equals("")){
			sql1 += " and xmid = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql1 += " and zsid = '"+zsID+"'";
		}
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
	Description :删除海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:29:38
	 */
	public void deleteYhxmHysyj(String hysyjID){
		String sql1 = " delete from T_HYSYYW_HYSYDT_YHXM_HYSYJ where id = '"+hysyjID+"' ";
		
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
	Description :查出代码表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午06:53:14
	 */
	public List<?> fetchDictionary(String dmlx,String tjz){
		String sql="from Dictionary where 1=1";
		if(dmlx != null && !dmlx.equals("")){
			sql += " and key = '"+dmlx+"'";
		}
		if(tjz != null && !tjz.equals("")){
			sql += " and dm like '"+tjz+"%'";
		}
		sql += " order by dm asc";
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
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
	Description :宗海图
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午04:33:26
	 */
	public List<?> fetchYhxmZht(String xmID,String zsID){
		String sql="from THysyywHysydtYhxmZht where 1=1";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and zsid = '"+zsID+"'";
		}
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
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
	Description :宗海图详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午05:12:36
	 */
	public THysyywHysydtYhxmZht fetchYhxmZhtDetail(String zhtID){
		String sql="from THysyywHysydtYhxmZht where 1=1";
		if(zhtID != null && !zhtID.equals("")){
			sql += " and id = '"+zhtID+"'";
		}
		THysyywHysydtYhxmZht hysyywHysydtYhxmYhfsZht = new THysyywHysydtYhxmZht();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHysydtYhxmYhfsZht = (THysyywHysydtYhxmZht) l.get(0);
		}
		return hysyywHysydtYhxmYhfsZht;
	}
	
	/**
	 * 
	Description :申请材料
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午04:33:12
	 */
	public List<?> fetchYhxmSqcl(String xmID,String zsID){
		String sql="from THysyywHysydtYhxmYhfsSqcl where 1=1";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"'";
		}
//		if(zsID != null && !zsID.equals("")){
//			sql += " and zsid = '"+zsID+"'";
//		}
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}

	
	/********************************用海项目批后监管**************************/
	
	
	/**
	 * 
	Description :查出项目信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:55:43
	 */
	public List<?> fetchXmxx(PageBean pageBean,THysyywHysydtYhxmForm hysyywHysydtYhxmForm,String userId,String userRoleName){
		String sql="select t.id, t.YHXMMC, t.YHZMJ, t.HYSYQR," +
				"(select d.value from base_dictionary d where d.key='项目位置' and d.dm=t.xmwz)," +
				"(select count(d.id) from t_hysyyw_hysydt_yhxmphjg_dt d where d.xmid = t.id)" +
				" from t_hysyyw_hysydt_yhxm t where 1=1 ";
		if(hysyywHysydtYhxmForm != null){
			if(hysyywHysydtYhxmForm.getYhxmmc() != null && !hysyywHysydtYhxmForm.getYhxmmc().equals("")){
				sql += " and yhxmmc like '%"+hysyywHysydtYhxmForm.getYhxmmc().trim()+"%' ";
			}
			if(hysyywHysydtYhxmForm.getXmwz() != null && !hysyywHysydtYhxmForm.getXmwz().equals("")){
				sql += " and xmwz like '%"+hysyywHysydtYhxmForm.getXmwz().trim()+"%' ";
			}
		}
		if(userRoleName != null && !userRoleName.equals("")){
			if(userRoleName.equals("管理员")){
				
			}else{
				sql += " and t.ADDUSERID = '"+userId+"' ";
			}
		}
		sql += " order by t.id desc ";
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
	Description :用海项目动态管理
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:37:37
	 */
	public List<?> fetchYhxmdtglList(PageBean pageBean,THysyywHysydtYhxmphjgDtForm hysyywHysydtYhxmphjgDtForm,String jgsf,String xmID,String tj){
		String sql=" from THysyywHysydtYhxmphjgDt where 1=1 ";
		if(hysyywHysydtYhxmphjgDtForm != null){
			if(hysyywHysydtYhxmphjgDtForm.getYhxmmc() != null && !hysyywHysydtYhxmphjgDtForm.getYhxmmc().equals("")){
				sql += " and yhxmmc like '%"+hysyywHysydtYhxmphjgDtForm.getYhxmmc().trim()+"%' ";
			}
		}
		if(jgsf != null && !jgsf.equals("")){
			sql += " and jgfs = '"+jgsf.trim()+"' ";
		}
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"' ";
		}
		if(tj != null && !tj.equals("") && tj.equals("是")){
			sql += " and (YHJZSFGB = '是' or YHMJSFGB = '是' or SJYTSFGB = '是' or" +
					" SFZYHY = '是' or SFFFWTH = '是' or SFSZGBHYYT = '是') ";
		}
		if(tj != null && !tj.equals("") && tj.equals("预警")){
			
//			sql += hysyywHysydtYhxmphjgDtForm.getTj();
			
			String sql1="select y.YHJZSFGB,y.YHMJSFGB,y.SJYTSFGB,y.SFZYHY,y.SFFFWTH ,y.SFSZGBHYYT," +
					" y.yjjkqsrq,y.yjjkzzrq  " +
					" from t_hysyyw_hysydt_yhxmphjg_yj y" +
					" where y.id='"+hysyywHysydtYhxmphjgDtForm.getYjid()+"'";
			List<Object []> l2 = null;
			try{
				l2 = this.findBySQL(sql1);
			}catch(Exception e){
				System.out.println("SQL语句错误");
				System.out.println("e"+e);
			}
			
			String tj1="";
			if(l2 != null && l2.size()!=0){
		    	Object[] obj = l2.get(0);
				
		    	sql += " and jgrq>='"+obj[6].toString()+"' " +
						"and jgrq<='"+obj[7].toString()+"' ";
		    	
		    	tj1=" and (";
	    		if(obj[0] != null && !obj[0].equals("")){
	    			tj1+=" yhjzsfgb='"+obj[0].toString()+"' or";
	    		}else{
	    			tj1+=" 1=2 or";
	    		}
				if(obj[1] != null && !obj[1].equals("")){
					tj1+=" yhmjsfgb='"+obj[1].toString()+"' or";		
				}else{
	    			tj1+=" 1=2 or";
	    		}
				if(obj[2] != null && !obj[2].equals("")){
					tj1+=" sjytsfgb='"+obj[2].toString()+"' or";
				}else{
	    			tj1+=" 1=2 or";
	    		}
				if(obj[3] != null && !obj[3].equals("")){
					tj1+=" sfzyhy='"+obj[3].toString()+"' or";
				}else{
	    			tj1+=" 1=2 or";
	    		}
				if(obj[4] != null && !obj[4].equals("")){
					tj1+=" sfffwth='"+obj[4].toString()+"' or";
				}else{
	    			tj1+=" 1=2 or";
	    		}
				if(obj[5] != null && !obj[5].equals("")){
					tj1+=" sfszgbhyyt='"+obj[5].toString()+"'";
				}else{
	    			tj1+=" 1=2 ";
	    		}
				tj1 +=")";
				
				sql += tj1;
		    	
			}
			
		}
		
		sql += " order by jgrq desc";
		System.out.println("sql="+sql);
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
	Description :删除动态管理
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:39:46
	 */
	public void deleteYhxmdtgl(String xmID,String dtglID){
		String sql1 = " delete from T_HYSYYW_HYSYDT_YHXMPHJG_DT where 1=1 ";
		if(xmID != null && !xmID.equals("")){
			sql1 += " and xmid = '"+xmID+"'";
		}
		if(dtglID != null && !dtglID.equals("")){
			sql1 += " and id = '"+dtglID+"'";
		}
		
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
	Description :动态管理详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:41:03
	 */
	public THysyywHysydtYhxmphjgDt fetchYhxmdtglDetail(String xmID,String dtglID){
		String sql="from THysyywHysydtYhxmphjgDt where 1=1";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"'";
		}
		if(dtglID != null && !dtglID.equals("")){
			sql += " and id = '"+dtglID+"'";
		}
		THysyywHysydtYhxmphjgDt hysyywHysydtYhxmphjgDt = new THysyywHysydtYhxmphjgDt();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHysydtYhxmphjgDt = (THysyywHysydtYhxmphjgDt) l.get(0);
		}
		return hysyywHysydtYhxmphjgDt;
	}
	

	/**
	 * 
	Description :选择项目名称
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午02:26:05
	 */
	public List<?> fetchXmmc(String userId,String userRoleName){
		String sql="select id,yhxmmc from t_hysyyw_hysydt_yhxm where 1=1 ";
		if(userRoleName != null && !userRoleName.equals("")){
			if(userRoleName.equals("管理员")){
				
			}else{
				sql += " and ADDUSERID = '"+userId+"' ";
			}
		}
		sql += " order by id desc";
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
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
	Description :删除宗海图
	@param:@param zhtID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-10-21 下午05:12:36
	 */
	public void deleteZht(String zhtID){
		String sql1 = " delete from T_HYSYYW_HYSYDT_YHXM_ZHT where id = '"+zhtID+"' ";
		
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
	Description :用海项目变化预警：查出所有的用海项目
	@param:@param pageBean
	@param:@param hysyywHysydtYhxmForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-27 下午03:41:31
	 */
	public List<?> fetchXmxxYj(PageBean pageBean,THysyywHysydtYhxmForm hysyywHysydtYhxmForm){
		String sql=
//				"select t.id, t.YHXMMC, t.YHZMJ, t.HYSYQR," +
//				"(select d.value from base_dictionary d where d.key='项目位置' and d.dm=t.xmwz)" +
//				" from t_hysyyw_hysydt_yhxm t where 1=1 ";

			"select t.id,\n" +
			"       t.YHXMMC,\n" + 
			"       t.YHZMJ,\n" + 
			"       t.HYSYQR,\n" + 
			"       (select d.value\n" + 
			"          from base_dictionary d\n" + 
			"         where d.key = '项目位置'\n" + 
			"           and d.dm = t.xmwz) xmwz,\n" + 
			"       (select count(d.id)\n" + 
			"          from t_hysyyw_hysydt_yhxmphjg_dt d\n" + 
			"         where d.xmid = t.id\n" + 
			"           and YHJZSFGB = '是') YHJZSFGB, --用海界址是否改变\n" + 
			"       (select count(d.id)\n" + 
			"          from t_hysyyw_hysydt_yhxmphjg_dt d\n" + 
			"         where d.xmid = t.id\n" + 
			"           and YHMJSFGB = '是') YHMJSFGB, --用海面积是否改变\n" + 
			"       (select count(d.id)\n" + 
			"          from t_hysyyw_hysydt_yhxmphjg_dt d\n" + 
			"         where d.xmid = t.id\n" + 
			"           and SJYTSFGB = '是') SJYTSFGB, --实际用途是否改变\n" + 
			"       (select count(d.id)\n" + 
			"          from t_hysyyw_hysydt_yhxmphjg_dt d\n" + 
			"         where d.xmid = t.id\n" + 
			"           and SFZYHY = '是') SFZYHY, --是否占用海域\n" + 
			"       (select count(d.id)\n" + 
			"          from t_hysyyw_hysydt_yhxmphjg_dt d\n" + 
			"         where d.xmid = t.id\n" + 
			"           and SFFFWTH = '是') SFFFWTH, --是否有非法围填海活动\n" + 
			"       (select count(d.id)\n" + 
			"          from t_hysyyw_hysydt_yhxmphjg_dt d\n" + 
			"         where d.xmid = t.id\n" + 
			"           and SFSZGBHYYT = '是') SFSZGBHYYT --是否擅自改变海域用途\n" + 
			"  from t_hysyyw_hysydt_yhxm t\n" + 
			" where 1 = 1";
		if(hysyywHysydtYhxmForm != null){
			if(hysyywHysydtYhxmForm.getYhxmmc() != null && !hysyywHysydtYhxmForm.getYhxmmc().equals("")){
				sql += " and yhxmmc like '%"+hysyywHysydtYhxmForm.getYhxmmc().trim()+"%' ";
			}
			if(hysyywHysydtYhxmForm.getXmwz() != null && !hysyywHysydtYhxmForm.getXmwz().equals("")){
				sql += " and xmwz like '%"+hysyywHysydtYhxmForm.getXmwz().trim()+"%' ";
			}
		}
		sql += " order by t.id desc ";
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
	Description :用海项目变化预警：预警数
	@param:@param pageBean
	@param:@param hysyywHysydtYhxmForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-28 下午01:18:42
	 */
	public List<?> fetchXmxxYj2(PageBean pageBean,THysyywHysydtYhxmForm hysyywHysydtYhxmForm,String userId,String userRoleName){
		String sql=
			"select y.id yid,\n" +
			"       t.id tid,\n" + 
			"       t.YHXMMC,\n" + 
			"       t.HYSYQR,\n" + 
			"       t.YHZMJ,\n" + 
			"       (select d.value from base_dictionary d where d.key = '项目位置'  and d.dm = t.xmwz) xmwz,\n" + 
			"       y.yjjkqsrq,\n" + 
			"       y.yjjkzzrq,\n" + 
			"  y.YHJZSFGB,y.YHMJSFGB,y.SJYTSFGB,y.SFZYHY,y.SFFFWTH ,y.SFSZGBHYYT,  \n" + //8-13
			"       (select count(d.id)\n" + 
			"          from t_hysyyw_hysydt_yhxmphjg_dt d\n" + 
			"         where d.xmid = t.id ) zjgs," +
			"       (select count(d.id)\n" + 
			"          from t_hysyyw_hysydt_yhxmphjg_dt d\n" + 
			"         where d.xmid = t.id \n" + 
			"           and (YHJZSFGB = '是' or YHMJSFGB = '是' or SJYTSFGB = '是' or\n" + 
			"               SFZYHY = '是' or SFFFWTH = '是' or SFSZGBHYYT = '是') ) wts" +
			"  from t_hysyyw_hysydt_yhxmphjg_yj y, t_hysyyw_hysydt_yhxm t\n" + 
			" where y.xmid = t.id";
		String sj="";
		if(hysyywHysydtYhxmForm != null){
			if(hysyywHysydtYhxmForm.getYhxmmc() != null && !hysyywHysydtYhxmForm.getYhxmmc().equals("")){
				sql += " and t.YHXMMC like '%"+hysyywHysydtYhxmForm.getYhxmmc().trim()+"%' ";
			}
			if(hysyywHysydtYhxmForm.getXmwz() != null && !hysyywHysydtYhxmForm.getXmwz().equals("")){
				sql += " and t.xmwz like '%"+hysyywHysydtYhxmForm.getXmwz().trim()+"%' ";
			}
			if(hysyywHysydtYhxmForm.getSj() != null && !hysyywHysydtYhxmForm.getSj().equals("")){
				sj = hysyywHysydtYhxmForm.getSj();
			}
			
		}
		if(userRoleName != null && !userRoleName.equals("")){
			if(userRoleName.equals("管理员")){
				
			}else{
				sql += " and y.ADDUSERID = '"+userId+"' ";
			}
		}
		sql += " order by y.id desc ";
		List<Object []> l = null;
		try{
			l = this.findPageBySQL(sql, pageBean);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		List yjList = new ArrayList();
		if(l != null && l.size()!=0){
			for (int i=0;i<l.size();i++){
	    		Object[] obj = l.get(i);
	    		THysyywHysydtYhxmphjgYjForm hysyywHysydtYhxmphjgYjForm = new THysyywHysydtYhxmphjgYjForm();
	    		if(obj[0] != null && !obj[0].equals("")){
	    			hysyywHysydtYhxmphjgYjForm.setId(obj[0].toString());
	    		}
	    		if(obj[1] != null && !obj[1].equals("")){
	    			hysyywHysydtYhxmphjgYjForm.setXmid(obj[1].toString());
	    		}
	    		if(obj[2] != null && !obj[2].equals("")){
	    			hysyywHysydtYhxmphjgYjForm.setXmmc(obj[2].toString());
	    		}
	    		if(obj[3] != null && !obj[3].equals("")){
	    			hysyywHysydtYhxmphjgYjForm.setHysyqr(obj[3].toString());
	    		}
	    		if(obj[4] != null && !obj[4].equals("")){
	    			hysyywHysydtYhxmphjgYjForm.setYhzmj(obj[4].toString());
	    		}
	    		if(obj[5] != null && !obj[5].equals("")){
	    			hysyywHysydtYhxmphjgYjForm.setXmwz(obj[5].toString());
	    		}
	    		if(obj[6] != null && !obj[6].equals("")){
	    			hysyywHysydtYhxmphjgYjForm.setYjjkqsrq(obj[6].toString());
	    		}
	    		if(obj[7] != null && !obj[7].equals("")){
	    			hysyywHysydtYhxmphjgYjForm.setYjjkzzrq(obj[7].toString());
	    		}
	    		if(obj[14] != null && !obj[14].equals("")){
		    		hysyywHysydtYhxmphjgYjForm.setZjgs(obj[14].toString());
		    	}
	    		if(obj[15] != null && !obj[15].equals("")){
		    		hysyywHysydtYhxmphjgYjForm.setWts(obj[15].toString());
		    	}
	    		//根据具体预警信息查出预警数9-16
	    		String sqlYj="select count(id) from t_hysyyw_hysydt_yhxmphjg_dt " +
	    				" where xmid='"+obj[1].toString()+"' " ;
	    		if(sj != null && !sj.equals("")){
	    			sqlYj += "and jgrq='"+sj+"'";
	    		}else{
	    			sqlYj += "and jgrq>='"+obj[6].toString()+"' and jgrq<='"+obj[7].toString()+"'";
	    		}
	    		
	    		//YHJZSFGB,YHMJSFGB,SJYTSFGB,SFZYHY,SFFFWTH ,SFSZGBHYYT
	    		String tj=" and (";
	    		if(obj[8] != null && !obj[8].equals("")){
	    			tj+=" YHJZSFGB='"+obj[8].toString()+"' or";
	    		}else{
	    			tj+=" 1=2 or";
	    		}
				if(obj[9] != null && !obj[9].equals("")){
					tj+="  YHMJSFGB='"+obj[9].toString()+"' or";		
				}else{
	    			tj+=" 1=2 or";
	    		}
				if(obj[10] != null && !obj[10].equals("")){
					tj+=" SJYTSFGB='"+obj[10].toString()+"' or";
				}else{
	    			tj+=" 1=2 or";
	    		}
				if(obj[11] != null && !obj[11].equals("")){
					tj+=" SFZYHY='"+obj[11].toString()+"' or";
				}else{
	    			tj+=" 1=2 or";
	    		}
				if(obj[12] != null && !obj[12].equals("")){
					tj+=" SFFFWTH='"+obj[12].toString()+"' or";
				}else{
	    			tj+=" 1=2 or";
	    		}
				if(obj[13] != null && !obj[13].equals("")){
					tj+=" SFSZGBHYYT='"+obj[13].toString()+"'";
				}else{
	    			tj+=" 1=2 ";
	    		}
				tj +=")";
				sqlYj += tj;
				System.out.println("sqlYj="+sqlYj);
				List<?> l2 = null;
				try{
					l2 = this.findBySQL(sqlYj);
				}catch(Exception e){
					System.out.println("SQL语句错误");
					System.out.println("e"+e);
				}
				int count=0;
				if(l2 != null && l2.size()!=0){
					count = Integer.parseInt(l2.get(0).toString());
				}
				hysyywHysydtYhxmphjgYjForm.setYjs(count+"");
	    		yjList.add(hysyywHysydtYhxmphjgYjForm);
			}
		}
		return yjList;
	}
	
	/**
	 * 
	Description :查出监管预警数
	@param:@param todayDate
	@param:@return
	@return:int
	@throws
	@Author：yinying
	@Create 2017-10-28 下午03:12:57
	 */
	public int fetchJggbCount(String todayDate){
		String sql=
			"select count(d.id)\n" +
			"  from t_hysyyw_hysydt_yhxmphjg_dt d\n" + 
			" where d.xmid in (select id from t_hysyyw_hysydt_yhxm)\n" + 
			"   and (YHJZSFGB = '是' or YHMJSFGB = '是' or SJYTSFGB = '是' or SFZYHY = '是' or\n" + 
			"       SFFFWTH = '是' or SFSZGBHYYT = '是')";
		if(todayDate != null && !todayDate.equals("")){
			sql += " and jgrq='"+todayDate+"'";
		}
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		int count=0;
		if(l != null && l.size()!=0){
			count = Integer.parseInt(l.get(0).toString());
		}
		return count;
	}
	
	/**
	 * 
	Description :查出预警信息列表-未用
	@param:@param pageBean
	@param:@param xmmc
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-28 下午03:57:47
	 
	public List<?> fetchYjxxList(PageBean pageBean,String xmmc){
		String sql ="from THysyywHysydtYhxmphjgYj where 1=1 ";
		List<?> l = this.findPageByJPQL(sql, pageBean);
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	*/
	
	
	/**
	 * 
	Description :预警信息详情
	@param:@param bhyjID
	@param:@return
	@return:THysyywHysydtYhxmphjgYj
	@throws
	@Author：yinying
	@Create 2017-10-28 下午04:14:47
	 */
	public THysyywHysydtYhxmphjgYj fetchYjxxDetail(String bhyjID){
		String sql="from THysyywHysydtYhxmphjgYj where id='"+bhyjID+"'";
		THysyywHysydtYhxmphjgYj hysyywHysydtYhxmphjgYj = new THysyywHysydtYhxmphjgYj();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHysydtYhxmphjgYj = (THysyywHysydtYhxmphjgYj) l.get(0);
		}
		return hysyywHysydtYhxmphjgYj;
	}
	/**
	 * 
	Description :删除预警信息
	@param:@param bhyjID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-10-28 下午04:16:02
	 */
	public void deleteYjxx(String bhyjID){
		String sql="delete from t_hysyyw_hysydt_yhxmphjg_yj where id='"+bhyjID+"'";
		try{
			int num = this.updateBySql(sql);
			System.out.println("删除预警信息="+num);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	
	/**
	 * 
	Description :宗海信息-项目信息
	@param:@param xmID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-30 下午06:58:56
	 */
	public List<?> fetchXmxx(String xmID){
		String sql="select t.yhxmmc,t.hysyqr,t.yhzmj,t.hydb,t.fddbr,t.txdz,t.fzjg,t.fzjgjb,t.XMWJCL" +
				" from t_hysyyw_hysydt_yhxm t " +
				" where id='"+xmID+"'";
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
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
	Description :查出项目数量
	@param:@param xmID
	@param:@return
	@return:int
	@throws
	@Author：yinying
	@Create 2017-10-30 下午07:14:53
	 */
	public int fetchXmzsCount(String xmID){
		String sql="select ZSSL" +
				" from t_hysyyw_hysydt_yhxm " +
				" where id='"+xmID+"'";
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		int count=0;
		if(l != null && l.size()!=0){
			count = Integer.parseInt(l.get(0).toString());
		}
		return count;
	}
	
	/**
	 * 
	Description :查出海域管理号
	@param:@param userId
	@param:@param userRoleName
	@param:@param xmID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-1 下午04:14:57
	 */
	public List<?> fetchHyglh(String userId,String userRoleName,String xmID){
		String sql="select distinct hyglh,id from t_hysyyw_hysydt_yhxm_zhxx " +
				" where hyglh is not null ";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid='"+xmID+"'";
		}
		if(userRoleName != null && !userRoleName.equals("")){
			if(userRoleName.equals("管理员")){
				
			}else{
				sql += " and ADDUSERID = '"+userId+"' ";
			}
		}
		sql += " order by id desc";
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
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
	Description :删除该监测任务下的所有界址点
	@param:@param dtglID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-1 下午04:45:09
	 */
	public void deleteJgxxJzdzb(String dtglID){
		String sql1 = " delete from T_HYSYYW_HYSYDT_YHXMPHJG_DTJZD where DTID = '"+dtglID+"' ";
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
	Description :删除监测任务下的一个界址点
	@param:@param jzdID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-1 下午04:45:25
	 */
	public void deleteJgxxJzdzbById(String jzdID){
		String sql1 = " delete from T_HYSYYW_HYSYDT_YHXMPHJG_DTJZD where id = '"+jzdID+"' ";
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
	Description :查出监测任务界址点列表
	@param:@param dtglID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-12-1 下午04:51:21
	 */
	public List<?> fetchJgxxJzdzb(String dtglID){
		String sql="from THysyywHysydtYhxmphjgDtjzd where 1=1";
		if(dtglID != null && !dtglID.equals("")){
			sql += " and dtid = '"+dtglID+"'";
		}
		sql += " order by xssx ";
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
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
	Description :删除监管信息附件
	@param:@param dtglFjID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-4 下午03:54:47
	 */
	public void deleteJgxxFj(String dtglFjID){
		String sql1 = " delete from T_HYSYYW_HYSYDT_YHXMPHJG_DTFJ where id = '"+dtglFjID+"' ";
		
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
	Description :监管信息附件
	@param:@param dtglID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-12-4 下午04:09:55
	 */
	public List<?> fetchJgxxFj(String dtglID){
		String sql="from THysyywHysydtYhxmphjgDtfj where 1=1";
		if(dtglID != null && !dtglID.equals("")){
			sql += " and dtid = '"+dtglID+"'";
		}
		sql += " order by id desc ";
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
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
	Description :监管信息-附件详情
	@param:@param dtglFjID
	@param:@return
	@return:THysyywHysydtYhxmphjgDtfj
	@throws
	@Author：yinying
	@Create 2017-12-4 下午05:58:51
	 */
	public THysyywHysydtYhxmphjgDtfj fetchJgxxFjDetail(String dtglFjID){
		String sql="from THysyywHysydtYhxmphjgDtfj where 1=1";
		if(dtglFjID != null && !dtglFjID.equals("")){
			sql += " and id = '"+dtglFjID+"'";
		}
		THysyywHysydtYhxmphjgDtfj hysyywHysydtYhxmphjgDtfj = new THysyywHysydtYhxmphjgDtfj();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHysydtYhxmphjgDtfj = (THysyywHysydtYhxmphjgDtfj) l.get(0);
		}
		return hysyywHysydtYhxmphjgDtfj;
	}
	
	/**
	 * 
	Description :保存List
	@param:@param dataList
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-22 下午04:43:19
	 */
	public void addDataList(List<Object> dataList){
		try{
			this.saveList(dataList);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	
}
