package com.htcf.dao;

import java.util.List;

import com.htcf.entity.SeawallPatrolFlow;
import com.htcf.util.PageBean;

/**
 * 海塘巡查上报流程
 * @author lwb
 *
 */
public interface SeawallPatrolFlowDao {
	
	/**
	 * 根据条件查询所有流程
	 * @param flow
	 * @param pageBean
	 * @param sort 排序 0：正序 1：倒序
	 * @return List<SeawallPatrolFlow>
	 */
	List<SeawallPatrolFlow> fetchSeawallPatrolFlow(SeawallPatrolFlow flow, PageBean pageBean, Long stPatrolId, int sort);
	
	/**
	 * 根据条件查询所有未完成流程
	 * @param flow
	 * @return List<SeawallPatrolFlow>
	 */
	List<SeawallPatrolFlow> fetchNoEndSeawallPatrolFlow(SeawallPatrolFlow flow);

	/**
	 * 根据巡查上报单ID查询所有相关流程
	 * @param patrolId
	 * @return List<SeawallPatrolFlow>
	 */
	List<SeawallPatrolFlow> fetchSeawallPatrolFlowByPatrolId(long patrolId);
	
	/**
	 * 根据ID查询流程
	 * @param id
	 * @return SeawallPatrolFlow
	 */
	SeawallPatrolFlow fetchSeawallPatrolFlowById(long id);
	
	/**
	 * 保存流程
	 * @param flow
	 * @return boolean
	 */
	boolean saveSeawallPatrolFlow(SeawallPatrolFlow flow);
	
	/**
	 * 修改流程
	 * @param flow
	 * @return boolean
	 */
	boolean updateSeawallPatrolFlow(SeawallPatrolFlow flow);
	
	/**
	 * 修改流程状态
	 * @param flow
	 * @return boolean
	 */
	boolean updateSeawallPatrolFlowStatus(SeawallPatrolFlow flow);
	
}
