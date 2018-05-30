package com.htcf.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.htcf.entity.THysyywHysydtHaxDctj;
import com.htcf.entity.THysyywHysydtHaxGhxx;
import com.htcf.entity.THysyywHysydtHaxJcxx;
import com.htcf.entity.THysyywHysydtHaxJsjc;
import com.htcf.entity.THysyywHysydtHaxZzxf;
import com.htcf.entity.User;
import com.htcf.entity.SearchForm;
import com.htcf.service.CoastlineInfoService;
import com.htcf.service.DgIffService;
import com.htcf.service.IBusinessService;
/**
 * 海域使用动态管理——海岸线管理
 * 
 * 海岸线基础信息管理、海岸线动态监视监测管理、海岸线调查统计
 * @author zxf
 *
 *海岸线规划信息管理、海岸线整治修复
 *@author yinying
 *
 */
@Controller("dgiffAction")
@Scope("prototype")
public class DgIffAction extends BaseAction{

	@Autowired
	private DgIffService dgIffService;
	
	@Autowired
	private IBusinessService businessService;

	@Resource(name="coastlineDefineService")
	private CoastlineInfoService coastlineDefineService;
	
	//实体
	private THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx=new THysyywHysydtHaxJcxx();
	private THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc=new THysyywHysydtHaxJsjc();
	private THysyywHysydtHaxDctj thysyywHysydtHaxDctj=new THysyywHysydtHaxDctj();
	private THysyywHysydtHaxGhxx hysyywHysydtHaxGhxx = new THysyywHysydtHaxGhxx();
	private THysyywHysydtHaxZzxf hysyywHysydtHaxZzxf = new THysyywHysydtHaxZzxf();
	private SearchForm searchForm = new SearchForm();
	private CoastlineInfo coastline  = new CoastlineInfo();
	
	//List
	private List<?> thysyywHysydtHaxJcxxList=new ArrayList<THysyywHysydtHaxJcxx>();
	private List<THysyywHysydtHaxJsjc> thysyywHysydtHaxJsjcList=new ArrayList<THysyywHysydtHaxJsjc>();
	private List<?> thysyywHysydtHaxDctjList=new ArrayList<THysyywHysydtHaxDctj>();
	
	private List<?> dicList;
	private List<?> dicList2;
	private List<?> dicList3;
	private List<?> dicList4;
	private List<?> dicList5;
	private List<?> dicList6;
	private List<?> dicList7;
	private List<?> ghxxList;
	private List<?> zzxfList;
	
	//变量
	private String id=null;
	private String ghID;
	private String zzID;
	
	private File upload;
	private String uploadFileName;// 文件名
	private String uploadContentType; // 上传的文件类型
	private String fileName;
	private String filePath;
	
	/*****************海岸线基础信息管理*********************/
	
