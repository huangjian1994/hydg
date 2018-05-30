package com.htcf.service;

import java.util.List;
import java.util.Map;

import com.htcf.entity.wsEntity.Case;
import com.htcf.entity.wsEntity.SeawallPatrolFromWs;
import com.htcf.util.PageBean;
import com.htcf.util.PageBeanS;

/**
 * 调用处理webservice
 * @author lwb
 *
 */
public interface SeaPatrolService {
	
	/**
	 * 海塘/提防 案件统计
	 * @param strBT 开始时间(yyyy-MM-dd)
	 * @param strET 结束时间(yyyy-MM-dd)
	 * @param type 类型：0全部  1堤防   2海塘
	 * @return Map<String,List<Case>>
	 */
	Map<String,List<Case>> loadCaseStatistics(String strBT, String strET, String type);
	
	/**
	 * 海塘/提防巡查信息
	 * @param strBT 开始时间(yyyy-MM-dd)
	 * @param strET 结束时间(yyyy-MM-dd)
	 * @param type 类型：0全部  1堤防   2海塘
	 * @return List<SeawallPatrolFromWs>
	 */
	List<SeawallPatrolFromWs> loadPatrol(String strBT, String strET, String type);
	
	/**
	 * 依据条件过滤并分页
	 * @param userId
	 * @param sp
	 * @return List<SeawallPatrolFromWs>
	 */
	List<SeawallPatrolFromWs> pagePatrol(String userId, SeawallPatrolFromWs sp, PageBean pageBean);
	
	/**
	 * 封装坐标信息
	 */
	Map<String, List<SeawallPatrolFromWs>> packageCoordinate(List<SeawallPatrolFromWs> spList);
	
	/**
	 * 根据任务号获取所有相关流程
	 * @param eventsn
	 * @return Map<String, Object>
	 */
	Map<String, Object> loadFlowsByEventsn(String eventsn);

	/**
	 * 依据条件过滤并分页,根据不同页面，设置显示不同的状态
	 * @param userId
	 * @param sp
	 * @return List<SeawallPatrolFromWs>
	 */
	List<SeawallPatrolFromWs> pagePatrol1(String userId,
										  SeawallPatrolFromWs sp,
										  PageBeanS pageBeanS,
										  String lb);
}
