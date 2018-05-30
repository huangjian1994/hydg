package com.htcf.service;

import java.util.List;

import com.htcf.entity.Dictionary;
import com.htcf.util.PageBean;

public interface IConfigService {
	
	List<Dictionary> retrieveDictionaryByName(Dictionary dictionary, PageBean pageBean); 
	boolean addKey(Dictionary dictionary);
	boolean delkey(Dictionary dictionary);
	Object editkey(Dictionary dictionary);
	boolean updateKey(Dictionary dictionary);
	
}
