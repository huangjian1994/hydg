package com.htcf.dao;

import java.util.List;

import com.htcf.entity.SubmarineCableAxes;

public interface SubmarineCableAxesDao {
	
	/**
	 * 根据类型查询坐标
	 * @param type 类型
	 * @return List<SubmarineCableAxes>
	 */
	List<SubmarineCableAxes> fetchScaByType(String type);
	
	/**
	 * 查询所有坐标
	 * @return List<SubmarineCableAxes>
	 */
	List<SubmarineCableAxes> fetchAllSca();
	
	/**
	 * 保存坐标
	 * @param sca
	 * @return boolean
	 */
	boolean saveSca(SubmarineCableAxes sca);
	
	/**
	 * 修改坐标
	 * @param sca
	 * @return boolean
	 */
	boolean updateSca(SubmarineCableAxes sca);
	
	/**
	 * 删除坐标
	 * @param id 坐标ID
	 * @return boolean
	 */
	boolean deleteScaById(Long id);
	
	/**
	 * 保存xy坐标
	 * @param scas xy坐标信息
	 * @return boolean
	 */
	boolean updateXyCoordinate(List<SubmarineCableAxes> scas);
}
