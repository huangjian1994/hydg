package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.dao.ISeaRecordDao;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtYhxmXmfj;
import com.htcf.entity.THysyywHysydtYhxmXmfjForm;
import com.htcf.entity.TjfxForm;
import com.htcf.util.PageBean;
/**
 * 海籍管理
 * @author yinying
 *
 */
@Repository(value="seaRecordDao")
public class SeaRecordDaoImpl extends BaseDAOImpl<Object, Serializable> implements ISeaRecordDao{

	/**
	 * 
	Description :文件列表
	@param:@param pageBean
	@param:@param searchForm
	@param:@param userId
	@param:@param userRoleName
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-16 上午10:21:03
	 */
	public List<?> fetchFileList(PageBean pageBean,SearchForm searchForm,String userId,String userRoleName){
		
		StringBuffer hql = new StringBuffer(
				"select t.ID,\n" +
				"       t.XMID,\n" + 
				"       t.ZSID,\n" + 
				"       t.FJMC,\n" + 
				"       t.FJLX, (select d.value from base_dictionary d where d.key='附件类型' and d.dm=t.FJLX) FJLXMC,\n" + 
				"       t.FJ,\n" + 
				"       t.BZ,\n" + 
				"       t.WJLX,\n" + 
				"       t.WJDX,\n" + 
				"       t.SCR,\n" + 
				"       t.SCSJ,\n" + 
				"       t.FJLJ,\n" + 
				"       t.ADDTIME,t.LASTUPDATETIME,t.ADDUSERNAME,t.ADDUSERID,y.yhxmmc,\n" +
				"(select z.hyglh from T_HYSYYW_HYSYDT_YHXM_ZHXX z where z.id=t.zsid ) " + 
				"  from T_HYSYYW_HYSYDT_YHXM_XMFJ t,t_hysyyw_hysydt_yhxm y\n" + 
				" where t.xmid=y.id ");
		Map<String, Object> args = new HashMap<String, Object>();
		if(searchForm != null){
			if(searchForm.getYhxmmc() != null && !searchForm.getYhxmmc().equals("")){
				hql.append(" and y.yhxmmc like :yhxmmc ");
				args.put("yhxmmc", "%" + searchForm.getYhxmmc().trim() + "%");
			}
			//if(searchForm.getHyglh() != null && !searchForm.getHyglh().equals("")){
			//	hql.append(" and z.hyglh like :hyglh ");
			//	args.put("hyglh", "%" + searchForm.getHyglh().trim() + "%");
			//}
			
			if(searchForm.getWjm() != null && !searchForm.getWjm().equals("")){
				hql.append(" and t.FJMC like :FJMC ");
				args.put("FJMC", "%" + searchForm.getWjm().trim() + "%");
			}
			if(searchForm.getWjlx() != null && !searchForm.getWjlx().equals("")){
				hql.append(" and t.FJLX = :FJLX ");
				args.put("FJLX", "" + searchForm.getWjlx().trim() + "");
			}
		}
		
		hql.append(" order by id desc ");
		List<Object []> l = null;
		try{
			l = this.findPageBySQL(hql.toString(), pageBean, args);
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
	    		if(obj[17] != null && !obj[17].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setYhxmmc(obj[17].toString());
	    		}
	    		if(obj[18] != null && !obj[18].equals("")){
	    			hysyywHysydtYhxmXmfjForm.setHyglh(obj[18].toString());
	    		}
	    		
	    		yjList.add(hysyywHysydtYhxmXmfjForm);
			}
		}
		return yjList;
	}
	
	/**
	 * 
	Description :图片列表
	@param:@param pageBean
	@param:@param searchForm
	@param:@param userId
	@param:@param userRoleName
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-16 上午10:21:13
	 */
	public List<?> fetchZpList(PageBean pageBean,SearchForm searchForm,String userId,String userRoleName){
		StringBuffer hql = new StringBuffer("select t.id,t.xmid,t.zsid,t.addusername,t.addtime,y.yhxmmc,z.hyglh" +
				" from T_HYSYYW_HYSYDT_YHXM_ZHT t,t_hysyyw_hysydt_yhxm y,T_HYSYYW_HYSYDT_YHXM_ZHXX z " +
				" where t.xmid=y.id and t.zsid = z.id ");
		Map<String, Object> args = new HashMap<String, Object>();
		if(searchForm != null){
			if(searchForm.getYhxmmc2() != null && !searchForm.getYhxmmc2().equals("")){
				hql.append(" and y.yhxmmc like :yhxmmc ");
				args.put("yhxmmc", "%" + searchForm.getYhxmmc2().trim() + "%");
			}
			if(searchForm.getHyglh2() != null && !searchForm.getHyglh2().equals("")){
				hql.append(" and z.hyglh like :hyglh ");
				args.put("hyglh", "%" + searchForm.getHyglh2().trim() + "%");
			}
			
		}
		
		hql.append(" order by t.id desc ");
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
	Description :附件详情
	@param:@param xmfjID
	@param:@return
	@return:THysyywHysydtYhxmXmfj
	@throws
	@Author：yinying
	@Create 2017-11-17 下午02:58:34
	 */
	public THysyywHysydtYhxmXmfj fetchXmfjDetail(String xmfjID){
		String sql="from THysyywHysydtYhxmXmfj where 1=1";
		if(xmfjID != null && !xmfjID.equals("")){
			sql += " and id = '"+xmfjID+"'";
		}
		THysyywHysydtYhxmXmfj hysyywHysydtYhxmXmfj = new THysyywHysydtYhxmXmfj();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywHysydtYhxmXmfj = (THysyywHysydtYhxmXmfj) l.get(0);
		}
		return hysyywHysydtYhxmXmfj;
	}
	
	//海籍综合分析：提供对海籍面积、分布、使用状况的统计和分析。
	public List<?> fetchHjmjTj(){
		String sql="";

		System.out.println("sql="+sql);
		List<?> l = this.findBySQL(sql);
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/**
	 * 
	Description :海籍综合分析
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-23 下午04:37:59
	 */
	public List<?> fetchHjzhfx(TjfxForm tjfxForm){
		String sql="";
		if(tjfxForm != null && tjfxForm.getTjfs() != null && !tjfxForm.getTjfs().equals("")){
			if(tjfxForm.getTjys().equals("证书数量")){
				if(tjfxForm.getTjfs().equals("按用海批准年份")){
					sql=
						"select substr(y.YHPZRQ, 1, 4),count(z.id)\n" +
						"from t_hysyyw_hysydt_yhxm y,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where y.id=z.xmid and y.YHPZRQ is not null\n" + 
						"group by substr(y.YHPZRQ, 1, 4)\n" + 
						"order by substr(y.YHPZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按初始登记年份")){
					sql=
						"select substr(CSDJRQ, 1, 4), count(distinct HYGLH)\n" +
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where CSDJRQ is not null and HYGLH is not null \n" + 
						" group by substr(CSDJRQ, 1, 4)\n" + 
						" order by substr(CSDJRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按配号年份") ){
					sql=
						"select substr(FZRQ, 1, 4), count(distinct HYGLH)\n" +
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where FZRQ is not null and HYGLH is not null\n" + 
						" group by substr(FZRQ, 1, 4)\n" + 
						" order by substr(FZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按用海类型") ){
					//用海类型A
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海类型A' and t.dm=YHLXA)),\n" +
						"count(distinct HYGLH),YHLXA\n" + 
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where YHLXA is not null and HYGLH is not null\n" + 
						" group by YHLXA\n" + 
						" order by YHLXA";
					//用海类型B
//					sql=
//						"select ((select t.value from base_dictionary t where t.key='用海类型B' and t.dm=YHLXB)),\n" +
//						"count(YHLXB),YHLXB\n" + 
//						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
//						" where YHLXB is not null and HYGLH is not null\n" + 
//						" group by YHLXB\n" + 
//						" order by YHLXB;";
				}
				if(tjfxForm.getTjfs().equals("按用海方式") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海方式' and t.dm=t.YHFS)),\n" +
						"count(distinct z.HYGLH),t.YHFS\n" + 
						"  from t_hysyyw_hysydt_yhxm_yhfs t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						" where t.zsid=z.id and t.YHFS is not null and z.HYGLH is not null\n" + 
						" group by t.YHFS\n" + 
						" order by t.YHFS";
				}
				if(tjfxForm.getTjfs().equals("按项目位置") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目位置' and t.dm=t.xmwz),\n" +
						"count(distinct z.hyglh),t.xmwz\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.hyglh is not null and t.xmwz is not null\n" + 
						"group by t.xmwz\n" + 
						"order by t.xmwz";
				}
				
				if(tjfxForm.getTjfs().equals("按批准级别") ){
					//FZJGJB发证机关级别
					sql =
						"select (select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=t.FZJGJB),\n" +
						"count(distinct z.hyglh),t.FZJGJB\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.hyglh is not null and t.FZJGJB is not null\n" + 
						"group by t.FZJGJB\n" + 
						"order by t.FZJGJB";
					//SLJGJB受理机关级别
//					sql=
//						"select (select t.value from base_dictionary t where t.key='受理机关级别' and t.dm=t.SLJGJB),\n" +
//						"count(distinct z.hyglh),t.SLJGJB\n" + 
//						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
//						"where t.id=z.xmid and z.hyglh is not null and t.SLJGJB is not null\n" + 
//						"group by t.SLJGJB\n" + 
//						"order by t.SLJGJB";
				}
				if(tjfxForm.getTjfs().equals("按使用状况") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目状态' and t.dm=t.zt),\n" +
						"count(distinct z.hyglh),t.zt\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.hyglh is not null and t.zt is not null\n" + 
						"group by t.zt\n" + 
						"order by t.zt";					
				}
			}
			
			if(tjfxForm.getTjys().equals("用海项目数量")){
				if(tjfxForm.getTjfs().equals("按用海批准年份")){
					sql=
						"select substr(YHPZRQ, 1, 4), count(YHPZRQ)\n" +
						"from t_hysyyw_hysydt_yhxm\n" + 
						"where YHPZRQ is not null\n" + 
						"group by substr(YHPZRQ, 1, 4)\n" + 
						"order by substr(YHPZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按初始登记年份")){
					sql=
						"select substr(CSDJRQ, 1, 4), count(distinct xmid)\n" +
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where CSDJRQ is not null\n" + 
						" group by substr(CSDJRQ, 1, 4)\n" + 
						" order by substr(CSDJRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按配号年份") ){
					sql=
						"select substr(FZRQ, 1, 4), count(distinct xmid)\n" +
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where FZRQ is not null and hyglh is not null \n" + 
						" group by substr(FZRQ, 1, 4)\n" + 
						" order by substr(FZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按用海类型") ){
					//用海类型A
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海类型A' and t.dm=YHLXA)),\n" +
						"count(distinct xmid),YHLXA\n" + 
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where YHLXA is not null\n" + 
						" group by YHLXA\n" + 
						" order by YHLXA";
					//用海类型B
//					sql=
//						"select ((select t.value from base_dictionary t where t.key='用海类型B' and t.dm=YHLXB)),\n" +
//						"count(distinct xmid),YHLXB\n" + 
//						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
//						" where YHLXB is not null\n" + 
//						" group by YHLXB\n" + 
//						" order by YHLXB";
				}
				if(tjfxForm.getTjfs().equals("按用海方式") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海方式' and t.dm=YHFS)),\n" +
						"count(distinct xmid),YHFS\n" + 
						"  from t_hysyyw_hysydt_yhxm_yhfs t\n" + 
						" where YHFS is not null\n" + 
						" and xmid in (select id from T_HYSYYW_HYSYDT_YHXM)\n" + 
						" group by YHFS\n" + 
						" order by YHFS";
				}
				if(tjfxForm.getTjfs().equals("按项目位置") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='项目位置' and t.dm=XMWZ)),\n" +
						"count(distinct id),XMWZ\n" + 
						"  from T_HYSYYW_HYSYDT_YHXM t\n" + 
						" where XMWZ is not null\n" + 
						" group by XMWZ\n" + 
						" order by XMWZ";
				}
				if(tjfxForm.getTjfs().equals("按批准级别") ){
					//FZJGJB发证机关级别
					sql=
						"select (select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=t.FZJGJB),\n" +
						"count(distinct id),t.FZJGJB\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t\n" + 
						"where t.FZJGJB is not null\n" + 
						"group by t.FZJGJB\n" + 
						"order by t.FZJGJB";
					//SLJGJB受理机关级别
//					sql=
//						"select (select t.value from base_dictionary t where t.key='受理机关级别' and t.dm=t.SLJGJB),\n" +
//						"count(distinct id),t.SLJGJB\n" + 
//						"from T_HYSYYW_HYSYDT_YHXM t\n" + 
//						"where t.SLJGJB is not null\n" + 
//						"group by t.SLJGJB\n" + 
//						"order by t.SLJGJB";
				}
				if(tjfxForm.getTjfs().equals("按使用状况") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目状态' and t.dm=t.zt),\n" +
						"count(distinct t.id),t.zt\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t\n" + 
						"where t.zt is not null\n" + 
						"group by t.zt\n" + 
						"order by t.zt";
				}
			}
			
			if(tjfxForm.getTjys().equals("宗海面积")){
				if(tjfxForm.getTjfs().equals("按用海批准年份")){
					sql=
						"select substr(y.YHPZRQ, 1, 4),sum(z.ZHMJ)\n" +
						"from t_hysyyw_hysydt_yhxm y,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where y.id=z.xmid and y.YHPZRQ is not null\n" + 
						"group by substr(y.YHPZRQ, 1, 4)\n" + 
						"order by substr(y.YHPZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按初始登记年份")){
					sql=
						"select substr(CSDJRQ, 1, 4), sum(ZHMJ)\n" +
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where CSDJRQ is not null and ZHMJ is not null\n" + 
						" group by substr(CSDJRQ, 1, 4)\n" + 
						" order by substr(CSDJRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按配号年份") ){
					sql=
						"select substr(FZRQ, 1, 4), sum(ZHMJ)\n" +
						" from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						"where FZRQ is not null and ZHMJ is not null and HYGLH is not null\n" + 
						"group by substr(FZRQ, 1, 4)\n" + 
						"order by substr(FZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按用海类型") ){
					//用海类型A
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海类型A' and t.dm=YHLXA)),\n" +
						"sum(ZHMJ),YHLXA\n" + 
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where YHLXA is not null and ZHMJ is not null\n" + 
						" group by YHLXA\n" + 
						" order by YHLXA";
					//用海类型B
//					sql=
//						"select ((select t.value from base_dictionary t where t.key='用海类型B' and t.dm=YHLXB)),\n" +
//						"sum(ZHMJ),YHLXB\n" + 
//						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
//						" where YHLXB is not null and ZHMJ is not null\n" + 
//						" group by YHLXB\n" + 
//						" order by YHLXB";
				}
				if(tjfxForm.getTjfs().equals("按用海方式") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海方式' and t.dm=t.YHFS)),\n" +
						"sum(z.ZHMJ),t.YHFS\n" + 
						"  from t_hysyyw_hysydt_yhxm_yhfs t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						" where t.ZSID=z.id and t.YHFS is not null and z.ZHMJ is not null\n" + 
						" group by t.YHFS\n" + 
						" order by t.YHFS";
				}
				if(tjfxForm.getTjfs().equals("按项目位置") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目位置' and t.dm=t.xmwz),\n" +
						"sum(z.ZHMJ),t.xmwz\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.ZHMJ is not null and t.xmwz is not null\n" + 
						"group by t.xmwz\n" + 
						"order by t.xmwz";
				}
				if(tjfxForm.getTjfs().equals("按批准级别") ){
					//FZJGJB发证机关级别
					sql=
						"select (select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=t.FZJGJB),\n" +
						"sum(z.ZHMJ),t.FZJGJB\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.ZHMJ is not null and t.FZJGJB is not null\n" + 
						"group by t.FZJGJB\n" + 
						"order by t.FZJGJB";
					//SLJGJB受理机关级别
//					sql=
//						"select (select t.value from base_dictionary t where t.key='受理机关级别' and t.dm=t.SLJGJB),\n" +
//						"sum(z.ZHMJ),t.SLJGJB\n" + 
//						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
//						"where t.id=z.xmid and z.ZHMJ is not null and t.SLJGJB is not null\n" + 
//						"group by t.SLJGJB\n" + 
//						"order by t.SLJGJB";
				}
				if(tjfxForm.getTjfs().equals("按使用状况") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目状态' and t.dm=t.zt),\n" +
						"sum(z.ZHMJ),t.zt\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.hyglh is not null and t.zt is not null\n" + 
						"group by t.zt\n" + 
						"order by t.zt";
				}
				
			}
			
			
			if(tjfxForm.getTjys().equals("海域使用金应征收总额")){
				//T_HYSYYW_HYSYDT_YHXM_ZHXX海域使用金总额SYJZE
				if(tjfxForm.getTjfs().equals("按用海批准年份")){
					sql=
						"select substr(y.YHPZRQ, 1, 4),sum(z.SYJZE)\n" +
						"from t_hysyyw_hysydt_yhxm y,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where y.id=z.xmid and y.YHPZRQ is not null\n" + 
						"group by substr(y.YHPZRQ, 1, 4)\n" + 
						"order by substr(y.YHPZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按初始登记年份")){
					sql=
						"select substr(CSDJRQ, 1, 4), sum(SYJZE)\n" +
						"from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						"where CSDJRQ is not null and SYJZE is not null\n" + 
						"group by substr(CSDJRQ, 1, 4)\n" + 
						"order by substr(CSDJRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按配号年份") ){
					sql=
						"select substr(FZRQ, 1, 4), sum(SYJZE)\n" +
						"from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						"where FZRQ is not null and SYJZE is not null and HYGLH is not null\n" + 
						"group by substr(FZRQ, 1, 4)\n" + 
						"order by substr(FZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按用海类型") ){
					//用海类型A
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海类型A' and t.dm=YHLXA)),\n" +
						"sum(SYJZE),YHLXA\n" + 
						"from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						"where YHLXA is not null and SYJZE is not null\n" + 
						"group by YHLXA\n" + 
						"order by YHLXA";
					//用海类型B
//					sql=
//						"select ((select t.value from base_dictionary t where t.key='用海类型B' and t.dm=YHLXB)),\n" +
//						"sum(SYJZE),YHLXB\n" + 
//						"from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
//						"where YHLXB is not null and SYJZE is not null\n" + 
//						"group by YHLXB\n" + 
//						"order by YHLXB";
				}
				if(tjfxForm.getTjfs().equals("按用海方式") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海方式' and t.dm=t.YHFS)),\n" +
						"sum(z.SYJZE),t.YHFS\n" + 
						"from t_hysyyw_hysydt_yhxm_yhfs t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.ZSID=z.id and t.YHFS is not null and z.SYJZE is not null\n" + 
						"group by t.YHFS\n" + 
						"order by t.YHFS";
				}
				if(tjfxForm.getTjfs().equals("按项目位置") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目位置' and t.dm=t.xmwz),\n" +
						"sum(z.ZHMJ),t.xmwz\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.ZHMJ is not null and t.xmwz is not null\n" + 
						"group by t.xmwz\n" + 
						"order by t.xmwz";
				}
				if(tjfxForm.getTjfs().equals("按批准级别") ){
					//FZJGJB发证机关级别
					sql=
						"select (select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=t.FZJGJB),\n" +
						"sum(z.SYJZE),t.FZJGJB\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.SYJZE is not null and t.FZJGJB is not null\n" + 
						"group by t.FZJGJB\n" + 
						"order by t.FZJGJB";
					//SLJGJB受理机关级别
//					sql=
//						"select (select t.value from base_dictionary t where t.key='受理机关级别' and t.dm=t.SLJGJB),\n" +
//						"sum(z.SYJZE),t.SLJGJB\n" + 
//						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
//						"where t.id=z.xmid and z.SYJZE is not null and t.SLJGJB is not null\n" + 
//						"group by t.SLJGJB\n" + 
//						"order by t.SLJGJB";
				}
				if(tjfxForm.getTjfs().equals("按使用状况") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目状态' and t.dm=t.zt),\n" +
						"sum(z.SYJZE),t.zt\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.hyglh is not null and t.zt is not null\n" + 
						"group by t.zt\n" + 
						"order by t.zt";
				}
			}
			
			if(tjfxForm.getTjys().equals("海域使用金实际征收总额")){
				//T_HYSYYW_HYSYDT_YHXM_HYSYJ海域使用金征收金额：小计（总额）ZSJE_XJ
				if(tjfxForm.getTjfs().equals("按用海批准年份")){
					sql=
						"select substr(y.YHPZRQ, 1, 4),sum(h.ZSJE_XJ)\n" +
						"from t_hysyyw_hysydt_yhxm y,t_hysyyw_hysydt_yhxm_zhxx z,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where y.id=z.xmid and z.id= h.zsid and y.YHPZRQ is not null\n" + 
						"group by substr(y.YHPZRQ, 1, 4)\n" + 
						"order by substr(y.YHPZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按初始登记年份")){
					sql=
						"select substr(t.CSDJRQ, 1, 4), sum(h.ZSJE_XJ)\n" +
						"from t_hysyyw_hysydt_yhxm_zhxx t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where t.id=h.zsid and t.CSDJRQ is not null and h.ZSJE_XJ is not null\n" + 
						"group by substr(t.CSDJRQ, 1, 4)\n" + 
						"order by substr(t.CSDJRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按配号年份") ){
					sql=
						"select substr(t.FZRQ, 1, 4), sum(h.ZSJE_XJ)\n" +
						"from t_hysyyw_hysydt_yhxm_zhxx t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where t.id=h.zsid and t.FZRQ is not null and h.ZSJE_XJ is not null and t.HYGLH is not null\n" + 
						"group by substr(t.FZRQ, 1, 4)\n" + 
						"order by substr(t.FZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按用海类型") ){
					//用海类型A
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海类型A' and t.dm=t.YHLXA)),\n" +
						"sum(h.ZSJE_XJ),t.YHLXA\n" + 
						"from t_hysyyw_hysydt_yhxm_zhxx t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where t.id=h.zsid and t.YHLXA is not null and h.ZSJE_XJ is not null\n" + 
						"group by t.YHLXA\n" + 
						"order by t.YHLXA";
					//用海类型B
//					sql=
//						"select ((select t.value from base_dictionary t where t.key='用海类型B' and t.dm=t.YHLXB)),\n" +
//						"sum(h.ZSJE_XJ),t.YHLXB\n" + 
//						"from t_hysyyw_hysydt_yhxm_zhxx t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
//						"where t.id=h.zsid and t.YHLXB is not null and h.ZSJE_XJ is not null\n" + 
//						"group by t.YHLXB\n" + 
//						"order by t.YHLXB";
				}
				if(tjfxForm.getTjfs().equals("按用海方式") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海方式' and t.dm=t.YHFS)),\n" +
						"sum(h.ZSJE_XJ),t.YHFS\n" + 
						"from t_hysyyw_hysydt_yhxm_yhfs t,t_hysyyw_hysydt_yhxm_zhxx z,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where t.ZSID=z.id and z.id=h.zsid and t.YHFS is not null and h.ZSJE_XJ is not null\n" + 
						"group by t.YHFS\n" + 
						"order by t.YHFS";
				}
				if(tjfxForm.getTjfs().equals("按项目位置") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目位置' and t.dm=t.xmwz),\n" +
						"sum(h.ZSJE_XJ),t.xmwz\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where t.id=h.xmid and h.ZSJE_XJ is not null and t.xmwz is not null\n" + 
						"group by t.xmwz\n" + 
						"order by t.xmwz";
				}
				if(tjfxForm.getTjfs().equals("按批准级别") ){
					//FZJGJB发证机关级别
					sql=
						"select (select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=t.FZJGJB),\n" +
						"sum(h.ZSJE_XJ),t.FZJGJB\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where t.id=h.xmid and h.ZSJE_XJ is not null and t.FZJGJB is not null\n" + 
						"group by t.FZJGJB\n" + 
						"order by t.FZJGJB";
					//SLJGJB受理机关级别
//					sql=
//						"select (select t.value from base_dictionary t where t.key='受理机关级别' and t.dm=t.SLJGJB),\n" +
//						"sum(h.ZSJE_XJ),t.SLJGJB\n" + 
//						"from T_HYSYYW_HYSYDT_YHXM t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
//						"where t.id=h.xmid and h.ZSJE_XJ is not null and t.SLJGJB is not null\n" + 
//						"group by t.SLJGJB\n" + 
//						"order by t.SLJGJB";
				}
				if(tjfxForm.getTjfs().equals("按使用状况") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目状态' and t.dm=t.zt),\n" +
						"sum(z.ZSJE_XJ),t.zt\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,T_HYSYYW_HYSYDT_YHXM_HYSYJ z\n" + 
						"where t.id=z.xmid and z.hyglh is not null and t.zt is not null\n" + 
						"group by t.zt\n" + 
						"order by t.zt";
				}
			}
			
			if(tjfxForm.getTjys().equals("占用岸线")){
				if(tjfxForm.getTjfs().equals("按用海批准年份")){
					sql=
						"select substr(y.YHPZRQ, 1, 4),sum(y.zyax)\n" +
						"from t_hysyyw_hysydt_yhxm y\n" + 
						"where y.YHPZRQ is not null\n" + 
						"group by substr(y.YHPZRQ, 1, 4)\n" + 
						"order by substr(y.YHPZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按初始登记年份")){
					sql=
						"select substr(t.CSDJRQ, 1, 4), sum(y.zyax)\n" +
						"from t_hysyyw_hysydt_yhxm_zhxx t,t_hysyyw_hysydt_yhxm y\n" + 
						"where t.xmid=y.id and t.CSDJRQ is not null and y.zyax is not null\n" + 
						"group by substr(t.CSDJRQ, 1, 4)\n" + 
						"order by substr(t.CSDJRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按配号年份") ){
					sql=
						"select substr(t.FZRQ, 1, 4), sum(y.zyax)\n" +
						"from t_hysyyw_hysydt_yhxm_zhxx t,t_hysyyw_hysydt_yhxm y\n" + 
						"where t.xmid=y.id and t.FZRQ is not null and hyglh is not null and y.zyax is not null\n" + 
						"group by substr(t.FZRQ, 1, 4)\n" + 
						"order by substr(t.FZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按用海类型") ){
					//用海类型A
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海类型A' and t.dm=YHLXA)),\n" +
						"sum(y.zyax),t.YHLXA\n" + 
						"from t_hysyyw_hysydt_yhxm_zhxx t,t_hysyyw_hysydt_yhxm y\n" + 
						"where t.xmid=y.id and t.YHLXA is not null and y.zyax is not null\n" + 
						"group by t.YHLXA\n" + 
						"order by t.YHLXA";
					//用海类型B
//					sql=
//						"select ((select t.value from base_dictionary t where t.key='用海类型B' and t.dm=YHLXB)),\n" +
//						"sum(y.zyax),t.YHLXB\n" + 
//						"from t_hysyyw_hysydt_yhxm_zhxx t,t_hysyyw_hysydt_yhxm y\n" + 
//						"where t.xmid=y.id and t.YHLXB is not null and y.zyax is not null\n" + 
//						"group by t.YHLXB\n" + 
//						"order by t.YHLXB";
				}
				if(tjfxForm.getTjfs().equals("按用海方式") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海方式' and t.dm=YHFS)),\n" +
						"sum(y.zyax),t.YHFS\n" + 
						"from t_hysyyw_hysydt_yhxm_yhfs t,t_hysyyw_hysydt_yhxm y\n" + 
						"where t.xmid=y.id and t.YHFS is not null and y.zyax is not null\n" + 
						"group by t.YHFS\n" + 
						"order by t.YHFS";
				}
				if(tjfxForm.getTjfs().equals("按项目位置") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='项目位置' and t.dm=XMWZ)),\n" +
						"sum(zyax),XMWZ\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t\n" + 
						"where XMWZ is not null and zyax is not null\n" + 
						"group by XMWZ\n" + 
						"order by XMWZ";
				}
				if(tjfxForm.getTjfs().equals("按批准级别") ){
					//FZJGJB发证机关级别
					sql=
						"select (select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=t.FZJGJB),\n" +
						"sum(zyax),t.FZJGJB\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t\n" + 
						"where t.FZJGJB is not null and zyax is not null\n" + 
						"group by t.FZJGJB\n" + 
						"order by t.FZJGJB";
					//SLJGJB受理机关级别
//					sql=
//						"select (select t.value from base_dictionary t where t.key='受理机关级别' and t.dm=t.SLJGJB),\n" +
//						"sum(zyax),t.SLJGJB\n" + 
//						"from T_HYSYYW_HYSYDT_YHXM t\n" + 
//						"where t.SLJGJB is not null and zyax is not null\n" + 
//						"group by t.SLJGJB\n" + 
//						"order by t.SLJGJB";

				}
				if(tjfxForm.getTjfs().equals("按使用状况") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目状态' and t.dm=t.zt),\n" +
						"sum(zyax),t.zt\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t\n" + 
						"where t.zt is not null\n" + 
						"group by t.zt\n" + 
						"order by t.zt";
				}
			}
		}else{
			System.out.println("DAO**********空值");
			sql=
				"select substr(CSDJRQ, 1, 4), count(CSDJRQ)\n" +
				"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
				" where CSDJRQ is not null and HYGLH is not null \n" + 
				" group by substr(CSDJRQ, 1, 4)\n" + 
				" order by substr(CSDJRQ, 1, 4)";
		}
		System.out.println("sql="+sql);
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
