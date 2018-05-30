package com.htcf.dao;

import com.htcf.entity.UserEntity;

/**
 * @author hj
 * @date 2017-8-10
 *
 */
public interface DguserDao {

	/**
	 * 用户登录
	 * @author ：hj
	 * @date:日期：2017-8-10下午04:26:23
	 * @param userEntity
	 * @return
	 */
	public UserEntity fetchUsersByName(UserEntity userEntity);
	
	
}
