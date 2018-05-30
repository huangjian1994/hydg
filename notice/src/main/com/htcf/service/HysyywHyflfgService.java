package com.htcf.service;

import java.util.List;
import java.util.Map;

import com.htcf.entity.Dictionary;
import com.htcf.entity.HysyywHyflfg;
import com.htcf.util.PageBean;


/**
 * 
 * @author lwb
 * 法律法规dao
 *
 */
public interface HysyywHyflfgService {
	
	/**
	 * 根据条件分页查询法律法规
	 * @param law
	 * @param pageBean
	 * @return List<HysyywHyflfg>
	 */
	 List<HysyywHyflfg> loadLawPage(HysyywHyflfg law, PageBean pageBean);
	 
	 /**
	  * 根据ID查询法律法规
	  * @param law
	  * @return HysyywHyflfg
	  */
	 HysyywHyflfg loadLawById(HysyywHyflfg law);
	 
	 /**
	  * 保存法律法规
	  * @param law
	  * @return
	  */
	 boolean addLaw(HysyywHyflfg law);
	 
	 /**
	  * 修改法律法规
	  * @param law
	  * @return
	  */
	 boolean editLaw(HysyywHyflfg law);
	 
	 /**
	  * 删除法律法规
	  * @param hyflfg
	  * @return
	  */
	 boolean removeLawById(HysyywHyflfg law);
	 
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
