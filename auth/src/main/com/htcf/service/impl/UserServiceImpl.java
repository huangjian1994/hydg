package com.htcf.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.IRoleDAO;
import com.htcf.dao.IUserDAO;
import com.htcf.dao.IUserRoleDAO;
import com.htcf.entity.Role;
import com.htcf.entity.User;
import com.htcf.entity.UserRole;
import com.htcf.service.IUserService;
import com.htcf.util.Operate;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;


@Service(value="userService")
public class UserServiceImpl implements IUserService{

	
	@Autowired
	private IUserDAO userDAO;
	
	@Autowired
	private IRoleDAO roleDAO;
	
	@Autowired
	private IUserRoleDAO userRoleDAO;
	
	
	
	//@Operate(description="根据编号查询用户")
	public User fetchUserById(User user) {
		return userDAO.fetchUsersById(user);
	
	}
	
	//用户登录方法
	//@Operate(description="查询用户根据姓名")
	public User fetchUsersByName(User user) {
		return userDAO.fetchUsersByName(user);
	}
	//@Operate(description="查询用户")
	public List<User> retrieveUsersByCondtions(User user,PageBean pageBean){
		return userDAO.retrieveUsersByConditions(user, pageBean);
		
	}
	

	@Operate(description="添加用户")
	public void addUser(User user,String roleIds) {
		
		UserRole ur=null;
		
		if(StringUtil.isNotBlank(roleIds)){
			
			List<Role> roleList=roleDAO.retrieveRolesByIds(roleIds);
			
			for(Role role:roleList){
				
				ur=new UserRole();
				ur.setUser(user);
				ur.setRole(role);
				
				userRoleDAO.addUserRole(ur);
			
			}
				
			
		}
		userDAO.addUser(user);
		
	}
	
	
	@Operate(description="修改用户")
	public void editUser(User user,String roleIds) {
		
		    UserRole ur=null;
			
			List<UserRole> userRoles=roleDAO.retrieveUserRolesByUser(user);
			
			if(userRoles !=null){
				
				for(UserRole userRole:userRoles){
					
					userRoleDAO.deleteUserRole(userRole);
				
				}
				
			}
			
			
			if(StringUtil.isNotBlank(roleIds)){
				
				List<Role> roleList=roleDAO.retrieveRolesByIds(roleIds);
				
				for(Role role:roleList){
					
					ur=new UserRole();
					ur.setUser(user);
					ur.setRole(role);
					
					
				    userRoleDAO.addUserRole(ur);
				
				}

			}
			
			userDAO.editUser(user);
		
	}

	@Operate(description="删除用户")
	public void deleteUser(User user) {
		
		List<UserRole> userRoles=roleDAO.retrieveUserRolesByUser(user);
		
		for(UserRole userRole:userRoles){
			
			userRoleDAO.deleteUserRole(userRole);
			
		}
		userDAO.deleteUser(user);
		
	}

	
	
	public IUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(IUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public IRoleDAO getRoleDAO() {
		return roleDAO;
	}

	public void setRoleDAO(IRoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}

	public IUserRoleDAO getUserRoleDAO() {
		return userRoleDAO;
	}

	public void setUserRoleDAO(IUserRoleDAO userRoleDAO) {
		this.userRoleDAO = userRoleDAO;
	}

	public void addUser(User user) {
		userDAO.addUser(user);
		
	}

	public void editUser(User user) {
		userDAO.editUser(user);
		
	}
	@Operate(description="查询用户信息")
	public User fetchUser(User user) {
		// TODO Auto-generated method stub
		return userDAO.fetchUser(user);
	}
	@Operate(description="查询用户根据用户信息")
	public User fetchUsersByUserID(User user) {
		return userDAO.fetchUsersByUserID(user);
	}

	@Override
	@Operate(description="查询所有用户")
	public List<User> fetchAllUsers() {
		return userDAO.fetchAllUsers();
	}

}