	/**
	 * 海岸线列表展示
	 * @return
	 */
	public String haxjcxxInfo(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList1(null,pageBean);
		return "haxjcxxInfoSuc";
	}
	/**
	 * 进入新增页面
	 * @return
	 */
	public String toAddHaxInfo(){
		dicList=this.dgIffService.getDictionaryListByKey("一级海岸线类型");
		dicList2=this.dgIffService.getDictionaryListByKey("二级海岸线类型");
		dicList3=this.dgIffService.getDictionaryListByKey("三级海岸线类型");
		return "toAddHaxInfoSuc";
	}
	/**
	 * 保存海岸线信息
	 * @return
	 */
	public String saveHaxInfo(){
		System.out.println("thysyywHysydtHaxJcxx.getName()="+thysyywHysydtHaxJcxx.getName());
		System.out.println("thysyywHysydtHaxJcxx.getAdduserid()="+thysyywHysydtHaxJcxx.getAdduserid());
		try {
			thysyywHysydtHaxJcxx.setAdduserid(((User)session.get("user")).getId());
			thysyywHysydtHaxJcxx.setAddusername(((User)session.get("user")).getName());
		} catch (Exception e) {
			
		}
		String t=getNowDateAndTime();
		thysyywHysydtHaxJcxx.setAddtime(t);
		thysyywHysydtHaxJcxx.setLastupdatetime(t);
		dgIffService.saveHaxInfoByHax(thysyywHysydtHaxJcxx);
		return "saveHaxInfoSuc";
	}
	/**
	 * 查询
	 * @return
	 */
	public String searchHaxByEntity(){
		
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxListByEntity(thysyywHysydtHaxJcxx,pageBean);
		return "searchHaxByEntitySuc";
	}
	/**
	 * 进入修改页面
	 * @return
	 */
	public String ToUpdateHaxJsp(){
		System.out.println("id="+id);
		thysyywHysydtHaxJcxx=dgIffService.getHaxJcxxInfoById(id);
		dicList=this.dgIffService.getDictionaryListByKey("一级海岸线类型");
		dicList2=this.dgIffService.getDictionaryListByKey("二级海岸线类型");
		dicList3=this.dgIffService.getDictionaryListByKey("三级海岸线类型");
		return "ToUpdateHaxJspSuc";
	}
	/**
	 * 保存修改的信息
	 * @return
	 */
	public String saveUpdateHaxInfo(){
		System.out.println("thysyywHysydtHaxJcxx.getId()="+thysyywHysydtHaxJcxx.getId());
		try {
			thysyywHysydtHaxJcxx.setAdduserid(((User)session.get("user")).getId());
			thysyywHysydtHaxJcxx.setAddusername(((User)session.get("user")).getName());
		} catch (Exception e) {
			
		}
		thysyywHysydtHaxJcxx.setLastupdatetime(getNowDateAndTime());
		dgIffService.saveUpdateHaxInfo(thysyywHysydtHaxJcxx);
		return "saveUpdateHaxInfoSuc";
	}
	/**
	 * 删除
	 * @return
	 */
	public String deleteHaxInfo(){
		System.out.println("id="+id);
		thysyywHysydtHaxJcxx.setId(Long.valueOf(id));
		dgIffService.deleteHaxInfoById(thysyywHysydtHaxJcxx);
		return "deleteHaxInfoSuc";
	}
	/**
	 * 查询后进入详情页面
	 * @return
	 */
	public String ToDetaileHaxJsp(){
		System.out.println("id="+id);
		thysyywHysydtHaxJcxx=dgIffService.getHaxJcxxInfoById(id);
		return "ToDetaileHaxJspSuc";
	}
	
	
	
	/*****************海岸线动态监视监测管理*********************/
	
	
	
