package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.dao.SeawallPatrolReportDao;
import com.htcf.entity.SeawallPatrolReport;
import com.htcf.util.DateUtil;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;

@Repository("seawallPatrolReportDao")
public class SeawallPatrolReportDaoImpl extends BaseDAOImpl<SeawallPatrolReport, Serializable> implements SeawallPatrolReportDao {

	@Override
	public boolean delSeawallPatrolReportById(Long id) {
		if ( null == id ) return false;
		String hql = "delete from SeawallPatrolReport s where s.id = :id";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", id);
		try {
			this.updateByJPQL(hql, args);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public SeawallPatrolReport fetchSeawallPatrolReportById(Long id) {
		if ( null == id ) return null;
		String hql = "from SeawallPatrolReport s where s.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", id);
		return (SeawallPatrolReport) findUniqueResultByHql(hql, args);
	}

	@Override
	public List<SeawallPatrolReport> fetchSeawallPatrolReportPage(SeawallPatrolReport spr, PageBean pageBean, String userId) {

		StringBuffer hql = new StringBuffer("from SeawallPatrolReport s where s.adduserid = :adduserid ");
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("adduserid", userId);
		if ( null != spr ) {
			//巡查员ID
			if ( StringUtil.isNotBlank(spr.getStPatrolPersonId()) ) {
				hql.append(" and s.stPatrolPersonId like :stPatrolPersonId ");
				args.put("stPatrolPersonId", "%" + spr.getStPatrolPersonId() + "%" );
			}
			//巡查员姓名
			if ( StringUtil.isNotBlank(spr.getStPatrolPerson()) ) {
				hql.append(" and s.stPatrolPerson like :stPatrolPerson ");
				args.put("stPatrolPerson", "%" + spr.getStPatrolPerson() +"%" );
			}
			//问题类别
			if ( StringUtil.isNotBlank(spr.getStEsclass()) ) {
				hql.append(" and s.stEsclass = :stEsclass ");
				args.put("stEsclass", spr.getStEsclass() );
			}
			//所属区县
			if ( StringUtil.isNotBlank(spr.getStAreacode()) ) {
				hql.append(" and s.stAreacode = :stAreacode ");
				args.put("stAreacode", spr.getStAreacode() );
			}
			//上报单编号
			if ( StringUtil.isNotBlank(spr.getStEventsn()) ) {
				hql.append(" and s.stEventsn like :stEventsn ");
				args.put("stEventsn", "%" + spr.getStEventsn() + "%" );
			}
			//上报时间
			if ( StringUtil.isNotBlank(spr.getAddtime()) ) {
				hql.append(" and s.addtime >= :addtime ");
				args.put("addtime", spr.getAddtime() );
			}
			//上报时间
			if ( StringUtil.isNotBlank(spr.getLastupdatetime()) ) {
				hql.append(" and s.lastupdatetime <= :lastupdatetime ");
				args.put("lastupdatetime", spr.getLastupdatetime() );
			}
			//上报人
			if ( StringUtil.isNotBlank(spr.getAdduserid()) ) {
				hql.append(" and s.adduserid <= :adduserid ");
				args.put("adduserid", spr.getAdduserid() );
			}
			
		}
		
		hql.append(" order by s.id desc ");
		
		return findPageByJPQL(hql.toString(), args, pageBean);
	}

	@Override
	public boolean saveSeawallPatrolReport(SeawallPatrolReport spr) {
		
		try {
			this.save(spr);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateSeawallPatrolReport(SeawallPatrolReport spr) {
		try {
			this.update(spr);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateSeawallPatrolReportStatus(SeawallPatrolReport spr) {
		
		if ( spr == null || null == spr.getId() ) return false;
		
		String hql = "update SeawallPatrolReport s set s.lastupdatetime = :lastupdatetime, s.nmState = :nmState where s.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", spr.getId());
		args.put("lastupdatetime", DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		args.put("nmState", spr.getNmState());
		try {
			this.updateByJPQL(hql, args);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public List<SeawallPatrolReport> fetchSeawallPatrolReportByIds(String stPatrolIds) {
		
		if (StringUtil.isBlank(stPatrolIds)) return null;
		String hql = "from SeawallPatrolReport s where s.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>();
		String[] ids = stPatrolIds.split(",");
		List<SeawallPatrolReport> rs = new ArrayList<SeawallPatrolReport>();
		
		for (int i = 0; i < ids.length; i++) {
			SeawallPatrolReport r = null;
			String id = ids[i];
			if ( i > 0 && StringUtil.isNotBlank(id) && id.equals(ids[i-1])) {
				r = rs.get(rs.size() -1 );
			} else {
				args.put("id", Long.parseLong(StringUtil.trimToBlank(id)));
				r = (SeawallPatrolReport) findUniqueResultByHql(hql, args);
			}
			rs.add(r);
		}
		return rs;
	}

}
