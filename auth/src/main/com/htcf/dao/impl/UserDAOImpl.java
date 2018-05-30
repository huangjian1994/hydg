package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.dao.IUserDAO;
import com.htcf.entity.User;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;

@Repository(value="userDAO")
public class UserDAOImpl extends BaseDAOImpl<User,Serializable> implements IUserDAO {

	public void addUser(User user) {
		save(user);
	}

	public void deleteUser(User user) {
		
		user=getById(user.getId());
		this.delete(user);
		
	}

	public void editUser(User user) {
		update(user);
		
	}
	
	@SuppressWarnings("unchecked")
	public User fetchUsersByName(User user) {
		String jpql="from User u where  u.userName=:userName";
		Map<String ,Object> params=new HashMap<String ,Object>();
		params.put("userName", user.getUserName());
		List<User> userList =this.findByJPQL(jpql, params);
		if(userList != null && userList.size()!=0){
			
			return userList.get(0);
		}
		return null;
		
		
		
	}
	
	
	
	public List<User> retrieveUsersByConditions(User user,PageBean pageBean){
		
		StringBuffer jpql=new StringBuffer("from User u where u.isSystem is null ");
		
		
		Map <String,Object> args=new HashMap<String,Object>();
		
		if(user !=null){
			
			if(StringUtil.isNotBlank(user.getName())){
				jpql.append(" and u.name like :uname");
				args.put("uname", "%"+user.getName()+"%");
			}
			if(StringUtil.isNotBlank(user.getPoliceNo())){
				
				jpql.append(" and u.policeNo like :policeNo");
				args.put("policeNo", "%"+user.getPoliceNo()+"%");
			}
			if(StringUtil.isNotBlank(user.getUserId())){
				jpql.append(" and u.userId like :userId");
				args.put("userId", "%"+user.getUserId()+"%");
			}
			if(StringUtil.isNotBlank(user.getDepartment())){
				
				jpql.append(" and u.department =:department");
				args.put("department",user.getDepartment());
			}
			if(StringUtil.isNotBlank(user.getOrganizationId())){
				
				jpql.append(" and u.organizationId =:organizationId");
				args.put("organizationId",user.getOrganizationId());
			}
			if(user.getRole()!=null && user.getRole().getId()!=null){
				
				jpql.append(" and u.role.id =:roleId");
				args.put("roleId",user.getRole().getId());
				
			}
			
		}
			return this.findPageByJPQL(jpql.toString(), args, pageBean);
		
	}

	public User fetchUsersById(User user) {
		
		return getById(user.getId());
	}

	
	public User fetchUser(User user) {
		
		StringBuffer jpql=new StringBuffer("from User u where  u.userName=:userName");
		Map<String ,Object> params=new HashMap<String ,Object>();
		params.put("userName", user.getUserName());
		
		if(user.getId()!=null){
			jpql.append(" and u.id <>:uid");
			
			params.put("uid", user.getId());
		}
		
		List<User> userList =this.findByJPQL(jpql.toString(), params);
		if(userList != null && userList.size()!=0){
			
			return userList.get(0);
		}
		return null;
		
		
	}

	public User fetchUsersByUserID(User user) {
		String jpql="from User u where  u.userId=:userId";
		Map<String ,Object> params=new HashMap<String ,Object>();
		params.put("userId", user.getUserId());
		List<User> userList =this.findByJPQL(jpql, params);
		if(userList != null && userList.size()!=0){
			
			return userList.get(0);
		}
		return null;
	}

	@Override
	public List<User> fetchAllUsers() {
		String jpql="from User u order by to_number(u.id) desc";
		return this.findByJPQL(jpql, null);
	}
	
	





	
}
