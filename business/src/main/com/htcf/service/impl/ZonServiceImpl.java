package com.htcf.service.impl;

import java.util.List;

import com.htcf.entity.*;
import com.htcf.util.Operate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.IZonDao;
import com.htcf.service.IZonService;
import com.htcf.util.PageBean;

/**
 * @author hj
 * @date 2017-8-24
 *
 */

@Service(value="zonService")
public class ZonServiceImpl implements IZonService {

	@Autowired
	private IZonDao zonDao;
	
	/**
	 * 功能区划项目信息列表
	 * @author ：hj
	 * @date:日期：2017-8-24下午03:37:44
	 */
	@Operate(description = "查询功能区划")
	@Override
	public List<?> fetchGnqhList(PageBean pageBean, THYsyywHygnqhXxgl hygnqhXxgl) {
		return zonDao.fetchGnqhList(pageBean, hygnqhXxgl);
	}
	
	/**
	 * 
	Description :功能区划详情
	@Author：hj
	@Create 2017-8-29下午03:03:58
	 */
	@Operate(description = "功能区划详情")
	@Override
	public THYsyywHygnqhXxgl fetchGnqhDetail(String xmID) {
		return zonDao.fetchGnqhDetail(xmID);
		
	}

	/**
	 * 查询功能区界址点坐标信息
	 *
	 * @param xmID 项目id
	 * @return
	 */
	@Operate(description = "查询功能区界址点坐标信息")
	@Override
	public List<XxglKjxxEntity> fetchXxglJzd(String xmID) {
		return zonDao.fetchXxglJzd(xmID);
	}

	/**
	 * 删除界址点
	 *
	 * @param jzdID
	 */
	@Operate(description = "删除界址点")
	@Override
	public void deleteXxglJzd(String jzdID) {
		zonDao.deleteXxglJzd(jzdID);
	}

	/**
	 * 删除界址点all
	 *
	 * @param xmID
	 */
	@Operate(description = "删除所有界址点")
	@Override
	public void deleteXxglJzdAll(String xmID) {
		zonDao.deleteXxglJzdAll(xmID);
	}

	/**
	 * Description :更新功能区划信息
	 * @Author：hj
	 * @Create 2017-8-31 16:22
	 * //@Operate(description = "更新功能区划信息")
	 */
	@Operate(description = "更新功能区划信息")
	@Override
	public void UpdateGnqh(THYsyywHygnqhXxgl hygnqhXxgl) {
		zonDao.UpdateGnqh(hygnqhXxgl);
	}

	/**
	 * Description :修改实体
	 * @Author：hj
	 * @Create 2017-8-31 16:36
	 */
	@Operate(description = "修改功能区划实体")
	@Override
	public void UpdateObj(Object obj) {
		zonDao.UpdateObj(obj);

	}

	/**
	 * Description :s删除功能区划
	 * @Author：hj
	 * @Create 2017-8-31 18:10
	 */
	@Operate(description = "删除功能区划")
	@Override
	public void deleteGnqh(String xmID) {
		zonDao.deleteGnqh(xmID);
	}

	/**
	 * Description :查询功能区辅助划分信息
	 *
	 * @param hysyywHygnqhFzhf  辅助划分信息
	 * @Author：hj
	 * @Create 2017-9-6 18:41
	 */
	@Operate(description = "查询功能区辅助划分信息")
	@Override
	public List<?> fetchFzhf(THysyywHygnqhFzhf hysyywHygnqhFzhf, PageBean pageBean) {
		return zonDao.fetchFzhf(hysyywHygnqhFzhf,pageBean);
	}

	/**
	 * Description :删除辅助功能区划
	 *
	 * @param xmID  辅助功能区划id
	 * @Author：hj
	 * @Create 2017-9-11 9:49
	 */
	@Operate(description = "删除辅助功能区划")
	@Override
	public void deleteFzqh(String xmID) {
		zonDao.deleteFzqh(xmID);
	}

