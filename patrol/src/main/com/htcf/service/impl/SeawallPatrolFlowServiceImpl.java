package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.SeawallPatrolFlowDao;
import com.htcf.entity.SeawallPatrolFlow;
import com.htcf.service.SeawallPatrolFlowService;
import com.htcf.util.PageBean;
@Service("seawallPatrolFlowService")
public class SeawallPatrolFlowServiceImpl implements SeawallPatrolFlowService {

	@Autowired
	private SeawallPatrolFlowDao seawallPatrolFlowDao;
	
	@Override
	public boolean addSeawallPatrolFlow(SeawallPatrolFlow flow) {
		return seawallPatrolFlowDao.saveSeawallPatrolFlow(flow);
	}

	@Override
	public boolean editSeawallPatrolFlow(SeawallPatrolFlow flow) {
		return seawallPatrolFlowDao.updateSeawallPatrolFlow(flow);
	}

	@Override
	public boolean editSeawallPatrolFlowStatus(SeawallPatrolFlow flow) {
		return seawallPatrolFlowDao.updateSeawallPatrolFlowStatus(flow);
	}

	@Override
	public List<SeawallPatrolFlow> loadNoEndSeawallPatrolFlow(SeawallPatrolFlow flow) {
		return seawallPatrolFlowDao.fetchNoEndSeawallPatrolFlow(flow);
	}

	@Override
	public List<SeawallPatrolFlow> loadSeawallPatrolFlow(SeawallPatrolFlow flow, PageBean pageBean, Long stPatrolId, int sort) {
		return seawallPatrolFlowDao.fetchSeawallPatrolFlow(flow, pageBean, stPatrolId, sort);
	}

	@Override
	public List<SeawallPatrolFlow> loadSeawallPatrolFlowByPatrolId(long patrolId) {
		return seawallPatrolFlowDao.fetchSeawallPatrolFlowByPatrolId(patrolId);
	}

	@Override
	public SeawallPatrolFlow loadSeawallPatrolFlowById(long id) {
		return seawallPatrolFlowDao.fetchSeawallPatrolFlowById(id);
	}

}
