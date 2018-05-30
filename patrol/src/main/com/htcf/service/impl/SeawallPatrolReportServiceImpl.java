package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.SeawallPatrolAttachmentDao;
import com.htcf.dao.SeawallPatrolReportDao;
import com.htcf.entity.SeawallPatrolAttachment;
import com.htcf.entity.SeawallPatrolReport;
import com.htcf.util.PageBean;

@Service("seawallPatrolReportService")
public class SeawallPatrolReportServiceImpl implements com.htcf.service.SeawallPatrolReportService {

	@Autowired
	private SeawallPatrolAttachmentDao seawallPatrolAttachmentDao;
	
	@Autowired
	private SeawallPatrolReportDao seawallPatrolReportDao;
	
	@Override
	public boolean addSeawallPatrolReport(SeawallPatrolReport spr) {
		return seawallPatrolReportDao.saveSeawallPatrolReport(spr);
	}

	@Override
	public boolean editSeawallPatrolReport(SeawallPatrolReport spr) {
		return seawallPatrolReportDao.updateSeawallPatrolReport(spr);
	}

	@Override
	public List<SeawallPatrolReport> loadSeawallPatrolReportPage(SeawallPatrolReport spr, PageBean pageBean, String userId) {
		return seawallPatrolReportDao.fetchSeawallPatrolReportPage(spr, pageBean, userId);
	}

	@Override
	public boolean removeSeawallPatrolReportById(Long id) {
		return seawallPatrolReportDao.delSeawallPatrolReportById(id);
	}

	@Override
	public SeawallPatrolReport loadSeawallPatrolReportByID(SeawallPatrolReport seawallPatrolReport, boolean withAttachment) {

		seawallPatrolReport = seawallPatrolReportDao.fetchSeawallPatrolReportById(seawallPatrolReport.getId());
		if ( withAttachment ) {
			List<SeawallPatrolAttachment> attachments = seawallPatrolAttachmentDao.fetchAttachmentByPatrolId(seawallPatrolReport.getId());
			seawallPatrolReport.setAttachments(attachments);
		}
		
		return seawallPatrolReport;
	}

	@Override
	public boolean editSeawallPatrolReportStatus(SeawallPatrolReport spr) {
		return seawallPatrolReportDao.updateSeawallPatrolReportStatus(spr);
	}

	@Override
	public List<SeawallPatrolReport> loadSeawallPatrolReportByIds(String stPatrolIds) {
		return seawallPatrolReportDao.fetchSeawallPatrolReportByIds(stPatrolIds);
	}

}
