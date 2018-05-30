package com.htcf.dao;

import java.util.List;

import com.htcf.entity.HysyywHyflfg;
import com.htcf.util.PageBean;


/**
 * 
 * @author lwb
 * 法律法规dao
 *
 */
public interface HysyywHyflfgDao {
	
	/**
	 * 根据条件分页查询法律法规
	 * @param law
	 * @param pageBean
	 * @return List<HysyywHyflfg>
	 */
	 List<HysyywHyflfg> fetchLawPage(HysyywHyflfg law, PageBean pageBean);
	 
	 /**
	  * 根据ID查询法律法规
	  * @param law
	  * @return HysyywHyflfg
	  */
	 HysyywHyflfg fetchLawById(HysyywHyflfg law);
	 
	 /**
	  * 保存法律法规
	  * @param law
	  * @return boolean
	  */
	 boolean saveLaw(HysyywHyflfg law);
	 
	 /**
	  * 修改法律法规
	  * @param law
	  * @return boolean
	  */
	 boolean updateLaw(HysyywHyflfg law);
	 
	 /**
	  * 删除法律法规
	  * @param hyflfg
	  * @return boolean
	  */
	 boolean delLawById(HysyywHyflfg law);
	 
}
