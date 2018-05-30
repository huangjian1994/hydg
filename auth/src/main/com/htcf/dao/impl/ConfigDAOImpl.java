package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.dao.IConfigDAO;
import com.htcf.entity.Dictionary;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;



@Repository(value="configDAO")
public class ConfigDAOImpl  extends BaseDAOImpl<Object,Serializable>  implements IConfigDAO {

	public List<Dictionary> retrieveDictionaryByName(Dictionary dictionary,
			PageBean pageBean) {
		StringBuffer jpql=new StringBuffer("from Dictionary where 1=1");
		Map<String,Object> args =new HashMap<String,Object>();
		if(StringUtil.isNotBlank(dictionary.getKey())){
			jpql.append(" and key like :key");
			args.put("key", "%"+dictionary.getKey()+"%");
		}
		if(StringUtil.isNotBlank(dictionary.getValue())){
			jpql.append(" and value like :value");
			args.put("value", "%"+dictionary.getValue()+"%");
		}
		if(StringUtil.isNotBlank(dictionary.getDm())){
			jpql.append(" and dm like :dm");
			args.put("dm", "%"+dictionary.getDm()+"%");
		}
		if(StringUtil.isNotBlank(dictionary.getBm())){
			jpql.append(" and bm like :bm");
			args.put("bm", "%"+dictionary.getBm()+"%");
		}
		if(StringUtil.isNotBlank(dictionary.getXs())){
			jpql.append(" and xs like :xs");
			args.put("xs", "%"+dictionary.getXs()+"%");
		}
		jpql.append(" order by id desc");
		return this.findPageByJPQL(jpql.toString(), args, pageBean);
		
	}
    /**
     * 增加配置键值对
     */
	public boolean addKey(Dictionary dictionary) {
        this.save(dictionary);
		return true;
	}
	/**
	 * 删除配置键值对
	 */
	public boolean delkey(Dictionary dictionary) {
		String sql="delete from BASE_DICTIONARY WHERE ID='"+dictionary.getId()+"'";
		this.updateBySql(sql);
		return true;
	}
	/**
	 * 进入修改界面
	 */
	public Object editkey(Dictionary dictionary) {
		String sql = "from Dictionary where id = '"+dictionary.getId()+"'";
		List l = this.findPageByJPQL(sql, null);
		Object o = l.get(0);
		return o;
	}
	/**
	 * 修改字典键值对
	 */
	public boolean updateKey(Dictionary dictionary) {
		String sql="UPDATE BASE_DICTIONARY SET KEY='"+dictionary.getKey()+"',VALUE='"+dictionary.getValue()+"',DM='"+dictionary.getDm()+"',BM='"+dictionary.getBm()+"',XS='"+dictionary.getXs()+"' where ID='"+dictionary.getId()+"'";
		this.updateBySql(sql);
		return true;
	}

	
}
