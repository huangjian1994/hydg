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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import com.htcf.entity.CoastlineInfo;
import com.htcf.entity.THysyywHysydtHykjDmtxx;
import com.htcf.entity.THysyywHysydtHykjHjfa;
import com.htcf.entity.THysyywHysydtHykjSlsj;
import com.htcf.entity.THysyywHysydtYhxmYhfsJzd;
import com.htcf.entity.User;
import com.htcf.service.CoastlineInfoService;
import com.htcf.service.IBusinessService;
import com.htcf.service.ISeaDemarcationService;
import com.htcf.util.DateUtil;

/**
 * 海域使用动态管理——海域勘界管理
 * @author yinying
 *
 */
@Controller("seaDemarcationAction")
@Scope("prototype")
public class SeaDemarcationAction extends BaseAction{
	@Autowired
	private ISeaDemarcationService seaDemarcationService;
	
	@Autowired
	private IBusinessService businessService;
	
	@Resource(name="coastlineAnalyzeService")
	private CoastlineInfoService coastlineAnalyzeService;
	
	//实体
	private THysyywHysydtHykjDmtxx hysyywHygnqhHykjDmtxx = new THysyywHysydtHykjDmtxx();
	private THysyywHysydtHykjSlsj hysyywHygnqhHykjSlsj = new THysyywHysydtHykjSlsj();
	private THysyywHysydtHykjHjfa hysyywHygnqhHykjHjfa = new THysyywHysydtHykjHjfa();
	private CoastlineInfo coastline  = new CoastlineInfo();
	//List
	private List<?> mediaList;
	private List<?> slsjList;
	private List<?> hjfaList;
	
	//变量
	private String wjm;//文件名
	private String dmtID;//多媒体ID
	private String slsjID;//矢量数据ID
	private String hjfaID;//划界方案ID
	private String wjlx;//文件类型
	
	private File upload;
	private String uploadFileName;// 文件名
	private String uploadContentType; // 上传的文件类型
	
	private File uploadSjwj;
	private String uploadSjwjFileName;// 文件名
	private String uploadSjwjContentType; // 上传的文件类型
	private String fileName;
	private String filePath;

	 private InputStream inputStream;	
	 
	//实现对上海市海域勘界信息的综合管理。
	//海域勘界的主要内容包括背景资料收集、外业调查、内业资料整理、界线方案制定和
	//界线协议书的签订及报批等。本模块实现的主要功能包括：
	
	
	/********海域使用动态管理——海域勘界管理——矢量数据管理******开始************/
	
	//对CAD、SHP、GeoDatabase等格式矢量数据进行有效管理，
	//实现各类数据的格式转换以及矢量数据的叠加、显示和分析；
	
    /**
     * 
    Description :矢量数据管理列表
    @param
    @return
    @throws
    @Author：yinying
    @Create 2017-9-4 下午07:50:36
     */
    public String fetchSlsj(){
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
		slsjList = seaDemarcationService.fetchSlsj(hysyywHygnqhHykjSlsj, pageBean,userId, userRoleName);
		return "slsjIndex";
	}
    /**
     * 
    Description :矢量数据管理列表-返回
    @param
    @return
    @throws
    @Author：yinying
    @Create 2017-9-4 下午07:50:36
     */
    public String fetchSlsj2(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		hysyywHygnqhHykjSlsj = null;
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}

