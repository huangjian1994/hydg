package com.htcf.action;

import com.alibaba.fastjson.JSON;
import com.htcf.entity.BoatRecord;
import com.htcf.entity.BoatStatic;
import com.htcf.entity.HdgxDbldxxEntity;
import com.htcf.service.HdgxDbldxxService;
import com.htcf.util.Base64Util;
import com.htcf.util.RequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 地波雷达信息
 * @author by hj on 2017-12-27.
 */
@Controller("dbldAction")
@Scope("prototype")
public class HdgxDbldxxAction extends BaseAction {

    @Autowired
    private HdgxDbldxxService dbldxxService;

    /**
     * 地波雷达实体
     */
    private HdgxDbldxxEntity dbldxxEntity;

    /**
     * 地波雷达信息
     */
    private List<HdgxDbldxxEntity> dbldxxEntityList;

    /**
     * 船舶信息
     */
    private String si;
    private String sicode;
    private String receice;

    /**
     * 查询时间段参数
     */
    private String startTime;
    private String endTime;

    /**
     * 船舶静态数据
     */
    private List<BoatStatic> boatStaticList;

    /**
     * 船舶档案数据
     */
    private List<BoatRecord> boatRecords;

    /**
    	 *
    	Description :地波雷达信息
    	@return
    	@author：hj
    	@Create 2017-12-27 17:30
    	 */
    public String fetchDbldxx(){
        pageBean = this.processPageBean(getHttpServletRequest());
        dbldxxEntityList = dbldxxService.fetchDbldxx(dbldxxEntity,pageBean);
        return "dbldxx";
    }

    /**
    	 *
    	Description :查询地波雷达发现船舶详细信息
    	@return 船舶详情页面
    	@author：hj
    	@Create 2017-12-28 17:01
    	 */
    public String fetchBoatxqDbld(){
        System.out.println("预警船舶详情oid"+dbldxxEntity.getMmsi());
        String cmd1 = "0x0121";
        si = "{mmsi:\""+dbldxxEntity.getMmsi()+"\"}";
        sicode = Base64Util.encode(si.getBytes());

        receice = RequestUtil.sendGet
                ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd1,sicode));
        System.out.println("单船静态数据获取到的信息"+receice);
        boatStaticList = JSON.parseArray(receice,BoatStatic.class);

        String cmd2 = "0x0125";
        sicode = Base64Util.encode(si.getBytes());
        receice = RequestUtil.sendGet
                ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd2,sicode));
        System.out.println("单船档案数据获取到的信息"+receice);
        boatRecords = JSON.parseArray(receice,BoatRecord.class);

        return "dbldcbxq";
    }

    /**
    	 *
    	Description :根据id查询地波雷达传过来的详细信
    	@return 地波雷达详情页面
    	@author：hj
    	@Create 2017-12-29 11:37
    	 */
    public String fetchDbldDetaile(){
        dbldxxEntity = dbldxxService.fetchDbldxxDetailById(dbldxxEntity);
        return "dbldxq";
    }

    /**
    	 *
    	Description :根据时间查询当前插入的数据，比对分析
    	@author：hj
    	@Create 2018-1-11 10:31
    	 */
    public void fetchByTime(){
        System.out.println(startTime);
        System.out.println(endTime);
        dbldxxEntityList = dbldxxService.fetchDbldByTime(startTime,endTime);
        System.out.println("dbldxxEntityList"+dbldxxEntityList);
        Object json = JSON.toJSON(dbldxxEntityList);
        System.out.println(json);

        HttpServletResponse response=this.getHttpServletResponse();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=null;
        try {
            out = response.getWriter();
            out.print(json.toString());
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

    }

    /**
     * set  get
     */

    public HdgxDbldxxService getDbldxxService() {
        return dbldxxService;
    }

    public void setDbldxxService(HdgxDbldxxService dbldxxService) {
        this.dbldxxService = dbldxxService;
    }

    public HdgxDbldxxEntity getDbldxxEntity() {
        return dbldxxEntity;
    }

    public void setDbldxxEntity(HdgxDbldxxEntity dbldxxEntity) {
        this.dbldxxEntity = dbldxxEntity;
    }

    public List<HdgxDbldxxEntity> getDbldxxEntityList() {
        return dbldxxEntityList;
    }

    public void setDbldxxEntityList(List<HdgxDbldxxEntity> dbldxxEntityList) {
        this.dbldxxEntityList = dbldxxEntityList;
    }

    public String getSi() {
        return si;
    }

    public void setSi(String si) {
        this.si = si;
    }

    public String getSicode() {
        return sicode;
    }

    public void setSicode(String sicode) {
        this.sicode = sicode;
    }

    public String getReceice() {
        return receice;
    }

    public void setReceice(String receice) {
        this.receice = receice;
    }

    public List<BoatStatic> getBoatStaticList() {
        return boatStaticList;
    }

    public void setBoatStaticList(List<BoatStatic> boatStaticList) {
        this.boatStaticList = boatStaticList;
    }

    public List<BoatRecord> getBoatRecords() {
        return boatRecords;
    }

    public void setBoatRecords(List<BoatRecord> boatRecords) {
        this.boatRecords = boatRecords;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
