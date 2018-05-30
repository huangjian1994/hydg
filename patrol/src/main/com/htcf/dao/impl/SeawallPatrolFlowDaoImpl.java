package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.dao.SeawallPatrolFlowDao;
import com.htcf.entity.SeawallPatrolFlow;
import com.htcf.entity.SeawallPatrolReport;
import com.htcf.util.DateUtil;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;

@Repository("seawallPatrolFlowDao")
public class SeawallPatrolFlowDaoImpl extends BaseDAOImpl<SeawallPatrolFlow, Serializable> implements SeawallPatrolFlowDao {
	
	
	@Override
	public List<SeawallPatrolFlow> fetchSeawallPatrolFlow(SeawallPatrolFlow flow, PageBean pageBean, Long stPatrolId, int sort) {

		StringBuffer hql = new StringBuffer("from SeawallPatrolFlow f where 1=1 ");
		Map<String, Object> args = new HashMap<String, Object>();
		if ( null != flow ) {
			if ( null != flow.getId() ) {
				hql.append(" and f.id = :id ");
				args.put("id", flow.getId());
			}
			
			if ( StringUtil.isNotBlank(flow.getPersonId()) ) {
				hql.append(" and f.personId = :personId ");
				args.put("personId", flow.getPersonId());
			}
			
			if ( StringUtil.isNotBlank(flow.getOpType()) ) {
				hql.append(" and f.opType = :opType ");
				args.put("opType", flow.getOpType());
			}
			
			if ( StringUtil.isNotBlank(flow.getOpStatus()) ) {
				hql.append(" and f.opStatus = :opStatus ");
				args.put("opStatus", flow.getOpStatus());
			}
			
			if ( null != flow.getStPatrolId() ) {
				hql.append(" and f.stPatrolId = :stPatrolId ");
				args.put("stPatrolId", flow.getStPatrolId() );
			}
			
			//这里用此字段传递上报单编号
			if ( null != stPatrolId ) {
				hql.append(" and f.stPatrolId in (select r.id from SeawallPatrolReport r where r.stEventsn like :stEventsn ) ");
				args.put("stEventsn", "%" + stPatrolId + "%");
			}
			
			//时间
			if ( StringUtil.isNotBlank(flow.getAddtime()) ) {
				hql.append(" and f.addtime >= :addtime ");
				args.put("addtime", flow.getAddtime() );
			}
			//时间
			if ( StringUtil.isNotBlank(flow.getLastupdatetime()) ) {
				hql.append(" and f.lastupdatetime <= :lastupdatetime ");
				args.put("lastupdatetime", flow.getLastupdatetime() );
			}
		}
		if ( sort == 1 ) {
			hql.append(" order by f.id desc ");
		} else {
			hql.append(" order by f.id asc ");
		}
		return findPageByJPQL(hql.toString(), args, pageBean);
	}
	
	@Override
	public List<SeawallPatrolFlow> fetchNoEndSeawallPatrolFlow(SeawallPatrolFlow flow) {

		StringBuffer hql = new StringBuffer("from SeawallPatrolFlow f where f.opStatus = :opStatus ");
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("opStatus", "0");
		
		if (null != flow) {
			if (StringUtil.isNotBlank(flow.getPersonId())) {
				hql.append(" and f.personId = :personId ");
				args.put("personId", flow.getPersonId());
			}
		}
		
		hql.append("order by f.id desc ");
		return findByJPQL(hql.toString(), args);
	}
	
	@Override
	public List<SeawallPatrolFlow> fetchSeawallPatrolFlowByPatrolId(long patrolId) {
		String hql = "from SeawallPatrolFlow f where f.stPatrolId = :stPatrolId order by f.id asc ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("stPatrolId", patrolId);
		
		return findByJPQL(hql, args);
	}

	@Override
	public boolean saveSeawallPatrolFlow(SeawallPatrolFlow flow) {
		try {
			//未完成状态
			flow.setOpStatus("0");
			save(flow);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateSeawallPatrolFlowStatus(SeawallPatrolFlow flow) {
		
		String hql = "update SeawallPatrolFlow f set f.opStatus = :opStatus, f.lastupdatetime = :lastupdatetime where f.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", flow.getId());
		args.put("opStatus", flow.getOpStatus());
		args.put("lastupdatetime", DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		
		try {
			updateByJPQL(hql, args);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean updateSeawallPatrolFlow(SeawallPatrolFlow flow) {
		try {
			update(flow);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public SeawallPatrolFlow fetchSeawallPatrolFlowById(long id) {
		String hql = "from SeawallPatrolFlow f where f.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", id);
		
		return (SeawallPatrolFlow) findUniqueResultByHql(hql, args);
	}

}
