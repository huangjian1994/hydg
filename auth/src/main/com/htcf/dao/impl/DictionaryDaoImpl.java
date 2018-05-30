package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.dao.DictionaryDao;
import com.htcf.entity.Dictionary;
import com.htcf.util.StringUtil;

@Repository("dictionaryDao")
public class DictionaryDaoImpl extends BaseDAOImpl<Dictionary, Serializable> implements DictionaryDao {

	public List<Dictionary> loadDicByKey(Dictionary dictionary) {
		
		String hql = "from Dictionary d where d.key = :key order by to_number(d.dm) asc";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("key", dictionary.getKey());
		
		return this.findByJPQL(hql, args);
	}

	public Map<String, String> loadDicMapByKey(Dictionary dictionary) {
		
		String hql = "from Dictionary d where d.key = :key order by to_number(d.dm) asc";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("key", dictionary.getKey());
		
		List<Dictionary> dics = this.findByJPQL(hql, args);
		Map<String, String> dicMap = new LinkedHashMap<String, String>();
		for (Dictionary dic : dics) {
			dicMap.put(dic.getDm(), dic.getValue());
		}
		
		return dicMap;
	}

	public Map<String, String> loadValByKeyAndDm(Dictionary dictionary) {

		StringBuffer hql = new StringBuffer("from Dictionary d where d.key = :key ");
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("key", dictionary.getKey());
		
		if ( StringUtil.isNotBlank(dictionary.getDm()) ) {
			hql.append(" d.dm in ( 'dm_'");
			String[] dms = dictionary.getDm().split(",");
			for (int i = 0; i < dms.length; i++) {
				String dm = dms[i];
				if ( StringUtil.isNotBlank(dm) ) {
					String key = ",:dm" + i;
					hql.append(key);
					args.put(key, StringUtil.trimToBlank(dm));
				}
			}
			hql.append(")");
		}
		
		List<Dictionary> dics = this.findByJPQL(hql.toString(), args);
		Map<String, String> dicMap = new LinkedHashMap<String, String>();
		for (Dictionary dic : dics) {
			dicMap.put(dic.getDm(), dic.getValue());
		}
		return null;
	}

}
