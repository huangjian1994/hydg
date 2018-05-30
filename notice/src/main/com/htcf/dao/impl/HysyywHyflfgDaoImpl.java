package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.htcf.dao.HysyywHyflfgDao;
import com.htcf.entity.HysyywHyflfg;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;

@Repository("lawDao")
public class HysyywHyflfgDaoImpl extends BaseDAOImpl<HysyywHyflfg, Serializable> implements HysyywHyflfgDao {

	@Override
	public List<HysyywHyflfg> fetchLawPage(HysyywHyflfg law, PageBean pageBean) {
		
		StringBuffer hql = new StringBuffer("from HysyywHyflfg l where 1=1 ");
		Map<String, Object> args = new HashMap<String, Object>();
		
		if ( null != law ) {
			if ( StringUtil.isNotBlank(law.getLawName()) ) {
				hql.append(" and l.lawName like :lawName ");
				args.put("lawName", "%" + law.getLawName() + "%");
			}
			if ( StringUtil.isNotBlank(law.getLawAbstract()) ) {
				hql.append(" and l.lawAbstract like :lawAbstract ");
				args.put("lawAbstract", "%" + law.getLawAbstract() + "%");
			}
		}
		
		hql.append(" order by l.seq asc, l.id asc ");
		
		return this.findPageByJPQL(hql.toString(), args, pageBean);
	}
	
	public HysyywHyflfg fetchLawById(HysyywHyflfg law) {
		String hql = "from HysyywHyflfg l where l.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", law.getId());
		
		return (HysyywHyflfg) this.findUniqueResultByHql(hql, args);
	}
	
	public boolean saveLaw(HysyywHyflfg law) {
		try {
			this.save(law);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateLaw(HysyywHyflfg law) {
		try {
			this.update(law);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean delLawById(HysyywHyflfg law) {
		
		if ( null == law || null == law.getId() ) {
			return false;
		}
		
		String hql = "delete from HysyywHyflfg l where l.id = :id ";
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("id", law.getId());
		try {
			int n = this.updateByJPQL(hql, args);
			if ( n > 0 ) {
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
