package com.htcf.dao;

import java.util.List;

import com.htcf.entity.*;
import com.htcf.util.PageBean;

/**
 * @author hj
 * @date 2017-8-24
 *
 */
public interface IZonDao {
	
	/**
	 * 功能区划项目信息列表
	 * @author ：hj
	 * @date:日期：2017-8-24下午03:37:44
	 * @param pageBean page
	 * @param hygnqhXxgl hygnqhXxgl
	 * @return List
	 */
	 List<?> fetchGnqhList(PageBean pageBean, THYsyywHygnqhXxgl hygnqhXxgl);

	/**
	 * 查询功能区界址点坐标信息
	 * @param xmID 项目id
	 * @return
	 */
	List<XxglKjxxEntity> fetchXxglJzd(String xmID);

	/**
	 * 删除界址点
	 * @param jzdID
	 */
	void deleteXxglJzd(String jzdID);

	/**
	 * 删除界址点all
	 * @param xmID
	 */
	void deleteXxglJzdAll(String xmID);

	/**
	 * 
		 * 
		Description :功能区划详情
		@param xmID xmID
		@return  THYsyywHygnqhXxgl
		@Author：hj
		@Create 2017-8-29下午03:05:48
	 */
	 THYsyywHygnqhXxgl fetchGnqhDetail(String xmID);

	/**
	 *
	 Description :更新功能区划信息
	 @Author：hj
	 @Create 2017-8-31 16:22
	 */
	public void UpdateGnqh(THYsyywHygnqhXxgl hygnqhXxgl);

	/**
	 *
	 Description :修改实体
	 @Author：hj
	 @Create 2017-8-31 16:36
	 */
	 void UpdateObj(Object obj);

	/**
	 *
	 Description :s删除功能区划
	 @Author：hj
     @param xmID xmid
	 @Create 2017-8-31 18:10
	 */

	 void deleteGnqh(String xmID);

	/**
	 *
	 Description :查询功能区辅助划分信息
	 @Author：hj
	 @Create 2017-9-6 18:41
	 */
	 List<?> fetchFzhf(THysyywHygnqhFzhf hysyywHygnqhFzhf, PageBean pageBean);

	/**
			*
	Description :删除辅助功能区划
	@Author：hj
	@Create 2017-9-11 9:49
			*/
	 void deleteFzqh(String xmID);

    /**
     *
     Description :辅助功能区划详情
     @Author：hj
     @Create 2017-9-11 17:02
     */
     THysyywHygnqhFzhf fetchFzhfDetail(String xmID);

	/**
	 *
	 Description :选择功能区划名称
	 @Author：hj
	 @Create 2017-9-15 15:00
	 */
	 List<?> fetchMcList();

	/**
		 *
		Description :
		@param hygnqhFb hygnqhFb
		@param pageBean pageBean
		@return List
		@author：hj
		@Create 2017-10-25 15:22
		 */
	 List<ThysyywHygnqhFb> fetchGnqhfbList(ThysyywHygnqhFb hygnqhFb,PageBean pageBean);

	/**
	 *
	 Description :
	 @param xmID 发布编号
	 @return 发布详情
	 @author：hj
	 @Create 2017-10-26 14:07
	 */
	 ThysyywHygnqhFb fetchFbDetail(String xmID);

    /**
     *
     Description :删除发布
     @param xmID 发布id
     @author：hj
     @Create 2017-10-26 19:04
     */
     void deleteFb(String xmID);

	/**
	 * Description :查询建立利用与跟踪保护中的功能区名称
	 *
	 * @return list
	 * @author：hj
	 * @Create 2017-11-23 15:45
	 */
	List<?> fetchLybhGnqmc();

	/**
		 *
	 Description :查询出所有的利用与保护信息
	 @param xzgz 现状保护
	 @param pageBean pagebean
	 @return 返回利用与保护
	 @author：hj
	 @Create 2017-11-24 11:09
		 */
    List<?> fetchLybh(Xzgz xzgz, PageBean pageBean );


    /**
    	 *
    	Description :删除现状跟踪
    	@author：hj
    	@Create 2017-11-28 9:48
    	 */
    boolean delXzgzById(Xzgz xzgz);

    /**
    	 *
    	Description :
    	@param xzgz xzgz
    	@return xzgz
    	@author：hj
    	@Create 2017-11-28 10:28
    	 */
	Xzgz fetchXzgzByid(Xzgz xzgz);

	/**
	 *
	 Description :修改现状跟踪
	 @param xzgz  现状跟踪
	 @return boolean
	 @author：hj
	 @Create 2017-11-28 13:57
	 */
    boolean updateXzgz(Xzgz xzgz);

	/**
	 *
	 Description :查询执行情况信息
	 @param zxqkjdEntity 执行情况
	 @param pageBean pageBean
	 @return 执行情况信息
	 @author：hj
	 @Create 2017-11-30 17:27
	 */
    List<?> fetchZxjd(ThysyywHygnqhZxqkjdEntity zxqkjdEntity, PageBean pageBean);

	/**
	 *
	 Description :删除执行情况监督
	 @param zxqkjdEntity 执行情况监督
	 @return boolean
	 @author：hj
	 @Create 2017-12-1 10:23
	 */
    boolean removeZxjdById(ThysyywHygnqhZxqkjdEntity zxqkjdEntity);

    /**
     *
     Description :根据id查出执行情况详细信息
     @param zxqkjdEntity 执行情况详细信息
     @return 执行情况详细信息
     @author：hj
     @Create 2017-12-1 10:32
     */
    ThysyywHygnqhZxqkjdEntity loadZxqkjdById(ThysyywHygnqhZxqkjdEntity zxqkjdEntity);

    /**
    	 *
    	Description :统计不同单位发现跟踪的个数
    	@return list
    	@author：hj
    	@Create 2017-12-4 10:50
    	 */
    List<Object[]> fetchtj();

	/**
	 *
	 Description :利用保护与现状跟踪统计-开发规模
	 @author：hj
	 @return List
	 @Create 2017-12-8 15:33
	 */
	List<Object[]> fetchtjXzgzKfgm();

	/**
	 *
	 Description :利用保护与现状跟踪统计-质量变化
	 @author：hj
	 @return List
	 @Create 2017-12-8 15:33
	 */
	List<Object[]> fetchtjXzgzZlbh();

	/**
	 *
	 Description :利用保护与现状跟踪统计-影响程度
	 @author：hj
	 @return List
	 @Create 2017-12-8 15:33
	 */
	List<Object[]> fetchtjXzgzYxcd();
}
