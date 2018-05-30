package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.htcf.dao.ISeaUseGoldDao;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtHysyjForm;
import com.htcf.entity.THysyywHysydtYhxm;
import com.htcf.entity.THysyywHysydtYhxmHysyjJntz;
import com.htcf.entity.THysyywHysydtYhxmHysyjZsbz;
import com.htcf.entity.THysyywHysydtYhxmZhxx;
import com.htcf.util.PageBean;
/**
 * 海域使用金征收管理 T_HYSYYW_HYSYDT_YHXM_HYSYJ
 * @author yinying
 *
 */
@Repository(value="seaUseGoldDao")
public class SeaUseGoldDaoImpl extends BaseDAOImpl<Object, Serializable> implements ISeaUseGoldDao{

	/**
	 * 
	Description :海域使用金列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-14 下午06:47:14
	 */
	public List<?> fetchHysyjList(THysyywHysydtHysyjForm hysyywHysydtHysyjForm,PageBean pageBean,String userId,String userRoleName){
		//证书编号 项目名称 用海性质 发证级别 海域使用权人 
		//两表关联
//		String sql=" from THysyywHysydtHysyj where 1=1 ";
		
		String sql = 
			"select '', y.id yid, z.id zid, z.hyglh, y.yhxmmc, " +
//			"z.yhxz, " +
			"(select t.value from base_dictionary t where t.key='用海性质' and t.dm=z.yhxz)," +
//			"y.FZJGJB," +
			"(select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=y.FZJGJB)," +
			" y.HYSYQR\n" +
			"  from t_hysyyw_hysydt_yhxm      y,\n" + 
			"       T_HYSYYW_HYSYDT_YHXM_ZHXX z\n" + 
			" where z.xmid = y.id  \n " +
			"  and z.hyglh in (select t.hyglh from t_hysyyw_hysydt_yhxm_hysyj t where t.SFWLSYH ='否') \n";//已确权

		if(hysyywHysydtHysyjForm != null ){
			//证书编号
			if(hysyywHysydtHysyjForm.getZsbh() != null && !hysyywHysydtHysyjForm.getZsbh().equals("")){
				sql += " and z.hyglh like '%"+hysyywHysydtHysyjForm.getZsbh().trim()+"%' ";
			}
			//项目名称
			if(hysyywHysydtHysyjForm.getXmmc() != null && !hysyywHysydtHysyjForm.getXmmc().equals("")){
				sql += " and y.yhxmmc like '%"+hysyywHysydtHysyjForm.getXmmc().trim()+"%' ";
			}
			//海域使用权人
			if(hysyywHysydtHysyjForm.getSyqr() != null && !hysyywHysydtHysyjForm.getSyqr().equals("")){
				sql += " and y.HYSYQR like '%"+hysyywHysydtHysyjForm.getSyqr().trim()+"%' ";
			}
			//项目状态:无值
			if(hysyywHysydtHysyjForm.getXmzt() != null && !hysyywHysydtHysyjForm.getXmzt().equals("")){
				sql += " and y.zt like '%"+hysyywHysydtHysyjForm.getXmzt().trim()+"%' ";
			}
			//项目位置
			if(hysyywHysydtHysyjForm.getXmwz() != null && !hysyywHysydtHysyjForm.getXmwz().equals("")){
				sql += " and y.XMWZ like '%"+hysyywHysydtHysyjForm.getXmwz().trim()+"%' ";
			}
			//缴纳类型:无值
			if(hysyywHysydtHysyjForm.getJnlx() != null && !hysyywHysydtHysyjForm.getJnlx().equals("")){
				sql += " and y.JNLX like '%"+hysyywHysydtHysyjForm.getJnlx().trim()+"%' ";
			}
			//发证级别
			if(hysyywHysydtHysyjForm.getFzjb() != null && !hysyywHysydtHysyjForm.getFzjb().equals("")){
				sql += " and y.FZJGJB like '%"+hysyywHysydtHysyjForm.getFzjb().trim()+"%' ";
			}
		}

		if(userRoleName != null && !userRoleName.equals("")){
			if(userRoleName.equals("管理员")){
					
			}else{
				sql += " and y.ADDUSERID = '"+userId+"' ";
			}
		}
		sql += " order by y.id desc ";
//		List<?> l = this.findPageByJPQL(sql, pageBean);
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
	Description :缴纳明细-证书信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-26 下午08:02:41
	 */
	public List<?> fetchJnmxZsxx(String xmID,String zsID){
		String sql=
//			"select t.id tid,y.id yid,t.zsh,y.yhxmmc,y.xmwz,y.hysyqr,t.QQFS," +
//				"t.YHLXA,t.YHLXB,t.SFWLSYH,t.YHZZNX " +
//				"from T_HYSYYW_HYSYDT_YHXM_ZHXX t,t_hysyyw_hysydt_yhxm y " +
//				"where t.xmid=y.id " +
//				"";
		"select t.id tid,\n" +
		"       y.id yid,\n" + 
		"       t.hyglh,\n" + 
		"       y.yhxmmc,\n" + 
		"       y.xmwz,\n" + 
		"       y.hysyqr,\n" + 
		"       t.QQFS,\n" + 
		"       t.YHLXA,\n" + 
		"       t.YHLXB,\n" + 
		"       '',\n" + //是否为临时用海
		"       t.YHZZNX,\n" + 
		"       (select d.value from base_dictionary d where d.key='项目位置' and d.dm=y.xmwz),\n" + 
		"       (select d.value from base_dictionary d where d.key='确权方式' and d.dm=t.QQFS),\n" + 
		"       (select d.value from base_dictionary d where d.key='用海类型A' and d.dm=t.YHLXA),\n" + 
		"       (select d.value from base_dictionary d where d.key='用海类型B' and d.dm=t.YHLXB)\n" + 
		"  from T_HYSYYW_HYSYDT_YHXM_ZHXX t, t_hysyyw_hysydt_yhxm y\n" + 
		" where t.xmid = y.id";
		if(xmID != null && !xmID.equals("")){
			sql += " and y.id = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql +=" and t.id='"+zsID+"' ";
		}
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
	Description :缴纳明细列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-28 下午04:03:17
	 */
	public List<?> fetchJnmxList(String xmID,String zsID,String xmmc){
		String sql=" from THysyywHysydtYhxmHysyj " +
				"where 1=1 ";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"' ";
		}
		if(zsID != null && !zsID.equals("")){
			sql +=" and zsid='"+zsID+"' ";
		}
		if(xmmc != null && !xmmc.equals("")){
			sql +=" and xmmc='"+xmmc+"' ";
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
	Description :临时用海海域使用金缴纳
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 上午10:47:30
	 */
	public List<?> fetchHysyjList2(THysyywHysydtHysyjForm hysyywHysydtHysyjForm,PageBean pageBean,String userId,String userRoleName){
		// 项目名称 海域使用权人  用海性质  项目位置  
		String sql = 
			"select distinct t.xmid,t.xmmc,t.hysyqr," +
//			"t.xmwz," +
			"(select d.value from base_dictionary d where d.key='项目位置' and d.dm=t.xmwz)," +
			"t.hyglh,t.id " +//用海性质
			" from t_hysyyw_hysydt_yhxm_hysyj t where t.SFWLSYH='是' ";
		
		if(hysyywHysydtHysyjForm != null ){
			//项目名称
			if(hysyywHysydtHysyjForm.getXmmc() != null && !hysyywHysydtHysyjForm.getXmmc().equals("")){
				sql += " and t.xmmc like '%"+hysyywHysydtHysyjForm.getXmmc().trim()+"%' ";
			}
			//海域使用权人
			if(hysyywHysydtHysyjForm.getSyqr() != null && !hysyywHysydtHysyjForm.getSyqr().equals("")){
				sql += " and t.hysyqr like '%"+hysyywHysydtHysyjForm.getSyqr().trim()+"%' ";
			}
			//用海性质
			if(hysyywHysydtHysyjForm.getYhxz() != null && !hysyywHysydtHysyjForm.getYhxz().equals("")){
//				sql += " and t.xmwz like '%"+hysyywHysydtHysyjForm.getYhxz().trim()+"%' ";
			}
			//项目位置
			if(hysyywHysydtHysyjForm.getXmwz() != null && !hysyywHysydtHysyjForm.getXmwz().equals("")){
				sql += " and t.xmwz like '%"+hysyywHysydtHysyjForm.getXmwz().trim()+"%' ";
			}
//			if(hysyywHysydtHysyjForm.getJnlx() != null && !hysyywHysydtHysyjForm.getJnlx().equals("")){
//				sql += " and y.JNLX like '%"+hysyywHysydtHysyjForm.getJnlx().trim()+"%' ";
//			}
//			if(hysyywHysydtHysyjForm.getFzjb() != null && !hysyywHysydtHysyjForm.getFzjb().equals("")){
//				sql += " and y.FZJGJB like '%"+hysyywHysydtHysyjForm.getFzjb().trim()+"%' ";
//			}
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
	Description :缴纳证书信息2
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 下午07:42:35
	 */
	public List<?> fetchJnmxZsxx2(String xmID,String zsID,String xmmc){
		String sql=
			"select distinct XMMC,XMWZ,HYSYQR,QQFS,YHLXA,YHLXB,SFWLSYH,YHSX,\n" +
			"(select d.value from base_dictionary d where d.key='项目位置' and d.dm=t.xmwz),\n" + 
			"       (select d.value from base_dictionary d where d.key='确权方式' and d.dm=t.QQFS),\n" + 
			"       (select d.value from base_dictionary d where d.key='用海类型A' and d.dm=t.YHLXA),\n" + 
			"       (select d.value from base_dictionary d where d.key='用海类型B' and d.dm=t.YHLXB)\n" + 
			" from t_hysyyw_hysydt_yhxm_hysyj t where 1=1 ";
		if(xmID != null && !xmID.equals("")){
			sql += " and t.xmid = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql +=" and t.ZSID='"+zsID+"' ";
		}
		if(xmmc != null && !xmmc.equals("")){
			sql +=" and t.XMMC='"+xmmc+"' ";
		}
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
	Description :海域使用金缴纳记录
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-11 下午02:58:31
	 */
	public List<?> fetchHysyjList3(THysyywHysydtHysyjForm hysyywHysydtHysyjForm,PageBean pageBean,String userId,String userRoleName){
		//缴纳时间 证书编号 项目名称 海域使用权人 是否临时项目
		String sql = 
			"select t.zsid,t.xmid,t.jnrq, t.hyglh,t.xmmc,t.hysyqr,t.SFWLSYH " +
			" from t_hysyyw_hysydt_yhxm_hysyj t where 1=1 ";
		if(hysyywHysydtHysyjForm != null ){
			//证书编号
			if(hysyywHysydtHysyjForm.getZsbh() != null && !hysyywHysydtHysyjForm.getZsbh().equals("")){
				sql += " and t.hyglh like '%"+hysyywHysydtHysyjForm.getZsbh().trim()+"%' ";
			}
			//项目名称
			if(hysyywHysydtHysyjForm.getXmmc() != null && !hysyywHysydtHysyjForm.getXmmc().equals("")){
				sql += " and t.xmmc like '%"+hysyywHysydtHysyjForm.getXmmc().trim()+"%' ";
			}
			//海域使用权人
			if(hysyywHysydtHysyjForm.getSyqr() != null && !hysyywHysydtHysyjForm.getSyqr().equals("")){
				sql += " and t.hysyqr like '%"+hysyywHysydtHysyjForm.getSyqr().trim()+"%' ";
			}
			//是否临时项目
			if(hysyywHysydtHysyjForm.getSfwlsyh() != null && !hysyywHysydtHysyjForm.getSfwlsyh().equals("")){
				sql += " and t.SFWLSYH like '%"+hysyywHysydtHysyjForm.getSfwlsyh().trim()+"%' ";
			}
		}
		if(userRoleName != null && !userRoleName.equals("")){
			if(userRoleName.equals("管理员")){
				
			}else{
				sql += " and t.ADDUSERID = '"+userId+"' ";
			}
		}
		sql += " order by t.jnrq desc";
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
	Description :证书信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-12 上午11:27:59
	 */
	public THysyywHysydtYhxmZhxx fetchYhxmZsxxDetail(String xmID,String zsID,String zsbh){
		String sql="from THysyywHysydtYhxmZhxx where 1=1";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and id = '"+zsID+"'";
		}
		if(zsbh != null && !zsbh.equals("")){
			sql += " and hyglh = '"+zsbh+"'";
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
	Description :项目信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-12 上午11:28:59
	 */
	public THysyywHysydtYhxm fetchYhxmDetail(String xmID,String xmmc){
		String sql="from THysyywHysydtYhxm where 1=1";
		if(xmID != null && !xmID.equals("")){
			sql += " and id = '"+xmID+"'";
		}
		if(xmmc != null && !xmmc.equals("")){
			sql += " and yhxmmc = '"+xmmc+"'";
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
	
	/********************缴纳通知*********************/
	
	/**
	 * 
	Description :查出证书列表（缴纳通知）
	@param:@param pageBean
	@param:@param userId
	@param:@param userRoleName
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-31 下午04:55:21
	 */
	public List<?> fetchZhxxList(PageBean pageBean,String userId,String userRoleName,SearchForm searchForm){
		String sql=
			"select t.id,\n" +
			"       t.xmid,\n" + 
			"       t.hyglh,\n" + 
			"       y.yhxmmc,\n" + 
			"       t.yhxz,\n" + 
			"       (select d.value\n" + 
			"          from base_dictionary d\n" + 
			"         where d.key = '用海性质'\n" + 
			"           and d.dm = t.yhxz) yhxzmc,\n" + 
			"       y.hysyqr,\n" + 
			"       (select count(h.id)\n" + 
			"          from t_hysyyw_hysydt_yhxm_hysyjjntz h\n" + 
			"         where h.xmid = y.id) cs,\n" + 
			"       t.SYJJNFS,\n" + 
			"       (select d.value\n" + 
			"          from base_dictionary d\n" + 
			"         where d.key = '使用金缴纳方式'\n" + 
			"           and d.dm = t.SYJJNFS) SYJJNFSMC\n" +
			"  from t_hysyyw_hysydt_yhxm_zhxx t, t_hysyyw_hysydt_yhxm y\n" + 
			" where t.xmid = y.id";
		if(searchForm != null){
			if(searchForm.getHyglh() != null && !searchForm.getHyglh().equals("")){
				sql += " and t.hyglh like '%"+searchForm.getHyglh().trim()+"%'";
			}
			if(searchForm.getYhxmmc() != null && !searchForm.getYhxmmc().equals("")){
				sql += " and y.yhxmmc like '%"+searchForm.getYhxmmc().trim()+"%'";
			}
			if(searchForm.getYhxz() != null && !searchForm.getYhxz().equals("")){
				sql += " and t.yhxz = '"+searchForm.getYhxz().trim()+"'";
			}
			if(searchForm.getHysyqr() != null && !searchForm.getHysyqr().equals("")){
				sql += " and y.hysyqr like '%"+searchForm.getHysyqr().trim()+"%'";
			}
		}
		sql += " order by t.id desc";
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
	Description :缴纳通知记录
	@param:@param pageBean
	@param:@param userId
	@param:@param userRoleName
	@param:@param searchForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-1 上午11:22:09
	 */
	public List<?> fetchZhxxList2(PageBean pageBean,String userId,String userRoleName,SearchForm searchForm){
		String sql=
			"select h.id,\n" +
			"       h.zsid,\n" + 
			"       h.xmid,z.hyglh,\n" + 
			"       y.yhxmmc,\n" + 
			"       z.yhxz,\n" + 
			"       (select d.value\n" + 
			"          from base_dictionary d\n" + 
			"         where d.key = '用海性质'\n" + 
			"           and d.dm = z.yhxz) yhxzmc,\n" + 
			"       y.hysyqr,\n" + 
			"       h.SYJJNFS,\n" + 
			"       (select d.value\n" + 
			"          from base_dictionary d\n" + 
			"         where d.key = '使用金缴纳方式'\n" + 
			"           and d.dm = h.SYJJNFS) SYJJNFSMC,h.tzrq,h.khh,h.zt\n" + 
			"  from T_HYSYYW_HYSYDT_YHXM_HYSYJJNTZ h,\n" + 
			"       t_hysyyw_hysydt_yhxm           y,\n" + 
			"       t_hysyyw_hysydt_yhxm_zhxx      z\n" + 
			" where h.xmid = y.id\n" + 
			"   and h.zsid = z.id(+) ";
		if(searchForm != null){
			if(searchForm.getHyglh() != null && !searchForm.getHyglh().equals("")){
				sql += " and h.hyglh like '%"+searchForm.getHyglh().trim()+"%'";
			}
			if(searchForm.getYhxmmc() != null && !searchForm.getYhxmmc().equals("")){
				sql += " and y.yhxmmc like '%"+searchForm.getYhxmmc().trim()+"%'";
			}
			if(searchForm.getYhxz() != null && !searchForm.getYhxz().equals("")){
				sql += " and z.yhxz = '"+searchForm.getYhxz().trim()+"'";
			}
			if(searchForm.getHysyqr() != null && !searchForm.getHysyqr().equals("")){
				sql += " and y.hysyqr like '%"+searchForm.getHysyqr().trim()+"%'";
			}
			if(searchForm.getJnfs() != null && !searchForm.getJnfs().equals("")){
				sql += " and h.SYJJNFS like '%"+searchForm.getJnfs().trim()+"%'";
			}
			if(searchForm.getZt() != null && !searchForm.getZt().equals("")){
				sql += " and h.zt like '%"+searchForm.getZt().trim()+"%'";
			}
		}
		sql += " order by h.id desc";
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
	Description :删除缴纳通知
	@param:@param jntzID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-10-31 下午07:48:40
	 */
	public void deleteJntz(String jntzID){
		String sql="delete from t_hysyyw_hysydt_yhxm_hysyjjntz where id='"+jntzID+"'";
		try{
			this.updateBySql(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	
	/**
	 * 
	Description :缴纳通知详情
	@param:@param jntzID
	@param:@return
	@return:THysyywHysydtYhxmHysyjJntz
	@throws
	@Author：yinying
	@Create 2017-10-31 下午07:52:13
	 */
	public THysyywHysydtYhxmHysyjJntz fetchJntzDetail(String jntzID){
		String sql =" from THysyywHysydtYhxmHysyjJntz where id='"+jntzID+"'";
		THysyywHysydtYhxmHysyjJntz hysyywHysydtYhxmHysyjJntz= new THysyywHysydtYhxmHysyjJntz();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHysydtYhxmHysyjJntz = (THysyywHysydtYhxmHysyjJntz) l.get(0);
		}
		return hysyywHysydtYhxmHysyjJntz;
		
	}
	
	/**
	 * 
	Description :根据项目id、证书ID查缴纳记录
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-1 下午05:10:44
	 */
	public List<?> fetchJntzListByXmid(String xmID,String zsID){
		String sql = "select t.id,t.XMID,t.ZSID,t.HYGLH,t.HYSYQR," +
				"t.SYJZE," +
				"(select d.value  from base_dictionary d where d.key = '使用金缴纳方式' and d.dm = t.SYJJNFS) SYJJNFSMC," +
				"t.TZRQ,t.KHH" +
				" from t_hysyyw_hysydt_yhxm_hysyjjntz t where 1=1 ";
		if(xmID != null && !xmID.equals("")){
			sql += " and t.XMID = '"+xmID+"'";
		}
//		if(zsID != null && !zsID.equals("")){
//			sql += " and t.ZSID = '"+zsID+"'";
//		}
		sql += " order by t.id desc";
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
	Description :查出项目信息
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-1 下午05:40:55
	 */
	public List<?> fetchXmxxZhxx(String xmID,String zsID){
		String sql = "select t.id tid,z.id zid,t.hysyqr,t.yhzmj,t.SLRQ,t.FZJG," +
				"z.YHQSNX,z.YHZZNX,z.SYJZE,z.SYJJNFS,z.SYJZSBZ,z.SYJZSBZYJ" +
				" from t_hysyyw_hysydt_yhxm t,t_hysyyw_hysydt_yhxm_zhxx z" +
				" where t.id=z.xmid";
		if(xmID != null && !xmID.equals("")){
			sql += " and t.id = '"+xmID+"'";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and z.id = '"+zsID+"'";
		}
		sql += " order by t.id desc";
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
	Description :逾期未缴纳
	@param:@return
	@return:int
	@throws
	@Author：yinying
	@Create 2017-11-1 下午06:52:16
	 */
	public int fetchYjwjn(){
		int count=0;
		String sql="select count(id) from t_hysyyw_hysydt_yhxm_hysyjjntz t " +
				"where zt='未缴纳' and TZRQ<to_char(sysdate,'yyyy-mm-dd') " +
				"and xmid in ( select id from T_HYSYYW_HYSYDT_YHXM)";
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
	
	/********************征收标准*********************/
	/**
	 * 
	Description :征收标准列表
	@param:@param pageBean
	@param:@param searchForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-1 下午07:08:39
	 */
	public List<?> fetchHysyjZsbz(PageBean pageBean,SearchForm searchForm){
		String sql="select id," +
				"(select d.value  from base_dictionary d where d.key = '使用金征收标准用海类别A' and d.dm = yhlxa) yhlxa," +
				"(select d.value  from base_dictionary d where d.key = '使用金征收标准用海类别B' and d.dm = yhlxb) yhlxb, " +
				"hydb1,hydb2,hydb3,hydb4,hydb5,hydb6,yz," +
				"dw," +
				"(select d.value  from base_dictionary d where d.key = '征收方式' and d.dm = zsfs) zsfs" +
				" from t_hysyyw_hysydt_yhxm_hysyjzsbz where 1=1 ";
		if(searchForm != null){
			if(searchForm.getYhlxa() != null && !searchForm.getYhlxa().equals("")){
				sql += " and yhlxa = '"+searchForm.getYhlxa()+"'";
			}
			if(searchForm.getYhlxb() != null && !searchForm.getYhlxb().equals("")){
				sql += " and yhlxb = '"+searchForm.getYhlxb()+"'";
			}
//			if(searchForm.getHydb() != null && !searchForm.getHydb().equals("")){
//				sql += " and hydb = '"+searchForm.getHydb()+"'";
//			}
			if(searchForm.getZsfs() != null && !searchForm.getZsfs().equals("")){
				sql += " and zsfs = '"+searchForm.getZsfs()+"'";
			}
		}
		sql += " order by id ";
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
	Description :删除征收标准
	@param:@param zsbzID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-11-1 下午07:32:01
	 */
	public void deleteZsbz(String zsbzID){
		String sql="delete from t_hysyyw_hysydt_yhxm_hysyjzsbz where id='"+zsbzID+"'";
		try{
			this.updateBySql(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	/**
	 * 
	Description :征收标准详情
	@param:@param zsbzID
	@param:@return
	@return:THysyywHysydtYhxmHysyjZsbz
	@throws
	@Author：yinying
	@Create 2017-11-1 下午07:33:12
	 */
	public THysyywHysydtYhxmHysyjZsbz fetchZsbzDetail(String zsbzID){
		String sql = " from THysyywHysydtYhxmHysyjZsbz where id='"+zsbzID+"'";
		THysyywHysydtYhxmHysyjZsbz hysyywHysydtYhxmHysyjZsbz= new THysyywHysydtYhxmHysyjZsbz();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHysydtYhxmHysyjZsbz = (THysyywHysydtYhxmHysyjZsbz) l.get(0);
		}
		return hysyywHysydtYhxmHysyjZsbz;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
