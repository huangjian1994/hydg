package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.dao.SeawallPatrolAttachmentDao;
import com.htcf.entity.SeawallPatrolAttachment;
import com.htcf.util.DateUtil;

@Repository("seawallPatrolAttachmentDao")
public class SeawallPatrolAttachmentDaoImpl extends BaseDAOImpl<SeawallPatrolAttachment, Serializable>
		implements SeawallPatrolAttachmentDao {

	@Override
	public boolean delSeawallPatrolAttachment(long id) {

		String hql = "update SeawallPatrolAttachment s set s.status = :status, s.lastupdatetime = :lastupdatetime where s.id = :id";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", id);
		args.put("status", "0");
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
	public List<SeawallPatrolAttachment> fetchAttachmentByPatrolId(long patrolId) {
		String hql = "from SeawallPatrolAttachment s where s.status = :status and s.stPatrolId = :stPatrolId order by s.id desc ";
		Map<String, Object> args = new HashMap<String, Object>();
		//状态：未删除
		args.put("status", "1");
		args.put("stPatrolId", patrolId);
		
		return findByJPQL(hql, args);
	}

	@Override
	public boolean saveSeawallPatrolAttachments(List<SeawallPatrolAttachment> attachments) {
		try {
			for (SeawallPatrolAttachment attachment : attachments) {
				save(attachment);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
