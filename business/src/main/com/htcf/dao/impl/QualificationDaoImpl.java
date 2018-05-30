package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.htcf.dao.IQualificationDao;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywNwbjkZzgl;
import com.htcf.util.PageBean;
/**
 * 内外部接口——资质管理接口
 * @author yinying
 *
 */
@Repository(value="qualificationDao")
public class QualificationDaoImpl extends BaseDAOImpl<Object, Serializable> implements IQualificationDao{

	/**
	 * 
	Description :查询资质列表
	@param:@param pageBean
	@param:@param searchForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:34:59
	 */
	public List<?> fetchZzglList(PageBean pageBean,SearchForm searchForm){
		String sql=" from THysyywNwbjkZzgl where 1=1 ";
		if(searchForm != null){
			if(searchForm.getZzlx() != null && !searchForm.getZzlx().equals("")){
				sql += " and zzlx = '"+searchForm.getZzlx()+"'";
			}
			if(searchForm.getZsdj() != null && !searchForm.getZsdj().equals("")){
				sql += " and zsdj = '"+searchForm.getZsdj()+"'";
			}
			if(searchForm.getDwmc() != null && !searchForm.getDwmc().equals("")){
				sql += " and dwmc like '%"+searchForm.getDwmc().trim()+"%'";
			}
//			if(searchForm.getFzjg() != null && !searchForm.getFzjg().equals("")){
//				sql += " and fzjg like '%"+searchForm.getFzjg().trim()+"%'";
//			}
			
			if(searchForm.getShxydm() != null && !searchForm.getShxydm().equals("")){
				sql += " and shxydm like '%"+searchForm.getShxydm().trim()+"%'";
			}
			if(searchForm.getZsbh() != null && !searchForm.getZsbh().equals("")){
				sql += " and zsbh like '%"+searchForm.getZsbh().trim()+"%'";
			}
			if(searchForm.getFddbr() != null && !searchForm.getFddbr().equals("")){
				sql += " and fddbr like '%"+searchForm.getFddbr().trim()+"%'";
			}
			
			
			
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
	Description :资质详情
	@param:@param zzID
	@param:@return
	@return:THysyywNwbjkZzgl
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:35:05
	 */
	public THysyywNwbjkZzgl fetchZzglDetail(String zzID){
		String sql = " from THysyywNwbjkZzgl where id='"+zzID+"'";
		THysyywNwbjkZzgl hysyywNwbjkZzgl= new THysyywNwbjkZzgl();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywNwbjkZzgl = (THysyywNwbjkZzgl) l.get(0);
		}
		return hysyywNwbjkZzgl;
	}
	
	/**
	 * 
	Description :删除资质
	@param:@param zzID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:33:49
	 */
	public void deleteZzgl(String zzID){
		String sql="delete from T_HYSYYW_NWBJK_ZZGL where id ='"+zzID+"' ";
		try{
			int num = this.updateBySql(sql);
			System.out.println("num="+num);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	
}
