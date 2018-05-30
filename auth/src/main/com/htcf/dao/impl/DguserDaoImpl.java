package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.htcf.dao.DguserDao;
import com.htcf.entity.User;
import com.htcf.entity.UserEntity;

/**
 * @author hj
 * @date 2017-8-10
 *
 */

@Repository(value="dguserDAO")
public class DguserDaoImpl extends BaseDAOImpl<UserEntity, Serializable> implements DguserDao {

	public UserEntity fetchUsersByName(UserEntity userEntity) {
		String jpql="select id,name,password,id_card  " +
		"from dg_user  where name  ='"+userEntity.getName()+"'";
		System.out.println("查出用户名"+userEntity.getName());
		List<Object[]> objectList =this.findBySQL(jpql);
		
		
		List<UserEntity> userList =UchangeO(objectList);
		if(userList != null && userList.size()!=0){
			return userList.get(0);
		}
		return null;
	}
	
	public List<UserEntity> UchangeO(List<Object[]> objectList){
		List<UserEntity> userList =new ArrayList<UserEntity>();
		for(int i=0;i<objectList.size();i++){
			UserEntity u=new UserEntity();
			u.setId(objectList.get(i)[0].toString());
			u.setName(objectList.get(i)[1].toString());
			u.setPassword(objectList.get(i)[2].toString());
			
			if(!"".equals(objectList.get(i)[3])&&
					objectList.get(i)[3]!=null){
				u.setId_card(objectList.get(i)[3].toString());
			}
			userList.add(i, u);
		}
		return userList;
	}
	
	
	
	
	
	
}