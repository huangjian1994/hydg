package com.htcf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.IConfigDAO;
import com.htcf.entity.Dictionary;
import com.htcf.service.IConfigService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;

@Service(value="configService")
public class ConfigServiceImpl implements IConfigService {
	@Autowired
	private IConfigDAO congfigDAO;
	public List<Dictionary> retrieveDictionaryByName(Dictionary dictionary,
			PageBean pageBean) {
		return this.congfigDAO.retrieveDictionaryByName(dictionary,pageBean);
	}
	 /**
	  * 增加配置键值对
	  */
	@Operate(description="增加配置键值对")
	public boolean addKey(Dictionary dictionary) {
		
		return this.congfigDAO.addKey(dictionary);
	}
	/**
	 * 删除配置键值对
	 */
	@Operate(description="删除配置键值对")
	public boolean delkey(Dictionary dictionary) {
		
		return this.congfigDAO.delkey(dictionary);
	}
	/**
	 * 进入修改界面
	 */
	@Operate(description="进入修改界面")
	public Object editkey(Dictionary dictionary) {
		
		return this.congfigDAO.editkey(dictionary);
	}
	/**
	 * 修改字典键值对
	 */
	@Operate(description="修改字典键值对")
	public boolean updateKey(Dictionary dictionary) {
	
		return this.congfigDAO.updateKey(dictionary);
	}
	public IConfigDAO getCongfigDAO() {
		return congfigDAO;
	}
	public void setCongfigDAO(IConfigDAO congfigDAO) {
		this.congfigDAO = congfigDAO;
	}
	
	


	

}
