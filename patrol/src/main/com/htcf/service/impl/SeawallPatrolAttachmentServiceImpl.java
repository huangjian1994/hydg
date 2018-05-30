package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.SeawallPatrolAttachmentDao;
import com.htcf.entity.SeawallPatrolAttachment;
import com.htcf.service.SeawallPatrolAttachmentService;

@Service("seawallPatrolAttachmentService")
public class SeawallPatrolAttachmentServiceImpl implements SeawallPatrolAttachmentService {
	
	@Autowired
	private SeawallPatrolAttachmentDao seawallPatrolAttachmentDao;
	
	@Override
	public boolean removeSeawallPatrolAttachment(long id) {
		return seawallPatrolAttachmentDao.delSeawallPatrolAttachment(id);
	}

	@Override
	public List<SeawallPatrolAttachment> loadAttachmentByPatrolId(long patrolId) {
		return seawallPatrolAttachmentDao.fetchAttachmentByPatrolId(patrolId);
	}

	@Override
	public boolean addSeawallPatrolAttachments(List<SeawallPatrolAttachment> attachments) {
		return seawallPatrolAttachmentDao.saveSeawallPatrolAttachments(attachments);
	}

}
