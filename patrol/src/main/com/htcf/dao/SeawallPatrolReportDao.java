package com.htcf.dao;

import java.util.List;

import com.htcf.entity.SeawallPatrolReport;
import com.htcf.util.PageBean;

/**
 * 海塘巡查上报dao
 * @author lwb
 *
 */
public interface SeawallPatrolReportDao {
	
	/**
	 * 分页查询海塘巡查上报
	 * @param spr 查询参数
	 * @param pageBean
	 * @return List<SeawallPatrolReport> 
	 */
	List<SeawallPatrolReport> fetchSeawallPatrolReportPage(SeawallPatrolReport spr, PageBean pageBean, String userId);
	
	/**
	 * 根据ids查询上报信息
	 * @param stPatrolIds
	 * @return List<SeawallPatrolReport>
	 */
	List<SeawallPatrolReport> fetchSeawallPatrolReportByIds(String stPatrolIds);
	
	/**
	 * 根据ID查询海塘巡查上报信息
	 * @param id
	 * @return SeawallPatrolReport
	 */
	SeawallPatrolReport fetchSeawallPatrolReportById(Long id);
	
	/**
	 * 保存海塘巡查上报信息
	 * @param spr
	 * @return boolean
	 */
	boolean saveSeawallPatrolReport(SeawallPatrolReport spr);
	
	/**
	 * 更新海塘巡查上报信息
	 * @param spr
	 * @return boolean
	 */
	boolean updateSeawallPatrolReport(SeawallPatrolReport spr);
	
	/**
	 * 根据ID删除海塘巡查上报信息
	 * @param id
	 * @return boolean
	 */
	boolean delSeawallPatrolReportById(Long id);
	
	/**
	 * 修改海塘巡查上报状态
	 * @param spr
	 * @return boolean
	 */
	boolean updateSeawallPatrolReportStatus(SeawallPatrolReport spr);
}
