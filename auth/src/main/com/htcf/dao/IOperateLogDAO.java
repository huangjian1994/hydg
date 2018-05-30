package com.htcf.dao;

import java.util.List;

import com.htcf.entity.OperateLog;
import com.htcf.entity.User;
import com.htcf.util.PageBean;

public interface IOperateLogDAO {
	
	 void addOperateLog(OperateLog operateLog);

	 List<OperateLog> retrieveLogs(User user, OperateLog opLog, PageBean pageBean);

}
