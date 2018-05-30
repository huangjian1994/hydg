package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.dao.SeaUseInfoCompareDao;
import com.htcf.entity.SeaUseInfoCompare;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;

@Repository("seaUseInfoCompareDao")
public class SeaUseInfoCompareDaoImpl extends BaseDAOImpl<SeaUseInfoCompare, Serializable> implements
		SeaUseInfoCompareDao {

	@Override
	public boolean deleteSeaUseInfoCompareById(SeaUseInfoCompare compare) {
		
		if ( null == compare || null == compare.getId() ) return false;
		String hql = "delete from SeaUseInfoCompare c where c.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", compare.getId());
		updateByJPQL(hql, args);
		return true;
	}

	@Override
	public List<SeaUseInfoCompare> fetchPageCompare(SeaUseInfoCompare compare, PageBean pageBean) {
		
		StringBuffer hql = new StringBuffer("from SeaUseInfoCompare c where 1=1 ");
		Map<String, Object> args = new HashMap<String, Object>();
		if ( null != compare ) {
			if ( StringUtil.isNotBlank(compare.getProjectName()) ) {
				hql.append(" and c.projectName like :projectName ");
				args.put("projectName", "%" + compare.getProjectName() + "%");
			}
		}
		
		hql.append(" order by c.id desc");
		List<SeaUseInfoCompare> compares = findPageByJPQL(hql.toString(), args, pageBean);
		return null == compares ? new ArrayList<SeaUseInfoCompare>() : compares;
	}

	@Override
	public SeaUseInfoCompare fetchCompareById(SeaUseInfoCompare compare) {
		
		if ( null == compare || null == compare.getId() ) return null;
		String hql = "from SeaUseInfoCompare c where c.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", compare.getId());
		return (SeaUseInfoCompare) findUniqueResultByHql(hql, args);
	}

	@Override
	public boolean saveSeaUseInfoCompare(SeaUseInfoCompare compare) {
		try {
			this.save(compare);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateSeaUseInfoCompare(SeaUseInfoCompare compare) {
		try {
			this.update(compare);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
