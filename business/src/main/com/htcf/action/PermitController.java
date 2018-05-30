package com.htcf.action;

import com.htcf.dao.PermitDao;
import com.htcf.entity.Xzxkxx;
import com.htcf.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 行政许可信息
 * @author by hj on 2017-11-20.
 */
@Controller("permitController")
@Scope("prototype")
public class PermitController extends BaseAction{

    @Autowired
    private PermitDao permitDao;

    private Xzxkxx xzxkxx;
    private PageBean pageBean;
    private List<?> xzxkList;


    /**
     * 进入行政许可信息页面
     * @return
     */
    public String toPermit(){
        HttpServletRequest request= this.getHttpServletRequest();
        pageBean=this.processPageBean(request);
        pageBean.setPageRecord(10);
        xzxkList = permitDao.fetchXkxxList(xzxkxx,pageBean);
        return "permitIndex";
    }

    /**
     * 行政许可信息详细页面
     * @return
     */
    public String goPermitDetaile(){
        //项目信息
        System.out.println("-=-=---------------="+xzxkxx.getProjectid());
        xzxkList = permitDao.permitDetail(xzxkxx);

        return "permitDetaile";
    }





    public PermitDao getPermitDao() {
        return permitDao;
    }

    public void setPermitDao(PermitDao permitDao) {
        this.permitDao = permitDao;
    }

    public Xzxkxx getXzxkxx() {
        return xzxkxx;
    }

    public void setXzxkxx(Xzxkxx xzxkxx) {
        this.xzxkxx = xzxkxx;
    }

    @Override
    public PageBean getPageBean() {
        return pageBean;
    }

    @Override
    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }

    public List<?> getXzxkList() {
        return xzxkList;
    }

    public void setXzxkList(List<?> xzxkList) {
        this.xzxkList = xzxkList;
    }
}
