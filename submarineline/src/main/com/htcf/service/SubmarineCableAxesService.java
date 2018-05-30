package com.htcf.service;

import java.util.List;

import com.htcf.entity.SubmarineCableAxes;

public interface SubmarineCableAxesService {
	
	/**
	 * 根据类型查询坐标
	 * @param type 类型
	 * @return List<SubmarineCableAxes>
	 */
	List<SubmarineCableAxes> loadScaByType(String type);
	
	/**
	 * 查询所有坐标
	 * @return List<SubmarineCableAxes>
	 */
	List<SubmarineCableAxes> loadAllSca();
	
	/**
	 * 保存坐标
	 * @param sca
	 * @return boolean
	 */
	boolean addSca(SubmarineCableAxes sca);
	
	/**
	 * 修改坐标
	 * @param sca
	 * @return boolean
	 */
	boolean editSca(SubmarineCableAxes sca);
	
	/**
	 * 删除坐标
	 * @param id 坐标ID
	 * @return boolean
	 */
	boolean removeScaById(Long id);
	
	/**
	 * 保存xy坐标
	 * @param scas xy坐标信息
	 * @return boolean
	 */
	boolean editXyCoordinate(List<SubmarineCableAxes> scas);
}