	/**
	 * 查询监视监测信息列表
	 * @return
	 */
	public String JsjcListView(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		thysyywHysydtHaxJsjcList=this.dgIffService.getJsjcListByIdOrNull(null,pageBean);
		//查询海岸线list
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList(null,null);
		return "JsjcListViewSuc";
	}
	/**
	 * 进入监视监测新增页面
	 * @return
	 */
	public String toAddJsjcInfo(){
		//查询海岸线list
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList(null,null);
		return "toAddJsjcInfoSuc";
	}
	/**
	 * 保存监视监测的信息
	 * @return
	 */
	public String saveJsjcInfo(){
		System.out.println("thysyywHysydtHaxJsjc.getHaxid()="+thysyywHysydtHaxJsjc.getHaxid());
		try {
			thysyywHysydtHaxJsjc.setAdduserid(((User)session.get("user")).getId());
			thysyywHysydtHaxJsjc.setAddusername(((User)session.get("user")).getName());
		} catch (Exception e) {
			
		}
		thysyywHysydtHaxJcxx=dgIffService.getHaxJcxxInfoById(thysyywHysydtHaxJsjc.getHaxid());
		thysyywHysydtHaxJsjc.setHaxname(thysyywHysydtHaxJcxx.getName());
		String t=getNowDateAndTime();
		thysyywHysydtHaxJsjc.setAddtime(t);
		thysyywHysydtHaxJsjc.setLastupdatetime(t);
		this.dgIffService.saveJsjcInfo(thysyywHysydtHaxJsjc);
		return "saveJsjcInfoSuc";
	}
	/**
	 * 查询并跳转到监视监测修改页面
	 * @return
	 */
	public String ToUpdateJsjcJsp(){
		System.out.println("id="+id);
		thysyywHysydtHaxJsjc=this.dgIffService.getJsjcInfoById(id);
		//查询海岸线list
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList(null,null);
		return "ToUpdateJsjcJspSuc";
	}
	/**
	 * 监视监测保存修改的信息
	 * @return
	 */
	public String saveUpdateJsjcInfo(){
		System.out.println("thysyywHysydtHaxJsjc.getHaxid()="+thysyywHysydtHaxJsjc.getHaxid());
		try {
			thysyywHysydtHaxJsjc.setAdduserid(((User)session.get("user")).getId());
			thysyywHysydtHaxJsjc.setAddusername(((User)session.get("user")).getName());
		} catch (Exception e) {
			
		}
		thysyywHysydtHaxJcxx=dgIffService.getHaxJcxxInfoById(thysyywHysydtHaxJsjc.getHaxid());
		thysyywHysydtHaxJsjc.setHaxname(thysyywHysydtHaxJcxx.getName());
		thysyywHysydtHaxJsjc.setLastupdatetime(getNowDateAndTime());
		this.dgIffService.saveUpdateJsjcInfo(thysyywHysydtHaxJsjc);
		return "saveJsjcInfoSuc";
	}
	/**
	 * 删除监视监测信息
	 * @return
	 */
	public String deleteJsjcInfo(){
		System.out.println("id="+id);
		thysyywHysydtHaxJsjc.setId(Long.valueOf(id));
		this.dgIffService.deleteJsjcInfoById(thysyywHysydtHaxJsjc);
		return "saveJsjcInfoSuc";
	}
	/**
	 * 跳转到详情页面
	 * @return
	 */
	public String ToDetaileJsjcJsp(){
		System.out.println("id="+id);
		thysyywHysydtHaxJsjc=this.dgIffService.getJsjcInfoById(id);
		//查询海岸线list
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList(null,null);
		return "ToDetaileJsjcJspSuc";
	}
	/**
	 * 查询监视监测list
	 * @return
	 */
	public String searchJsjcByEntity(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		thysyywHysydtHaxJsjcList=dgIffService.getHaxJsjcListByEntity(thysyywHysydtHaxJsjc,pageBean);
		//查询海岸线list
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList(null,null);
		return "searchJsjcByEntitySuc";
	}
	/**
	 * 获得当前日期
	 * @return
	 */
	public String getNowDateAndTime(){
		Calendar c = Calendar.getInstance();
		Date date = c.getTime();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式
		String datetime = dateFormat.format(date);
		System.out.println("系统当前时间："+datetime);
	    return datetime;
	}
	
	
	/*****************海岸线调查统计*********************/
	
	
	
	
	/**
	 * 查询调查统计信息列表
	 * @return
	 */
	public String dctjListView(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		thysyywHysydtHaxDctjList=this.dgIffService.getDctjListByIdOrNull(null,pageBean);
		//查询海岸线list
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList(null,null);
		return "dctjListViewSuc";
	}
	/**
	 * 跳转到新增页面
	 * @return
	 */
	public String toAddDctjInfo(){
		dicList=this.dgIffService.getDictionaryListByKey("一级海岸线类型");
		dicList2=this.dgIffService.getDictionaryListByKey("二级海岸线类型");
		dicList3=this.dgIffService.getDictionaryListByKey("三级海岸线类型");
		dicList4=this.dgIffService.getDictionaryListByKey("海岸线保护类别");
		dicList5=this.dgIffService.getDictionaryListByKey("开发利用现状");
		dicList6=this.dgIffService.getDictionaryListByKey("整治修复情况");
		dicList7=this.dgIffService.getDictionaryListByKey("动态变化情况");
		//查询海岸线list
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList(null,null);
		return "toAddDctjInfoSuc";
	}
	/**
	 * 保存调查统计的信息
	 * @return
	 */
	public String saveDctjInfo(){
		System.out.println("thysyywHysydtHaxDctj.getHaxid()="+thysyywHysydtHaxDctj.getHaxid());
		try {
			thysyywHysydtHaxDctj.setAdduserid(((User)session.get("user")).getId());
			thysyywHysydtHaxDctj.setAddusername(((User)session.get("user")).getName());
		} catch (Exception e) {
			
		}
		thysyywHysydtHaxJcxx=dgIffService.getHaxJcxxInfoById(thysyywHysydtHaxDctj.getHaxid());
		thysyywHysydtHaxDctj.setHaxname(thysyywHysydtHaxJcxx.getName());
		String t=getNowDateAndTime();
		thysyywHysydtHaxDctj.setAddtime(t);
		thysyywHysydtHaxDctj.setLastupdatetime(t);
		this.dgIffService.saveDctjInfo(thysyywHysydtHaxDctj);
		return "ToDctjViewSuc";
	}
	/**
	 * 跳转到修改页面
	 * @return
	 */
	public String ToUpdateDctjJsp(){
		System.out.println("id="+id);
		thysyywHysydtHaxDctj=this.dgIffService.getDctjById(id);
		dicList=this.dgIffService.getDictionaryListByKey("一级海岸线类型");
		dicList2=this.dgIffService.getDictionaryListByKey("二级海岸线类型");
		dicList3=this.dgIffService.getDictionaryListByKey("三级海岸线类型");
		dicList4=this.dgIffService.getDictionaryListByKey("海岸线保护类别");
		dicList5=this.dgIffService.getDictionaryListByKey("开发利用现状");
		dicList6=this.dgIffService.getDictionaryListByKey("整治修复情况");
		dicList7=this.dgIffService.getDictionaryListByKey("动态变化情况");
		//查询海岸线list
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList(null,null);
		return "ToUpdateDctjJspSuc";
	}
	/**
	 * 保存调查统计修改的信息
	 * @return
	 */
	public String saveUpdateDctjInfo(){
		System.out.println("thysyywHysydtHaxDctj.getHaxid()="+thysyywHysydtHaxDctj.getHaxid());
		try {
			thysyywHysydtHaxDctj.setAdduserid(((User)session.get("user")).getId());
			thysyywHysydtHaxDctj.setAddusername(((User)session.get("user")).getName());
		} catch (Exception e) {
			
		}
		thysyywHysydtHaxJcxx=dgIffService.getHaxJcxxInfoById(thysyywHysydtHaxDctj.getHaxid());
		thysyywHysydtHaxDctj.setHaxname(thysyywHysydtHaxJcxx.getName());
		String t=getNowDateAndTime();
		thysyywHysydtHaxDctj.setLastupdatetime(t);
		this.dgIffService.saveUpdateDctjInfo(thysyywHysydtHaxDctj);
		return "ToDctjViewSuc";
	}
	/**
	 * 调查统计详情展示
	 * @return
	 */
	public String ToDetaileDctjJsp(){
		System.out.println("id="+id);
		thysyywHysydtHaxDctj=this.dgIffService.getDctjById(id);
		return "ToDetaileDctjJspSuc";
	}
	/**
	 * 调查统计删除
	 * @return
	 */
	public String deleteDctjInfo(){
		System.out.println("id="+id);
		thysyywHysydtHaxDctj.setId(Long.valueOf(id));
		this.dgIffService.deleteDctjInfoById(thysyywHysydtHaxDctj);
		return "ToDctjViewSuc";
	}
	/**
	 * 查询
	 * @return
	 */
	public String searchDctjByEntity(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		thysyywHysydtHaxDctjList=dgIffService.getHaxDctjListByEntity(thysyywHysydtHaxDctj,pageBean);
		//查询海岸线list
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList(null,null);
		return "searchDctjByEntitySuc";
	}
	
	
	/********海岸线规划信息管理******开始************/
	
