package com.htcf.dao;

import com.htcf.entity.Xzxkxx;
import com.htcf.util.PageBean;

import java.util.List;

/**
 * @author by hj on 2017-11-20.
 */
public interface PermitDao {

    /**
     * 行政许可信息
     * @param xzxkxx 行政许可
     * @param pageBean 返回页数
     * @return
     */
    List<?> fetchXkxxList(Xzxkxx xzxkxx,PageBean pageBean);

    /**
    	 *
    	Description :详情页面
    	@param xzxkxx 行政许可
    	@return
    	@author：hj
    	@Create 2017-11-21 17:25
    	 */
    List<?> permitDetail (Xzxkxx xzxkxx);

}
