package com.htcf.service;


import java.util.List;

import com.htcf.entity.User;
import com.htcf.util.PageBean;

public interface IUserService {
	
	public List<User> fetchAllUsers();
	
	public User fetchUsersByName(User user);
	public User fetchUsersByUserID(User user);
	public List<User> retrieveUsersByCondtions(User user,PageBean pageBean);
	

	public void editUser(User user,String roleIds);

	public void addUser(User user,String roleIds);

	public void deleteUser(User user);

	public User fetchUserById(User user);

	public void addUser(User user);

	public void editUser(User user);

	public User fetchUser(User user);


	
}