	//根据涉海部门（市海洋局、市交通港口局、上海海事局等）的相关海岸线规划，对海岸线进行管理。
	
	
	/**
	 * 
	Description :规划信息列表
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:11:19
	 */
	public String fetchHaxGhxxList(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		ghxxList = dgIffService.fetchHaxGhxxList(searchForm, pageBean);
		return "ghxxIndex";	
	}
	
	/**
	 * 
	Description :新增规划信息
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:11:19
	 */
	public String addHaxGhxx(){
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywHysydtHaxGhxx.setAddtime(xzsj);
		hysyywHysydtHaxGhxx.setLastupdatetime(xzsj);
		hysyywHysydtHaxGhxx.setAddusername(userXm);
		hysyywHysydtHaxGhxx.setAdduserid(userId);
		//上传文件
		if(uploadFileName != null && !uploadFileName.equals("")){
			String dowloadPath_hax="C:/hydg/hax/";
			String path=uploadFile(dowloadPath_hax,upload,uploadFileName);//上传
			hysyywHysydtHaxGhxx.setFj(uploadFileName);
			hysyywHysydtHaxGhxx.setWjbclj(path);
		}
		businessService.addObject(hysyywHysydtHaxGhxx);
		return "addGhxxSuccess";
	}
	/**
	 * 
	Description :规划信息详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:12:21
	 */
	public String fetchGhxxDetail(){
		System.out.println("ghID="+ghID);
		hysyywHysydtHaxGhxx = dgIffService.fetchHaxGhxxDetail(ghID);
		return "goGhxxDetail";
	}
	/**
	 * 
	Description :获取修改的规划信息
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:12:50
	 */
	public String fetchForUpdateGhxx(){
		System.out.println("ghID="+ghID);
		hysyywHysydtHaxGhxx = dgIffService.fetchHaxGhxxDetail(ghID);
		return "goGhxxUpdate";
	}
	/**
	 * 
	Description :修改规划信息
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:13:58
	 */
	public String updateGhxx(){
		System.out.println("ghID="+ghID);
		String xzsj=this.getDateTime();
		hysyywHysydtHaxGhxx.setLastupdatetime(xzsj);
		//上传文件
		if(uploadFileName != null && !uploadFileName.equals("")){
			String dowloadPath_hax="C:/hydg/hax/";
			String path=uploadFile(dowloadPath_hax,upload,uploadFileName);//上传
			hysyywHysydtHaxGhxx.setFj(uploadFileName);
			hysyywHysydtHaxGhxx.setWjbclj(path);
		}
		businessService.updateObject(hysyywHysydtHaxGhxx);
		return "addGhxxSuccess";
	}
	/**
	 * 
	Description :删除规划信息
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:14:40
	 */
	public String deleteGhxx(){
		System.out.println("ghID="+ghID);
		dgIffService.deleteHaxGhxx(ghID);
		return "addGhxxSuccess";
	}
	
