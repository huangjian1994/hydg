package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.htcf.dao.IPatrolDao;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtYhxm;
import com.htcf.entity.THyxcXckpDwkh;
import com.htcf.entity.THyxcXckpRykh;
import com.htcf.util.PageBean;

/**
 * 巡查考评管理
 * @author yinying
 *
 */
@Repository(value="patorlDao")
public class PatorlDaoImpl extends BaseDAOImpl<Object, Serializable> implements IPatrolDao{
	/**
	 * 
	Description :单位考核查询列表
	@param:@param searchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-12-8 下午03:52:42
	 */
	public List<?> fetchDwkhList(SearchForm searchForm,PageBean pageBean,String pxlx){
		StringBuffer hql = new StringBuffer(" from THyxcXckpDwkh y where 1=1  ");
		Map<String, Object> args = new HashMap<String, Object>();
		if(searchForm != null){
			if(searchForm.getXzqh() != null && !searchForm.getXzqh().equals("")){
				hql.append(" and y.xzqh = :xzqh ");
				args.put("xzqh", "" + searchForm.getXzqh().trim() + "");
			}
			if(searchForm.getDwmc() != null && !searchForm.getDwmc().equals("")){
				hql.append(" and y.dwmc = :dwmc ");
				args.put("dwmc", "" + searchForm.getDwmc().trim() + "");
			}
			if(searchForm.getYear() != null && !searchForm.getYear().equals("")){
				hql.append(" and y.year = :year ");
				args.put("year", "" + searchForm.getYear().trim() + "");
			}
			if(searchForm.getMonth() != null && !searchForm.getMonth().equals("")){
				hql.append(" and y.month = :month ");
				args.put("month", "" + searchForm.getMonth().trim() + "");
			}
			if(searchForm.getXclx() != null && !searchForm.getXclx().equals("")){
				hql.append(" and y.xclx = :xclx ");
				args.put("xclx", "" + searchForm.getXclx().trim() + "");
			}
		}
		hql.append(" order by "+pxlx+" desc ");
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
	Description :删除单位考核记录
	@param:@param dwkhID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-8 下午03:54:57
	 */
	public void deleteDwkh(String dwkhID){
		String sql="delete from T_HYXC_XCKP_DWKH where id='"+dwkhID+"'";
		
		try{
			this.updateBySql(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	/**
	 * 
	Description :单位考核详情
	@param:@param dwkhID
	@param:@return
	@return:THyxcXckpDwkh
	@throws
	@Author：yinying
	@Create 2017-12-8 下午04:00:35
	 */
	public THyxcXckpDwkh fetchDwkhDetail(String dwkhID){
		String sql=" from THyxcXckpDwkh where id='"+dwkhID+"'";
		THyxcXckpDwkh hyxcXckpDwkh = new THyxcXckpDwkh();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hyxcXckpDwkh = (THyxcXckpDwkh) l.get(0);
		}
		return hyxcXckpDwkh;
	}
	
	/**
	 * 
	Description :单位考核统计
	@param:@param searchForm
	@param:@param tjlx
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-12-8 下午07:13:14
	 */
	public List<?> fetchDwkhTj(SearchForm searchForm,String tjlx){
		String sql="select xzqhmc,sum(zf),xzqh from T_HYXC_XCKP_DWKH where 1=1 ";
		
		if(searchForm != null){
			if(searchForm.getXclx() != null && !searchForm.getXclx().equals("")){
				sql += " and xclx='"+searchForm.getXclx()+"' ";
			}
			if(searchForm.getXzqh() != null && !searchForm.getXzqh().equals("")){
				sql += " and xzqhmc='"+searchForm.getXzqh()+"' ";
			}
			if(searchForm.getYear() != null && !searchForm.getYear().equals("")){
				sql += " and year='"+searchForm.getYear()+"'";
			}
			if(searchForm.getMonth() != null && !searchForm.getMonth().equals("")){
				sql += " and month='"+searchForm.getMonth()+"'";
			}
			if(searchForm.getJidu() != null && !searchForm.getJidu().equals("")){
				if(searchForm.getJidu().equals("1")){
					sql += " and month >='1' and month <='3' ";
				}
				if(searchForm.getJidu().equals("2")){
					sql += " and month >='4' and month <='6' ";
				}
				if(searchForm.getJidu().equals("3")){
					sql += " and month >='7' and month <='9' ";
				}
				if(searchForm.getJidu().equals("4")){
					sql += " and month >='10' and month <='12' ";
				}
			}
		}
		
		sql += " group by xzqhmc,xzqh order by xzqh";
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
	

	
	/******************************人员考核***************************************/
	
	
	
	/**
	 * 
	Description :巡查考核-人员考核
	@param:@param searchForm
	@param:@param pageBean
	@param:@param pxlx
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-4 下午05:50:33
	 */
	public List<?> fetchXckhRykh(SearchForm searchForm,PageBean pageBean,String pxlx){
		StringBuffer hql = new StringBuffer(" from THyxcXckpRykh y where 1=1  ");
		Map<String, Object> args = new HashMap<String, Object>();
		if(searchForm != null){
			if(searchForm.getXzqh() != null && !searchForm.getXzqh().equals("")){
				hql.append(" and y.xzqh = :xzqh ");
				args.put("xzqh", "" + searchForm.getXzqh().trim() + "");
			}
			if(searchForm.getDwmc() != null && !searchForm.getDwmc().equals("")){
				hql.append(" and y.dwmc = :dwmc ");
				args.put("dwmc", "" + searchForm.getDwmc().trim() + "");
			}
			if(searchForm.getYear() != null && !searchForm.getYear().equals("")){
				hql.append(" and y.year = :year ");
				args.put("year", "" + searchForm.getYear().trim() + "");
			}
			if(searchForm.getMonth() != null && !searchForm.getMonth().equals("")){
				hql.append(" and y.month = :month ");
				args.put("month", "" + searchForm.getMonth().trim() + "");
			}
			if(searchForm.getXclx() != null && !searchForm.getXclx().equals("")){
				hql.append(" and y.xclx = :xclx ");
				args.put("xclx", "" + searchForm.getXclx().trim() + "");
			}
		}
		hql.append(" order by "+pxlx+" desc ");
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
	Description :删除人员考核
	@param:@param rykhID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-4 下午05:51:45
	 */
	public boolean deleteRykh(String rykhID){
		Long ryid = Long.parseLong(rykhID);
		if ( null == ryid ) return false;
		String hql = "delete from THyxcXckpRykh s where s.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", ryid);
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
	Description :人员考核详情
	@param:@param rykhID
	@param:@return
	@return:THyxcXckpRykh
	@throws
	@Author：yinying
	@Create 2018-1-4 下午05:51:57
	 */
	public THyxcXckpRykh fetchRykhDetail(String rykhID){
		String sql=" from THyxcXckpRykh where id='"+rykhID+"'";
		THyxcXckpRykh hyxcXckpRykh = new THyxcXckpRykh();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hyxcXckpRykh = (THyxcXckpRykh) l.get(0);
		}
		return hyxcXckpRykh;
	}
	
	/**
	 * 
	Description :人员考核统计
	@param:@param searchForm
	@param:@param tjlx
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-5 下午06:53:38
	 */
	public List<?> fetchRykhTj(SearchForm searchForm,String tjlx){
		String sql="select xzqhmc,sum(zf),xzqh from T_Hyxc_Xckp_Rykh where 1=1 ";
		
		if(searchForm != null){
			if(searchForm.getXclx() != null && !searchForm.getXclx().equals("")){
				sql += " and xclx='"+searchForm.getXclx()+"' ";
			}
			if(searchForm.getXzqh() != null && !searchForm.getXzqh().equals("")){
				sql += " and xzqhmc='"+searchForm.getXzqh()+"' ";
			}
			if(searchForm.getYear() != null && !searchForm.getYear().equals("")){
				sql += " and year='"+searchForm.getYear()+"'";
			}
			if(searchForm.getMonth() != null && !searchForm.getMonth().equals("")){
				sql += " and month='"+searchForm.getMonth()+"'";
			}
			if(searchForm.getJidu() != null && !searchForm.getJidu().equals("")){
				if(searchForm.getJidu().equals("1")){
					sql += " and month >='1' and month <='3' ";
				}
				if(searchForm.getJidu().equals("2")){
					sql += " and month >='4' and month <='6' ";
				}
				if(searchForm.getJidu().equals("3")){
					sql += " and month >='7' and month <='9' ";
				}
				if(searchForm.getJidu().equals("4")){
					sql += " and month >='10' and month <='12' ";
				}
			}
		}
		
		sql += " group by xzqhmc,xzqh order by xzqh";
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
