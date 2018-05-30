package com.htcf.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.SearchForm;
import com.htcf.entity.Ship;
import com.htcf.entity.THysyywHysydtYhxm;
import com.htcf.entity.THysyywHysydtYhxmXmfj;
import com.htcf.entity.TjfxForm;
import com.htcf.entity.User;
import com.htcf.service.IBusinessService;
import com.htcf.service.ISeaRecordService;

/**
 * 海域使用动态管理——海籍管理
 * @author yinying
 *
 */
@Controller("seaRecordAction")
@Scope("prototype")
public class SeaRecordAction extends BaseAction{
	
	@Autowired
	private IBusinessService businessService;
	
	@Autowired
	private ISeaRecordService seaRecordService;

	//实体
	private TjfxForm tjfxForm = new TjfxForm();
	private SearchForm searchForm = new SearchForm();
	private THysyywHysydtYhxmXmfj hysyywHysydtYhxmXmfj = new THysyywHysydtYhxmXmfj();
	private THysyywHysydtYhxm hysyywHysydtYhxm = new THysyywHysydtYhxm();
	
	
	//List
	private List<?> fileList;
	private List<?> imgList;
	private List<?> ewjcbList;
	private List<?> tjbList;
	private List<?> yhxmList;//用海项目
	
	

	//变量
	private String hysytjData_x;
	private String hysytjData_y;
	private String hysytjData_y2;
	private String jldw;//计量单位
	private String xmfjID;//项目附件ID
	private int number;
	private String camera_num;
	private String camera;
	private String cam;
	//实现对上海市各类海籍信息的一体化综合管理，满足上海市管理海籍的需求。主要功能包括：
	
	/********海域使用动态管理——海籍管理——海籍历史资料管理******开始************/

	//海籍历史资料管理：海籍历史资料的收集、整理和保存，
	//包括海籍历史文档（多媒体信息、文件、图册等资料）管理。
	 
	
	//复用用海项目信息管理

	/**
	 * 
	Description :用海项目信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:18:23
	 */
	public String fetchYhxm(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		
		yhxmList = businessService.fetchYhxmList(pageBean, hysyywHysydtYhxm, userId, userRoleName);
		return "hjglIndex";
	}

	/**
	 * 
	Description :海籍-文件信息
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-17 上午11:13:38
	 */
	public String fetchFileList(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		fileList=seaRecordService.fetchFileList(pageBean, searchForm, userId, userRoleName);
		
		return "hjglIndex2";
	}
	/**
	 * 
	Description :项目附件详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-17 下午03:00:41
	 */
	public String fetchFileDetail(){
		System.out.println("xmfjID="+xmfjID);
		hysyywHysydtYhxmXmfj=seaRecordService.fetchXmfjDetail(xmfjID);
		return "hjglIndex2Detail";
	}
	
	
	/**
	 * 
	Description :海籍-图片信息
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-17 上午11:14:10
	 */
	public String fetchImgList(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(5);
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		imgList=seaRecordService.fetchZpList(pageBean, searchForm, userId, userRoleName);
		
		return "hjglIndex3";
	}
		
	/********海域使用动态管理——海籍管理——海籍综合分析******开始************/

	//海籍综合分析：提供对海籍面积、分布、使用状况的统计和分析。
	
