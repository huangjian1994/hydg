package com.htcf.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.htcf.entity.User;

public class HttpSessionUtil implements HttpSessionListener, HttpSessionAttributeListener {

	private static Map<String, HttpSession> sessionMap = new HashMap<String, HttpSession>();
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
//		System.out.println("创建session");
//		//map中无此此session
//		if (!sessionMap.keySet().contains(event.getSession().getId())) {
//			sessionMap.put(event.getSession().getId(), event.getSession());
//		}
	}	

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		sessionMap.remove(event.getSession().getId());
	}
	
	
	/**
	 * 获取已登录的用户
	 * @return List<User>
	 */
	public static List<User> getLoginedUsers(){
		Map<String, User> userMap = new HashMap<String, User>();
		for (String key : sessionMap.keySet()) {
			if (null != sessionMap.get(key)) {
				User user = (User) sessionMap.get(key).getAttribute("user");
				if (null != user) {
					userMap.put(user.getId(), user);
				}
			} else {
				sessionMap.remove(key);
			}
		}
		
		List<User> users = new ArrayList<User>();
		for (String userId : userMap.keySet()) {
			users.add(userMap.get(userId));
		}
		return users;
	}

	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		String attrName = event.getName();
		if ("user".equals(attrName)) {
			sessionMap.put(event.getSession().getId(), event.getSession());
		}
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		String attrName = event.getName();
		if ("user".equals(attrName)) {
			sessionMap.remove(event.getSession().getId());
		}
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {

	}

}
