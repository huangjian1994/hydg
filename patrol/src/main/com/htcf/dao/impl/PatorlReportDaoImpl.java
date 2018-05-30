package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.dao.IPatorlReportDao;
import com.htcf.entity.PatorlSearchForm;
import com.htcf.entity.THyxcHdxcFkfj;
import com.htcf.entity.THyxcHdxcFkjcxx;
import com.htcf.entity.THyxcHdxcFxwt;
import com.htcf.entity.ThyxcHdxcXcjhEntity;
import com.htcf.util.PageBean;

/**
 * 巡查上报
 * @author yinying
 *
 */
@Repository(value="patorlReportDao")
public class PatorlReportDaoImpl extends BaseDAOImpl<Object, Serializable> implements  IPatorlReportDao{

	/**
	 * 
	Description :巡查上报:查询
	@param:@param patorlSearchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:01:19
	 */
	public List<?> fetchPatorlReportList(PatorlSearchForm patorlSearchForm,PageBean pageBean){
		StringBuffer hql = new StringBuffer(" from THyxcHdxcFxwt y where 1=1  ");
		Map<String, Object> args = new HashMap<String, Object>();
		if(patorlSearchForm != null){
			if(patorlSearchForm.getWtlb() != null && !patorlSearchForm.getWtlb().equals("")){
				hql.append(" and y.wtlb = :wtlb ");
				args.put("wtlb", "" + patorlSearchForm.getWtlb().trim() + "");
			}
			if(patorlSearchForm.getDwmc() != null && !patorlSearchForm.getDwmc().equals("")){
				hql.append(" and y.sbrdwmc like :sbrdwmc ");
				args.put("sbrdwmc", "%" + patorlSearchForm.getDwmc().trim() + "%");
			}
			if(patorlSearchForm.getSsqx() != null && !patorlSearchForm.getSsqx().equals("")){
				hql.append(" and y.ssqx = :ssqx ");
				args.put("ssqx", "" + patorlSearchForm.getSsqx().trim() + "");
			}
			if(patorlSearchForm.getSbrq() != null && !patorlSearchForm.getSbrq().equals("")){
				hql.append(" and y.sbsj = :sbsj ");
				args.put("sbsj", "" + patorlSearchForm.getSbrq().trim() + "");
			}
			if(patorlSearchForm.getSbr() != null && !patorlSearchForm.getSbr().equals("")){
				hql.append(" and y.sbr like :sbr ");
				args.put("sbr", "%" + patorlSearchForm.getSbr().trim() + "%");
			}
			if(patorlSearchForm.getSbzt() != null && !patorlSearchForm.getSbzt().equals("")){
				hql.append(" and y.sbzt = :sbzt ");
				args.put("sbzt", "" + patorlSearchForm.getSbzt().trim() + "");
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
	Description :巡查上报:详情
	@param:@param prID
	@param:@return
	@return:THyxcHdxcFxwt
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:01:34
	 */
	public THyxcHdxcFxwt fetchReportDetail(String prID){
		String sql=" from THyxcHdxcFxwt y where 1=1  and id='"+prID+"'";
		THyxcHdxcFxwt hyxcHdxcFxwt = new THyxcHdxcFxwt();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hyxcHdxcFxwt = (THyxcHdxcFxwt) l.get(0);
		}
		return hyxcHdxcFxwt;
	}

	/**
	 * 
	Description :巡查上报:删除
	@param:@param prID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:01:43
	 */
	public void deleteReport(String prID){
		String sql=" delete from T_HYXC_HDXC_FXWT where id='"+prID+"'";
		this.updateBySql(sql);
	}
	
	
	/**
	 * 
	Description :巡查信息反馈:查询
	@param:@param patorlSearchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-3-28 下午04:39:42
	 */
	public List<?> fetchPatorlFkList(PatorlSearchForm patorlSearchForm,PageBean pageBean,String xcjhID){
		System.out.println("DAO  xcjhID ="+xcjhID);
		StringBuffer hql = new StringBuffer(" from THyxcHdxcFkjcxx y where 1=1  ");
		Map<String, Object> args = new HashMap<String, Object>();
		if(xcjhID != null && !xcjhID.equals("")){
			hql.append(" and y.patrolid = :patrolid ");
			args.put("patrolid", "" + xcjhID.trim() + "");
			
			System.out.println("DAO  xcjhID ="+xcjhID);
		}
		if(patorlSearchForm != null){
			if(patorlSearchForm.getXcdw() != null && !patorlSearchForm.getXcdw().equals("")){
				hql.append(" and y.fillingunit like :fillingunit ");
				args.put("fillingunit", "%" + patorlSearchForm.getXcdw().trim() + "%");
			}
			if(patorlSearchForm.getXcqsrq() != null && !patorlSearchForm.getXcqsrq().equals("")){
				hql.append(" and y.begintime >= :begintime ");
				args.put("begintime", "" + patorlSearchForm.getXcqsrq().trim() + "");
			}
			if(patorlSearchForm.getXcjsrq() != null && !patorlSearchForm.getXcjsrq().equals("")){
				hql.append(" and y.endtime <= :endtime ");
				args.put("endtime", "" + patorlSearchForm.getXcjsrq().trim() + "");
			}
			
			if(patorlSearchForm.getFknrfl() != null && !patorlSearchForm.getFknrfl().equals("")){
				hql.append(" and y.classify like :classify ");
				args.put("classify", "%" + patorlSearchForm.getFknrfl().trim() + "%");
			}
			if(patorlSearchForm.getFkrxm() != null && !patorlSearchForm.getFkrxm().equals("")){
				hql.append(" and y.feedbackname like :feedbackname ");
				args.put("feedbackname", "%" + patorlSearchForm.getFkrxm().trim() + "%");
			}
			if(patorlSearchForm.getFkrq() != null && !patorlSearchForm.getFkrq().equals("")){
				hql.append(" and y.feedbacktime = :feedbacktime ");
				args.put("feedbacktime", "" + patorlSearchForm.getFkrq().trim() + "");
			}
		}
		hql.append(" order by id desc ");
		System.out.println("hql="+hql);
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
	Description :巡查信息反馈：删除
	@param:@param fkID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-3-28 下午04:48:05
	 */
	public void deletePatorlFk(String fkID){
		String sql = " delete from T_HYXC_HDXC_FKJCXX where id='"+fkID+"'";
		this.updateBySql(sql);
	}
	
	/**
	 * 
	Description :巡查信息反馈：详情
	@param:@param fkID
	@param:@return
	@return:THyxcHdxcFkjcxx
	@throws
	@Author：yinying
	@Create 2018-3-28 下午05:07:35
	 */
	public THyxcHdxcFkjcxx fetchXcxxfkDeatil(String fkID){
		String sql=" from THyxcHdxcFkjcxx y where 1=1  and id='"+fkID+"'";
		THyxcHdxcFkjcxx hyxcHdxcFkjcxx = new THyxcHdxcFkjcxx();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hyxcHdxcFkjcxx = (THyxcHdxcFkjcxx) l.get(0);
		}
		return hyxcHdxcFkjcxx;
	}
	
	/**
	 * 
	Description :巡查信息反馈：附件
	@param:@param fkID
	@param:@param xcjhID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-3-28 下午05:15:55
	 */
	public List<?> fetchXcxxfkfj(String fkID,String xcjhID){
		StringBuffer hql = new StringBuffer(" from THyxcHdxcFkfj y where 1=1  ");
		Map<String, Object> args = new HashMap<String, Object>();
		if(fkID != null && !fkID.equals("")){
			hql.append(" and y.fkid = :fkid ");
			args.put("fkid", "" + fkID.trim() + "");
		}
		if(xcjhID != null && !xcjhID.equals("")){
			hql.append(" and y.patrolid = :patrolid ");
			args.put("patrolid", "" + xcjhID.trim() + "");
		}
		hql.append(" order by id desc ");
		List<?> l = null;
		try{
			l = this.findByJPQL(hql.toString(), args);
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
	Description :反馈附件：详情
	@param:@param fkfjID
	@param:@return
	@return:THyxcHdxcFkfj
	@throws
	@Author：yinying
	@Create 2018-3-28 下午05:25:52
	 */
	public THyxcHdxcFkfj fetchXcxxfkfjDeatil(String fkfjID){
		String sql=" from THyxcHdxcFkfj y where 1=1  and id='"+fkfjID+"'";
		THyxcHdxcFkfj hyxcHdxcFkfj = new THyxcHdxcFkfj();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hyxcHdxcFkfj = (THyxcHdxcFkfj) l.get(0);
		}
		return hyxcHdxcFkfj;
	}
	
	/**
	 * 
	Description :删除反馈附件
	@param:@param fkID
	@param:@param xcjhID
	@param:@param fkfjID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-3-28 下午05:31:54
	 */
	public void deleteFkfj(String fkID,String xcjhID,String fkfjID){
		String sql = " delete from T_HYXC_HDXC_FKFJ where 1=1 ";
		if(xcjhID != null && !xcjhID.equals("")){
			sql += " and patrolid = '"+xcjhID+"'";
		}
		if(fkID != null && !fkID.equals("")){
			sql += " and fkid = '"+fkID+"'";
		}
		if(fkfjID != null && !fkfjID.equals("")){
			sql += " and id = '"+fkfjID+"'";
		}
		
		this.updateBySql(sql);
	}
	
	/**
	 * 
	Description :巡查计划
	@param:@param patorlSearchForm
	@param:@param pageBean
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-4-2 下午04:34:06
	 */
	public List<?> fetchPatorlJhList(PatorlSearchForm patorlSearchForm,PageBean pageBean){
		StringBuffer hql = new StringBuffer(" select t.id,t.patrolname,t.fillingtime from T_HYXC_HDXC_XCJH t where 1=1  ");
		Map<String, Object> args = new HashMap<String, Object>();
		
		if(patorlSearchForm != null){
			if(patorlSearchForm.getXcjhmc() != null && !patorlSearchForm.getXcjhmc().equals("")){
				hql.append(" and t.patrolname like :patrolname ");
				args.put("patrolname", "%" + patorlSearchForm.getXcjhmc().trim() + "%");
			}
			
		}
		hql.append(" order by id desc ");
		System.out.println("hql="+hql);
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
		
		
//		String sql=" select t.id,t.patrolname,t.fillingtime from T_HYXC_HDXC_XCJH t " +
//				" order by id desc ";
//		List<?> l = null;
//		try{
//			l = this.findBySQL(sql);
//		}catch(Exception e){
//			System.out.println("SQL语句错误");
//			System.out.println("e"+e);
//		}
//		if(l != null && l.size()!=0){
//			return l;
//		}
//		return null;
	}
	
	/**
	 * 
	Description :查出主键
	@param:@param xcjhID
	@param:@param dqsj
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-4-4 下午03:41:49
	 */
	public String fetchFkxxId(String xcjhID,String dqsj){
		String sql=" select id  from T_HYXC_HDXC_FKJCXX where PATROLID='"+xcjhID+"' and ADDTIME='"+dqsj+"'";
		List<?> l = this.findBySQL(sql);
		String zj = null;
		if(l != null && l.size()!=0){
			zj = l.get(0).toString();
		}
		return zj;
	}
	
	/**
	 * 
	Description :更改计划状态
	@param:@param xcjhID
	@return:void
	@throws
	@Author：yinying
	@Create 2018-4-23 下午03:04:29
	 */
	public void updateXcjhZt(String xcjhID){
		String sql= " update T_HYXC_HDXC_XCJH set PLANSTATUS='已巡查' " +
				" where id ='"+xcjhID+"' and PLANSTATUS='审核通过' ";
		
		this.updateBySql(sql);
	}
	
	/**
	 * 
	Description :巡查计划
	@param:@param patorlSearchForm
	@param:@param pageBean
	@param:@param userName
	@param:@param userRoleName
	@param:@return
	@return:List<ThyxcHdxcXcjhEntity>
	@throws
	@Author：yinying
	@Create 2018-4-23 下午03:11:48
	 */
	public List<ThyxcHdxcXcjhEntity> fetchChxcList(PatorlSearchForm patorlSearchForm,
            PageBean pageBean,
            String userName,
            String userRoleName) {
		StringBuffer hql = new StringBuffer(" from ThyxcHdxcXcjhEntity y where 1=1 and planstatus in ('审核通过','已巡查') ");
		Map<String, Object> args = new HashMap<String, Object>();
		if (patorlSearchForm != null) {
			if(patorlSearchForm.getXcjhmc() != null && !patorlSearchForm.getXcjhmc().equals("")){
				hql.append(" and y.patrolname like :patrolname ");
				args.put("patrolname", "%" + patorlSearchForm.getXcjhmc().trim() + "%");
			}
			
//			if (xcjhEntity.getPatrolname() != null && !xcjhEntity.getPatrolname().equals("")) {
//			hql.append(" and y.patrolname like :patrolname ");
//			args.put("patrolname", "" + xcjhEntity.getPatrolname() + "");
//			}
//			if (xcjhEntity.getFillingdw() != null && !xcjhEntity.getFillingdw().equals("")) {
//			hql.append(" and y.fillingdw like :fillingdw ");
//			args.put("fillingdw", "" + xcjhEntity.getFillingdw() + "");
//			}
//			if (xcjhEntity.getLeadername() != null && !xcjhEntity.getLeadername().equals("")) {
//			hql.append(" and y.leadername like :leadername ");
//			args.put("leadername", "" + xcjhEntity.getLeadername() + "");
//			}
//			if (xcjhEntity.getDrafetdate() != null && !xcjhEntity.getDrafetdate().equals("")) {
//			hql.append(" and y.drafetdate like :drafetdate ");
//			args.put("drafetdate", "" + xcjhEntity.getDrafetdate() + "");
//			}
//			if (xcjhEntity.getDrafepeoplename() != null && !xcjhEntity.getDrafepeoplename().equals("")) {
//			hql.append(" and y.drafepeoplename like :drafepeoplename ");
//			args.put("drafepeoplename", "" + xcjhEntity.getDrafepeoplename() + "");
//			}
//			if (xcjhEntity.getPlanstatus() != null && !xcjhEntity.getPlanstatus().equals("")) {
//			hql.append(" and y.planstatus like :planstatus ");
//			args.put("planstatus", "" + xcjhEntity.getPlanstatus() + "");
//			}
		}
		if(userRoleName != null && !userRoleName.equals("")){
		if(userRoleName.equals("管理员")){
		
		}else{
		hql.append("and y.leadername like :leadername or y.peoplename like :peoplename");
		args.put("leadername",""+userName+"");
		args.put("peoplename",""+userName+"");
		}
		}
		hql.append(" order by y.id desc ");
		List<ThyxcHdxcXcjhEntity> l = null;
		try {
		l = this.findPageByJPQL(hql.toString(), args, pageBean);
		} catch (Exception e) {
		System.out.println("SQL语句错误");
		System.out.println("e" + e);
		}
		if (l != null && l.size() != 0) {
		return l;
		}
		return null;
	}

	
	
	
}
