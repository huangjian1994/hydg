package com.htcf.service;

import java.util.List;

import com.htcf.entity.Menu;
import com.htcf.entity.Role;
import com.htcf.entity.User;
import com.htcf.util.PageBean;

public interface IMenuService {
	
	public List<Menu> retrieveMenusByUser(User user);

	public List<Menu> retrieveMenusByConditions(Menu menu,PageBean pageBean);

	public void addMenu(Menu menu,List<Role> roleList);

	public void eidtMenu(Menu menu);

	public Menu fetchMenuById(Menu menu);

	public void deleteMenu(Menu menu);

	public List<Menu> retrieveParentMenus(Menu menu);

	public List<Menu> retrieveAllMenus();

	public List<Menu> retrieveMenusByRole(Role role);

	public Menu fetchMenu(Menu menu);

	public void addMenu(Menu menu);
	

	public List<Menu> retrieveMenusByLevel(Menu menu);

	
	
}
