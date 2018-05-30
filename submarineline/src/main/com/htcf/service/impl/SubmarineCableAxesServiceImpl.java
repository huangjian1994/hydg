package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.SubmarineCableAxesDao;
import com.htcf.entity.SubmarineCableAxes;
import com.htcf.service.SubmarineCableAxesService;

@Service("submarineCableAxesService")
public class SubmarineCableAxesServiceImpl implements SubmarineCableAxesService {

	@Autowired
	private SubmarineCableAxesDao submarineCableAxesDao;
	
	@Override
	public boolean addSca(SubmarineCableAxes sca) {
		return submarineCableAxesDao.saveSca(sca);
	}

	@Override
	public boolean editSca(SubmarineCableAxes sca) {
		return submarineCableAxesDao.updateSca(sca);
	}

	@Override
	public List<SubmarineCableAxes> loadAllSca() {
		return submarineCableAxesDao.fetchAllSca();
	}

	@Override
	public List<SubmarineCableAxes> loadScaByType(String type) {
		return submarineCableAxesDao.fetchScaByType(type);
	}

	@Override
	public boolean removeScaById(Long id) {
		return submarineCableAxesDao.deleteScaById(id);
	}

	@Override
	public boolean editXyCoordinate(List<SubmarineCableAxes> scas) {
		return submarineCableAxesDao.updateXyCoordinate(scas);
	}

}
