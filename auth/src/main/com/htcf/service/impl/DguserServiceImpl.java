package com.htcf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.DguserDao;
import com.htcf.entity.User;
import com.htcf.entity.UserEntity;
import com.htcf.service.DguserService;
import com.htcf.util.Operate;

/**
 * @author hj
 * @date 2017-8-10
 *
 */

@Service(value="dguserService")
public class DguserServiceImpl implements DguserService {
	
	@Autowired
	private DguserDao dguserDao;
	

	
	
	//用户登录方法
	@Operate(description="根据用户名查询用户")
	public UserEntity  fetchUsersByName(UserEntity userEntity) {
		return this.dguserDao.fetchUsersByName(userEntity);
	}



	
	
	/*---------------------------------------*/

	public DguserDao getDguserDao() {
		return dguserDao;
	}




	public void setDguserDao(DguserDao dguserDao) {
		this.dguserDao = dguserDao;
	}

	
}
