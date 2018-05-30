package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Repository;

import com.htcf.dao.CoastlineInfoDao;
import com.htcf.entity.CoastlineInfo;

@Repository("coastlineInfo")
public class CoastlineInfoDaoImpl extends BaseDAOImpl<CoastlineInfo, Serializable> implements
		CoastlineInfoDao {

	public List<CoastlineInfo> fetchAllCoastline(int type) {
		
		String hql = "from CoastlineInfo ci where ci.type = :type order by ci.lineUpdateTime desc";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("type", type);
		
		return this.findByJPQL(hql, args);
	}
	
	public CoastlineInfo fetchCoastlineById(CoastlineInfo coastlineInfo, int type) {
		
		String hql = "from CoastlineInfo ci where ci.id = :id and ci.type = :type ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", coastlineInfo.getId());
		args.put("type", type);
		
		return (CoastlineInfo) this.findUniqueResultByHql(hql, args);
	}
	
	public CoastlineInfo fetchCoastlineByName(CoastlineInfo coastlineInfo, int type) {
		
		String hql = "from CoastlineInfo ci where ci.lineName = :lineName and ci.type = :type ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("lineName", coastlineInfo.getLineName());
		args.put("type", type);
		
		return (CoastlineInfo) this.findUniqueResultByHql(hql, args);
	}
	
	public boolean saveCoastlineInfo(CoastlineInfo coastlineInfo, int type) {
		
		try {
			coastlineInfo.setType(type);
			this.save(coastlineInfo);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public boolean updateCoastlineInfo(CoastlineInfo coastlineInfo, int type) {
		try {
			coastlineInfo.setType(type);
			// update T_HYSYYW_HAXXX set ADDTIME=?, ADDUSERID=?, ADDUSERNAME=?, LASTUPDATETIME=?, LINE_GEO=?, LINE_LENGTH=?, LINE_NAME=?, LINE_UPDATE_PERSON=?, LINE_UPDATE_PERSON_ID=?, LINE_UPDATE_REASON=?, LINE_UPDATE_TIME=?, TYPE=? where ID=?
			System.out.println("type="+type);
			System.out.println("id="+coastlineInfo.getId());
			System.out.println("getLineName="+coastlineInfo.getLineName());
			this.update(coastlineInfo);
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean delCoastlineInfo(CoastlineInfo coastlineInfo, int type) {
		String hql = "delete from CoastlineInfo ci where ci.id = :id and ci.type = :type ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", coastlineInfo.getId());
		args.put("type", type);
		try {
			updateByJPQL(hql, args);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

}
