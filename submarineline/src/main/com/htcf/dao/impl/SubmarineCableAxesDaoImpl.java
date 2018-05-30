package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.dao.SubmarineCableAxesDao;
import com.htcf.entity.SubmarineCableAxes;
import com.htcf.util.StringUtil;

@Repository("submarineCableAxesDao")
public class SubmarineCableAxesDaoImpl extends BaseDAOImpl<SubmarineCableAxes, Serializable> implements
		SubmarineCableAxesDao {

	@Override
	public boolean deleteScaById(Long id) {
		
		if ( null == id ) return false;

		String hql = "delete from SubmarineCableAxes s where s.id = :id ";
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

	@Override
	public List<SubmarineCableAxes> fetchAllSca() {
		
		String hql = "from SubmarineCableAxes s order by s.type asc, s.seq asc ";
		return findByJPQL(hql, null);
	}

	@Override
	public List<SubmarineCableAxes> fetchScaByType(String type) {
		
		if ( StringUtil.isNotBlank(type) ) {
			String hql = "from SubmarineCableAxes s where s.type = :type order by s.seq asc ";
			Map<String, Object> args = new HashMap<String, Object>();
			args.put("type", type);
			List<SubmarineCableAxes> scas = findByJPQL(hql, args);
			
			return null == scas ? new ArrayList<SubmarineCableAxes>() : scas;
		}
		return new ArrayList<SubmarineCableAxes>() ;
	}

	@Override
	public boolean saveSca(SubmarineCableAxes sca) {
		try {
			save(sca);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateSca(SubmarineCableAxes sca) {
		try {
			update(sca);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateXyCoordinate(List<SubmarineCableAxes> scas) {
		
		String hql = "update SubmarineCableAxes s set s.x = :x, s.y = :y where s.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>();
		try {
			for (SubmarineCableAxes sca : scas) {
				args.put("x", sca.getX());
				args.put("y", sca.getY());
				args.put("id", sca.getId());
				updateByJPQL(hql, args);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

}
