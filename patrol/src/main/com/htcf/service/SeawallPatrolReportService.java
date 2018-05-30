package com.htcf.service;

import java.util.List;

import com.htcf.entity.SeawallPatrolReport;
import com.htcf.util.PageBean;
/**
 * 海塘巡查上报service
 * @author lwb
 *
 */
public interface SeawallPatrolReportService {

	/**
	 * 分页查询海塘巡查上报
	 * @param spr 查询参数
	 * @param pageBean
	 * @return List<SeawallPatrolReport> 
	 */
	List<SeawallPatrolReport> loadSeawallPatrolReportPage(SeawallPatrolReport spr, PageBean pageBean, String userId);
	
	/**
	 * 根据ids查询上报信息
	 * @param stPatrolIds
	 * @return List<SeawallPatrolReport>
	 */
	List<SeawallPatrolReport> loadSeawallPatrolReportByIds(String stPatrolIds);
	
	/**
	 * 根据ID加载海塘上报事件详情
	 * @param seawallPatrolReport
	 * @param withAttachment 是否查询附件
	 * @return SeawallPatrolReport
	 */
	SeawallPatrolReport loadSeawallPatrolReportByID(SeawallPatrolReport seawallPatrolReport,boolean withAttachment);
	
	/**
	 * 保存海塘巡查上报信息
	 * @param spr
	 * @return boolean
	 */
	boolean addSeawallPatrolReport(SeawallPatrolReport spr);
	
	/**
	 * 更新海塘巡查上报信息
	 * @param spr
	 * @return boolean
	 */
	boolean editSeawallPatrolReport(SeawallPatrolReport spr);
	
	/**
	 * 根据ID删除海塘巡查上报信息
	 * @param id
	 * @return boolean
	 */
	boolean removeSeawallPatrolReportById(Long id);
	
	/**
	 * 修改海塘巡查上报状态
	 * @param spr
	 * @return boolean
	 */
	boolean editSeawallPatrolReportStatus(SeawallPatrolReport spr);

}
