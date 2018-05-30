package com.htcf.service;

import com.htcf.entity.UserEntity;

/**
 * Created by hj on 2017-8-9.
 */

public interface DguserService {
	
	/**
	 * 用户登录
	 * @author ：hj
	 * @date:日期：2017-8-10下午03:52:16
	 * @param user
	 * @return
	 */
	public UserEntity fetchUsersByName(UserEntity userEntity);



}
