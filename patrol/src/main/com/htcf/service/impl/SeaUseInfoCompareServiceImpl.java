package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.SeaUseInfoCompareDao;
import com.htcf.entity.SeaUseInfoCompare;
import com.htcf.service.SeaUseInfoCompareService;
import com.htcf.util.PageBean;

@Service("seaUseInfoCompareService")
public class SeaUseInfoCompareServiceImpl implements SeaUseInfoCompareService {

	@Autowired
	private SeaUseInfoCompareDao seaUseInfoCompareDao;
	
	@Override
	public boolean addSeaUseInfoCompare(SeaUseInfoCompare compare) {
		return seaUseInfoCompareDao.saveSeaUseInfoCompare(compare);
	}

	@Override
	public boolean delSeaUseInfoCompareById(SeaUseInfoCompare compare) {
		return seaUseInfoCompareDao.deleteSeaUseInfoCompareById(compare);
	}

	@Override
	public boolean editSeaUseInfoCompare(SeaUseInfoCompare compare) {
		return seaUseInfoCompareDao.updateSeaUseInfoCompare(compare);
	}

	@Override
	public List<SeaUseInfoCompare> loadPageCompare(SeaUseInfoCompare compare, PageBean pageBean) {
		return seaUseInfoCompareDao.fetchPageCompare(compare, pageBean);
	}

	@Override
	public SeaUseInfoCompare loadCompareById(SeaUseInfoCompare compare) {
		return seaUseInfoCompareDao.fetchCompareById(compare);
	}

}
