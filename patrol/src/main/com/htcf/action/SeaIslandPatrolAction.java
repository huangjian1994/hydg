package com.htcf.action;

import com.htcf.entity.ThyxcHdxcXcjhEntity;
import com.htcf.entity.User;
import com.htcf.service.IPatorlReportService;
import com.htcf.service.SeaIslandPatrolService;
import com.htcf.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Date;
import java.util.List;

/**
 * 海域海岛巡查模块
 * @author by hj on 2018-3-30.
 */
@Controller("seaIslandPatrolAction")
@Scope("prototype")
public class SeaIslandPatrolAction extends BaseAction {

    @Autowired
    private SeaIslandPatrolService islandPatrolService;
    @Autowired
    private IPatorlReportService patorlReportService;

    private ThyxcHdxcXcjhEntity xcjhEntity;

    /**
     * 文件
     */
    private File upload;

    /**
     * 文件名
     */
    private String uploadFileName;

    /**
     * 上传的文件类型
     */
    private String uploadContentType;

    /**
     * 流
     */
    private InputStream inputStream;


    private List<ThyxcHdxcXcjhEntity> xcjhList;

    private String jhId;

    /**
     * 出海巡查集合
     */
    private List chxcList;


    /**
    *Description :查询巡查计划
    *@return String
    *@author：hj
    *@Create 2018-4-2 18:32
    */
    public String fetchXcjh() {
        HttpServletRequest request = this.getHttpServletRequest();
        String userId = "";
        String userRoleName="";
        try{
            //登陆人ID
            userId = ((User)session.get("user")).getId();
            //角色
            userRoleName = ((User)session.get("user")).getRole().getRoleName();
        }catch(Exception e){
            return "dlCs";
        }
        pageBean = this.processPageBean(request);
        pageBean.setPageRecord(10);
        xcjhList = islandPatrolService.fetchXcjhtList(xcjhEntity, pageBean,userId,userRoleName);
        return "xcjhIndex";
    }

    public String fetchXcjhBack() {
        xcjhEntity = null;
        HttpServletRequest request = this.getHttpServletRequest();
        pageBean = this.processPageBean(request);
        pageBean.setPageRecord(10);
        String userId = "";
        String userRoleName="";
        try{
            //登陆人ID
            userId = ((User)session.get("user")).getId();
            //角色
            userRoleName = ((User)session.get("user")).getRole().getRoleName();
        }catch(Exception e){
            return "dlCs";
        }
        xcjhList = islandPatrolService.fetchXcjhtList(xcjhEntity, pageBean,userId,userRoleName);
        return "xcjhIndex";
    }

   /**
   *Description :新增计划
   *@return String
   *@author：hj
   *@Create 2018-4-2 11:08
   */
    public String addXcjh(){
        String xzsj=this.getDateTime();
        String userId = "";
        String userName = "";
//        String userRoleName="";
        try{
            //登陆人ID
            userId = ((User)session.get("user")).getId();
            /*//角色
            userRoleName = ((User)session.get("user")).getRole().getRoleName();*/
            //当前用户名
            userName = ((User)session.get("user")).getName();
        }catch(Exception e){
            return "dlCs";
        }
        xcjhEntity.setPlanstatus("未审核");
        xcjhEntity.setDrafepeopleid(userId);
        xcjhEntity.setDrafepeoplename(userName);
        xcjhEntity.setDrafetdate(xzsj);
        patorlReportService.addObject(xcjhEntity);
        return "addxcjhSuccess";
    }

    /**
    *Description :删除巡查计划
    *@return String
    *@author：hj
    *@Create 2018-4-2 20:10
    */
    public String deleteXcjh(){

        System.out.println("jhId="+jhId);
        islandPatrolService.deleteXcjh(jhId);

        return "addxcjhSuccess";
    }

    /**
    *Description :巡查计划详情
    *@param
    *@return String
    *@author：hj
    *@Create 2018-4-2 20:30
    */
    public String xcjhDetail(){
        System.out.println("id"+jhId);
        xcjhEntity = islandPatrolService.fetchXcjhDetail(jhId);
        return "goXcjhShDetail";
    }

    /**
     *Description :巡查计划修改信息
     *@param
     *@return String
     *@author：hj
     *@Create 2018-4-2 20:30
     */
    public String getXcjhUpdate(){
        xcjhEntity = islandPatrolService.fetchXcjhDetail(jhId);
        return "goXcjhUpdate";
    }

    /**
     *
     Description :巡查上报:修改
     @param:@return
     @return:String
     @throws
     @Author：hj
     @Create 2018-3-23 下午04:39:25
     */
    public String updateReport(){
        String userId = "";
        String userXm = "";
        try{
            userId = ((User)session.get("user")).getId();
            userXm = ((User)session.get("user")).getName();
        }catch(Exception e){
            return "dlCs";
        }
        String xzsj=this.getDateTime();
        xcjhEntity.setUpdatetime(xzsj);
        xcjhEntity.setUpdateuser(userXm);

        xcjhEntity.setPlanstatus("未审核");
        patorlReportService.updateObject(xcjhEntity);

        return "addxcjhSuccess";
    }



