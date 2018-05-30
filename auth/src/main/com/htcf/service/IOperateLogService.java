package com.htcf.service;

import java.util.List;

import com.htcf.entity.OperateLog;
import com.htcf.entity.User;
import com.htcf.util.PageBean;

public interface IOperateLogService {

	void add(OperateLog op);

	List<OperateLog> retrieveLogs(User user, OperateLog opLog, PageBean pageBean);

}
