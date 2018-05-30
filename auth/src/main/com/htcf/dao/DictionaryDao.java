package com.htcf.dao;

import java.util.List;
import java.util.Map;

import com.htcf.entity.Dictionary;

public interface DictionaryDao {
	
	/**
	 * 根据key值获取字典集合
	 * @param dictionary
	 * @return List<Dictionary>
	 */
	List<Dictionary> loadDicByKey(Dictionary dictionary);
	
	/**
	 * 根据key值获取字典键值对 dm-value
	 * @param dictionary
	 * @return Map<String,String> 
	 */
	Map<String,String> loadDicMapByKey(Dictionary dictionary);
	
	/**
	 * 根据key值和dm字符串获取字典键值对 dm-value
	 * @param dictionary
	 * @return Map<String,String> 
	 */
	Map<String,String> loadValByKeyAndDm(Dictionary dictionary);
}
