package com.htcf.service;

import java.util.List;

import com.htcf.entity.SeaUseInfoCompare;
import com.htcf.util.PageBean;

/**
 * 用海信息比对dao
 * @author lwb
 *
 */
public interface SeaUseInfoCompareService {

	/**
	 * 根据条件分页查询
	 * @param compare
	 * @param pageBean
	 * @return List<SeaUseInfoCompare>
	 */
	List<SeaUseInfoCompare> loadPageCompare(SeaUseInfoCompare compare, PageBean pageBean);
	
	/**
	 * 根据ID查询详细比较信息
	 * @param compare
	 * @return SeaUseInfoCompare
	 */
	SeaUseInfoCompare loadCompareById(SeaUseInfoCompare compare);
	
	/**
	 * 保存对比信息
	 * @param compare
	 * @return boolean
	 */
	boolean addSeaUseInfoCompare(SeaUseInfoCompare compare);
	
	/**
	 * 修改对比信息
	 * @param compare
	 * @return boolean
	 */
	boolean editSeaUseInfoCompare(SeaUseInfoCompare compare);
	
	/**
	 * 根据ID删除对比信息
	 * @param compare
	 * @return boolean
	 */
	boolean delSeaUseInfoCompareById(SeaUseInfoCompare compare);
}
