package com.htcf.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.Dictionary;
import com.htcf.entity.THysyywHysydtYhxm;
import com.htcf.entity.THysyywHysydtYhxmForm;
import com.htcf.entity.THysyywHysydtYhxmHysyj;
import com.htcf.entity.THysyywHysydtYhxmXmfj;
import com.htcf.entity.THysyywHysydtYhxmYhfs;
import com.htcf.entity.THysyywHysydtYhxmYhfsJzd;
import com.htcf.entity.THysyywHysydtYhxmZht;
import com.htcf.entity.THysyywHysydtYhxmZhxx;
import com.htcf.entity.THysyywHysydtYhxmphjgDt;
import com.htcf.entity.THysyywHysydtYhxmphjgDtForm;
import com.htcf.entity.THysyywHysydtYhxmphjgDtfj;
import com.htcf.entity.THysyywHysydtYhxmphjgDtjzd;
import com.htcf.entity.THysyywHysydtYhxmphjgYj;
import com.htcf.entity.THysyywHysydtYhxmphjgYjForm;
import com.htcf.entity.User;
import com.htcf.service.IBusinessService;
import com.htcf.service.ISeaUseGoldService;
/**
 * 海域使用动态管理——用海项目信息管理、用海项目批后监管
 * @author yinying
 *
 */
@Controller("businessAction")
@Scope("prototype")
public class BusinessAction extends BaseAction{
	@Autowired
	private IBusinessService businessService;
	
	@Autowired
	private ISeaUseGoldService seaUseGoldService;

	//实体
	private THysyywHysydtYhxm hysyywHysydtYhxm = new THysyywHysydtYhxm();
	private THysyywHysydtYhxmXmfj hysyywHysydtYhxmXmfj = new THysyywHysydtYhxmXmfj();
	private THysyywHysydtYhxmXmfj hysyywHysydtYhxmXmfjU = new THysyywHysydtYhxmXmfj();
	private THysyywHysydtYhxmZhxx hysyywHysydtYhxmZsxx = new THysyywHysydtYhxmZhxx();
	private THysyywHysydtYhxmYhfs hysyywHysydtYhxmYhfs = new THysyywHysydtYhxmYhfs();
	private THysyywHysydtYhxmYhfsJzd hysyywHysydtYhxmYhfsJzd = new THysyywHysydtYhxmYhfsJzd();
	private THysyywHysydtYhxmHysyj hysyywHysydtYhxmHysyj = new THysyywHysydtYhxmHysyj();
	private THysyywHysydtYhxmphjgDt hysyywHysydtYhxmphjgDt = new THysyywHysydtYhxmphjgDt();
	private THysyywHysydtYhxmZht hysyywHysydtYhxmZht = new THysyywHysydtYhxmZht();
	private THysyywHysydtYhxmForm hysyywHysydtYhxmForm = new THysyywHysydtYhxmForm();
	private Dictionary dictionary = new Dictionary();
	private THysyywHysydtYhxmphjgYj hysyywHysydtYhxmphjgYj = new THysyywHysydtYhxmphjgYj();
	private THysyywHysydtYhxmphjgDtForm hysyywHysydtYhxmphjgDtForm = new THysyywHysydtYhxmphjgDtForm();
	private THysyywHysydtYhxmphjgDtfj hysyywHysydtYhxmphjgDtfj = new THysyywHysydtYhxmphjgDtfj();
	
	//List
	private List<?> yhxmList;//用海项目
	private List<?> yhxmfjList;//附件
	private List<?> yhxmzsxxList;//证书信息
	private List<?> yhxmsyjList;//海域使用金
	private List<?> yhxmyhfsList;//用海方式
	private List<?> yhxmyhfsjzdList;//用海方式界址点坐标
	private List<?> yhxmzhtList;//宗海图
	private List<?> yhxmsqclList;//申请材料
	private List<?> zsxxList;
	
	private List<?> phjgDtglList;//批后监管-动态管理
	private List<?> phjgDtglList1;
	private List<?> phjgDtglList2;
	private List<?> phjgDtglList3;
	private List<?> phjgDtglList4;
	
	private List<?> phjgBhyjList;
	
	//变量
	private String xmID;//项目ID
	private String zsID;//证书ID
	private String hysyjID;//海域使用金ID
	private String yhfsID;//用海方式ID
	private String jzdID;//界址点ID
	private String xmfjID;//项目附件ID
	private String dtglID;//动态管理ID
	private String zhtID;//宗海图ID
	private String zhttype;//宗海图
	private String dtdwID;//地图定位
	private String bhyjID;//变化预警ID
	private String dtglFjID;//动态管理附件ID
	
	private File upload;
	private String uploadFileName;// 文件名
	private String uploadContentType; // 上传的文件类型
	
	private File uploadJzt;
	private String uploadJztFileName;// 文件名
	private String uploadJztContentType; // 上传的文件类型
	
	private String fileName;
	private String filePath;
	//下载文件原始存放路径  
    private final static String dowloadPath_xmfj="C:/hydg/yhxm/";
    
    private String[] jzdXh;
    private String[] jzdJd;
    private String[] jzdWd;
    
    private String jgfs;//监管方式
    private String jgXmmc;//监管项目名称
    private String yhlxa;//用海类型A
    private int xmzsCount;//项目证书数量
    private int zsCount;//证书数量
    
    private InputStream inputStream;	
    