		slsjList = seaDemarcationService.fetchSlsj(hysyywHygnqhHykjSlsj, pageBean,userId, userRoleName);
		return "slsjIndex";
	}
    /**
     * 
    Description :删除矢量数据
    @param
    @return
    @throws
    @Author：yinying
    @Create 2017-9-4 下午07:50:36
     */
    public String deleteSlsj(){
    	System.out.println("slsjID="+slsjID);
    	seaDemarcationService.deleteSlsj(slsjID);
    	
    	return "delSlsjSuccess";
    }
    /**
     * 矢量数据-详情
    Description :
    @param
    @return
    @throws
    @Author：yinying
    @Create 2017-9-8 下午03:46:33
     */
    public String fetchSlsjDetail(){
    	System.out.println("slsjID="+slsjID);
    	hysyywHygnqhHykjSlsj = seaDemarcationService.fetchSlsjDetail(slsjID);
    	return "slsjDetail";
    }
    /**
     * 
    Description :获取需要修改的-矢量数据
    @param
    @return
    @throws
    @Author：yinying
    @Create 2017-9-8 下午03:47:40
     */
    public String getUpdateSlsj(){
    	System.out.println("slsjID="+slsjID);
    	hysyywHygnqhHykjSlsj = seaDemarcationService.fetchSlsjDetail(slsjID);
    	return "slsjUpdate";
    }
    /**
     * 
    Description :矢量数据-修改
    @param
    @return
    @throws
    @Author：yinying
    @Create 2017-9-8 下午05:27:12
     */
    public String updateSlsj(){
    	String xzsj=this.getDateTime();
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		hysyywHygnqhHykjSlsj.setAdduserid(userId);
		hysyywHygnqhHykjSlsj.setAddusername(userXm);
		hysyywHygnqhHykjSlsj.setLastupdatetime(xzsj);
		System.out.println("uploadSjwjFileName="+uploadSjwjFileName);
		System.out.println("uploadFileName="+uploadFileName);
		if(uploadSjwjFileName != null && !uploadSjwjFileName.equals("")){
			//附件、文件类型、文件大小
			String dowloadPath_slsjfj="C:/hydg/hykj/slsj/";
			String path=uploadFile(dowloadPath_slsjfj,uploadSjwj,uploadSjwjFileName);//上传
			hysyywHygnqhHykjSlsj.setSjwjm(uploadSjwjFileName);
			hysyywHygnqhHykjSlsj.setSjsclx(uploadSjwjContentType);
			hysyywHygnqhHykjSlsj.setSjbclj(path);
		}
		
		if(uploadFileName != null && !uploadFileName.equals("")){
			//附件、文件类型、文件大小
			String dowloadPath_slsjfj="C:/hydg/hykj/slsj/";
			String path=uploadFile(dowloadPath_slsjfj,upload,uploadFileName);//上传
			hysyywHygnqhHykjSlsj.setFj(uploadFileName);
			hysyywHygnqhHykjSlsj.setFjlj(path);
		}
    	businessService.updateObject(hysyywHygnqhHykjSlsj);
    	return "delSlsjSuccess";
    }
    /**
     * 
    Description :保存矢量数据
    @param
    @return
    @throws
    @Author：yinying
    @Create 2017-9-8 下午03:50:11
     */
    public String addSlsj(){
    	String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHygnqhHykjSlsj.setAddtime(xzsj);
		hysyywHygnqhHykjSlsj.setLastupdatetime(xzsj);
		hysyywHygnqhHykjSlsj.setAddusername(userXm);
		hysyywHygnqhHykjSlsj.setAdduserid(userId);
		
		System.out.println("uploadSjwjFileName="+uploadSjwjFileName);
		System.out.println("uploadFileName="+uploadFileName);
		if(uploadSjwjFileName != null && !uploadSjwjFileName.equals("")){
			//附件、文件类型、文件大小
			String dowloadPath_slsjfj="C:/hydg/hykj/slsj/";
			String path=uploadFile(dowloadPath_slsjfj,uploadSjwj,uploadSjwjFileName);//上传
			hysyywHygnqhHykjSlsj.setSjwjm(uploadSjwjFileName);
			hysyywHygnqhHykjSlsj.setSjsclx(uploadSjwjContentType);
			hysyywHygnqhHykjSlsj.setSjbclj(path);
		}
		
		if(uploadFileName != null && !uploadFileName.equals("")){
			//附件、文件类型、文件大小
			String dowloadPath_slsjfj="C:/hydg/hykj/slsj/";
			String path=uploadFile(dowloadPath_slsjfj,upload,uploadFileName);//上传
			hysyywHygnqhHykjSlsj.setFj(uploadFileName);
			hysyywHygnqhHykjSlsj.setFjlj(path);
		}
		businessService.addObject(hysyywHygnqhHykjSlsj);
    	return "delSlsjSuccess";
    }
    /**
	 * 
	Description :下载矢量数据
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午05:32:23
	 */
	public String downLoadSlsj(){
		System.out.println("fileName="+fileName);
		return "downLoadSlsj";
	}
	public InputStream getDownLoadFileSlsj(){
		System.out.println("进入getDownloadFile.....");
		String dowloadPath_slsjfj="C:/hydg/hykj/slsj/";
   		filePath = dowloadPath_slsjfj+fileName;
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
	
    //转换格式
	public String goGszh(){
		System.out.println("slsjID="+slsjID);
    	hysyywHygnqhHykjSlsj = seaDemarcationService.fetchSlsjDetail(slsjID);
		return "goSlsjGszh";
	}
	
	/**
	 * 
	Description :下载
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-22 下午05:50:38
	 */
	public String downLoadSlsjFile1(){
		fileName="arcgis10.2.2.rar";
		System.out.println("fileName="+fileName);
		return "downLoadSlsj1";
	}
	public String downLoadSlsjFile2(){
		fileName="ArcGIS10.2安装文档.doc";
		System.out.println("fileName="+fileName);
		return "downLoadSlsj2";
	}
	public String downLoadSlsjFile3(){
		fileName="DWG转SHP格式.doc";
		System.out.println("fileName="+fileName);
		return "downLoadSlsj3";
	}
	public String downLoadSlsjFile4(){
		fileName="SHP转DWG格式.doc";
		System.out.println("fileName="+fileName);
		return "downLoadSlsj4";
	}
	
	
	
	
	//地图展示
	
	/********海域使用动态管理——海域勘界管理——矢量数据管理******结束************/
	
	
	/********海域使用动态管理——海域勘界管理——划界方案综合分析******开始************/
	
	//实现划界方案生成和方案综合分析功能, 结合相关划界信息,
	//便于迅速、全面、准确地作出各种划界方案并进行利弊得失分析。
	
	/**
	 * 
	Description :划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午05:28:00
	 */
	public String fetchHjfa(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		hjfaList = seaDemarcationService.fetchHjfaList(hysyywHygnqhHykjHjfa, pageBean);
		return "goHjfaIndex";
	}
	public String fetchHjfa2(){
		hysyywHygnqhHykjHjfa = null;
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		hjfaList = seaDemarcationService.fetchHjfaList(hysyywHygnqhHykjHjfa, pageBean);
		return "goHjfaIndex";
	}
	
	/**
	 * 
	Description :保存划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午05:48:22
	 */
	public String saveHjfa(){
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHygnqhHykjHjfa.setAddtime(xzsj);
		hysyywHygnqhHykjHjfa.setLastupdatetime(xzsj);
		hysyywHygnqhHykjHjfa.setAddusername(userXm);
		hysyywHygnqhHykjHjfa.setAdduserid(userId);
		
		String dowloadPath_mediafj="C:/hydg/hykj/hjfa/";
		String path=uploadFile(dowloadPath_mediafj,upload,uploadFileName);//上传
		hysyywHygnqhHykjHjfa.setFj(uploadFileName);
		hysyywHygnqhHykjHjfa.setWjbclj(path);
		businessService.addObject(hysyywHygnqhHykjHjfa);
		return "addHjfaSuccess";
	}
	/**
	 * 
	Description :删除-划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午06:00:07
	 */
	public String deletehjfa(){
		System.out.println("hjfaID="+hjfaID);
		seaDemarcationService.deleteHjfa(hjfaID);
		return "addHjfaSuccess";
	}
	/**
	 * 
	Description :详情-划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午06:00:17
	 */
	public String fetchhjfaDetail(){
		System.out.println("hjfaID="+hjfaID);
		hysyywHygnqhHykjHjfa = seaDemarcationService.fetchHjfaDetail(hjfaID);
		return "hjfaDetail";
	}
	
	/**
	 * 
	Description :获取修改的划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午06:00:41
	 */
	public String getUpdateHjfa(){
		System.out.println("hjfaID="+hjfaID);
		hysyywHygnqhHykjHjfa = seaDemarcationService.fetchHjfaDetail(hjfaID);
		return "hjfaUpdate";
	}
	/**
	 * 
	Description :修改-划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午06:00:36
	 */
	public String updateHjfa(){
		System.out.println("hjfaID="+hjfaID+",主键="+hysyywHygnqhHykjHjfa.getId());
		String xzsj=this.getDateTime();
		
		hysyywHygnqhHykjHjfa.setLastupdatetime(xzsj);
		if(uploadFileName != null && !uploadFileName.equals("")){
			//附件、文件类型、文件大小
			String dowloadPath_mediafj="C:/hydg/hykj/hjfa/";
			String path=uploadFile(dowloadPath_mediafj,upload,uploadFileName);//上传
			hysyywHygnqhHykjHjfa.setFj(uploadFileName);
//			hysyywHygnqhHykjDmtxx.setWjlx(uploadContentType);
			hysyywHygnqhHykjHjfa.setWjbclj(path);
		}
		businessService.updateObject(hysyywHygnqhHykjHjfa);
		return "addHjfaSuccess";
	}

	/**
	 * 
	Description :下载划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午06:11:17
	 */
	public String downLoadHjfa(){
		System.out.println("fileName="+fileName);
		return "downLoadHjfafj";
	}
	public InputStream getDownLoadFileHjfa(){
		System.out.println("进入getDownloadFile.....");
		String dowloadPath_mediafj="C:/hydg/hykj/hjfa/";
   		filePath = dowloadPath_mediafj+fileName;
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
	Description :划界方案-统计
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午06:57:07
	 */
	public String fetchHjfaTj(){
		hjfaList = seaDemarcationService.fetchHjfaTj();
		
		return "goHjfaTj";
	}
	/**
	 * 
	Description :统计-详情划界方案
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-13 下午06:57:04
	 */
	public String fetchHjfaTjDetail(){
		System.out.println("wjlx="+wjlx);
		hysyywHygnqhHykjHjfa.setWjlx(wjlx);
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		hjfaList = seaDemarcationService.fetchHjfaList(hysyywHygnqhHykjHjfa, pageBean);
		hysyywHygnqhHykjHjfa=null;
		return "goHjfaIndex";
	}
	
	/**
	 * 
	Description :经纬度模板下载
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-3-2 下午05:03:50
	 */
	public String downLoadHjfaJwd(){
		System.out.println("下载划界方案综合分析坐标上传模板.....");
		fileName="划界方案综合分析坐标上传模板.xls";
		return "downLoadHjfaJwd";
	}
	public InputStream getDownLoadFileHjfaJwd(){
		System.out.println("进入getDownloadFile.....");
	    System.out.println(ServletActionContext.getServletContext().getResourceAsStream("/files/"+fileName));
	   	//FileInputStream fis=ServletActionContext.getServletContext().getResourceAsStream("/hcbdmb/"+fileName);		 
		return ServletActionContext.getServletContext().getResourceAsStream("/files/"+fileName);
	}

	//上传
	public String saveClAnalyze(){
		//
		System.out.println("名称="+coastline.getLineName());
		
		String path=uploadExcel();
		System.out.println("path-------="+path);
		System.out.println("我想得到的path======"+uploadFileName);
		try{
			String flag=insertData(path);
			System.out.println("flag="+flag);
			coastline.setLineGeo(flag);
		}catch(Exception e){
			e.printStackTrace();
			message = "上传失败"+","+" ";
			//message = "上传失败"+"+"+"";
		}

		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		coastline.setAddtime(xzsj);
		coastline.setLastupdatetime(xzsj);
		coastline.setAdduserid(userId);
		coastline.setAddusername(userXm);
		coastlineAnalyzeService.addCoastlineInfo(coastline);
		
		return "goHjfa";
	}
	
	//解析上传的EXCEL
	public String insertData(String path) {
		System.out.println("++path+"+path+"++upload+++"+upload);
		System.out.println("文件名+++====="+uploadFileName);
		String yyMessage="";

		LoadExcel le = new LoadExcel();
		Workbook workbook = le.getExcel(path); // path路径名
		Sheet[] tables = workbook.getSheets();
		
		int tSize = tables.length;
		Sheet sheet = le.getSheet(workbook, 0);
		int row = sheet.getRows();// 表行
		int columns = sheet.getColumns();// 表列	
		System.out.println(path);
		System.out.println("colu mns列数："+columns);
			
		if (columns == 3) {// 读内容				
			try{
				for (int i = 1; i < row; i++){ // 循环一张表的行					
					Cell[] cell = le.readLine(sheet, i);			
					int cellLength = cell.length;
					System.out.println("cellLength="+cellLength);
//					System.out.println("000="+cell[0].getContents());
//					System.out.println("111="+cell[1].getContents());
//					System.out.println("222="+cell[2].getContents());
					String xh = cell[0].getContents().trim();
					String wd = cell[1].getContents().trim();//北纬
					String jd = cell[2].getContents().trim();//东经
					if(i==row-1){
						yyMessage += xh+","+jd+","+wd;
					}else{
						yyMessage += xh+","+jd+","+wd+";";
					}
				}
			}catch(Exception e){
				System.out.println("数据存在空行");
			}
			
			le.closeWorkbook(workbook);
			System.out.println("yyMessage==="+yyMessage);
			return yyMessage;
		}else{
			System.out.println("表中数据格式与模版不符合!");
//			yyMessage = "表中数据格式与模版不符合!"+","+" ";
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/********海域使用动态管理——海域勘界管理——划界方案综合分析******结束************/
	
	
	
	/********海域使用动态管理——海域勘界管理——多媒体信息管理******开始************/
	//实现对多媒体信息的有效管理，主要包括多媒体信息的查询、检索和显示等功能；
	/**
	 * 
	Description :多媒体信息管理-列表展示
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 上午11:34:01
	 */
	public String fetchDmtxx(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		System.out.println("文件名="+hysyywHygnqhHykjDmtxx.getWjm()+",文件类型="+hysyywHygnqhHykjDmtxx.getWjlx());
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		mediaList = seaDemarcationService.fetchDmtxx(hysyywHygnqhHykjDmtxx, pageBean,userId, userRoleName);
		return "mediaIndex";
	}
	/**
	 * 
	Description :多媒体信息管理-列表展示-返回
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午05:50:34
	 */
	public String fetchDmtxx2(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		hysyywHygnqhHykjDmtxx=null;
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
		    return "dlCs";
		}
		mediaList = seaDemarcationService.fetchDmtxx(hysyywHygnqhHykjDmtxx, pageBean,userId, userRoleName);
		return "mediaIndex";
	}
	
	
	/**
	 * 
	Description :删除
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午05:02:56
	 */
	public String deleteMedia(){
		System.out.println("dmtID="+dmtID);
		seaDemarcationService.deleteDmtxx(dmtID);
		return "delSuccess";
	}
	/**
	 * 
	Description :详情
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午05:04:53
	 */
	public String fetchMediaDetail(){
		System.out.println("dmtID="+dmtID);
		hysyywHygnqhHykjDmtxx = seaDemarcationService.fetchDmtxxDetail(dmtID);
		
		return "mediaDetail";
	}
	/**
	 * 
	Description :新增
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午05:08:07
	 */
	public String addMedia(){
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHygnqhHykjDmtxx.setAddtime(xzsj);
		hysyywHygnqhHykjDmtxx.setLastupdatetime(xzsj);
		hysyywHygnqhHykjDmtxx.setAddusername(userXm);
		hysyywHygnqhHykjDmtxx.setAdduserid(userId);
		hysyywHygnqhHykjDmtxx.setScr(userXm);
		hysyywHygnqhHykjDmtxx.setScsj(xzsj);
		String dowloadPath_mediafj="C:/hydg/hykj/media/";
		String path=uploadFile(dowloadPath_mediafj,upload,uploadFileName);//上传
		hysyywHygnqhHykjDmtxx.setFj(uploadFileName);
		hysyywHygnqhHykjDmtxx.setType(uploadContentType);
		hysyywHygnqhHykjDmtxx.setFjlj(path);
		if(hysyywHygnqhHykjDmtxx.getWjlx().equals("视频")){
			//视频转码，统一转为标准码
			//截取视频的缩略图-//视频截图PICTURE
			Snapshot snapshot = new Snapshot();
			//本地路径C:\hydg\yhxmdtgl\picture
			String picPath ="C:/hydg/hykj/media/picture";
			File serFile = new File(picPath);
			//判断服务器上该目录是否存在，不存在则创建目录
			if (!serFile.exists()) {
				serFile.mkdirs();
			}
			//截图的文件名得注意：目前是截取视频文件名，若用户上传多次文件名一样，则会替换
			String[] strarray=uploadFileName.split("\\.");//截取视频文件名的前半段
		    System.out.println("图片名："+strarray[0]);
			String picName=strarray[0]+".jpg";
			picPath += File.separator + picName;
			try{
				snapshot.getPictrue(path, picPath);//获取视频的截图
			}catch(Exception e){
				System.out.println("获取视频的截图报错");
			}
			hysyywHygnqhHykjDmtxx.setSpjtmc(picName);//视频截图
		}
		if(hysyywHygnqhHykjDmtxx.getWjlx().equals("照片")){
			File f = new File(path);
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(f);
				byte[] bs = new byte[fis.available()];
				fis.read(bs);
				//t.setZp(Hibernate.createBlob(fis));
				hysyywHygnqhHykjDmtxx.setZp(bs);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		businessService.addObject(hysyywHygnqhHykjDmtxx);
		return "delSuccess";
	}
	/**
	 * 
	Description :展示照片
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-24 下午06:12:18
	 */
	public String fetchDmtxxZp(){
		System.out.println("dmtID="+dmtID);
		hysyywHygnqhHykjDmtxx = seaDemarcationService.fetchDmtxxDetail(dmtID);
		
		inputStream = new ByteArrayInputStream(hysyywHygnqhHykjDmtxx.getZp());	
		
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
	Description :多媒体照片放大
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-24 下午06:14:44
	 */
	public String fetchDmtxxZpDetail(){
		System.out.println("dmtID="+dmtID);
		hysyywHygnqhHykjDmtxx = seaDemarcationService.fetchDmtxxDetail(dmtID);
		return "dmtxxZpDetail";
	}
	
	/**
	 * 
	Description :视频播放
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-24 下午06:16:36
	 */
	public String fetchVideoDetail(){
		System.out.println("dmtID="+dmtID);
		hysyywHygnqhHykjDmtxx = seaDemarcationService.fetchDmtxxDetail(dmtID);
		return "videoDetail";
	}
	/**
	 * 
	Description :获取需要修改的信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午05:05:35
	 */
	public String getUpdateMedia(){
		System.out.println("dmtID="+dmtID);
		hysyywHygnqhHykjDmtxx = seaDemarcationService.fetchDmtxxDetail(dmtID);
		
		return "mediaUpdate";
	}
	/**
	 * 
	Description :修改
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-9-4 下午05:06:56
	 */
	public String updateMedia(){
		System.out.println("dmtID="+dmtID+",主键="+hysyywHygnqhHykjDmtxx.getId());
		String xzsj=this.getDateTime();
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		
		hysyywHygnqhHykjDmtxx.setAdduserid(userId);
		hysyywHygnqhHykjDmtxx.setAddusername(userXm);
		hysyywHygnqhHykjDmtxx.setScr(userXm);
		hysyywHygnqhHykjDmtxx.setScsj(xzsj);
		hysyywHygnqhHykjDmtxx.setLastupdatetime(xzsj);
		if(uploadFileName != null && !uploadFileName.equals("")){
			//附件、文件类型、文件大小
			String dowloadPath_mediafj="C:/hydg/hykj/media/";
			String path=uploadFile(dowloadPath_mediafj,upload,uploadFileName);//上传
			hysyywHygnqhHykjDmtxx.setFj(uploadFileName);
			hysyywHygnqhHykjDmtxx.setType(uploadContentType);
			hysyywHygnqhHykjDmtxx.setFjlj(path);
			
			if(hysyywHygnqhHykjDmtxx.getWjlx().equals("视频")){
				//视频转码，统一转为标准码
				//截取视频的缩略图-//视频截图PICTURE
				Snapshot snapshot = new Snapshot();
				//本地路径C:\hydg\yhxmdtgl\picture
				String picPath ="C:/hydg/hykj/media/picture";
				File serFile = new File(picPath);
				//判断服务器上该目录是否存在，不存在则创建目录
				if (!serFile.exists()) {
					serFile.mkdirs();
				}
				//截图的文件名得注意：目前是截取视频文件名，若用户上传多次文件名一样，则会替换
				String[] strarray=uploadFileName.split("\\.");//截取视频文件名的前半段
			    System.out.println("图片名："+strarray[0]);
				String picName=strarray[0]+".jpg";
				picPath += File.separator + picName;
				try{
					snapshot.getPictrue(path, picPath);//获取视频的截图
				}catch(Exception e){
					System.out.println("获取视频的截图报错");
				}
				hysyywHygnqhHykjDmtxx.setSpjtmc(picName);//视频截图
			}
			if(hysyywHygnqhHykjDmtxx.getWjlx().equals("照片")){
				File f = new File(path);
				FileInputStream fis = null;
				try {
					fis = new FileInputStream(f);
					byte[] bs = new byte[fis.available()];
					fis.read(bs);
					//t.setZp(Hibernate.createBlob(fis));
					hysyywHygnqhHykjDmtxx.setZp(bs);
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		businessService.updateObject(hysyywHygnqhHykjDmtxx);
		return "delSuccess";
	}
	
	/**
	 * 
	Description :下载多媒体附件
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午05:32:23
	 */
	public String downLoadMediafj(){
		System.out.println("fileName="+fileName);
		return "downLoadMediafj";
	}
	public InputStream getDownLoadFileMediafj(){
		System.out.println("进入getDownloadFile.....");
		String dowloadPath_mediafj="C:/hydg/hykj/media/";
   		filePath = dowloadPath_mediafj+fileName;
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
	Description :上传文件
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-23 下午08:20:50
	 */
	public String uploadFile(String realPath,File upload1,String uploadfilename){
		System.out.println("进入上传文件。。。。 ");
		FileInputStream fis = null; // 为了关闭资源
		FileOutputStream fos = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		String path = null;
		try {
			System.out.println("realPath:   " + realPath);
			System.out.println("文件名:   " + uploadfilename);
//			System.out.println("文件类型:   " + uploadContentType);
			fis = new FileInputStream(upload1);
			// FileReader 一次只能读一个字符，一个汉字字符流 读汉字
			// 封装成，缓冲一下，可以读一行
			bis = new BufferedInputStream(fis);
			
//			String realPath = ServletActionContext.getServletContext().getRealPath("/files");
			System.out.println("文件路径：" + realPath);
			
			path = realPath + uploadfilename;
			System.out.println("文件详细路径：" +path);
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
	
	/********海域使用动态管理——海域勘界管理——多媒体信息管理******结束************/
	
	
	public ISeaDemarcationService getSeaDemarcationService() {
		return seaDemarcationService;
	}

	
	public void setSeaDemarcationService(
			ISeaDemarcationService seaDemarcationService) {
		this.seaDemarcationService = seaDemarcationService;
	}

	public List<?> getMediaList() {
		return mediaList;
	}


	public void setMediaList(List<?> mediaList) {
		this.mediaList = mediaList;
	}
	public String getWjm() {
		return wjm;
	}


	public void setWjm(String wjm) {
		this.wjm = wjm;
	}

	public String getDmtID() {
		return dmtID;
	}

	public void setDmtID(String dmtID) {
		this.dmtID = dmtID;
	}
	public IBusinessService getBusinessService() {
		return businessService;
	}
	public void setBusinessService(IBusinessService businessService) {
		this.businessService = businessService;
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
	
	public List<?> getSlsjList() {
		return slsjList;
	}
	public void setSlsjList(List<?> slsjList) {
		this.slsjList = slsjList;
	}
	public String getSlsjID() {
		return slsjID;
	}
	public void setSlsjID(String slsjID) {
		this.slsjID = slsjID;
	}
	public File getUploadSjwj() {
		return uploadSjwj;
	}
	public void setUploadSjwj(File uploadSjwj) {
		this.uploadSjwj = uploadSjwj;
	}
	public String getUploadSjwjFileName() {
		return uploadSjwjFileName;
	}
	public void setUploadSjwjFileName(String uploadSjwjFileName) {
		this.uploadSjwjFileName = uploadSjwjFileName;
	}
	public String getUploadSjwjContentType() {
		return uploadSjwjContentType;
	}
	public void setUploadSjwjContentType(String uploadSjwjContentType) {
		this.uploadSjwjContentType = uploadSjwjContentType;
	}
	
	public List<?> getHjfaList() {
		return hjfaList;
	}
	public void setHjfaList(List<?> hjfaList) {
		this.hjfaList = hjfaList;
	}
	public String getHjfaID() {
		return hjfaID;
	}
	public void setHjfaID(String hjfaID) {
		this.hjfaID = hjfaID;
	}
	public String getWjlx() {
		return wjlx;
	}
	public void setWjlx(String wjlx) {
		this.wjlx = wjlx;
	}
	public THysyywHysydtHykjDmtxx getHysyywHygnqhHykjDmtxx() {
		return hysyywHygnqhHykjDmtxx;
	}
	public void setHysyywHygnqhHykjDmtxx(
			THysyywHysydtHykjDmtxx hysyywHygnqhHykjDmtxx) {
		this.hysyywHygnqhHykjDmtxx = hysyywHygnqhHykjDmtxx;
	}
	public THysyywHysydtHykjSlsj getHysyywHygnqhHykjSlsj() {
		return hysyywHygnqhHykjSlsj;
	}
	public void setHysyywHygnqhHykjSlsj(THysyywHysydtHykjSlsj hysyywHygnqhHykjSlsj) {
		this.hysyywHygnqhHykjSlsj = hysyywHygnqhHykjSlsj;
	}
	public THysyywHysydtHykjHjfa getHysyywHygnqhHykjHjfa() {
		return hysyywHygnqhHykjHjfa;
	}
	public void setHysyywHygnqhHykjHjfa(THysyywHysydtHykjHjfa hysyywHygnqhHykjHjfa) {
		this.hysyywHygnqhHykjHjfa = hysyywHygnqhHykjHjfa;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public CoastlineInfo getCoastline() {
		return coastline;
	}
	public void setCoastline(CoastlineInfo coastline) {
		this.coastline = coastline;
	}
	public CoastlineInfoService getCoastlineAnalyzeService() {
		return coastlineAnalyzeService;
	}
	public void setCoastlineAnalyzeService(
			CoastlineInfoService coastlineAnalyzeService) {
		this.coastlineAnalyzeService = coastlineAnalyzeService;
	}
	
	
	
}