	/**
	 * 
	Description :海籍综合分析
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-23 下午05:58:33
	 */
	public String fetchHjzhfx(){
		System.out.println("海域使用统计数据");
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		hysytjData_x="";
		hysytjData_y="";
		
		if(tjfxForm != null && tjfxForm.getTjfs() != null && !tjfxForm.getTjfs().equals("") 
				&& tjfxForm.getTjys() != null && !tjfxForm.getTjys().equals("")
				&& tjfxForm.getZsfs() != null && !tjfxForm.getZsfs().equals("")){
			
		}else{
			System.out.println("塞默认值");
			tjfxForm.setTjfs("按用海批准年份");
			tjfxForm.setTjys("宗海面积");
			tjfxForm.setZsfs("柱状图");
		}
		
		List<?> tjList = seaRecordService.fetchHjzhfx(tjfxForm);
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					hysytjData_x += obj[0].toString() + "";
					hysytjData_y += obj[1].toString() + "";
				}else{
					hysytjData_x += obj[0].toString() + ",";
					hysytjData_y += obj[1].toString() + ",";
				}
			}
		}
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		
		System.out.println("hysytjData_x="+hysytjData_x);
		System.out.println("hysytjData_y="+hysytjData_y);
		
		//jldw
		if(tjfxForm.getTjys().equals("证书数量") || tjfxForm.getTjys().equals("用海项目数量")){
			jldw="个";
		}
		if(tjfxForm.getTjys().equals("宗海面积")){
			jldw="公顷";
		}
		if(tjfxForm.getTjys().equals("海域使用金应征收总额") || tjfxForm.getTjys().equals("海域使用金实际征收总额")){
			jldw="元";
		}
		if(tjfxForm.getTjys().equals("占用岸线")){
			jldw="米";
		}
		
		if(tjfxForm.getZsfs().equals("柱状图")){
			return "goHjzhfx";
		}else if(tjfxForm.getZsfs().equals("折线图")){
			return "goHjzhfx2";
		}else if(tjfxForm.getZsfs().equals("饼状图")){
			return "goHjzhfx3";
		}else{
			//默认柱状图
			return "goHjzhfx";
		}
	}
	//=========================视频监视-智能视频分析开始=========================================
	public String znspfx_maintop(){
		//与船只检测服务断开连接(結束時只需要調用一次 )
		ShipAction.breakConnection();	
		System.out.println("znspfx_maintop"+"连接");
		//与船只检测服务建立连接(只需要調用一次 )
		ShipAction.getConnection();
		//session.put("cbjc", "cbjc_on");		
		System.out.println("进入智能分析界面");
		return "goznspfx_maptop";
	}
	public String  znspfx(){
		//与船只检测服务断开连接(結束時只需要調用一次 )
		ShipAction.breakConnection();
		System.out.println("znspfx"+"连接");
		//与船只检测服务建立连接(只需要調用一次 )
		ShipAction.getConnection();
		//session.put("cbjc", "cbjc_on");		
		System.out.println("进入智能分析界面");
		return "goznspfx";
	}
	/**
	 * 退出智能视频分析
	 */
	public void exitznspfx(){
		//与船只检测服务断开连接(結束時只需要調用一次 )
		ShipAction.breakConnection();	
	}
	/***
	 * 获取船只列表
	 * 
	 * @return
	 */
	public void getShip(){
		//异步获取船只列表
		ArrayList<Ship> ships_test= ShipAction.getShipList();
		HttpServletResponse response=this.getHttpServletResponse();		 
		response.setContentType("text/plain;charset=utf-8");		
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}	
		JsonConfig config=new JsonConfig();
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);  //自动为我排除circle
		JSONArray arr=JSONArray.fromObject(ships_test,config);
		System.out.println("船信息："+arr);
		out.print(arr.toString());		
		out.flush();		
		//return null;
	}
	/***
	 * 获取全景图
	 * @return
	 */
	public void getFullImage(){
		String path=ServletActionContext.getServletContext().getRealPath("/files");
		System.out.println("路径"+path);
		//String path1 = "C:/hydg/yhxm/Panorama.png";
		ShipAction.getPanorama(cam,path);
	}
	/**
	 * 发送船只编号，开始追踪
	 * @return
	 */
	public void start_track(){
		System.out.println("摄像头编号" + camera_num +",从前台得到船只编号" + number);
		//int number=0;//从前台获取到的前台编号，直接传入参数（这行代码为测试行）
		ShipAction.start_Track(camera_num,number);
	}
	/**
	 * 停止追踪
	 * @return
	 */
	public void stop_track(){
		System.out.print(camera);
		ShipAction.stop_Track(camera);
	}
	//=========================视频监视-智能视频分析结束=========================================
	public IBusinessService getBusinessService() {
		return businessService;
	}
	public void setBusinessService(IBusinessService businessService) {
		this.businessService = businessService;
	}
	
	public ISeaRecordService getSeaRecordService() {
		return seaRecordService;
	}
	public void setSeaRecordService(ISeaRecordService seaRecordService) {
		this.seaRecordService = seaRecordService;
	}
	public TjfxForm getTjfxForm() {
		return tjfxForm;
	}
	public void setTjfxForm(TjfxForm tjfxForm) {
		this.tjfxForm = tjfxForm;
	}
	public List<?> getEwjcbList() {
		return ewjcbList;
	}
	public void setEwjcbList(List<?> ewjcbList) {
		this.ewjcbList = ewjcbList;
	}
	public List<?> getTjbList() {
		return tjbList;
	}
	public void setTjbList(List<?> tjbList) {
		this.tjbList = tjbList;
	}
	public String getHysytjData_x() {
		return hysytjData_x;
	}
	public void setHysytjData_x(String hysytjDataX) {
		hysytjData_x = hysytjDataX;
	}
	public String getHysytjData_y() {
		return hysytjData_y;
	}
	public void setHysytjData_y(String hysytjDataY) {
		hysytjData_y = hysytjDataY;
	}
	public String getHysytjData_y2() {
		return hysytjData_y2;
	}
	public void setHysytjData_y2(String hysytjDataY2) {
		hysytjData_y2 = hysytjDataY2;
	}
	public String getJldw() {
		return jldw;
	}
	public void setJldw(String jldw) {
		this.jldw = jldw;
	}

	public SearchForm getSearchForm() {
		return searchForm;
	}

	public void setSearchForm(SearchForm searchForm) {
		this.searchForm = searchForm;
	}

	public List<?> getFileList() {
		return fileList;
	}
	public void setFileList(List<?> fileList) {
		this.fileList = fileList;
	}
	public List<?> getImgList() {
		return imgList;
	}
	public void setImgList(List<?> imgList) {
		this.imgList = imgList;
	}
	public THysyywHysydtYhxmXmfj getHysyywHysydtYhxmXmfj() {
		return hysyywHysydtYhxmXmfj;
	}
	public void setHysyywHysydtYhxmXmfj(THysyywHysydtYhxmXmfj hysyywHysydtYhxmXmfj) {
		this.hysyywHysydtYhxmXmfj = hysyywHysydtYhxmXmfj;
	}
	public String getXmfjID() {
		return xmfjID;
	}
	public void setXmfjID(String xmfjID) {
		this.xmfjID = xmfjID;
	}

	public THysyywHysydtYhxm getHysyywHysydtYhxm() {
		return hysyywHysydtYhxm;
	}

	public void setHysyywHysydtYhxm(THysyywHysydtYhxm hysyywHysydtYhxm) {
		this.hysyywHysydtYhxm = hysyywHysydtYhxm;
	}

	public List<?> getYhxmList() {
		return yhxmList;
	}

	public void setYhxmList(List<?> yhxmList) {
		this.yhxmList = yhxmList;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	public String getCamera_num() {
		return camera_num;
	}

	public void setCamera_num(String camera_num) {
		this.camera_num = camera_num;
	}
	
	public String getCamera() {
		return camera;
	}

	public void setCamera(String camera) {
		this.camera = camera;
	}
	public String getCam() {
		return cam;
	}

	public void setCam(String cam) {
		this.cam = cam;
	}
	
}
