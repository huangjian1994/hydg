package com.htcf.service;

import java.util.List;

import com.htcf.entity.CoastlineInfo;
/**
 * 海岸线service
 * @author lwb
 *
 */
public interface CoastlineInfoService {
	/**
	 * 查询所有海岸线信息
	 * @return List<CoastlineInfo>
	 */
	List<CoastlineInfo> loadAllCoastline();
	
	/**
	 * 根据ID查询海岸线信息
	 * @param coastlineInfo
	 * @return CoastlineInfo
	 */
	CoastlineInfo loadCoastlineById(CoastlineInfo coastlineInfo);
	
	/**
	 * 根据名称查询海岸线信息
	 * @param coastlineInfo
	 * @return CoastlineInfo
	 */
	CoastlineInfo loadCoastlineByName(CoastlineInfo coastlineInfo);
	
	/**
	 * 保存海岸线信息
	 * @param coastlineInfo
	 * @return boolean
	 */
	boolean addCoastlineInfo(CoastlineInfo coastlineInfo);
	
	/**
	 * 更新海岸线信息
	 * @param coastlineInfo
	 * @return boolean
	 */
	boolean editCoastlineInfo(CoastlineInfo coastlineInfo);
	
	/**
	 * 删除海岸信息
	 * @param coastlineInfo
	 * @return boolean
	 */
	boolean delCoastlineInfo(CoastlineInfo coastlineInfo);
	
}
