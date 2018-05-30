package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.CoastlineInfoDao;
import com.htcf.entity.CoastlineInfo;
import com.htcf.service.CoastlineInfoService;
import com.htcf.util.StringUtil;

/**
 * 海岸线时空分析service
 * @author lwb
 *
 */
@Service("coastlineAnalyzeService")
public class CoastlineAnalyzeServiceImpl implements CoastlineInfoService {

	@Autowired
	private CoastlineInfoDao coastlineInfoDao;
	/**
	 * 1:划界方案综合分析
	 */
	private int type = 2;
	
	@Override
	public boolean addCoastlineInfo(CoastlineInfo coastlineInfo) {
		if ( null == coastlineInfo ) return false;
		return coastlineInfoDao.saveCoastlineInfo(coastlineInfo, type);
	}

	@Override
	public boolean delCoastlineInfo(CoastlineInfo coastlineInfo) {
		if ( null == coastlineInfo || null == coastlineInfo.getId() ) return false;
		return coastlineInfoDao.delCoastlineInfo(coastlineInfo, type);
	}

	@Override
	public boolean editCoastlineInfo(CoastlineInfo coastlineInfo) {
		if ( null == coastlineInfo || null == coastlineInfo.getId() ) return false;
		return coastlineInfoDao.updateCoastlineInfo(coastlineInfo, type);
	}

	@Override
	public List<CoastlineInfo> loadAllCoastline() {
		return coastlineInfoDao.fetchAllCoastline(type);
	}

	@Override
	public CoastlineInfo loadCoastlineById(CoastlineInfo coastlineInfo) {
		if ( null == coastlineInfo || null == coastlineInfo.getId() ) return null;
		return coastlineInfoDao.fetchCoastlineById(coastlineInfo, type);
	}

	@Override
	public CoastlineInfo loadCoastlineByName(CoastlineInfo coastlineInfo) {
		if ( null == coastlineInfo || StringUtil.isNotBlank(coastlineInfo.getLineName()) ) return null;
		return coastlineInfoDao.fetchCoastlineByName(coastlineInfo, type);
	}

}