	/**
	 * 
	Description :上传文件
	@param:@param realPath
	@param:@param upload1
	@param:@param uploadfilename
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:34:24
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
			System.out.println("文件类型:   " + uploadContentType);
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
	
	/**
	 * 
	Description :下载附件
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:34:31
	 */
	public String downLoadHaxfj(){
		System.out.println("fileName="+fileName);
		return "downLoadHaxfj";
	}
	public InputStream getDownLoadFileHaxfj(){
		System.out.println("进入getDownloadFile.....");
		String dowloadPath_mediafj="C:/hydg/hax/";
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
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-11 下午04:34:39
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
    Description :打开PDF
    @param:@return
    @return:String
    @throws
    @Author：yinying
    @Create 2017-11-11 下午04:56:49
     */
	public String openPdf(){
		String realPath = "C:/hydg/hax";
		System.out.println("文件路径：" + realPath);
		System.out.println("文件详细路径：" + realPath + File.separator + fileName);
		String path = realPath + File.separator + fileName;
		
		File serFile = new File(realPath);
		//判断服务器上该目录是否存在，不存在则创建目录
		if(!serFile.exists()){
			HttpServletRequest request1 = ServletActionContext.getRequest();
			request1.setAttribute("mess","<script language='javascript'>alert('路径下找不到该文件。')</script>");	
			System.out.println("找不到该文件。");
			//给一个死值
		}else {
			System.out.println("路径下找到该文件。。。。");
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("application/pdf");
	        FileInputStream in;
			try {
				in = new FileInputStream(new File(path));
				OutputStream out = response.getOutputStream();
		        byte[] b = new byte[512];
		        while ((in.read(b)) != -1) {
		            out.write(b);
		        }
		        out.flush();
		        in.close();
		        out.close();
				
			} catch (FileNotFoundException e) {
				System.out.println("1路径下找不到该文件。");
				HttpServletRequest request1 = ServletActionContext.getRequest();
				request1.setAttribute("mess","<script language='javascript'>alert('路径下找不到该文件。')</script>");	
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println("2路径下找不到该文件。");
				e.printStackTrace();
				
			}    
			
		}	
		return null;
	}
	
	/********海岸线整治修复******开始************/
	
	
	/** 整治修复查询
	 * 
	Description :
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-13 下午03:01:33
	 */
	public String fetchHaxZzxfList(){
		System.out.println("整治修复查询");
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		zzxfList = dgIffService.fetchHaxZzxfList(searchForm, pageBean);
		
		//查询海岸线list
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList(null,null);
		
		return "zzxfIndex";
	}
	/**
	 * 
	Description :到整治修复新增页面
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-13 下午03:32:17
	 */
	public String goAddZzxf(){
		//查询海岸线list
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList(null,null);
		return "toAddZzxfInfo";
	}
	
	/**
	 * 
	Description :新增整治修复
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-13 下午03:02:00
	 */
	public String addHaxZzxf(){
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		thysyywHysydtHaxJcxx=dgIffService.getHaxJcxxInfoById(hysyywHysydtHaxZzxf.getHaxid()+"");
		hysyywHysydtHaxZzxf.setHaxmc(thysyywHysydtHaxJcxx.getName());
		
		hysyywHysydtHaxZzxf.setAddtime(xzsj);
		hysyywHysydtHaxZzxf.setLastupdatetime(xzsj);
		hysyywHysydtHaxZzxf.setAddusername(userXm);
		hysyywHysydtHaxZzxf.setAdduserid(userId);
		businessService.addObject(hysyywHysydtHaxZzxf);
		return "addZzxfSuccess";
	}
	
	/**
	 * 
	Description :整治修复详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-13 下午03:02:32
	 */
	public String fetchZzxfDetail(){
		System.out.println("zzID="+zzID);
		hysyywHysydtHaxZzxf = dgIffService.fetchHaxZzxfDetail(zzID);
		return "goZzxfDetail";
	}
	/**
	 * 
	Description :获取修改的整治修复
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-13 下午03:03:45
	 */
	public String fetchForUpdateZzxf(){
		System.out.println("zzID="+zzID);
		hysyywHysydtHaxZzxf = dgIffService.fetchHaxZzxfDetail(zzID);
		
		//查询海岸线list
		thysyywHysydtHaxJcxxList=dgIffService.getHaxJcxxList(null,null);
		
		return "goZzxfUpdate";
	}
	/**
	 * 
	Description :修改整治修复
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-13 下午03:04:58
	 */
	public String updateZzxf(){
		System.out.println("zzID="+zzID);
		String xzsj=this.getDateTime();
		hysyywHysydtHaxZzxf.setLastupdatetime(xzsj);
		
		thysyywHysydtHaxJcxx=dgIffService.getHaxJcxxInfoById(hysyywHysydtHaxZzxf.getHaxid()+"");
		hysyywHysydtHaxZzxf.setHaxmc(thysyywHysydtHaxJcxx.getName());
		
		businessService.updateObject(hysyywHysydtHaxZzxf);
		return "addZzxfSuccess";
	}
	/**
	 * 
	Description :删除整治修复
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-13 下午03:05:25
	 */
	public String deleteZzxf(){
		System.out.println("zzID="+zzID);
		dgIffService.deleteHaxZzxf(zzID);
		return "addZzxfSuccess";
	}
	
	
	/*************************************海岸线动态修订*****************************************************/
	
	
	/**
	 * 
	Description :经纬度模板下载
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-3-2 下午05:03:50
	 */
	public String downLoadHaxdtxdJwd(){
		System.out.println("下载海岸线动态修订坐标上传模板.....");
		fileName="海岸线动态修订坐标上传模板.xls";
		return "downLoadHaxdtxdJwd";
	}
	
	public InputStream getDownLoadFileHaxdtxdJwd(){
		System.out.println("进入getDownloadFile.....");
	    System.out.println(ServletActionContext.getServletContext().getResourceAsStream("/files/"+fileName));
	   	//FileInputStream fis=ServletActionContext.getServletContext().getResourceAsStream("/hcbdmb/"+fileName);		 
		return ServletActionContext.getServletContext().getResourceAsStream("/files/"+fileName);
	}

	//上传
	public String saveHaxdtxd(){
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
		coastlineDefineService.addCoastlineInfo(coastline);
		
		return "goHaxdtxd";
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
	
	
	
	
	
	
	
	
	/******************************************************************************************/
	public THysyywHysydtHaxJcxx getThysyywHysydtHaxJcxx() {
		return thysyywHysydtHaxJcxx;
	}
	public void setThysyywHysydtHaxJcxx(THysyywHysydtHaxJcxx thysyywHysydtHaxJcxx) {
		this.thysyywHysydtHaxJcxx = thysyywHysydtHaxJcxx;
	}
	public List<?> getThysyywHysydtHaxJcxxList() {
		return thysyywHysydtHaxJcxxList;
	}
	public void setThysyywHysydtHaxJcxxList(
			List<?> thysyywHysydtHaxJcxxList) {
		this.thysyywHysydtHaxJcxxList = thysyywHysydtHaxJcxxList;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public THysyywHysydtHaxJsjc getThysyywHysydtHaxJsjc() {
		return thysyywHysydtHaxJsjc;
	}
	public void setThysyywHysydtHaxJsjc(THysyywHysydtHaxJsjc thysyywHysydtHaxJsjc) {
		this.thysyywHysydtHaxJsjc = thysyywHysydtHaxJsjc;
	}
	public List<THysyywHysydtHaxJsjc> getThysyywHysydtHaxJsjcList() {
		return thysyywHysydtHaxJsjcList;
	}
	public void setThysyywHysydtHaxJsjcList(
			List<THysyywHysydtHaxJsjc> thysyywHysydtHaxJsjcList) {
		this.thysyywHysydtHaxJsjcList = thysyywHysydtHaxJsjcList;
	}
	public THysyywHysydtHaxDctj getThysyywHysydtHaxDctj() {
		return thysyywHysydtHaxDctj;
	}
	public void setThysyywHysydtHaxDctj(THysyywHysydtHaxDctj thysyywHysydtHaxDctj) {
		this.thysyywHysydtHaxDctj = thysyywHysydtHaxDctj;
	}
	public List<?> getThysyywHysydtHaxDctjList() {
		return thysyywHysydtHaxDctjList;
	}
	public void setThysyywHysydtHaxDctjList(
			List<?> thysyywHysydtHaxDctjList) {
		this.thysyywHysydtHaxDctjList = thysyywHysydtHaxDctjList;
	}
	public List<?> getDicList() {
		return dicList;
	}
	public void setDicList(List<?> dicList) {
		this.dicList = dicList;
	}
	public List<?> getDicList2() {
		return dicList2;
	}
	public void setDicList2(List<?> dicList2) {
		this.dicList2 = dicList2;
	}
	public List<?> getDicList3() {
		return dicList3;
	}
	public void setDicList3(List<?> dicList3) {
		this.dicList3 = dicList3;
	}
	public List<?> getDicList4() {
		return dicList4;
	}
	public void setDicList4(List<?> dicList4) {
		this.dicList4 = dicList4;
	}
	public List<?> getDicList5() {
		return dicList5;
	}
	public void setDicList5(List<?> dicList5) {
		this.dicList5 = dicList5;
	}
	public List<?> getDicList6() {
		return dicList6;
	}
	public void setDicList6(List<?> dicList6) {
		this.dicList6 = dicList6;
	}
	public List<?> getDicList7() {
		return dicList7;
	}
	public void setDicList7(List<?> dicList7) {
		this.dicList7 = dicList7;
	}
	public DgIffService getDgIffService() {
		return dgIffService;
	}
	public void setDgIffService(DgIffService dgIffService) {
		this.dgIffService = dgIffService;
	}
	public THysyywHysydtHaxGhxx getHysyywHysydtHaxGhxx() {
		return hysyywHysydtHaxGhxx;
	}
	public void setHysyywHysydtHaxGhxx(THysyywHysydtHaxGhxx hysyywHysydtHaxGhxx) {
		this.hysyywHysydtHaxGhxx = hysyywHysydtHaxGhxx;
	}
	public List<?> getGhxxList() {
		return ghxxList;
	}
	public void setGhxxList(List<?> ghxxList) {
		this.ghxxList = ghxxList;
	}
	public String getGhID() {
		return ghID;
	}
	public void setGhID(String ghID) {
		this.ghID = ghID;
	}
	public SearchForm getSearchForm() {
		return searchForm;
	}
	public void setSearchForm(SearchForm searchForm) {
		this.searchForm = searchForm;
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
	public THysyywHysydtHaxZzxf getHysyywHysydtHaxZzxf() {
		return hysyywHysydtHaxZzxf;
	}
	public void setHysyywHysydtHaxZzxf(THysyywHysydtHaxZzxf hysyywHysydtHaxZzxf) {
		this.hysyywHysydtHaxZzxf = hysyywHysydtHaxZzxf;
	}
	public List<?> getZzxfList() {
		return zzxfList;
	}
	public void setZzxfList(List<?> zzxfList) {
		this.zzxfList = zzxfList;
	}
	public String getZzID() {
		return zzID;
	}
	public void setZzID(String zzID) {
		this.zzID = zzID;
	}
	public CoastlineInfoService getCoastlineDefineService() {
		return coastlineDefineService;
	}
	public void setCoastlineDefineService(
			CoastlineInfoService coastlineDefineService) {
		this.coastlineDefineService = coastlineDefineService;
	}
	public CoastlineInfo getCoastline() {
		return coastline;
	}
	public void setCoastline(CoastlineInfo coastline) {
		this.coastline = coastline;
	}

	
	
	
}