	/**
	 * Description :辅助功能区划详情
	 *
	 * @param xmID  辅助功能区id
	 * @Author：hj
	 * @Create 2017-9-11 17:02
	 */
	@Operate(description = "辅助功能区划详情")
	@Override
	public THysyywHygnqhFzhf fetchFzhfDetail(String xmID) {
		return zonDao.fetchFzhfDetail(xmID);
	}

	/**
	 * Description :选择功能区划名称
	 *
	 * @Author：hj
	 * @Create 2017-9-15 15:00
	 */
	@Operate(description = "选择功能区划名称")
	@Override
	public List<?> fetchMcList() {
		return this.zonDao.fetchMcList();
	}

	/**
	 * Description :查询功能区划发布信息
	 *
	 * @param hygnqhFb 发布实体
	 * @param pageBean 分页
	 * @return 发布信息集合
	 * @author：hj
	 * @Create 2017-10-25 15:14
	 */
	@Operate(description = "查询功能区划发布信息")
	@Override
	public List<ThysyywHygnqhFb> fetchGnqhfbList(ThysyywHygnqhFb hygnqhFb, PageBean pageBean) {
		return this.zonDao.fetchGnqhfbList(hygnqhFb, pageBean);
	}

	/**
	 * Description :发布详情
	 *
	 * @param xmID 发布编号
	 * @return  发布详情
	 * @author：hj
	 * @Create 2017-10-26 14:07
	 */
	@Operate(description = "发布详情")
	@Override
	public ThysyywHygnqhFb fetchFbDetail(String xmID) {
		return zonDao.fetchFbDetail(xmID);
	}

	/**
	 * Description :删除发布
	 *
	 * @param xmID 发布id
	 * @author：hj
	 * @Create 2017-10-26 19:04
	 */
	@Operate(description = "删除发布")
	@Override
	public void deleteFb(String xmID) {
		zonDao.deleteFb(xmID);
	}


    @Override
    public List<?> fetchLybhGnqmc() {
        return this.zonDao.fetchLybhGnqmc();
    }

    @Override
    public List<?> fetchLybh(Xzgz xzgz, PageBean pageBean) {
        return  zonDao.fetchLybh(xzgz,pageBean);
    }

    @Override
    public boolean removeXzgzById(Xzgz xzgz) {
        return zonDao.delXzgzById(xzgz);
    }

    @Override
    public Xzgz loadXzgzById(Xzgz xzgz) {
        return zonDao.fetchXzgzByid(xzgz);
    }

    @Override
    public boolean editXzgz(Xzgz xzgz) {
        return zonDao.updateXzgz(xzgz);
    }

    @Override
    public List<?> fetchZxjd(ThysyywHygnqhZxqkjdEntity zxqkjdEntity, PageBean pageBean) {
        return zonDao.fetchZxjd(zxqkjdEntity,pageBean);
    }

    @Override
    public boolean removeZxjdById(ThysyywHygnqhZxqkjdEntity zxqkjdEntity) {
        return zonDao.removeZxjdById(zxqkjdEntity);
    }

	@Override
	public ThysyywHygnqhZxqkjdEntity loadzxqkjdEntityById(ThysyywHygnqhZxqkjdEntity zxqkjdEntity) {
		return zonDao.loadZxqkjdById(zxqkjdEntity);
	}

    @Override
    public List<Object[]> fetchtj() {
        return zonDao.fetchtj();
    }

    @Override
    public List<Object[]> fetchtjXzgzKfgm() {
        return zonDao.fetchtjXzgzKfgm();
    }

	@Override
	public List<Object[]> fetchtjXzgzZlbh() {
		return zonDao.fetchtjXzgzZlbh();
	}

	@Override
	public List<Object[]> fetchtjXzgzYxcd() {
		return zonDao.fetchtjXzgzYxcd();
	}


}
