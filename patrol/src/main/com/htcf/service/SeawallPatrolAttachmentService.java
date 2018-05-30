package com.htcf.service;

import java.util.List;

import com.htcf.entity.SeawallPatrolAttachment;

/**
 * 海塘巡查附件service
 * @author lwb
 *
 */
public interface SeawallPatrolAttachmentService {

	/**
	 * 根据海塘巡查事件ID查询附件
	 * @param patrolId 海棠春巡查上报ID
	 * @return List<SeawallPatrolAttachment>
	 */
	List<SeawallPatrolAttachment> loadAttachmentByPatrolId(long patrolId);
	
	/**
	 * 批量保存附件
	 * @param attachments 附件list集合
	 * @return boolean
	 */
	boolean addSeawallPatrolAttachments(List<SeawallPatrolAttachment> attachments);
	
	/**
	 * 删除附件（修改状态）
	 * @param id 附件ID
	 * @return boolean
	 */
	boolean removeSeawallPatrolAttachment(long id);
}
