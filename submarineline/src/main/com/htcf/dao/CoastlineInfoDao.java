package com.htcf.dao;

import java.util.List;

import com.htcf.entity.CoastlineInfo;
/**
 * 海岸线dao
 * @author lwb
 *
 */
public interface CoastlineInfoDao {
	/**
	 * 查询所有海岸线信息
	 * @return List<CoastlineInfo>
	 */
	List<CoastlineInfo> fetchAllCoastline(int type);
	
	/**
	 * 根据ID查询海岸线信息
	 * @param coastlineInfo
	 * @return CoastlineInfo
	 */
	CoastlineInfo fetchCoastlineById(CoastlineInfo coastlineInfo, int type);
	
	/**
	 * 根据名称查询海岸线信息
	 * @param coastlineInfo
	 * @return CoastlineInfo
	 */
	CoastlineInfo fetchCoastlineByName(CoastlineInfo coastlineInfo, int type);
	
	/**
	 * 保存海岸线信息
	 * @param coastlineInfo
	 * @return boolean
	 */
	boolean saveCoastlineInfo(CoastlineInfo coastlineInfo, int type);
	
	/**
	 * 更新海岸线信息
	 * @param coastlineInfo
	 * @return boolean
	 */
	boolean updateCoastlineInfo(CoastlineInfo coastlineInfo, int type);
	
	/**
	 * 删除海岸信息
	 * @param coastlineInfo
	 * @return boolean
	 */
	boolean delCoastlineInfo(CoastlineInfo coastlineInfo, int type);
	
}
