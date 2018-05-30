package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.htcf.dao.ISeaDemarcationDao;
import com.htcf.entity.THysyywHysydtHykjDmtxx;
import com.htcf.entity.THysyywHysydtHykjHjfa;
import com.htcf.entity.THysyywHysydtHykjSlsj;

import com.htcf.util.PageBean;
/**
 * 海域动态管理——海域勘界管理
 * @author yinying
 *
 */
@Repository(value="seaDemarcationDao")
public class SeaDemarcationDaoImpl extends BaseDAOImpl<Object, Serializable> implements ISeaDemarcationDao{

	/**
	 * 
	Description :查出多媒体信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 上午11:40:26
	 */
	public List<?> fetchDmtxx(THysyywHysydtHykjDmtxx hysyywHygnqhHykjDmtxx,PageBean pageBean,String userId,String userRoleName){
		String sql=" from THysyywHysydtHykjDmtxx where 1=1 ";
		if(hysyywHygnqhHykjDmtxx != null ){
			if(hysyywHygnqhHykjDmtxx.getWjm() != null && !hysyywHygnqhHykjDmtxx.getWjm().equals("")){
				sql += " and wjm like '%"+hysyywHygnqhHykjDmtxx.getWjm().trim()+"%' ";
			}
			if(hysyywHygnqhHykjDmtxx.getWjlx() != null && !hysyywHygnqhHykjDmtxx.getWjlx().equals("")){
				sql += " and wjlx like '%"+hysyywHygnqhHykjDmtxx.getWjlx().trim()+"%' ";
			}
		}
		if(userRoleName != null && !userRoleName.equals("")){
			if(userRoleName.equals("管理员")){
				
			}else{
				sql += " and adduserid = '"+userId+"' ";
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
	Description :删除多媒体信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午04:58:27
	 */
	public void deleteDmtxx(String dmtID){
		String sql=" delete from T_HYSYYW_HYSYDT_HYKJ_DMTXX where id='"+dmtID+"'";
		try{
			this.updateBySql(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	/**
	 * 
	Description :详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午05:00:56
	 */
	public THysyywHysydtHykjDmtxx fetchDmtxxDetail(String dmtID){
		String sql="from THysyywHysydtHykjDmtxx where 1=1";
		if(dmtID != null && !dmtID.equals("")){
			sql += " and id = '"+dmtID+"'";
		}
		THysyywHysydtHykjDmtxx hysyywHygnqhHykjDmtxx = new THysyywHysydtHykjDmtxx();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHygnqhHykjDmtxx = (THysyywHysydtHykjDmtxx) l.get(0);
		}
		return hysyywHygnqhHykjDmtxx;
	} 
	
	
	/**
	 * 
	Description :查出矢量数据
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午07:47:44
	 */
	public List<?> fetchSlsj(THysyywHysydtHykjSlsj hysyywHygnqhHykjSlsj,PageBean pageBean,String userId,String userRoleName){
		String sql=" from THysyywHysydtHykjSlsj where 1=1 ";
		if(hysyywHygnqhHykjSlsj != null ){
			if(hysyywHygnqhHykjSlsj.getSjlx() != null && !hysyywHygnqhHykjSlsj.getSjlx().equals("")){
				sql += " and sjlx like '%"+hysyywHygnqhHykjSlsj.getSjlx().trim()+"%' ";
			}
			if(hysyywHygnqhHykjSlsj.getSlsjmc() != null && !hysyywHygnqhHykjSlsj.getSlsjmc().equals("")){
				sql += " and slsjmc like '%"+hysyywHygnqhHykjSlsj.getSlsjmc().trim()+"%' ";
			}
		}
		if(userRoleName != null && !userRoleName.equals("")){
			if(userRoleName.equals("管理员")){
				
			}else{
				sql += " and adduserid = '"+userId+"' ";
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
	Description :删除矢量数据
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午07:48:19
	 */
	public void deleteSlsj(String slsjID){
		String sql=" delete from T_HYSYYW_HYSYDT_HYKJ_SLSJ where id='"+slsjID+"'";
		try{
			this.updateBySql(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	/**
	 * 
	Description :详情矢量数据
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午05:00:56
	 */
	public THysyywHysydtHykjSlsj fetchSlsjDetail(String slsjID){
		String sql="from THysyywHysydtHykjSlsj where 1=1";
		if(slsjID != null && !slsjID.equals("")){
			sql += " and id = '"+slsjID+"'";
		}
		THysyywHysydtHykjSlsj hysyywHygnqhHykjSlsj = new THysyywHysydtHykjSlsj();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHygnqhHykjSlsj = (THysyywHysydtHykjSlsj) l.get(0);
		}
		return hysyywHygnqhHykjSlsj;
	} 
	
	/**
	 * 
	Description :划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午05:22:53
	 */
	public List<?> fetchHjfaList(THysyywHysydtHykjHjfa hysyywHygnqhHykjHjfa,PageBean pageBean){
		String sql=" from THysyywHysydtHykjHjfa where 1=1 ";
		if(hysyywHygnqhHykjHjfa != null ){
			if(hysyywHygnqhHykjHjfa.getWjm() != null && !hysyywHygnqhHykjHjfa.getWjm().equals("")){
				sql += " and wjm like '%"+hysyywHygnqhHykjHjfa.getWjm().trim()+"%' ";
			}
			if(hysyywHygnqhHykjHjfa.getWjlx() != null && !hysyywHygnqhHykjHjfa.getWjlx().equals("")){
				sql += " and wjlx = '"+hysyywHygnqhHykjHjfa.getWjlx().trim()+"' ";
			}
		}
		sql += " order by id ";
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
	Description :划界方案详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午05:24:03
	 */
	public THysyywHysydtHykjHjfa fetchHjfaDetail(String hjfaID){
		String sql="from THysyywHysydtHykjHjfa where 1=1";
		if(hjfaID != null && !hjfaID.equals("")){
			sql += " and id = '"+hjfaID+"'";
		}
		THysyywHysydtHykjHjfa hysyywHygnqhHykjHjfa = new THysyywHysydtHykjHjfa();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHygnqhHykjHjfa = (THysyywHysydtHykjHjfa) l.get(0);
		}
		return hysyywHygnqhHykjHjfa;
	} 
	/**
	 * 
	Description :删除划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午05:56:00
	 */
	public void deleteHjfa(String hjfaID){
		String sql=" delete from T_HYSYYW_HYSYDT_HYKJ_HJFA where id='"+hjfaID+"'";
		try{
			this.updateBySql(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	/**
	 * 
	Description :划界方案统计
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午06:47:54
	 */
	public List<?> fetchHjfaTj(){
		String sql = "select wjlx,count(wjlx) from t_hysyyw_hysydt_hykj_hjfa " +
				"group by wjlx order by wjlx";
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
	
	
	
}