    /**
     *Description :查询巡查计划审核
     *@return String
     *@author：hj
     *@Create 2018-4-2 18:32
     */
    public String fetchXcjhShList() {
        HttpServletRequest request = this.getHttpServletRequest();
        pageBean = this.processPageBean(request);
        pageBean.setPageRecord(10);
        String userId = "";
        String userRoleName="";
        try{
            //登陆人ID
            userId = ((User)session.get("user")).getId();
            //角色
            userRoleName = ((User)session.get("user")).getRole().getRoleName();
        }catch(Exception e){
            return "dlCs";
        }
        xcjhList = islandPatrolService.fetchXcjhtShList(xcjhEntity, pageBean,userId,userRoleName);
        return "xcjhshIndex";
    }

    /**
    *Description :巡查计划审核-返回
    *@param
    *@return
    *@author：hj
    *@Create 2018-4-18 16:21
    */
    public String fetchXcjhShBack() {
        xcjhEntity = null;
        HttpServletRequest request = this.getHttpServletRequest();
        pageBean = this.processPageBean(request);
        pageBean.setPageRecord(10);
        String userId = "";
        String userRoleName="";
        try{
            //登陆人ID
            userId = ((User)session.get("user")).getId();
            //角色
            userRoleName = ((User)session.get("user")).getRole().getRoleName();
        }catch(Exception e){
            return "dlCs";
        }
        xcjhList = islandPatrolService.fetchXcjhtShList(xcjhEntity, pageBean,userId,userRoleName);
        return "xcjhshIndex";
    }


    /**
     *Description :巡查计划详情-审核
     *@param
     *@return String
     *@author：hj
     *@Create 2018-4-2 20:30
     */
    public String xcjhShDetail(){
        System.out.println("id"+jhId);
        xcjhEntity = islandPatrolService.fetchXcjhDetail(jhId);
        return "goXcjhShDetail";
    }

    /**
     *Description :巡查任务审核页面
     *@param
     *@return String
     *@author：hj
     *@Create 2018-4-2 20:30
     */
    public String goXcjhSh(){
        System.out.println("id"+jhId);
        xcjhEntity = islandPatrolService.fetchXcjhDetail(jhId);
        return "goXcjhSh";
    }

    /**
     *Description :任务审核通过
     *@return String
     *@author：hj
     *@Create 2018-4-2 20:30
     */
    public String shTg(){
        xcjhEntity.setPlanstatus("审核通过");
        xcjhEntity.setApproveuser(this.getSessionUser().getName());
        xcjhEntity.setApprovetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
        patorlReportService.updateObject(xcjhEntity);
        return "shSuccess";
    }

    /**
     *Description :任务审核不通过
     *@return String
     *@author：hj
     *@Create 2018-4-2 20:30
     */
    public String shBtg(){
        xcjhEntity.setPlanstatus("审核不通过");
        xcjhEntity.setApproveuser(this.getSessionUser().getName());
        xcjhEntity.setApprovetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
        patorlReportService.updateObject(xcjhEntity);
        return "shSuccess";
    }

    /**
    *Description :巡查人员查看的出海巡查页面
    *@return String
    *@author：hj
    *@Create 2018-4-18 11:37
    */
    public String fetchChxc(){
        HttpServletRequest request = this.getHttpServletRequest();
        String userId = "";
        String userName = "";
        String userRoleName="";
        try{
            //登陆人ID
            userId = ((User)session.get("user")).getId();
            userName = ((User) session.get("user")).getName();
            //角色
            userRoleName = ((User)session.get("user")).getRole().getRoleName();
        }catch(Exception e){
            return "dlCs";
        }
        pageBean = this.processPageBean(request);
        pageBean.setPageRecord(10);
        chxcList = islandPatrolService.fetchChxctShList(xcjhEntity, pageBean,userName,userRoleName);
        return "chxc";
    }

























    /*------------------------------------------------*/

    public SeaIslandPatrolService getIslandPatrolService() {
        return islandPatrolService;
    }

    public void setIslandPatrolService(SeaIslandPatrolService islandPatrolService) {
        this.islandPatrolService = islandPatrolService;
    }

    public ThyxcHdxcXcjhEntity getXcjhEntity() {
        return xcjhEntity;
    }

    public void setXcjhEntity(ThyxcHdxcXcjhEntity xcjhEntity) {
        this.xcjhEntity = xcjhEntity;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public IPatorlReportService getPatorlReportService() {
        return patorlReportService;
    }

    public void setPatorlReportService(IPatorlReportService patorlReportService) {
        this.patorlReportService = patorlReportService;
    }

    public List<ThyxcHdxcXcjhEntity> getXcjhList() {
        return xcjhList;
    }

    public void setXcjhList(List<ThyxcHdxcXcjhEntity> xcjhList) {
        this.xcjhList = xcjhList;
    }

    public String getJhId() {
        return jhId;
    }

    public void setJhId(String jhId) {
        this.jhId = jhId;
    }

    public List getChxcList() {
        return chxcList;
    }

    public void setChxcList(List chxcList) {
        this.chxcList = chxcList;
    }
}
