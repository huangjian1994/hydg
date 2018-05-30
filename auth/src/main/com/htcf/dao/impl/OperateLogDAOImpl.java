package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.htcf.dao.IOperateLogDAO;
import com.htcf.entity.OperateLog;
import com.htcf.entity.User;
import com.htcf.util.PageBean;


@Repository(value="operateLogDAO")
public class OperateLogDAOImpl extends BaseDAOImpl<OperateLog,Serializable> implements IOperateLogDAO{

	public void addOperateLog(OperateLog operateLog) {
		this.save(operateLog);
		
	}

	public void deleteOperateLog(OperateLog operateLog) {
		this.delete(this.getById(operateLog.getId()));
		
	}

	public List<OperateLog> retrieveLogs(User user, OperateLog opLog,PageBean pageBean) {
		
		StringBuffer jpql=new StringBuffer(" from OperateLog log where 1=1  ");
		
		Map <String,Object> args=new HashMap<String,Object>();
		
		if(user !=null && StringUtils.isNotBlank(user.getName())){
			
			jpql.append(" and log.userName=:name");
			args.put("name", user.getName());
			
		}
		if(opLog !=null && opLog.getOperateType() !=null && opLog.getOperateType()!=-1 ){
			
			jpql.append(" and log.operateType=:opType");
			args.put("opType", opLog.getOperateType());
		}
		if(opLog !=null && StringUtils.isNotBlank(opLog.getOperateName())){
			jpql.append(" and log.operateName=:operateName");
			args.put("operateName", opLog.getOperateName());
			
		}
		if(opLog !=null && StringUtils.isNotBlank(opLog.getOpTime())){
			
			jpql.append(" and log.opTime like:opTime");
			args.put("opTime", "%"+opLog.getOpTime()+"%");
		}
		jpql.append(" order by opTime desc");
		return this.findPageByJPQL(jpql.toString(), args, pageBean);
	
	}

}