	/*************海域使用动态管理——用海项目信息管理******开始*************************/
	
    
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
		return "yhxmJsp";
	}
	
	/**
	 * 
	Description :用海项目信息：用于返回
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:18:23
	 */
	public String fetchYhxmBack(){
		hysyywHysydtYhxm = null;
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
		yhxmList = businessService.fetchYhxmList(pageBean, hysyywHysydtYhxm,userId, userRoleName);
		return "yhxmJsp";
	}
	
	/**
	 * 
	Description :用海项目详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:37:38
	 */
	public String fetchYhxmDetaile(){
		System.out.println("xmID="+xmID);
		//项目信息
		hysyywHysydtYhxm = businessService.fetchYhxmDetail(xmID);
		//项目附件列表
		yhxmfjList = businessService.fetchYhxmXmfj(xmID,"");
		//宗海信息详情
		yhxmzsxxList = businessService.fetchYhxmZsxx(xmID);
		
		session.put("yhxmmc", hysyywHysydtYhxm.getYhxmmc());
		
		return "yhxmDetail";
	}
	
	/**
	 * 
	Description :异步获取用海项目详情
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-2-26 下午04:38:36
	 */
	public void getYhxmDetail(){
		System.out.println("xmID"+xmID);
		
		List<?> yhxmDetailList = businessService.fetchYhxmDetailJson(xmID);
		
		//展示项目简项信息：0-8
		//id 主键，yhxmmc 用海项目名称，xmwz 项目位置，yhzmj 用海总面积，mjdw 面积单位，
		//hydb 海域等别，slrq 受理日期，yhpzrq 用海批准日期，hysyqr 海域使用权人

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
		JSONArray arr=JSONArray.fromObject(yhxmDetailList,config);
		out.print(arr.toString());		
		out.flush();		
		//return null;
	}
	
	/**
	 * 
	Description :用海项目删除
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:35:56
	 */
	public String deleteYhxm(){
		System.out.println("xmID="+xmID);
		businessService.deleteYhxm(xmID);
		//重定向
		return "goXmxxIndex";
	}
	
	
	
	/**
	 * 
	Description :宗海信息详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-16 下午12:12:39
	 */
	public String fetchZhxxDetail(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		//证书信息详情
		hysyywHysydtYhxmZsxx = businessService.fetchYhxmZsxxDetail(xmID, zsID);
		
		//用海方式列表
		yhxmyhfsList = businessService.fetchYhxmYhfs(xmID, zsID);
		
		//界址点坐标列表
		yhxmyhfsjzdList = businessService.fetchYhxmYhfsJzdzb(xmID, zsID);

		//项目信息
		zsxxList = seaUseGoldService.fetchJnmxZsxx(xmID, zsID);
		
		//海域使用金列表
		yhxmsyjList = businessService.fetchYhxmHysyj(xmID, zsID);
		
		//宗海图详情
		yhxmzhtList = businessService.fetchYhxmZht(xmID, zsID);
		
		//申请材料详情
		yhxmsqclList = businessService.fetchYhxmXmfj(xmID,zsID);
		
		//地图定位详情【GIS】
		
		return "yhxmZhxxDetail";
	}
	
	/**
	 * 
	Description :根据海域管理号
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-25 下午03:38:04
	 */
	public String fetchZhxxDetailByHyglh(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		//证书信息详情
		hysyywHysydtYhxmZsxx = businessService.fetchYhxmZsxxDetail(xmID, zsID);
		
		//用海方式列表
		yhxmyhfsList = businessService.fetchYhxmYhfs(xmID, zsID);
		
		//界址点坐标列表
		yhxmyhfsjzdList = businessService.fetchYhxmYhfsJzdzb(xmID, zsID);

		//项目信息
		zsxxList = seaUseGoldService.fetchJnmxZsxx(xmID, zsID);
		
		//海域使用金列表
		yhxmsyjList = businessService.fetchYhxmHysyj(xmID, zsID);
		
		//宗海图详情
		yhxmzhtList = businessService.fetchYhxmZht(xmID, zsID);
		
		//申请材料详情
		yhxmsqclList = businessService.fetchYhxmXmfj(xmID,zsID);
		
		//地图定位详情【GIS】
		
		return "yhxmZhxxDetail";
	}
	
	/**
	 * 
	Description :用海方式详情-未用
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午02:17:30
	 */
	public String fetchYhfsDetail(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",hysyjID="+hysyjID);
		hysyywHysydtYhxmYhfs= businessService.fetchYhxmYhfsDetail(xmID, zsID, yhfsID);
		return "";
	}
	
	/**
	 * 
	Description :海域使用金详情-未用
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午02:17:30
	 */
	public String fetchHysyjDetail(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",hysyjID="+hysyjID);
		hysyywHysydtYhxmHysyj = businessService.fetchYhxmHysyjDetail(xmID, zsID, hysyjID);
		return "";
	}
	
	
	/**
	 * 
	Description :用海项目基本信息保存
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午07:18:54
	 */
	public String addYhxm(){
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxm.setAddtime(xzsj);
		hysyywHysydtYhxm.setLastupdatetime(xzsj);
		hysyywHysydtYhxm.setAddusername(userXm);
		hysyywHysydtYhxm.setAdduserid(userId);
		hysyywHysydtYhxm.setZt("1");//新增
		businessService.addObject(hysyywHysydtYhxm);
		//查出主键
		String tablename="t_hysyyw_hysydt_yhxm";
		xmID = businessService.fetchYhxmID(tablename,xzsj, userId);
		
		return "goAddSuccess";
	}
	
	/**
	 * 
	Description :保存成功返回原页面
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午07:25:05
	 */
	public String addYhxmSuccess(){
		System.out.println("xmID="+xmID);
		//项目信息
		hysyywHysydtYhxm = businessService.fetchYhxmDetail(xmID);
		
		//判断页面显示是否有值的
		//项目附件列表
		yhxmfjList = businessService.fetchYhxmXmfj(xmID,"");
		//宗海信息详情
		yhxmzsxxList = businessService.fetchYhxmZsxx(xmID);
		
		return "addYhxmSuccess";
	}

	/**
	 * 
	Description :获取需要修改的信息的详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:38:43
	 */
	public String getYhxmDetaile(){
		System.out.println("xmID="+xmID);
		hysyywHysydtYhxm = businessService.fetchYhxmDetail(xmID);
		session.put("yhxmmc", hysyywHysydtYhxm.getYhxmmc());
		session.put("zssl", hysyywHysydtYhxm.getZssl());
		
		//判断页面显示是否有值的
		//项目附件列表
		yhxmfjList = businessService.fetchYhxmXmfj(xmID,"");
		//宗海信息详情
		yhxmzsxxList = businessService.fetchYhxmZsxx(xmID);
		
		return "addYhxmSuccess";
//		return "yhxmJsp";
	}
	
	/**
	 * 
	Description :修改项目信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-15 下午07:40:31
	 */
	public String updateYhxm(){
		System.out.println("xmID="+xmID);
		System.out.println("hysyywHysydtYhxm.getId()="+hysyywHysydtYhxm.getId());
		hysyywHysydtYhxm.setLastupdatetime(this.getDateTime());
		businessService.updateYhxm(hysyywHysydtYhxm);
		//重定向
		return "goAddSuccess";
	}
	/**
	 * 
	Description :新增项目附件页面
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午07:56:30
	 */
	public String addYhxmFj(){
		System.out.println("xmID="+xmID);
		//项目附件列表
		yhxmfjList = businessService.fetchYhxmXmfj(xmID,"");
		
		//判断页面显示是否有值的
		//宗海信息详情
		yhxmzsxxList = businessService.fetchYhxmZsxx(xmID);
		return "addYhxmFj";
	}
	
	/**
	 * 
	Description :保存用海项目附件
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午08:15:31
	 */
	public String saveYhxmFj(){
		System.out.println("xmID="+xmID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmXmfj.setAddtime(xzsj);
		hysyywHysydtYhxmXmfj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmXmfj.setAddusername(userXm);
		hysyywHysydtYhxmXmfj.setAdduserid(userId);
		hysyywHysydtYhxmXmfj.setScr(userXm);
		hysyywHysydtYhxmXmfj.setScsj(xzsj);
		//附件、文件类型、文件大小
		String realPath = "C:/hydg/yhxm";
		String path=uploadExcel(realPath,xmID);//上传
		hysyywHysydtYhxmXmfj.setFj(uploadFileName);
		
		
		//文件类型、大小重新获取
		hysyywHysydtYhxmXmfj.setWjlx(uploadContentType);
		
		Long len = upload.length();//字节
		System.out.println("len="+len);
		double filesize = (double)len/1024;
		
		System.out.println("len="+len+",filesize="+filesize);
		
		//保留2位小数
//		//方法一
//		DecimalFormat df = new DecimalFormat(".00");
//		System.out.println(df.format(filesize));
//		
//		//方法二
//		System.out.println(String.format("%.2f",filesize));
//		//方法三
//		BigDecimal bg = new BigDecimal(filesize);
//		double b3 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
//		System.out.println(b3);
		
		//方法四
		NumberFormat nf = NumberFormat.getNumberInstance();
		nf.setMaximumFractionDigits(2);
		String size = nf.format(filesize);
		System.out.println(nf.format(filesize));

		hysyywHysydtYhxmXmfj.setWjdx(size);
		hysyywHysydtYhxmXmfj.setFjlj(path);
		businessService.addObject(hysyywHysydtYhxmXmfj);

//		//查出主键
//		String tablename="T_HYSYYW_HYSYDT_YHXM_XMFJ";
//		xmfjID = businessService.fetchYhxmID(tablename,xzsj, userId);
		
		return "goAddFjSuccess";
	}
	
	/**
	 * 
	Description :判断文件的大小
	@param:@param file
	@param:@param size 限制大小
	@param:@param unit
	@param:@return
	@return:boolean
	@throws
	@Author：yinying
	@Create 2018-1-25 下午03:38:55
	 */
	public boolean checkFileSize(File file,int size,String unit){
		long len = file.length();
		double fileSize = 0;
		if("B".equals(unit.toUpperCase())){
			fileSize = (double)len;
		}else if("K".equals(unit.toUpperCase())){
			fileSize = (double)len/1024;
		}else if("M".equals(unit.toUpperCase())){
			fileSize = (double)len/1048576;
		}else if("G".equals(unit.toUpperCase())){
			fileSize = (double)len/1073741824;
		}
		
		if(fileSize > size){
			return false;
		}
		return true;
	}
	
	/**
	 * 
	Description :删除附件
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午04:47:26
	 */
	public String deleteYhxmFj(){
		System.out.println("xmID="+xmID+",xmfjID="+xmfjID);
		businessService.deleteYhxmFj(xmfjID);
		//重定向
		return "goAddFjSuccess";
	}
	
	/**
	 * 
	Description :下载项目附件
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午05:32:23
	 */
	public String downLoadXmfj(){
		System.out.println("fileName="+fileName+",xmID="+xmID);
		return "downLoadXmfj";
	}
	public InputStream getDownLoadFileXmfj(){
		System.out.println("进入getDownloadFile.....");
//   		System.out.println(dowloadPath_xmfj);
//   		System.out.println(fileName);
//   		System.out.println(dowloadPath_xmfj+xmID+"/"+fileName);
   		filePath = dowloadPath_xmfj+xmID+"/"+fileName;
   		System.out.println("filePath="+filePath);
   		FileInputStream fis =null;
		try {
//			fis = new FileInputStream(dowloadPath_xmfj+fileName);
			fis = new FileInputStream(filePath);
		} catch (FileNotFoundException e) {	
			System.out.println("找不到该文件。");			
			e.printStackTrace();
		}
		return fis; 
	}
	
	/**
	 * 
	Description :如果下载文件名为中文，进行字符编码转换
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午05:33:31
	 */
    public String getDownloadChineseFile() {  
        String downloadChineseFileName = fileName;  
        System.out.println("文件名："+ fileName);
        try {  
            downloadChineseFileName = new String(downloadChineseFileName.getBytes(), "ISO8859-1");  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }  
        return downloadChineseFileName;          
    }  
	
    /**
     * 
    Description :修改项目附件信息
    @param
    @return
    @throws
    @Author：yinying
    @Create 2017-8-24 下午06:56:35
     */
    public String updateYhxmFj(){
		System.out.println("xmID="+xmID+",附件ID="+hysyywHysydtYhxmXmfjU.getId());
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmXmfjU.setLastupdatetime(xzsj);
		if(uploadFileName != null && !uploadFileName.equals("")){
			//附件、文件类型、文件大小
			String realPath = "C:/hydg/yhxm";
			String path=uploadExcel(realPath,xmID);//上传
			hysyywHysydtYhxmXmfjU.setFj(uploadFileName);
			//文件类型、大小重新获取
			hysyywHysydtYhxmXmfjU.setWjlx(uploadContentType);
			
			Long len = upload.length();//字节
			System.out.println("len="+len);
			double filesize = (double)len/1024;
			
			System.out.println("len="+len+",filesize="+filesize);

			NumberFormat nf = NumberFormat.getNumberInstance();
			nf.setMaximumFractionDigits(2);
			String size = nf.format(filesize);
			System.out.println(nf.format(filesize));

			hysyywHysydtYhxmXmfjU.setWjdx(size);
			hysyywHysydtYhxmXmfjU.setFjlj(path);
		}

		businessService.updateObject(hysyywHysydtYhxmXmfjU);

		return "goAddFjSuccess";
	}
	
	/**
	 * 
	Description :新增宗海信息页面
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午07:59:14
	 */
	public String addYhxmZhxx(){
		System.out.println("xmID="+xmID);
		//宗海信息
		yhxmzsxxList = businessService.fetchYhxmZsxx(xmID);
		zsCount=0;
		if(yhxmzsxxList != null && yhxmzsxxList.size()!=0 ){
			zsCount = yhxmzsxxList.size();
		}
		//查出应新增的证书数量
		xmzsCount = businessService.fetchXmzsCount(xmID);
		
		//判断页面显示是否有值的
		//项目附件列表
		yhxmfjList = businessService.fetchYhxmXmfj(xmID,"");
		return "addYhxmZhxx";
	}

	/**
	 * 
	Description :到新增宗海页面
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午07:46:30
	 */
	public String goZhxxadd(){
		System.out.println("xmID="+xmID);
		//查出项目信息
		yhxmList = businessService.fetchXmxx(xmID);
		return "goZhxxadd";
	}
	
	/**
	 * 
	Description :保存证书信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午07:59:51
	 */
	public String saveZhxx(){
		System.out.println("xmID="+xmID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmZsxx.setAddtime(xzsj);
		hysyywHysydtYhxmZsxx.setLastupdatetime(xzsj);
		hysyywHysydtYhxmZsxx.setAddusername(userXm);
//		hysyywHysydtYhxmZsxx.setSqr(userXm);
		hysyywHysydtYhxmZsxx.setAdduserid(userId);
		hysyywHysydtYhxmZsxx.setMjdw("3");
		System.out.println("审核人="+hysyywHysydtYhxmZsxx.getShrxm());
		
		businessService.addObject(hysyywHysydtYhxmZsxx);

		//查出主键
		String tablename="T_HYSYYW_HYSYDT_YHXM_ZHXX";
		zsID = businessService.fetchYhxmID(tablename,xzsj, userId);
		System.out.println("查出主键zsID="+zsID);
		return "goAddZhxxSuccessS";
	}

	/**
	 * 
	Description :新增、修改宗海信息成功
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午02:39:04
	 */
	public String addYhxmZhxxSuccess(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		//宗海信息
		yhxmzsxxList = businessService.fetchYhxmZsxx(xmID);
		zsCount=0;
		if(yhxmzsxxList != null && yhxmzsxxList.size()!=0 ){
			zsCount = yhxmzsxxList.size();
		}
		//查出应新增的证书数量
		xmzsCount = businessService.fetchXmzsCount(xmID);
		
		//判断页面显示是否有值的
		//项目附件列表
		yhxmfjList = businessService.fetchYhxmXmfj(xmID,"");
		return "addYhxmZhxxS";
	}
	
	/**
	 * 
	Description :修改宗海信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午08:08:14
	 */
	public String getUpdateZhxx(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		//证书信息详情
		hysyywHysydtYhxmZsxx = businessService.fetchYhxmZsxxDetail(xmID, zsID);
		
		//判断
		//用海方式列表
		yhxmyhfsList = businessService.fetchYhxmYhfs(xmID, zsID);
		
		//海域使用金列表
		yhxmsyjList = businessService.fetchYhxmHysyj(xmID, zsID);
		
		//宗海图详情
		yhxmzhtList = businessService.fetchYhxmZht(xmID, zsID);
		
		//申请材料详情
		yhxmsqclList = businessService.fetchYhxmXmfj(xmID,zsID);
		
		//界址点坐标
		yhxmyhfsjzdList = businessService.fetchYhxmYhfsJzdzb(xmID, zsID);
		
		
		return "goZhxxUpdate";
	}
	
	/**
	 * 
	Description :修改宗海信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午08:13:39
	 */
	public String updateZhxx(){
		System.out.println("xmID="+xmID+",zsID="+hysyywHysydtYhxmZsxx.getId());
		System.out.println("审核人="+hysyywHysydtYhxmZsxx.getShrxm());
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmZsxx.setLastupdatetime(xzsj);
		hysyywHysydtYhxmZsxx.setMjdw("3");
		businessService.updateObject(hysyywHysydtYhxmZsxx);
		return "goAddZhxxSuccessS";
	}
	
	/**
	 * 
	Description :删除宗海信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午08:10:03
	 */
	public String deleteZhxx(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		businessService.deleteYhxmZhxx(zsID);
		return "goAddZhxxSuccess";
	}
	
	/**
	 * 
	Description :用海方式新增、修改、删除
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午05:02:39
	 */
	public String fetchYhfs(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		//用海方式列表
		yhxmyhfsList = businessService.fetchYhxmYhfs(xmID, zsID);
		
		//判断
		//界址点坐标列表
		yhxmyhfsjzdList = businessService.fetchYhxmYhfsJzdzb(xmID, zsID);

		//海域使用金列表
		yhxmsyjList = businessService.fetchYhxmHysyj(xmID, zsID);
		
		//宗海图详情
		yhxmzhtList = businessService.fetchYhxmZht(xmID, zsID);
		
		//申请材料详情
		yhxmsqclList = businessService.fetchYhxmXmfj(xmID,zsID);
		return "goZhxxUpdate2";
	}
	
	/**
	 * 
	Description :异步获取用海方式-界址点
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-23 下午06:18:37
	 */
	public void getYhfsJzd(){
		System.out.println("xmID="+xmID+",zsID="+zsID);

		//界址点坐标列表
		yhxmyhfsjzdList = businessService.fetchYhxmYhfsJzdzb(xmID, zsID);
		
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
		JSONArray arr=JSONArray.fromObject(yhxmyhfsjzdList,config);
		out.print(arr.toString());		
		out.flush();		
		//return null;
	}
	
	/**
	 * 
	Description :异步获取用海方式-界址点——所有
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-2-2 下午03:28:16
	 */
	public void getYhxmJzd(){
		//界址点坐标列表
		yhxmyhfsjzdList = businessService.fetchYhxmJzdzb();
		
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
		JSONArray arr=JSONArray.fromObject(yhxmyhfsjzdList,config);
		out.print(arr.toString());		
		out.flush();		
		//return null;
	}
	
	
	
	
	
	/**
	 * 
	Description :保存用海方式
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午05:04:57
	 */
	public String addYhfs(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmYhfs.setAddtime(xzsj);
		hysyywHysydtYhxmYhfs.setLastupdatetime(xzsj);
		hysyywHysydtYhxmYhfs.setAddusername(userXm);
		hysyywHysydtYhxmYhfs.setAdduserid(userId);
		hysyywHysydtYhxmYhfs.setXmid(Long.parseLong(xmID));
		hysyywHysydtYhxmYhfs.setZsid(Long.parseLong(zsID));
		businessService.addObject(hysyywHysydtYhxmYhfs);
		return "addYhfsSuccess";
	}
	/**
	 * 
	Description :修改用海方式
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午05:20:24
	 */
	public String updateYhxmYhfs(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",yhfsID="+hysyywHysydtYhxmYhfs.getId());
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmYhfs.setLastupdatetime(xzsj);
		businessService.updateObject(hysyywHysydtYhxmYhfs);
		return "addYhfsSuccess";
	}
	/**
	 * 
	Description :删除用海方式
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午05:22:50
	 */
	public String deleteYhxmYhfs(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",yhfsID="+yhfsID);
		businessService.deleteYhxmYhfs(yhfsID);
		return "addYhfsSuccess";
	}
	
	
	/**
	 * 
	Description :保存界址点坐标
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:26:23
	 */
	public String saveJzdzb(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		System.out.println("jzdXh="+jzdXh+",jzdJd="+jzdJd+",jzdWd="+jzdWd);
		//删除已有的
		businessService.deleteYhxmJzdzb(xmID,zsID);
		
		
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		int nn=1;
		for(int i = 0;i<jzdXh.length;i++){
			THysyywHysydtYhxmYhfsJzd hysyywHysydtYhxmYhfsJzd = new THysyywHysydtYhxmYhfsJzd();
			hysyywHysydtYhxmYhfsJzd.setAddtime(xzsj);
			hysyywHysydtYhxmYhfsJzd.setLastupdatetime(xzsj);
			hysyywHysydtYhxmYhfsJzd.setAddusername(userXm);
			hysyywHysydtYhxmYhfsJzd.setAdduserid(userId);
			hysyywHysydtYhxmYhfsJzd.setXmid(Long.parseLong(xmID));
			hysyywHysydtYhxmYhfsJzd.setZsid(Long.parseLong(zsID));
			hysyywHysydtYhxmYhfsJzd.setXh(jzdXh[i]);
			hysyywHysydtYhxmYhfsJzd.setJd(jzdJd[i]);
			hysyywHysydtYhxmYhfsJzd.setWd(jzdWd[i]);
			hysyywHysydtYhxmYhfsJzd.setXssx(Long.parseLong(nn+""));
			businessService.addObject(hysyywHysydtYhxmYhfsJzd);
			nn++;
		}
		return "addYhfsSuccess";
	}

	/**
	 * 
	Description :删除界址点
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-28 下午07:45:52
	 */
	public String deleteYhxmJdzzb(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",jzdID="+jzdID);
		businessService.deleteYhxmJzdzb(jzdID);
		return "addYhfsSuccess";
	}
	
	/**
	 * 
	Description :下载模板
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-22 下午03:20:53
	 */
	public String downLoadYhfsJzdmb(){
		System.out.println("下载用海方式界址点坐标上传模板.....");
		fileName="用海方式界址点坐标上传模板.xls";
		return "downLoadYhfsJzdmb";
	}
	public InputStream getDownLoadFileYhfsJzdmb(){
		System.out.println("进入getDownloadFile.....");
	    System.out.println(ServletActionContext.getServletContext().getResourceAsStream("/files/"+fileName));
	   	//FileInputStream fis=ServletActionContext.getServletContext().getResourceAsStream("/hcbdmb/"+fileName);		 
		return ServletActionContext.getServletContext().getResourceAsStream("/files/"+fileName);
	}
	
	/**
	 * 
	Description :上传用海方式的界址点
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-22 下午04:46:13
	 */
	public String  uploadYhfsJzdData(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		System.out.println("进入到上传数据表界面");
		String path=uploadExcel();
		System.out.println("path-------="+path);
		System.out.println("我想得到的path======"+uploadFileName);
		try{
			String flag=insertData(path);
			message=flag;
		}catch(Exception e){
			e.printStackTrace();
			message = "上传失败"+","+" ";
			//message = "上传失败"+"+"+"";
		}
		System.out.println(message+"============");
		
		return "addYhfsSuccess";
	}
	//解析上传的EXCEL
	public String insertData(String path) {
		System.out.println("xmID="+xmID+",zsID="+zsID);
		System.out.println("++path+"+path+"++upload+++"+upload);
		System.out.println("文件名+++====="+uploadFileName);
		String yyMessage="";

		
		String userName = "";
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		
		LoadExcel le = new LoadExcel();
		Workbook workbook = le.getExcel(path); // path路径名
		Sheet[] tables = workbook.getSheets();
		
		THysyywHysydtYhxmYhfsJzd hysyywHysydtYhxmYhfsJzd = null;
		int tSize = tables.length;
		Sheet sheet = le.getSheet(workbook, 0);
		int row = sheet.getRows();// 表行
		int columns = sheet.getColumns();// 表列	
		System.out.println(path);
		System.out.println("colu mns列数："+columns);
			
		if (columns == 3) {// 读内容				
			List<Object> jzdList = new ArrayList();
				
			try{
				for (int i = 1; i < row; i++){ // 循环一张表的行					
					hysyywHysydtYhxmYhfsJzd = new THysyywHysydtYhxmYhfsJzd();
					Cell[] cell = le.readLine(sheet, i);			
					int cellLength = cell.length;
					System.out.println("cellLength="+cellLength);
//					System.out.println("000="+cell[0].getContents());
//					System.out.println("111="+cell[1].getContents());
//					System.out.println("222="+cell[2].getContents());
					String xh = cell[0].getContents().trim();
					String wd = cell[1].getContents().trim();
					String jd = cell[2].getContents().trim();
					
					if(cellLength>=1){
						if( !"".equals(cell[0].getContents().trim()) && cell[0].getContents().trim() != null){
							hysyywHysydtYhxmYhfsJzd.setXh(cell[0].getContents().trim());
						}
					}
					if(cellLength>=2){
						if( !"".equals(cell[1].getContents().trim()) && cell[1].getContents().trim() != null){
							hysyywHysydtYhxmYhfsJzd.setWd(cell[1].getContents().trim());
						}
					}
					if(cellLength>=3){
						if( !"".equals(cell[2].getContents().trim()) && cell[2].getContents().trim() != null){
							hysyywHysydtYhxmYhfsJzd.setJd(cell[2].getContents().trim());
						}
					}
					if(xh != null && !xh.equals("") && wd != null && !wd.equals("") && jd != null && !jd.equals("")){
						hysyywHysydtYhxmYhfsJzd.setAddtime(xzsj);
						hysyywHysydtYhxmYhfsJzd.setLastupdatetime(xzsj);
						hysyywHysydtYhxmYhfsJzd.setAddusername(userXm);
						hysyywHysydtYhxmYhfsJzd.setAdduserid(userId);
						hysyywHysydtYhxmYhfsJzd.setXmid(Long.parseLong(xmID));
						hysyywHysydtYhxmYhfsJzd.setZsid(Long.parseLong(zsID));
						hysyywHysydtYhxmYhfsJzd.setXssx(Long.parseLong(xh));
					}
					jzdList.add(hysyywHysydtYhxmYhfsJzd);
				}
			}catch(Exception e){
				yyMessage = "数据中存在空行!"+","+" ";
				return yyMessage;
			}
			//添加
			businessService.addDataList(jzdList);
			le.closeWorkbook(workbook);
			yyMessage = "上传数据成功!"+","+jzdList.size();		
			System.out.println("yyMessage==="+yyMessage);
			return yyMessage;
		}else{
			yyMessage = "表中数据格式与模版不符合!"+","+" ";
			return yyMessage;
		}
	}

	
	public String uploadExcel() {
		System.out.println("进入上传EXCEL。。。。 ");
		FileInputStream fis = null; // 为了关闭资源
		FileOutputStream fos = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		String path = null;
		try {
			System.out.println("upload:   " + upload);
			System.out.println("文件名:   " + uploadFileName);
			System.out.println("文件类型:   " + uploadContentType);
			fis = new FileInputStream(upload);
			// FileReader 一次只能读一个字符，一个汉字字符流 读汉字
			// 封装成，缓冲一下，可以读一行
			bis = new BufferedInputStream(fis);
			
			String realPath = "C:/hydg/upload";
//			String realPath = ServletActionContext.getServletContext().getRealPath("/files");
			System.out.println("文件路径：" + realPath);
			System.out.println("文件详细路径：" + realPath + File.separator
					+ uploadFileName);
			path = realPath + File.separator + uploadFileName;

			File serFile = new File(realPath);
			// 判断服务器上该目录是否存在，不存在则创建目录
			if (!serFile.exists()) {
				serFile.mkdirs();
			}
			// 封装成IO流对象，以便输出文件内容
			fos = new FileOutputStream(path); // 从内存走
			bos = new BufferedOutputStream(fos); // 从内存往硬盘走
			int count = bis.read();
			// 如果没有读取到文件末行
			while (count != -1) {
				// 把读取到的一行 输出到硬盘上
				bos.write(count);
				count = bis.read();
			}
			// 上传文件完毕，关闭IO流资源
			if (bis != null) {
				bis.close();
			}
			if (bos != null) {
				bos.close();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("路径：" + path);
		return path;
	}
	
	/**
	 * 
	Description :海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:26:42
	 */
	public String fetchHysyj(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		//海域使用金列表
		yhxmsyjList = businessService.fetchYhxmHysyj(xmID, zsID);
		
		//项目信息
		zsxxList = seaUseGoldService.fetchJnmxZsxx(xmID, zsID);
		
		//判断
		//用海方式列表
		yhxmyhfsList = businessService.fetchYhxmYhfs(xmID, zsID);
		
		//宗海图详情
		yhxmzhtList = businessService.fetchYhxmZht(xmID, zsID);
		
		//申请材料详情
		yhxmsqclList = businessService.fetchYhxmXmfj(xmID,zsID);
		
		//界址点坐标
		yhxmyhfsjzdList = businessService.fetchYhxmYhfsJzdzb(xmID, zsID);
		return "goZhxxUpdate3";
	}
	
	/**
	 * 
	Description :保存海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:27:51
	 */
	public String saveHysyj(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		System.out.println("新增----用海时限=="+hysyywHysydtYhxmHysyj.getYhsx());
		
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyj.setAddtime(xzsj);
		hysyywHysydtYhxmHysyj.setDjsj(xzsj);
		hysyywHysydtYhxmHysyj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyj.setAddusername(userXm);
		hysyywHysydtYhxmHysyj.setAdduserid(userId);
		hysyywHysydtYhxmHysyj.setXmid(Long.parseLong(xmID));
		hysyywHysydtYhxmHysyj.setZsid(Long.parseLong(zsID));
		businessService.addObject(hysyywHysydtYhxmHysyj);
		return "saveHysyjSuccess";
	}
	
	/**
	 * 
	Description :删除海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:29:10
	 */
	public String deleteHysyj(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",hysyjID="+hysyjID);
		businessService.deleteYhxmHysyj(hysyjID);
		return "saveHysyjSuccess";
	}
	
	/**
	 * 
	Description :修改海域使用金
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午05:32:05
	 */
	public String updateHysyj(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",hysyjID="+hysyywHysydtYhxmHysyj.getId());
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmHysyj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmHysyj.setDjsj(xzsj);
		System.out.println("修改----用海时限=="+hysyywHysydtYhxmHysyj.getYhsx());
		
		businessService.updateObject(hysyywHysydtYhxmHysyj);
		return "saveHysyjSuccess";
	}
	
	/**
	 * 
	Description :宗海图放大
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午05:24:56
	 */
	public String fetchZhtDetail(){
		System.out.println("zhtID="+zhtID+",zhttype="+zhttype);
		hysyywHysydtYhxmZht = businessService.fetchYhxmZhtDetail(zhtID);
		return "yhxmZhxxDetailZht";
	}
	
	/**
	 * 
	Description :查出宗海图的用海位置图、界址图
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午05:15:00
	 */
	public String fetchZht(){
		System.out.println("zhtID="+zhtID+",zhttype="+zhttype);
		hysyywHysydtYhxmZht = businessService.fetchYhxmZhtDetail(zhtID);
		if(zhttype.equals("yhwzt")){
			inputStream = new ByteArrayInputStream(hysyywHysydtYhxmZht.getYhwzt());	
		}else if(zhttype.equals("jzt")){
			inputStream = new ByteArrayInputStream(hysyywHysydtYhxmZht.getJzt());	
		}
		HttpServletResponse resp = this.getHttpServletResponse();
		PrintWriter out = null;
		try {
			out = resp.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			int a =inputStream.read();			
			while(a != -1){
				out.print((char)a);
				a = inputStream.read();				
			}
			out.flush();
			out.close();

		} 
		 catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	/**
	 * 
	Description :宗海图
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午05:55:17
	 */
	public String fetchZhtList(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		//宗海图详情
		yhxmzhtList = businessService.fetchYhxmZht(xmID, zsID);

		//判断
		//用海方式列表
		yhxmyhfsList = businessService.fetchYhxmYhfs(xmID, zsID);
		
		//海域使用金列表
		yhxmsyjList = businessService.fetchYhxmHysyj(xmID, zsID);
		
		//申请材料详情
		yhxmsqclList = businessService.fetchYhxmXmfj(xmID,zsID);
		
		//界址点坐标
		yhxmyhfsjzdList = businessService.fetchYhxmYhfsJzdzb(xmID, zsID);
		
		return "goZhxxUpdate4";
	}
	/**
	 * 
	Description :保存宗海图
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-21 下午04:56:49
	 */
	public String saveZht(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmZht.setAddtime(xzsj);
		hysyywHysydtYhxmZht.setLastupdatetime(xzsj);
		hysyywHysydtYhxmZht.setAddusername(userXm);
		hysyywHysydtYhxmZht.setAdduserid(userId);
		
		//位置图：图片名称、图片实际尺寸、图片大小KB、图片格式
		
		String realPath = "C:/hydg/yhxm";
		String path=uploadExcel(realPath,xmID);//上传
		
		
		hysyywHysydtYhxmZht.setWzt_tpmc(uploadFileName);
		hysyywHysydtYhxmZht.setWzt_tpsjcc("1000*1000");
		hysyywHysydtYhxmZht.setWzt_tpgs(uploadContentType);
		hysyywHysydtYhxmZht.setWzt_tpdx("50");
		
		File f = new File(path);
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(f);
			byte[] bs = new byte[fis.available()];
			fis.read(bs);
			//t.setZp(Hibernate.createBlob(fis));
			hysyywHysydtYhxmZht.setYhwzt(bs);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//界址图：图片名称、图片实际尺寸、图片大小KB、图片格式
		String path2=uploadJzt(realPath,xmID);//上传
		File f2 = new File(path2);
		FileInputStream fis2 = null;
		try {
			fis2 = new FileInputStream(f2);
			byte[] bs = new byte[fis2.available()];
			fis2.read(bs);
			//t.setZp(Hibernate.createBlob(fis));
			hysyywHysydtYhxmZht.setJzt(bs);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		hysyywHysydtYhxmZht.setJzt_tpmc(uploadJztFileName);
		hysyywHysydtYhxmZht.setJzt_tpsjcc("1000*1000");
		hysyywHysydtYhxmZht.setJzt_tpgs(uploadJztContentType);
		hysyywHysydtYhxmZht.setJzt_tpdx("50");

		hysyywHysydtYhxmZht.setXmid(Long.parseLong(xmID));
		hysyywHysydtYhxmZht.setZsid(Long.parseLong(zsID));
		businessService.addObject(hysyywHysydtYhxmZht);

		return "goAddZhtSuccess";
	}
	
	
	/**
	 * 
	Description :删除宗海图
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-21 下午05:12:01
	 */
	public String deleteZht(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",zhtID="+zhtID);
		businessService.deleteZht(zhtID);
		return "goAddZhtSuccess";
	}
	
	/**
	 * 
	Description :申请材料
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午05:55:29
	 */
	public String fetchSqclList(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		
		//申请材料详情
//		yhxmsqclList = businessService.fetchYhxmSqcl(xmID, zsID);
		
		yhxmsqclList = businessService.fetchYhxmXmfj(xmID,zsID);
		
		//判断
		//用海方式列表
		yhxmyhfsList = businessService.fetchYhxmYhfs(xmID, zsID);
		
		//海域使用金列表
		yhxmsyjList = businessService.fetchYhxmHysyj(xmID, zsID);
		
		//宗海图详情
		yhxmzhtList = businessService.fetchYhxmZht(xmID, zsID);

		//界址点坐标
		yhxmyhfsjzdList = businessService.fetchYhxmYhfsJzdzb(xmID, zsID);
		return "goZhxxUpdate5";
	}
	
	/**
	 * 
	Description :保存用海项目附件
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午08:15:31
	 */
	public String saveYhxmFj5(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmXmfj.setAddtime(xzsj);
		hysyywHysydtYhxmXmfj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmXmfj.setAddusername(userXm);
		hysyywHysydtYhxmXmfj.setAdduserid(userId);
		hysyywHysydtYhxmXmfj.setScr(userXm);
		hysyywHysydtYhxmXmfj.setScsj(xzsj);
//		hysyywHysydtYhxmXmfj.setZsid(Long.parseLong(zsID));
		//附件、文件类型、文件大小
		String realPath = "C:/hydg/yhxm";
		String path=uploadExcel(realPath,xmID);//上传
		hysyywHysydtYhxmXmfj.setFj(uploadFileName);
		
		//文件类型、大小重新获取
		hysyywHysydtYhxmXmfj.setWjlx(uploadContentType);
		
		Long len = upload.length();//字节
		System.out.println("len="+len);
		double filesize = (double)len/1024;
		
		System.out.println("len="+len+",filesize="+filesize);

		NumberFormat nf = NumberFormat.getNumberInstance();
		nf.setMaximumFractionDigits(2);
		String size = nf.format(filesize);
		System.out.println(nf.format(filesize));

		hysyywHysydtYhxmXmfj.setWjdx(size);
		
		
		hysyywHysydtYhxmXmfj.setFjlj(path);
		businessService.addObject(hysyywHysydtYhxmXmfj);

//		//查出主键
//		String tablename="T_HYSYYW_HYSYDT_YHXM_XMFJ";
//		xmfjID = businessService.fetchYhxmID(tablename,xzsj, userId);
		
		return "goAddFjSuccess5";
	}
	
	/**
	 * 
	Description :删除附件
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午04:47:26
	 */
	public String deleteYhxmFj5(){
		System.out.println("xmID="+xmID+",xmfjID="+xmfjID);
		businessService.deleteYhxmFj(xmfjID);
		//重定向
		return "goAddFjSuccess5";
	}
	 /**
     * 
    Description :修改项目附件信息
    @param
    @return
    @throws
    @Author：yinying
    @Create 2017-8-24 下午06:56:35
     */
    public String updateYhxmFj5(){
		System.out.println("xmID="+xmID+",zsID="+zsID+",附件ID="+hysyywHysydtYhxmXmfjU.getId());
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmXmfjU.setLastupdatetime(xzsj);
		if(uploadFileName != null && !uploadFileName.equals("")){
			//附件、文件类型、文件大小
			String realPath = "C:/hydg/yhxm";
			String path=uploadExcel(realPath,xmID);//上传
			hysyywHysydtYhxmXmfjU.setFj(uploadFileName);
			//文件类型、大小重新获取
			hysyywHysydtYhxmXmfjU.setWjlx(uploadContentType);
			
			Long len = upload.length();//字节
			System.out.println("len="+len);
			double filesize = (double)len/1024;
			
			System.out.println("len="+len+",filesize="+filesize);

			NumberFormat nf = NumberFormat.getNumberInstance();
			nf.setMaximumFractionDigits(2);
			String size = nf.format(filesize);
			System.out.println(nf.format(filesize));

			hysyywHysydtYhxmXmfjU.setWjdx(size);
			hysyywHysydtYhxmXmfjU.setFjlj(path);
			hysyywHysydtYhxmXmfjU.setZsid(Long.parseLong(zsID));
		}

		businessService.updateObject(hysyywHysydtYhxmXmfjU);

		return "goAddFjSuccess5";
	}
	
	
	
	/**
	 * 
	Description :地图定位页面
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午06:04:43
	 */
	public String goDtdw(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
//		System.out.println("dtdwID"+dtdwID);
		dtdwID="";
		//判断
		//用海方式列表
		yhxmyhfsList = businessService.fetchYhxmYhfs(xmID, zsID);
		
		//海域使用金列表
		yhxmsyjList = businessService.fetchYhxmHysyj(xmID, zsID);
		
		//宗海图详情
		yhxmzhtList = businessService.fetchYhxmZht(xmID, zsID);
		//申请材料详情
		yhxmsqclList = businessService.fetchYhxmXmfj(xmID,zsID);
		//界址点坐标
		yhxmyhfsjzdList = businessService.fetchYhxmYhfsJzdzb(xmID, zsID);
		return "goZhxxUpdate6";
	}
	/*************海域使用动态管理——用海项目信息管理******结束*************************/
	

	/********海域使用动态管理——用海项目批后监管——用海项目动态管理******开始*************/
	
	//接入重点海域海岛视频监视系统以及海域巡查管理系统信息，
	//实现对用海项目的实时监视监测和动态管理，特别是可将在建用海项目的工程建设情况的
	//实时建设情况与批准建设内容进行人工甄别、比对和记录。
	
	
	/**
	 * 
	Description :用海项目动态管理
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:37:37
	 */
	public String fetchYhxmdtgl(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		//显示项目信息，关联几个监管信息
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		
		phjgDtglList = businessService.fetchXmxx(pageBean, hysyywHysydtYhxmForm,userId, userRoleName);
//		System.out.println("phjgDtglList="+phjgDtglList.size());
		return "yhxmdtglIndex";
	}
	/**
	 * 
	Description :查出项目的所有监管信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:53:05
	 */
	public String fetchXmDtjgList(){
		System.out.println("xmID="+xmID+",jgXmmc="+jgXmmc);
		session.put("jgxmID", xmID);
		if(jgXmmc != null && !jgXmmc.equals("")){
			//获取项目名称
			session.put("jgXmmc", jgXmmc);
		}else{
			try{
				jgXmmc = (String) session.get("jgXmmc");
			}catch(Exception e){
				System.out.println("session中无jgXmmc");
			}
		}
		System.out.println("xmID="+xmID+",jgXmmc="+jgXmmc);
		
//		HttpServletRequest request= this.getHttpServletRequest();
//		pageBean=this.processPageBean(request);
//		pageBean.setPageRecord(10);
//		hysyywHysydtYhxmphjgDt.setJgfs(jgfs);
		phjgDtglList1 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"1",xmID,"");

		phjgDtglList2 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"2",xmID,"");

		phjgDtglList3 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"3",xmID,"");

		phjgDtglList4 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"4",xmID,"");

		return "dtglJgList";
	}

	/**
	 * 
	Description :删除用海项目动态信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:49:03
	 */
	public String deleteYhxmdtgl(){		
		System.out.println("xmID="+xmID+",dtglID="+dtglID+",jgXmmc="+jgXmmc);
		businessService.deleteYhxmdtgl(xmID,dtglID);
		return "addJgxxSucess";
	}
	/**
	 * 
	Description :保存监管信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 下午05:57:13
	 */
	public String saveJgxx(){
		System.out.println("xmID="+xmID+",jgXmmc="+jgXmmc);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		if(hysyywHysydtYhxmphjgDt.getJgfs().equals("1")){
			hysyywHysydtYhxmphjgDt.setSfagdyxsg("");//2
			
			hysyywHysydtYhxmphjgDt.setSfzyhy("");//3
			hysyywHysydtYhxmphjgDt.setZyhyqk("");//3
			hysyywHysydtYhxmphjgDt.setSfffwth("");//3
			hysyywHysydtYhxmphjgDt.setFfwthqk("");//3
			hysyywHysydtYhxmphjgDt.setSfszgbhyyt("");//3
			hysyywHysydtYhxmphjgDt.setSzgbhyytqk("");//3
			
			hysyywHysydtYhxmphjgDt.setYdyqwz("");//4
			hysyywHysydtYhxmphjgDt.setYhfs("");//4
			hysyywHysydtYhxmphjgDt.setSjyt("");//4
			hysyywHysydtYhxmphjgDt.setSfwgyh("");//4
			hysyywHysydtYhxmphjgDt.setHcjsjc("");//4
		}
		if(hysyywHysydtYhxmphjgDt.getJgfs().equals("2")){
			hysyywHysydtYhxmphjgDt.setSgfs("");//1
			hysyywHysydtYhxmphjgDt.setSgjzqk("");//1
			hysyywHysydtYhxmphjgDt.setAtybqk("");//1
			hysyywHysydtYhxmphjgDt.setSfydg("");//1
			
			hysyywHysydtYhxmphjgDt.setSfzyhy("");//3
			hysyywHysydtYhxmphjgDt.setZyhyqk("");//3
			hysyywHysydtYhxmphjgDt.setSfffwth("");//3
			hysyywHysydtYhxmphjgDt.setFfwthqk("");//3
			hysyywHysydtYhxmphjgDt.setSfszgbhyyt("");//3
			hysyywHysydtYhxmphjgDt.setSzgbhyytqk("");//3
			
			hysyywHysydtYhxmphjgDt.setYdyqwz("");//4
			hysyywHysydtYhxmphjgDt.setYhfs("");//4
			hysyywHysydtYhxmphjgDt.setSjyt("");//4
			hysyywHysydtYhxmphjgDt.setSfwgyh("");//4
			hysyywHysydtYhxmphjgDt.setHcjsjc("");//4
		}
		if(hysyywHysydtYhxmphjgDt.getJgfs().equals("3")){
			hysyywHysydtYhxmphjgDt.setYhjz("");//124
			hysyywHysydtYhxmphjgDt.setYhmj("");//124
			hysyywHysydtYhxmphjgDt.setSgfs("");//1
			hysyywHysydtYhxmphjgDt.setSgjzqk("");//1
			hysyywHysydtYhxmphjgDt.setAtybqk("");//1
			hysyywHysydtYhxmphjgDt.setSfydg("");//1
			
			hysyywHysydtYhxmphjgDt.setSjytsfgb("");//12
			hysyywHysydtYhxmphjgDt.setSjytgbnr("");//12
			hysyywHysydtYhxmphjgDt.setYhjzsfgb("");//12
			hysyywHysydtYhxmphjgDt.setYhmjsfgb("");//12
			hysyywHysydtYhxmphjgDt.setSfcfwth("");//12
			
			hysyywHysydtYhxmphjgDt.setSfagdyxsg("");//2
			
			hysyywHysydtYhxmphjgDt.setYdyqwz("");//4
			hysyywHysydtYhxmphjgDt.setYhfs("");//4
			hysyywHysydtYhxmphjgDt.setSjyt("");//4
			hysyywHysydtYhxmphjgDt.setSfwgyh("");//4
			hysyywHysydtYhxmphjgDt.setHcjsjc("");//4
		}
		if(hysyywHysydtYhxmphjgDt.getJgfs().equals("4")){
			
			hysyywHysydtYhxmphjgDt.setSgfs("");//1
			hysyywHysydtYhxmphjgDt.setSgjzqk("");//1
			hysyywHysydtYhxmphjgDt.setAtybqk("");//1
			hysyywHysydtYhxmphjgDt.setSfydg("");//1
			
			hysyywHysydtYhxmphjgDt.setSjytsfgb("");//12
			hysyywHysydtYhxmphjgDt.setSjytgbnr("");//12
			hysyywHysydtYhxmphjgDt.setYhjzsfgb("");//12
			hysyywHysydtYhxmphjgDt.setYhmjsfgb("");//12
			
			hysyywHysydtYhxmphjgDt.setSfagdyxsg("");//2
			
			hysyywHysydtYhxmphjgDt.setSfzyhy("");//3
			hysyywHysydtYhxmphjgDt.setZyhyqk("");//3
			hysyywHysydtYhxmphjgDt.setSfffwth("");//3
			hysyywHysydtYhxmphjgDt.setFfwthqk("");//3
			hysyywHysydtYhxmphjgDt.setSfszgbhyyt("");//3
			hysyywHysydtYhxmphjgDt.setSzgbhyytqk("");//3
		}

		String xzsj=this.getDateTime();
		hysyywHysydtYhxmphjgDt.setAddtime(xzsj);
		hysyywHysydtYhxmphjgDt.setLastupdatetime(xzsj);
		hysyywHysydtYhxmphjgDt.setAddusername(userXm);
		hysyywHysydtYhxmphjgDt.setAdduserid(userId);
		hysyywHysydtYhxmphjgDt.setXmid(Long.parseLong(xmID));
		businessService.addObject(hysyywHysydtYhxmphjgDt);
		//查出主键
		
		String tablename="T_HYSYYW_HYSYDT_YHXMPHJG_DT";
		dtglID = businessService.fetchYhxmID(tablename,xzsj, userId);
		return "goFetchJgxxAdd1";
//		return "addJgxxSucess";
	}
	
	/**
	 * 
	Description :保存后即可修改
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-1 下午03:30:17
	 */
	public String fetchJgxxAdd1(){
		System.out.println("xmID="+xmID+",dtglID="+dtglID);
		hysyywHysydtYhxmphjgDt = businessService.fetchYhxmdtglDetail(xmID, dtglID);
		return "goJgxxAdd1";
	}
	public String updateJgxx1(){
		System.out.println("xmID="+xmID+",dtglID="+hysyywHysydtYhxmphjgDt.getId()+",jgXmmc="+jgXmmc);
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmphjgDt.setLastupdatetime(xzsj);
		if(hysyywHysydtYhxmphjgDt.getJgfs().equals("1")){
			hysyywHysydtYhxmphjgDt.setSfagdyxsg("");//2
			
			hysyywHysydtYhxmphjgDt.setSfzyhy("");//3
			hysyywHysydtYhxmphjgDt.setZyhyqk("");//3
			hysyywHysydtYhxmphjgDt.setSfffwth("");//3
			hysyywHysydtYhxmphjgDt.setFfwthqk("");//3
			hysyywHysydtYhxmphjgDt.setSfszgbhyyt("");//3
			hysyywHysydtYhxmphjgDt.setSzgbhyytqk("");//3
			
			hysyywHysydtYhxmphjgDt.setYdyqwz("");//4
			hysyywHysydtYhxmphjgDt.setYhfs("");//4
			hysyywHysydtYhxmphjgDt.setSjyt("");//4
			hysyywHysydtYhxmphjgDt.setSfwgyh("");//4
			hysyywHysydtYhxmphjgDt.setHcjsjc("");//4
		}
		if(hysyywHysydtYhxmphjgDt.getJgfs().equals("2")){
			hysyywHysydtYhxmphjgDt.setSgfs("");//1
			hysyywHysydtYhxmphjgDt.setSgjzqk("");//1
			hysyywHysydtYhxmphjgDt.setAtybqk("");//1
			hysyywHysydtYhxmphjgDt.setSfydg("");//1
			
			hysyywHysydtYhxmphjgDt.setSfzyhy("");//3
			hysyywHysydtYhxmphjgDt.setZyhyqk("");//3
			hysyywHysydtYhxmphjgDt.setSfffwth("");//3
			hysyywHysydtYhxmphjgDt.setFfwthqk("");//3
			hysyywHysydtYhxmphjgDt.setSfszgbhyyt("");//3
			hysyywHysydtYhxmphjgDt.setSzgbhyytqk("");//3
			
			hysyywHysydtYhxmphjgDt.setYdyqwz("");//4
			hysyywHysydtYhxmphjgDt.setYhfs("");//4
			hysyywHysydtYhxmphjgDt.setSjyt("");//4
			hysyywHysydtYhxmphjgDt.setSfwgyh("");//4
			hysyywHysydtYhxmphjgDt.setHcjsjc("");//4
		}
		if(hysyywHysydtYhxmphjgDt.getJgfs().equals("3")){
			hysyywHysydtYhxmphjgDt.setYhjz("");//124
			hysyywHysydtYhxmphjgDt.setYhmj("");//124
			hysyywHysydtYhxmphjgDt.setSgfs("");//1
			hysyywHysydtYhxmphjgDt.setSgjzqk("");//1
			hysyywHysydtYhxmphjgDt.setAtybqk("");//1
			hysyywHysydtYhxmphjgDt.setSfydg("");//1
			
			hysyywHysydtYhxmphjgDt.setSjytsfgb("");//12
			hysyywHysydtYhxmphjgDt.setSjytgbnr("");//12
			hysyywHysydtYhxmphjgDt.setYhjzsfgb("");//12
			hysyywHysydtYhxmphjgDt.setYhmjsfgb("");//12
			hysyywHysydtYhxmphjgDt.setSfcfwth("");//12
			
			hysyywHysydtYhxmphjgDt.setSfagdyxsg("");//2
			
			hysyywHysydtYhxmphjgDt.setYdyqwz("");//4
			hysyywHysydtYhxmphjgDt.setYhfs("");//4
			hysyywHysydtYhxmphjgDt.setSjyt("");//4
			hysyywHysydtYhxmphjgDt.setSfwgyh("");//4
			hysyywHysydtYhxmphjgDt.setHcjsjc("");//4
		}
		if(hysyywHysydtYhxmphjgDt.getJgfs().equals("4")){
			
			hysyywHysydtYhxmphjgDt.setSgfs("");//1
			hysyywHysydtYhxmphjgDt.setSgjzqk("");//1
			hysyywHysydtYhxmphjgDt.setAtybqk("");//1
			hysyywHysydtYhxmphjgDt.setSfydg("");//1
			
			hysyywHysydtYhxmphjgDt.setSjytsfgb("");//12
			hysyywHysydtYhxmphjgDt.setSjytgbnr("");//12
			hysyywHysydtYhxmphjgDt.setYhjzsfgb("");//12
			hysyywHysydtYhxmphjgDt.setYhmjsfgb("");//12
			
			hysyywHysydtYhxmphjgDt.setSfagdyxsg("");//2
			
			hysyywHysydtYhxmphjgDt.setSfzyhy("");//3
			hysyywHysydtYhxmphjgDt.setZyhyqk("");//3
			hysyywHysydtYhxmphjgDt.setSfffwth("");//3
			hysyywHysydtYhxmphjgDt.setFfwthqk("");//3
			hysyywHysydtYhxmphjgDt.setSfszgbhyyt("");//3
			hysyywHysydtYhxmphjgDt.setSzgbhyytqk("");//3
		}
		
		businessService.updateObject(hysyywHysydtYhxmphjgDt);
		return "goFetchJgxxAdd1";
	}
	
	
	
	/**
	 * 
	Description :获取需要修改的监管信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 下午05:57:54
	 */
	public String getJgxxUpdate(){
		System.out.println("xmID="+xmID+",dtglID="+dtglID+",jgfs="+jgfs+",jgXmmc="+jgXmmc);
		hysyywHysydtYhxmphjgDt = businessService.fetchYhxmdtglDetail(xmID, dtglID);
		
		//显示是否已有记录
		yhxmyhfsjzdList = businessService.fetchJgxxJzdzb(dtglID);
		//显示是否已有记录
		//附件列表
		phjgDtglList = businessService.fetchJgxxFj(dtglID);
		return "goJgxxUpdate";
	}
	/**
	 * 
	Description :修改监管信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 下午05:58:56
	 */
	public String updateJgxx(){
		System.out.println("xmID="+xmID+",dtglID="+hysyywHysydtYhxmphjgDt.getId()+",jgXmmc="+jgXmmc);
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmphjgDt.setLastupdatetime(xzsj);
		if(hysyywHysydtYhxmphjgDt.getJgfs().equals("1")){
			hysyywHysydtYhxmphjgDt.setSfagdyxsg("");//2
			
			hysyywHysydtYhxmphjgDt.setSfzyhy("");//3
			hysyywHysydtYhxmphjgDt.setZyhyqk("");//3
			hysyywHysydtYhxmphjgDt.setSfffwth("");//3
			hysyywHysydtYhxmphjgDt.setFfwthqk("");//3
			hysyywHysydtYhxmphjgDt.setSfszgbhyyt("");//3
			hysyywHysydtYhxmphjgDt.setSzgbhyytqk("");//3
			
			hysyywHysydtYhxmphjgDt.setYdyqwz("");//4
			hysyywHysydtYhxmphjgDt.setYhfs("");//4
			hysyywHysydtYhxmphjgDt.setSjyt("");//4
			hysyywHysydtYhxmphjgDt.setSfwgyh("");//4
			hysyywHysydtYhxmphjgDt.setHcjsjc("");//4
		}
		if(hysyywHysydtYhxmphjgDt.getJgfs().equals("2")){
			hysyywHysydtYhxmphjgDt.setSgfs("");//1
			hysyywHysydtYhxmphjgDt.setSgjzqk("");//1
			hysyywHysydtYhxmphjgDt.setAtybqk("");//1
			hysyywHysydtYhxmphjgDt.setSfydg("");//1
			
			hysyywHysydtYhxmphjgDt.setSfzyhy("");//3
			hysyywHysydtYhxmphjgDt.setZyhyqk("");//3
			hysyywHysydtYhxmphjgDt.setSfffwth("");//3
			hysyywHysydtYhxmphjgDt.setFfwthqk("");//3
			hysyywHysydtYhxmphjgDt.setSfszgbhyyt("");//3
			hysyywHysydtYhxmphjgDt.setSzgbhyytqk("");//3
			
			hysyywHysydtYhxmphjgDt.setYdyqwz("");//4
			hysyywHysydtYhxmphjgDt.setYhfs("");//4
			hysyywHysydtYhxmphjgDt.setSjyt("");//4
			hysyywHysydtYhxmphjgDt.setSfwgyh("");//4
			hysyywHysydtYhxmphjgDt.setHcjsjc("");//4
		}
		if(hysyywHysydtYhxmphjgDt.getJgfs().equals("3")){
			hysyywHysydtYhxmphjgDt.setYhjz("");//124
			hysyywHysydtYhxmphjgDt.setYhmj("");//124
			hysyywHysydtYhxmphjgDt.setSgfs("");//1
			hysyywHysydtYhxmphjgDt.setSgjzqk("");//1
			hysyywHysydtYhxmphjgDt.setAtybqk("");//1
			hysyywHysydtYhxmphjgDt.setSfydg("");//1
			
			hysyywHysydtYhxmphjgDt.setSjytsfgb("");//12
			hysyywHysydtYhxmphjgDt.setSjytgbnr("");//12
			hysyywHysydtYhxmphjgDt.setYhjzsfgb("");//12
			hysyywHysydtYhxmphjgDt.setYhmjsfgb("");//12
			hysyywHysydtYhxmphjgDt.setSfcfwth("");//12
			
			hysyywHysydtYhxmphjgDt.setSfagdyxsg("");//2
			
			hysyywHysydtYhxmphjgDt.setYdyqwz("");//4
			hysyywHysydtYhxmphjgDt.setYhfs("");//4
			hysyywHysydtYhxmphjgDt.setSjyt("");//4
			hysyywHysydtYhxmphjgDt.setSfwgyh("");//4
			hysyywHysydtYhxmphjgDt.setHcjsjc("");//4
		}
		if(hysyywHysydtYhxmphjgDt.getJgfs().equals("4")){
			
			hysyywHysydtYhxmphjgDt.setSgfs("");//1
			hysyywHysydtYhxmphjgDt.setSgjzqk("");//1
			hysyywHysydtYhxmphjgDt.setAtybqk("");//1
			hysyywHysydtYhxmphjgDt.setSfydg("");//1
			
			hysyywHysydtYhxmphjgDt.setSjytsfgb("");//12
			hysyywHysydtYhxmphjgDt.setSjytgbnr("");//12
			hysyywHysydtYhxmphjgDt.setYhjzsfgb("");//12
			hysyywHysydtYhxmphjgDt.setYhmjsfgb("");//12
			
			hysyywHysydtYhxmphjgDt.setSfagdyxsg("");//2
			
			hysyywHysydtYhxmphjgDt.setSfzyhy("");//3
			hysyywHysydtYhxmphjgDt.setZyhyqk("");//3
			hysyywHysydtYhxmphjgDt.setSfffwth("");//3
			hysyywHysydtYhxmphjgDt.setFfwthqk("");//3
			hysyywHysydtYhxmphjgDt.setSfszgbhyyt("");//3
			hysyywHysydtYhxmphjgDt.setSzgbhyytqk("");//3
		}
		
		businessService.updateObject(hysyywHysydtYhxmphjgDt);
		return "addJgxxSucess";
	}
	
	/**
	 * 
	Description :用海项目动态信息详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-30 上午11:50:00
	 */
	public String fetchYhxmdtglDetail(){
		System.out.println("xmID="+xmID+",dtglID="+dtglID);
		hysyywHysydtYhxmphjgDt = businessService.fetchYhxmdtglDetail(xmID, dtglID);
		
		//附件列表
		phjgDtglList = businessService.fetchJgxxFj(dtglID);
		
		
		//显示是否已有记录
		yhxmyhfsjzdList = businessService.fetchJgxxJzdzb(dtglID);
		
		return "goJgxxDetail";
	}

	/**
	 * 
	Description :选择项目名称fetchXmmc
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-31 下午02:28:58
	 */
	public String fetchXmmc(){
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		List xmList=businessService.fetchXmmc(userId, userRoleName);
//		System.out.println("xmList="+xmList.size());
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
		JSONArray arr=JSONArray.fromObject(xmList,config);
		out.print(arr.toString());		
		out.flush();		
		return null;
	}

	/**
	 * 
	Description :选择海域管理号
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-1 下午04:13:44
	 */
	public String fetchXmZhHyglh(){
		System.out.println("xmID="+xmID);
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		List xmList=businessService.fetchHyglh(userId, userRoleName,xmID);
//		System.out.println("xmList="+xmList.size());
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
		JSONArray arr=JSONArray.fromObject(xmList,config);
		out.print(arr.toString());		
		out.flush();		
		return null;
	}

	//监测范围
	public String fetchJgxxJcfw(){
		System.out.println("界址点");
		System.out.println("xmID="+xmID+",dtglID="+dtglID);
		yhxmyhfsjzdList = businessService.fetchJgxxJzdzb(dtglID);
		//显示是否已有记录
		//附件列表
		phjgDtglList = businessService.fetchJgxxFj(dtglID);
		return "goJgxxAdd2";
	}
	
	
	//监测附件
	public String fetchJgxxJcfj(){
		System.out.println("监测附件");
		System.out.println("xmID="+xmID+",dtglID="+dtglID);
		//附件列表
		phjgDtglList = businessService.fetchJgxxFj(dtglID);
		
		
		//显示是否已有记录
		yhxmyhfsjzdList = businessService.fetchJgxxJzdzb(dtglID);
		return "goJgxxAdd3";
	}
	
	/**
	 * 
	Description :保存界址点
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-1 下午04:46:54
	 */
	public String saveJcrwJzdzb(){
		System.out.println("xmID="+xmID+",dtglID="+dtglID);
		System.out.println("jzdXh="+jzdXh+",jzdJd="+jzdJd+",jzdWd="+jzdWd);
		
		//删除已有的
		businessService.deleteJgxxJzdzb(dtglID);
		
		
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		int nn=1;
		for(int i = 0;i<jzdXh.length;i++){
			THysyywHysydtYhxmphjgDtjzd hysyywHysydtYhxmphjgDtjzd = new THysyywHysydtYhxmphjgDtjzd();
			hysyywHysydtYhxmphjgDtjzd.setAddtime(xzsj);
			hysyywHysydtYhxmphjgDtjzd.setLastupdatetime(xzsj);
			hysyywHysydtYhxmphjgDtjzd.setAddusername(userXm);
			hysyywHysydtYhxmphjgDtjzd.setAdduserid(userId);
			hysyywHysydtYhxmphjgDtjzd.setDtid(Long.parseLong(dtglID));
			hysyywHysydtYhxmphjgDtjzd.setXh(jzdXh[i]);
			hysyywHysydtYhxmphjgDtjzd.setJd(jzdJd[i]);
			hysyywHysydtYhxmphjgDtjzd.setWd(jzdWd[i]);
			hysyywHysydtYhxmphjgDtjzd.setXssx(Long.parseLong(nn+""));
			businessService.addObject(hysyywHysydtYhxmphjgDtjzd);
			nn++;
		}
		return "addJgxxJcfwSuccess";
	}

	/**
	 * 
	Description :删除监测任务下的一个界址点
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-1 下午04:49:34
	 */
	public String deleteJcrwJdzzb(){
		System.out.println("xmID="+xmID+",dtglID="+dtglID);
		System.out.println("jzdID="+jzdID);
		businessService.deleteJgxxJzdzbById(jzdID);
		return "addJgxxJcfwSuccess";
	}
	
	/**
	 * 
	Description :保存附件：照片
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-4 下午03:51:01
	 */
	public String saveXczp(){
		System.out.println("xmID="+xmID+",dtglID="+dtglID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmphjgDtfj.setAddtime(xzsj);
		hysyywHysydtYhxmphjgDtfj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmphjgDtfj.setAddusername(userXm);
		hysyywHysydtYhxmphjgDtfj.setAdduserid(userId);
		hysyywHysydtYhxmphjgDtfj.setType("现场照片");
		hysyywHysydtYhxmphjgDtfj.setWjlx(uploadContentType);
		//位置图：图片名称
		String realPath = "C:/hydg/yhxmdtgl";
		String path=uploadFile(realPath);//上传
		hysyywHysydtYhxmphjgDtfj.setXcyxmc(uploadFileName);
		File f = new File(path);
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(f);
			byte[] bs = new byte[fis.available()];
			fis.read(bs);
			//t.setZp(Hibernate.createBlob(fis));
			hysyywHysydtYhxmphjgDtfj.setXczp(bs);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		hysyywHysydtYhxmphjgDtfj.setDtid(Long.parseLong(dtglID));
		businessService.addObject(hysyywHysydtYhxmphjgDtfj);

		return "goAddXczpSuccess";
	}
	/**
	 * 
	Description :删除监管信息附件
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-4 下午04:09:05
	 */
	public String deleteXczp(){
		System.out.println("xmID="+xmID+",dtglID="+dtglID+",dtglFjID="+dtglFjID);
		businessService.deleteJgxxFj(dtglFjID);
		return "goAddXczpSuccess";
	}
	
	/**
	 * 
	Description :上传影像
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-4 下午04:40:46
	 */
	public String uploadVideo(){
		System.out.println("进入到上传数据表界面");
		String realPath = "C:/hydg/yhxmdtgl";
//		System.out.println("upload:   " + upload);
//		System.out.println("文件名:   " + uploadFileName);
//		System.out.println("文件类型:   " + uploadContentType);
		String veido_path=uploadFileJzt(realPath);//上传到对应盘下
		
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmphjgDtfj.setAddtime(xzsj);
		hysyywHysydtYhxmphjgDtfj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmphjgDtfj.setAddusername(userXm);
		hysyywHysydtYhxmphjgDtfj.setAdduserid(userId);
		hysyywHysydtYhxmphjgDtfj.setType("现场影像");
		hysyywHysydtYhxmphjgDtfj.setDtid(Long.parseLong(dtglID));
		hysyywHysydtYhxmphjgDtfj.setWjlx(uploadJztContentType);
		//视频转码，统一转为标准码
		//截取视频的缩略图-//视频截图PICTURE
		Snapshot snapshot = new Snapshot();
		
		//Tomcat下相对路径
//		String picPath = ServletActionContext.getServletContext().getRealPath("/video/videoPicture");
	
		//本地路径C:\hydg\yhxmdtgl\picture
		String picPath ="C:/hydg/yhxmdtgl/picture";
		File serFile = new File(picPath);
		//判断服务器上该目录是否存在，不存在则创建目录
		if (!serFile.exists()) {
			serFile.mkdirs();
		}
		
		//截图的文件名得注意：目前是截取视频文件名，若用户上传多次文件名一样，则会替换
		String[] strarray=uploadJztFileName.split("\\.");//截取视频文件名的前半段
	    System.out.println("图片名："+strarray[0]);
		String picName=strarray[0]+".jpg";
		picPath += File.separator + picName;
		try{
			snapshot.getPictrue(veido_path, picPath);//获取视频的截图
		}catch(Exception e){
			System.out.println("获取视频的截图报错");
		}
		hysyywHysydtYhxmphjgDtfj.setYxjtmc(picName);//视频截图
		
//		File f = new File(picPath);
//		FileInputStream fis = null;
//		try {
//			fis = new FileInputStream(f);
//			byte[] bs = new byte[fis.available()];
//			fis.read(bs);
//			//t.setZp(Hibernate.createBlob(fis));
//			hysyywHysydtYhxmphjgDtfj.setXczp(bs);
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		//建议将视频的截图保存到数据库，存为BLOB字段，前端显示也需调整
		
		hysyywHysydtYhxmphjgDtfj.setXcyxmc(uploadJztFileName);//视频文件名称
		
		businessService.addObject(hysyywHysydtYhxmphjgDtfj);

		return "goAddXczpSuccess";
	}
	
	
	/**
	 * 
	Description :监管照片
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-4 下午05:59:51
	 */
	public String fetchJgxxZp(){
		System.out.println("dtglFjID="+dtglFjID);
		hysyywHysydtYhxmphjgDtfj = businessService.fetchJgxxFjDetail(dtglFjID);
		
		inputStream = new ByteArrayInputStream(hysyywHysydtYhxmphjgDtfj.getXczp());	
		
		HttpServletResponse resp = this.getHttpServletResponse();
		PrintWriter out = null;
		try {
			out = resp.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			int a =inputStream.read();			
			while(a != -1){
				out.print((char)a);
				a = inputStream.read();				
			}
			out.flush();
			out.close();

		} 
		 catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 
	Description :照片放大
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-4 下午06:00:41
	 */
	public String fetchJgxxZpDetail(){
		System.out.println("dtglFjID="+dtglFjID);
		hysyywHysydtYhxmphjgDtfj = businessService.fetchJgxxFjDetail(dtglFjID);
		return "xczpDetail";//phjg_dtgl_xczp_detail.jsp
	}
	/**
	 * 
	Description :视频播放
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-12-4 下午06:12:34
	 */
	public String fetchVideoDetail(){
		System.out.println("dtglFjID="+dtglFjID);
		hysyywHysydtYhxmphjgDtfj = businessService.fetchJgxxFjDetail(dtglFjID);
		return "videoDetail";
	}
	
	/**
	 * 1、建设过程监管
	对重点用海项目的项目用海界址与面积、施工方式、施工进展情况、实际用途是否改变、
	岸滩演变情况进行监管。
	2、竣工用海复核
	对竣工用海项目的用海界址与面积、实际用途等与审批同意的内容进行复核和比对。
	3、日常监管
	对竣工后的用海项目占用海域、非法围、填海活动、擅自改变海域用途等内容进行批后监管。
	4、核查监视监测
	 依据卫星、航空遥感监视监测发现的异点异区信息以及举报发现的违规用海信息
	 (例如发生权属纠纷的用海，由群众举报的未经审批或擅自扩大海域使用范围的违规用海)，
	 随时核查对比监测，并即时上报核查数据。
	**/
	
	/********海域使用动态管理——用海项目批后监管——用海项目动态管理******结束************/
	
	
	
	/********海域使用动态管理——用海项目批后监管——用海项目变化预警******开始************/
	
	//通过对用海项目的实时监测，按照既定的用海项目突发事件预案，设置用海项目监控信息的预警，
	//提醒用海项目管理者及时处置各类突发事件。结合视频监视点实时监测数据及基础管理数据，
	//并结合实际情况开发必要的数据模型，准确、及时地对用海类型变化和用海面积变化等进行警告、预警。
	
	
	/**
	 * 
	Description :用海项目变化预警
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-27 下午06:02:19
	 */
	public String fetchYjxm(){
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
//		phjgBhyjList = businessService.fetchXmxxYj(pageBean, hysyywHysydtYhxmForm);
		phjgBhyjList = businessService.fetchXmxxYj2(pageBean, hysyywHysydtYhxmForm,userId, userRoleName);
		return "phjgBhyjIndex";
	}
	/**
	 * 
	Description :查出项目具体的监管记录-问题数
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-28 下午01:23:48
	 */
	public String fetchXmjgList2(){
		jgfs="2";
		System.out.println("xmID="+xmID+",jgXmmc="+jgXmmc);
		phjgDtglList1 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"1",xmID,"是");
		phjgDtglList2 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"2",xmID,"是");
		phjgDtglList3 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"3",xmID,"是");
		phjgDtglList4 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"4",xmID,"是");
		return "bhyjJgList";
	}
	/**
	 * 
	Description :查出项目具体的监管记录-总数
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-28 下午05:42:59
	 */
	public String fetchXmjgList1(){
		jgfs="1";
		System.out.println("xmID="+xmID+",jgXmmc="+jgXmmc);
		phjgDtglList1 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"1",xmID,"");
		phjgDtglList2 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"2",xmID,"");
		phjgDtglList3 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"3",xmID,"");
		phjgDtglList4 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"4",xmID,"");
		return "bhyjJgList";
	}
	/**
	 * 
	Description :查出项目具体的监管记录-预警数
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-28 下午05:43:16
	 */
	public String fetchXmjgList3(){
		jgfs="3";
		System.out.println("xmID="+xmID+",jgXmmc="+jgXmmc+",getYjid="+hysyywHysydtYhxmphjgDtForm.getYjid());		
		phjgDtglList1 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"1",xmID,"预警");
		phjgDtglList2 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"2",xmID,"预警");
		phjgDtglList3 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"3",xmID,"预警");
		phjgDtglList4 = businessService.fetchYhxmdtglList(pageBean, hysyywHysydtYhxmphjgDtForm,"4",xmID,"预警");
		return "bhyjJgList";
	}
	
	
	
	
	
	
	
	
	/**
	 * 
	Description :监管详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-28 下午02:08:33
	 */
	public String fetchYhxmglDetail(){
		System.out.println("xmID="+xmID+",dtglID="+dtglID+"哪个详情页面jgfs="+jgfs+",getYjid="+hysyywHysydtYhxmphjgDtForm.getYjid());
		hysyywHysydtYhxmphjgDt = businessService.fetchYhxmdtglDetail(xmID, dtglID);
		return "jgxxDetail";
	}
	
	//登录之后弹出提示信息
  	public String openZdclIndexDialog(){
  		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		
  		pageBean=null;
  		int num1 = 0;
  		phjgBhyjList = businessService.fetchXmxxYj2(pageBean, hysyywHysydtYhxmForm,userId, userRoleName);
  		System.out.println("phjgBhyjList记录数=="+phjgBhyjList.size());
  		if(phjgBhyjList != null && phjgBhyjList.size()!=0){
  			for(int i=0;i<phjgBhyjList.size();i++){
  				THysyywHysydtYhxmphjgYjForm hysyywHysydtYhxmphjgYjForm = new THysyywHysydtYhxmphjgYjForm();
  				hysyywHysydtYhxmphjgYjForm=(THysyywHysydtYhxmphjgYjForm) phjgBhyjList.get(i);
  				num1 += Integer.parseInt(hysyywHysydtYhxmphjgYjForm.getYjs());
  			}
  		}
  		
  		
  		hysyywHysydtYhxmForm.setSj(this.getTodayDate());
  		int num2 = 0;
  		List<?> phjgBhyjList2 = businessService.fetchXmxxYj2(pageBean, hysyywHysydtYhxmForm,userId, userRoleName);
  		if(phjgBhyjList2 != null && phjgBhyjList2.size()!=0){
  			for(int i=0;i<phjgBhyjList2.size();i++){
  				THysyywHysydtYhxmphjgYjForm hysyywHysydtYhxmphjgYjForm = new THysyywHysydtYhxmphjgYjForm();
  				hysyywHysydtYhxmphjgYjForm=(THysyywHysydtYhxmphjgYjForm) phjgBhyjList2.get(i);
  				num2 += Integer.parseInt(hysyywHysydtYhxmphjgYjForm.getYjs());
  			}
  		}
  		System.out.println("num1="+num1+",num2="+num2);
  		
  		
//  	int num3 = 1;
//  	int num4 = 2;
  		int[] num = {num1,num2};//,num3,num4
  		
  		HttpServletResponse response = this.getHttpServletResponse();
  		response.setContentType("text/plain;charset=utf-8");
  		PrintWriter out = null;
  		try {
  			out = response.getWriter();
  		} catch (IOException e) {
  			e.printStackTrace();
  		}
  		JsonConfig config = new JsonConfig();
  		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT); // 自动为我排除circle
  		JSONArray arr = JSONArray.fromObject(num, config);
  		out.print(arr.toString());
  		out.flush();
  		
  		return null;
  	}
	/**
	 * 
	Description :保存预警设置信息
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-28 下午03:52:57
	 */
  	public String saveYhxmBhyjxx(){
		System.out.println("xmID="+xmID+",jgXmmc="+jgXmmc);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		
		String xzsj=this.getDateTime();
		hysyywHysydtYhxmphjgYj.setAddtime(xzsj);
		hysyywHysydtYhxmphjgYj.setLastupdatetime(xzsj);
		hysyywHysydtYhxmphjgYj.setAddusername(userXm);
		hysyywHysydtYhxmphjgYj.setAdduserid(userId);
		hysyywHysydtYhxmphjgYj.setXmid(Long.parseLong(xmID));
		businessService.addObject(hysyywHysydtYhxmphjgYj);
		return "addYjxxSucess";
	}
	/**
	 * 
	Description :预警信息详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-28 下午04:13:15
	 */
  	public String fetchYjxxDetail(){
  		System.out.println("bhyjID="+bhyjID);
  		hysyywHysydtYhxmphjgYj = businessService.fetchYjxxDetail(bhyjID);
  		return "yjxxDetail";
  	}
  	/**
  	 * 
  	Description :删除预警
  	@param:@return
  	@return:String
  	@throws
  	@Author：yinying
  	@Create 2017-10-28 下午04:18:09
  	 */
  	public String deleteYjxx(){
  		System.out.println("bhyjID="+bhyjID);
  		businessService.deleteYjxx(bhyjID);
  		return "addYjxxSucess";
  	}
  	/**
  	 * 
  	Description :获取需要修改的预警信息
  	@param:@return
  	@return:String
  	@throws
  	@Author：yinying
  	@Create 2017-10-28 下午04:20:27
  	 */
  	public String getYjxxForUpdate(){
  		System.out.println("bhyjID="+bhyjID);
  		hysyywHysydtYhxmphjgYj = businessService.fetchYjxxDetail(bhyjID);
  		return "yjxxUpdate";
  	}
  	/**
  	 * 
  	Description :修改预警信息
  	@param:@return
  	@return:String
  	@throws
  	@Author：yinying
  	@Create 2017-10-28 下午04:21:24
  	 */
  	public String updateYjxx(){
  		System.out.println("bhyjID="+bhyjID);
  		String xzsj=this.getDateTime();
  		hysyywHysydtYhxmphjgYj.setLastupdatetime(xzsj);
  		businessService.updateObject(hysyywHysydtYhxmphjgYj);
  		return "addYjxxSucess";
  	}
  	
  	/**
  	 * 
  	Description :变化预警列表
  	@param:@return
  	@return:String
  	@throws
  	@Author：yinying
  	@Create 2017-10-28 下午03:54:32
  	 */
	public String fetchBhyjList(){
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/********海域使用动态管理——用海项目批后监管——用海项目变化预警******结束************/
	
	
	
	/*******************************通用******开始*************************/
	/**
	 * 
	Description :获取年份
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-6-16 下午06:27:57
	 */
	public String getYear(){
		//入库时间
		Calendar c = Calendar.getInstance();
		Date date = c.getTime();
		System.out.println("系统当前时间："+date);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");//可以方便地修改日期格式
		String datetime = dateFormat.format(date);
	    return datetime;
	}
	
	/**
	 * 
	Description :获取当前时间
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-6-16 下午06:27:53
	 */
	public String getDateTime(){
		Calendar c = Calendar.getInstance();
		Date date = c.getTime();
		System.out.println("系统当前时间："+date);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式
		String datetime = dateFormat.format(date);
	    return datetime;
	}
	/**
	 * 
	Description :获取当前日期
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-28 下午03:14:33
	 */
	public String getTodayDate(){
		Calendar c = Calendar.getInstance();
		Date date = c.getTime();
		System.out.println("系统当前时间："+date);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
		String datetime = dateFormat.format(date);
	    return datetime;
	}
	/**
	 * 
	Description :上传文件
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午08:20:50
	 */
	public String uploadExcel(String realPath,String xmID) {
		System.out.println("进入上传EXCEL。。。。 ");
		FileInputStream fis = null; // 为了关闭资源
		FileOutputStream fos = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		String path = null;
		try {
			System.out.println("upload:   " + upload);
			System.out.println("文件名:   " + uploadFileName);
			System.out.println("文件类型:   " + uploadContentType);
			fis = new FileInputStream(upload);
			// FileReader 一次只能读一个字符，一个汉字字符流 读汉字
			// 封装成，缓冲一下，可以读一行
			bis = new BufferedInputStream(fis);
			
//			String realPath = "C:/hydg/yhxm/";
//			String realPath = ServletActionContext.getServletContext().getRealPath("/files");
			System.out.println("文件路径：" + realPath);
			
			path = realPath + File.separator
					+ xmID + File.separator +  uploadFileName;
			System.out.println("文件详细路径：" +path);
			File serFile = new File(realPath+ File.separator + xmID);
			// 判断服务器上该目录是否存在，不存在则创建目录
			if (!serFile.exists()) {
				serFile.mkdirs();
			}
			// 封装成IO流对象，以便输出文件内容
			fos = new FileOutputStream(path); // 从内存走
			bos = new BufferedOutputStream(fos); // 从内存往硬盘走
			int count = bis.read();
			// 如果没有读取到文件末行
			while (count != -1) {
				// 把读取到的一行 输出到硬盘上
				bos.write(count);
				count = bis.read();
			}
			// 上传文件完毕，关闭IO流资源
			if (bis != null) {
				bis.close();
			}
			if (bos != null) {
				bos.close();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("路径：" + path);
		return path;
	}
	
	public String uploadJzt(String realPath,String xmID) {
		System.out.println("进入上传EXCEL。。。。 ");
		FileInputStream fis = null; // 为了关闭资源
		FileOutputStream fos = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		String path = null;
		try {
			System.out.println("uploadJzt:   " + uploadJzt);
			System.out.println("文件名:   " + uploadJztFileName);
			System.out.println("文件类型:   " + uploadJztContentType);
			fis = new FileInputStream(uploadJzt);
			// FileReader 一次只能读一个字符，一个汉字字符流 读汉字
			// 封装成，缓冲一下，可以读一行
			bis = new BufferedInputStream(fis);
			
//			String realPath = "C:/hydg/yhxm/";
//			String realPath = ServletActionContext.getServletContext().getRealPath("/files");
			System.out.println("文件路径：" + realPath);
			
			path = realPath + File.separator
					+ xmID + File.separator +  uploadJztFileName;
			System.out.println("文件详细路径：" +path);
			File serFile = new File(realPath+ File.separator + xmID);
			// 判断服务器上该目录是否存在，不存在则创建目录
			if (!serFile.exists()) {
				serFile.mkdirs();
			}
			// 封装成IO流对象，以便输出文件内容
			fos = new FileOutputStream(path); // 从内存走
			bos = new BufferedOutputStream(fos); // 从内存往硬盘走
			int count = bis.read();
			// 如果没有读取到文件末行
			while (count != -1) {
				// 把读取到的一行 输出到硬盘上
				bos.write(count);
				count = bis.read();
			}
			// 上传文件完毕，关闭IO流资源
			if (bis != null) {
				bis.close();
			}
			if (bos != null) {
				bos.close();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("路径：" + path);
		return path;
	}
	
	public String uploadFile(String realPath) {
		System.out.println("进入上传EXCEL。。。。 ");
		FileInputStream fis = null; // 为了关闭资源
		FileOutputStream fos = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		String path = null;
		try {
			System.out.println("upload:   " + upload);
			System.out.println("文件名:   " + uploadFileName);
			System.out.println("文件类型:   " + uploadContentType);
			fis = new FileInputStream(upload);
			// FileReader 一次只能读一个字符，一个汉字字符流 读汉字
			// 封装成，缓冲一下，可以读一行
			bis = new BufferedInputStream(fis);
			
//			String realPath = "C:/hydg/yhxm/";
//			String realPath = ServletActionContext.getServletContext().getRealPath("/files");
			System.out.println("文件路径：" + realPath);
			
			path = realPath + File.separator  +  uploadFileName;
			System.out.println("文件详细路径：" +path);
			File serFile = new File(realPath+ File.separator);
			// 判断服务器上该目录是否存在，不存在则创建目录
			if (!serFile.exists()) {
				serFile.mkdirs();
			}
			// 封装成IO流对象，以便输出文件内容
			fos = new FileOutputStream(path); // 从内存走
			bos = new BufferedOutputStream(fos); // 从内存往硬盘走
			int count = bis.read();
			// 如果没有读取到文件末行
			while (count != -1) {
				// 把读取到的一行 输出到硬盘上
				bos.write(count);
				count = bis.read();
			}
			// 上传文件完毕，关闭IO流资源
			if (bis != null) {
				bis.close();
			}
			if (bos != null) {
				bos.close();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("路径：" + path);
		return path;
	}
	
	public String uploadFileJzt(String realPath) {
		System.out.println("进入上传EXCEL。。。。 ");
		FileInputStream fis = null; // 为了关闭资源
		FileOutputStream fos = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		String path = null;
		try {
			System.out.println("uploadJzt:   " + uploadJzt);
			System.out.println("文件名:   " + uploadJztFileName);
			System.out.println("文件类型:   " + uploadJztContentType);
			fis = new FileInputStream(uploadJzt);
			// FileReader 一次只能读一个字符，一个汉字字符流 读汉字
			// 封装成，缓冲一下，可以读一行
			bis = new BufferedInputStream(fis);
			
//			String realPath = "C:/hydg/yhxm/";
//			String realPath = ServletActionContext.getServletContext().getRealPath("/files");
			System.out.println("文件路径：" + realPath);
			
			path = realPath + File.separator +  uploadJztFileName;
			System.out.println("文件详细路径：" +path);
			File serFile = new File(realPath+ File.separator);
			// 判断服务器上该目录是否存在，不存在则创建目录
			if (!serFile.exists()) {
				serFile.mkdirs();
			}
			// 封装成IO流对象，以便输出文件内容
			fos = new FileOutputStream(path); // 从内存走
			bos = new BufferedOutputStream(fos); // 从内存往硬盘走
			int count = bis.read();
			// 如果没有读取到文件末行
			while (count != -1) {
				// 把读取到的一行 输出到硬盘上
				bos.write(count);
				count = bis.read();
			}
			// 上传文件完毕，关闭IO流资源
			if (bis != null) {
				bis.close();
			}
			if (bos != null) {
				bos.close();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("路径：" + path);
		return path;
	}
	
	/**
	 * 
	Description :查代码
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-29 下午07:01:36
	 */
	public String fetchDictionary(){
		System.out.println("代码类型="+dictionary.getKey());
		List dmList=businessService.fetchDictionary(dictionary.getKey(),"");
//		System.out.println("dmList="+dmList.size());
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
		JSONArray arr=JSONArray.fromObject(dmList,config);
		out.print(arr.toString());		
		out.flush();		
		return null;
	}
	
	/**
	 * 
	Description :级联用海类型B
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-30 下午06:37:19
	 */
	public String fetchYhlxa() {
		dictionary.setKey("用海类型B");
		List dmList=businessService.fetchDictionary(dictionary.getKey(),yhlxa);
		
		HttpServletResponse response = this.getHttpServletResponse();
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		JsonConfig config = new JsonConfig();
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT); // 自动为我排除circle
		JSONArray arr = JSONArray.fromObject(dmList, config);
		out.print(arr.toString());
		out.flush();
		return null;
	}
	/**
	 * 
	Description :使用金征收标准用海类型B
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-2 上午10:19:59
	 */
	public String fetchZsbzYhlxa() {
		dictionary.setKey("使用金征收标准用海类别B");
		List dmList=businessService.fetchDictionary(dictionary.getKey(),yhlxa);
		
		HttpServletResponse response = this.getHttpServletResponse();
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		JsonConfig config = new JsonConfig();
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT); // 自动为我排除circle
		JSONArray arr = JSONArray.fromObject(dmList, config);
		out.print(arr.toString());
		out.flush();
		return null;
	}
	
	/**
	 * 
	Description :测试超时
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-31 下午03:44:44
	 */
	public String chaoshi(){
		System.out.println("测试");
    	return "dlCs";
	}
    
	
	/*******************************通用******结束*************************/
	
	
	
	
	
	public IBusinessService getBusinessService() {
		return businessService;
	}

	public void setBusinessService(IBusinessService businessService) {
		this.businessService = businessService;
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

	public String getXmID() {
		return xmID;
	}

	public void setXmID(String xmID) {
		this.xmID = xmID;
	}

	public THysyywHysydtYhxmXmfj getHysyywHysydtYhxmXmfj() {
		return hysyywHysydtYhxmXmfj;
	}

	public void setHysyywHysydtYhxmXmfj(THysyywHysydtYhxmXmfj hysyywHysydtYhxmXmfj) {
		this.hysyywHysydtYhxmXmfj = hysyywHysydtYhxmXmfj;
	}

	public List<?> getYhxmfjList() {
		return yhxmfjList;
	}

	public void setYhxmfjList(List<?> yhxmfjList) {
		this.yhxmfjList = yhxmfjList;
	}

	public List<?> getYhxmzsxxList() {
		return yhxmzsxxList;
	}

	public void setYhxmzsxxList(List<?> yhxmzsxxList) {
		this.yhxmzsxxList = yhxmzsxxList;
	}

	public String getZsID() {
		return zsID;
	}

	public void setZsID(String zsID) {
		this.zsID = zsID;
	}

	public THysyywHysydtYhxmZhxx getHysyywHysydtYhxmZsxx() {
		return hysyywHysydtYhxmZsxx;
	}

	public void setHysyywHysydtYhxmZsxx(THysyywHysydtYhxmZhxx hysyywHysydtYhxmZsxx) {
		this.hysyywHysydtYhxmZsxx = hysyywHysydtYhxmZsxx;
	}

	public THysyywHysydtYhxmYhfs getHysyywHysydtYhxmYhfs() {
		return hysyywHysydtYhxmYhfs;
	}

	public void setHysyywHysydtYhxmYhfs(THysyywHysydtYhxmYhfs hysyywHysydtYhxmYhfs) {
		this.hysyywHysydtYhxmYhfs = hysyywHysydtYhxmYhfs;
	}

	public THysyywHysydtYhxmHysyj getHysyywHysydtYhxmHysyj() {
		return hysyywHysydtYhxmHysyj;
	}

	public void setHysyywHysydtYhxmHysyj(
			THysyywHysydtYhxmHysyj hysyywHysydtYhxmHysyj) {
		this.hysyywHysydtYhxmHysyj = hysyywHysydtYhxmHysyj;
	}

	public List<?> getYhxmsyjList() {
		return yhxmsyjList;
	}

	public void setYhxmsyjList(List<?> yhxmsyjList) {
		this.yhxmsyjList = yhxmsyjList;
	}

	public String getHysyjID() {
		return hysyjID;
	}

	public void setHysyjID(String hysyjID) {
		this.hysyjID = hysyjID;
	}

	public String getYhfsID() {
		return yhfsID;
	}

	public void setYhfsID(String yhfsID) {
		this.yhfsID = yhfsID;
	}

	public List<?> getYhxmyhfsList() {
		return yhxmyhfsList;
	}

	public void setYhxmyhfsList(List<?> yhxmyhfsList) {
		this.yhxmyhfsList = yhxmyhfsList;
	}

	public List<?> getYhxmyhfsjzdList() {
		return yhxmyhfsjzdList;
	}

	public void setYhxmyhfsjzdList(List<?> yhxmyhfsjzdList) {
		this.yhxmyhfsjzdList = yhxmyhfsjzdList;
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

	public String getXmfjID() {
		return xmfjID;
	}

	public void setXmfjID(String xmfjID) {
		this.xmfjID = xmfjID;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public THysyywHysydtYhxmXmfj getHysyywHysydtYhxmXmfjU() {
		return hysyywHysydtYhxmXmfjU;
	}

	public void setHysyywHysydtYhxmXmfjU(THysyywHysydtYhxmXmfj hysyywHysydtYhxmXmfjU) {
		this.hysyywHysydtYhxmXmfjU = hysyywHysydtYhxmXmfjU;
	}

	public THysyywHysydtYhxmYhfsJzd getHysyywHysydtYhxmYhfsJzd() {
		return hysyywHysydtYhxmYhfsJzd;
	}

	public void setHysyywHysydtYhxmYhfsJzd(
			THysyywHysydtYhxmYhfsJzd hysyywHysydtYhxmYhfsJzd) {
		this.hysyywHysydtYhxmYhfsJzd = hysyywHysydtYhxmYhfsJzd;
	}

	public String[] getJzdXh() {
		return jzdXh;
	}

	public void setJzdXh(String[] jzdXh) {
		this.jzdXh = jzdXh;
	}

	public String[] getJzdJd() {
		return jzdJd;
	}

	public void setJzdJd(String[] jzdJd) {
		this.jzdJd = jzdJd;
	}

	public String[] getJzdWd() {
		return jzdWd;
	}

	public void setJzdWd(String[] jzdWd) {
		this.jzdWd = jzdWd;
	}

	public String getJzdID() {
		return jzdID;
	}

	public void setJzdID(String jzdID) {
		this.jzdID = jzdID;
	}

	public Dictionary getDictionary() {
		return dictionary;
	}

	public void setDictionary(Dictionary dictionary) {
		this.dictionary = dictionary;
	}

	public THysyywHysydtYhxmphjgDt getHysyywHysydtYhxmphjgDt() {
		return hysyywHysydtYhxmphjgDt;
	}

	public void setHysyywHysydtYhxmphjgDt(
			THysyywHysydtYhxmphjgDt hysyywHysydtYhxmphjgDt) {
		this.hysyywHysydtYhxmphjgDt = hysyywHysydtYhxmphjgDt;
	}

	public String getDtglID() {
		return dtglID;
	}

	public void setDtglID(String dtglID) {
		this.dtglID = dtglID;
	}

	public List<?> getPhjgDtglList() {
		return phjgDtglList;
	}

	public void setPhjgDtglList(List<?> phjgDtglList) {
		this.phjgDtglList = phjgDtglList;
	}

	public THysyywHysydtYhxmForm getHysyywHysydtYhxmForm() {
		return hysyywHysydtYhxmForm;
	}

	public void setHysyywHysydtYhxmForm(THysyywHysydtYhxmForm hysyywHysydtYhxmForm) {
		this.hysyywHysydtYhxmForm = hysyywHysydtYhxmForm;
	}

	public String getJgfs() {
		return jgfs;
	}

	public void setJgfs(String jgfs) {
		this.jgfs = jgfs;
	}

	public List<?> getPhjgDtglList1() {
		return phjgDtglList1;
	}

	public void setPhjgDtglList1(List<?> phjgDtglList1) {
		this.phjgDtglList1 = phjgDtglList1;
	}

	public List<?> getPhjgDtglList2() {
		return phjgDtglList2;
	}

	public void setPhjgDtglList2(List<?> phjgDtglList2) {
		this.phjgDtglList2 = phjgDtglList2;
	}

	public List<?> getPhjgDtglList3() {
		return phjgDtglList3;
	}

	public void setPhjgDtglList3(List<?> phjgDtglList3) {
		this.phjgDtglList3 = phjgDtglList3;
	}

	public List<?> getPhjgDtglList4() {
		return phjgDtglList4;
	}

	public void setPhjgDtglList4(List<?> phjgDtglList4) {
		this.phjgDtglList4 = phjgDtglList4;
	}

	public String getJgXmmc() {
		return jgXmmc;
	}

	public void setJgXmmc(String jgXmmc) {
		this.jgXmmc = jgXmmc;
	}

	public List<?> getYhxmzhtList() {
		return yhxmzhtList;
	}

	public void setYhxmzhtList(List<?> yhxmzhtList) {
		this.yhxmzhtList = yhxmzhtList;
	}

	public List<?> getYhxmsqclList() {
		return yhxmsqclList;
	}

	public void setYhxmsqclList(List<?> yhxmsqclList) {
		this.yhxmsqclList = yhxmsqclList;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}


	public THysyywHysydtYhxmZht getHysyywHysydtYhxmZht() {
		return hysyywHysydtYhxmZht;
	}

	public void setHysyywHysydtYhxmZht(THysyywHysydtYhxmZht hysyywHysydtYhxmZht) {
		this.hysyywHysydtYhxmZht = hysyywHysydtYhxmZht;
	}

	public String getZhtID() {
		return zhtID;
	}

	public void setZhtID(String zhtID) {
		this.zhtID = zhtID;
	}

	public String getZhttype() {
		return zhttype;
	}

	public void setZhttype(String zhttype) {
		this.zhttype = zhttype;
	}

	public String getDtdwID() {
		return dtdwID;
	}

	public void setDtdwID(String dtdwID) {
		this.dtdwID = dtdwID;
	}

	public File getUploadJzt() {
		return uploadJzt;
	}

	public void setUploadJzt(File uploadJzt) {
		this.uploadJzt = uploadJzt;
	}

	public String getUploadJztFileName() {
		return uploadJztFileName;
	}

	public void setUploadJztFileName(String uploadJztFileName) {
		this.uploadJztFileName = uploadJztFileName;
	}

	public String getUploadJztContentType() {
		return uploadJztContentType;
	}

	public void setUploadJztContentType(String uploadJztContentType) {
		this.uploadJztContentType = uploadJztContentType;
	}

	public ISeaUseGoldService getSeaUseGoldService() {
		return seaUseGoldService;
	}

	public void setSeaUseGoldService(ISeaUseGoldService seaUseGoldService) {
		this.seaUseGoldService = seaUseGoldService;
	}

	public List<?> getZsxxList() {
		return zsxxList;
	}

	public void setZsxxList(List<?> zsxxList) {
		this.zsxxList = zsxxList;
	}

	public List<?> getPhjgBhyjList() {
		return phjgBhyjList;
	}

	public void setPhjgBhyjList(List<?> phjgBhyjList) {
		this.phjgBhyjList = phjgBhyjList;
	}

	public THysyywHysydtYhxmphjgYj getHysyywHysydtYhxmphjgYj() {
		return hysyywHysydtYhxmphjgYj;
	}

	public void setHysyywHysydtYhxmphjgYj(
			THysyywHysydtYhxmphjgYj hysyywHysydtYhxmphjgYj) {
		this.hysyywHysydtYhxmphjgYj = hysyywHysydtYhxmphjgYj;
	}

	public String getBhyjID() {
		return bhyjID;
	}

	public void setBhyjID(String bhyjID) {
		this.bhyjID = bhyjID;
	}

	public THysyywHysydtYhxmphjgDtForm getHysyywHysydtYhxmphjgDtForm() {
		return hysyywHysydtYhxmphjgDtForm;
	}

	public void setHysyywHysydtYhxmphjgDtForm(
			THysyywHysydtYhxmphjgDtForm hysyywHysydtYhxmphjgDtForm) {
		this.hysyywHysydtYhxmphjgDtForm = hysyywHysydtYhxmphjgDtForm;
	}

	public String getYhlxa() {
		return yhlxa;
	}

	public void setYhlxa(String yhlxa) {
		this.yhlxa = yhlxa;
	}

	public int getXmzsCount() {
		return xmzsCount;
	}

	public void setXmzsCount(int xmzsCount) {
		this.xmzsCount = xmzsCount;
	}

	public int getZsCount() {
		return zsCount;
	}

	public void setZsCount(int zsCount) {
		this.zsCount = zsCount;
	}

	public THysyywHysydtYhxmphjgDtfj getHysyywHysydtYhxmphjgDtfj() {
		return hysyywHysydtYhxmphjgDtfj;
	}

	public void setHysyywHysydtYhxmphjgDtfj(
			THysyywHysydtYhxmphjgDtfj hysyywHysydtYhxmphjgDtfj) {
		this.hysyywHysydtYhxmphjgDtfj = hysyywHysydtYhxmphjgDtfj;
	}

	public String getDtglFjID() {
		return dtglFjID;
	}

	public void setDtglFjID(String dtglFjID) {
		this.dtglFjID = dtglFjID;
	}
	
	
}
