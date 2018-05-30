package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.htcf.dao.ISubmarinelineDao;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THdgxAqglWgjb;
import com.htcf.util.PageBean;

/**
 * 海底管线：安全管理-违规举报
 * @author yinying
 *
 */
@Repository(value="submarinelineDao")
public class SubmarinelineDaoImpl extends BaseDAOImpl<Object, Serializable> implements ISubmarinelineDao{

	/**
	 * 
	Description :违规举报管理列表
	@param:@param searchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:02:11
	 */
	public List<?> fetchAqglWgjb(SearchForm searchForm,PageBean pageBean){
		StringBuffer hql = new StringBuffer(" from THdgxAqglWgjb y where 1=1  ");
		Map<String, Object> args = new HashMap<String, Object>();
		if(searchForm != null){
			if(searchForm.getMmsi() != null && !searchForm.getMmsi().equals("")){
				hql.append(" and y.mmsi like :mmsi ");
				args.put("mmsi", "%" + searchForm.getMmsi().trim() + "%");
			}
			if(searchForm.getWgcm() != null && !searchForm.getWgcm().equals("")){
				hql.append(" and y.wgcm like :wgcm ");
				args.put("wgcm", "%" + searchForm.getWgcm().trim() + "%");
			}
			if(searchForm.getCblx() != null && !searchForm.getCblx().equals("")){
				hql.append(" and y.cblx = :cblx ");
				args.put("cblx", "" + searchForm.getCblx().trim() + "");
			}
			if(searchForm.getWgrq() != null && !searchForm.getWgrq().equals("")){
				hql.append(" and y.wgrq = :wgrq ");
				args.put("wgrq", "" + searchForm.getWgrq().trim() + "");
			}
		}
		hql.append(" order by id desc ");
		List<?> l = null;
		try{
			l = this.findPageByJPQL(hql.toString(), args, pageBean);
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
	Description :修改违规举报
	@param:@param hdgxAqglWgjb
	@param:@return
	@return:boolean
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:03:07
	 */
	public boolean updateWgjb(THdgxAqglWgjb hdgxAqglWgjb) {
		try {
			update(hdgxAqglWgjb);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * 
	Description :删除违规举报
	@param:@param id
	@param:@return
	@return:boolean
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:04:24
	 */
	public boolean deleteWgjbById(Long id){
		if ( null == id ) return false;
		String hql = "delete from THdgxAqglWgjb s where s.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", id);
		try {
			updateByJPQL(hql, args);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	} 
	/**
	 * 
	Description :违规举报详情
	@param:@param wgjbID
	@param:@return
	@return:THdgxAqglWgjb
	@throws
	@Author：yinying
	@Create 2017-12-29 下午03:05:59
	 */
	public THdgxAqglWgjb fetchWgjbDetail(String wgjbID){		
		String sql=" from THdgxAqglWgjb where id='"+wgjbID+"'";
		THdgxAqglWgjb hdgxAqglWgjb = new THdgxAqglWgjb();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hdgxAqglWgjb = (THdgxAqglWgjb) l.get(0);
		}
		return hdgxAqglWgjb;
	}

	
	
	
	
	
	
	
	
	
	
}
