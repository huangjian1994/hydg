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
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.PatorlSearchForm;
import com.htcf.entity.THyxcHdxcFkfj;
import com.htcf.entity.THyxcHdxcFkjcxx;
import com.htcf.entity.THyxcHdxcFxwt;
import com.htcf.entity.User;
import com.htcf.service.IPatorlReportService;

/**
 * 巡查上报
 * @author yinying
 *
 */
@Controller("patorlReportAction")
@Scope("prototype")
public class PatorlReportAction  extends BaseAction{
	@Autowired
	private IPatorlReportService patorlReportService;

	//实体
	private THyxcHdxcFxwt hyxcHdxcFxwt = new THyxcHdxcFxwt();
	private PatorlSearchForm patorlSearchForm = new PatorlSearchForm();
	private THyxcHdxcFkjcxx hyxcHdxcFkjcxx = new THyxcHdxcFkjcxx();
	private THyxcHdxcFkfj hyxcHdxcFkfj = new THyxcHdxcFkfj();
	
	
	//List
	private List<?> reportList;
	private List<?> xcfkList;
	private List<?> xcfkfjList;
	private List<?> xcjhList;
	
	//变量
	private String prID;//巡查问题上报ID
	private String fkID;//反馈ID
	private String xcjhID;//巡查计划ID
	private String fkfjID;//反馈附件ID
	
	private File upload;
	private String uploadFileName;// 文件名
	private String uploadContentType; // 上传的文件类型
	
	private File uploadFj[];
	private String uploadFjFileName[];// 文件名
	private String uploadFjContentType[]; // 上传的文件类型
	
	private InputStream inputStream;
	
	/**
	 * 
	Description :巡查上报:查询
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:38:47
	 */
	public String fetchPatorlReport(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		reportList = patorlReportService.fetchPatorlReportList(patorlSearchForm, pageBean);
		return "reportIndex";
	}
	
	
	/**
	 * 
	Description :巡查上报:新增
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:38:59
	 */
	public String addReport(){
		
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hyxcHdxcFxwt.setAddtime(xzsj);
		hyxcHdxcFxwt.setLastupdatetime(xzsj);
		hyxcHdxcFxwt.setSbrid(userId);
		hyxcHdxcFxwt.setXgrxm(userXm);
		String zpfj="C:/hydg/hyhd/hdxc/";
		String path=uploadFile(zpfj,upload,uploadFileName);//上传
		File f = new File(path);
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(f);
			byte[] bs = new byte[fis.available()];
			fis.read(bs);
			//t.setZp(Hibernate.createBlob(fis));
			hyxcHdxcFxwt.setXczp(bs);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		hyxcHdxcFxwt.setSbzt("未解决");
		patorlReportService.addObject(hyxcHdxcFxwt);
		
		return "addReportSuccess";
	}
	
	/**
	 * 
	Description :巡查上报:详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:39:07
	 */
	public String reportDetail(){
		System.out.println("prID="+prID);
		hyxcHdxcFxwt = patorlReportService.fetchReportDetail(prID);
		
		return "goReportDetail";
	}
	
	/**
	 * 
	Description :巡查上报:获取修改
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:39:18
	 */
	public String getReportUpdate(){
		System.out.println("prID="+prID);
		hyxcHdxcFxwt = patorlReportService.fetchReportDetail(prID);
		
		return "goReportUpdate";
	}
	
	/**
	 * 
	Description :巡查上报:修改
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:39:25
	 */
	public String updateReport(){
		System.out.println("主键="+hyxcHdxcFxwt.getId());
		System.out.println("巡查照片="+hyxcHdxcFxwt.getXczp());
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hyxcHdxcFxwt.setLastupdatetime(xzsj);
		hyxcHdxcFxwt.setXgrxm(userXm);
		
		if(upload != null && !upload.equals("") && uploadFileName != null && !uploadFileName.equals("")){
			String zpfj="C:/hydg/hyhd/hdxc/";
			String path=uploadFile(zpfj,upload,uploadFileName);//上传
			File f = new File(path);
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(f);
				byte[] bs = new byte[fis.available()];
				fis.read(bs);
				//t.setZp(Hibernate.createBlob(fis));
				hyxcHdxcFxwt.setXczp(bs);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		hyxcHdxcFxwt.setSbzt("未解决");
		
		patorlReportService.updateObject(hyxcHdxcFxwt);
		
		return "addReportSuccess";
	}
	
	
	/**
	 * 
	Description :巡查上报:删除
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-3-23 下午04:39:35
	 */
	public String deleteReport(){
		
		System.out.println("prID="+prID);
		patorlReportService.deleteReport(prID);
		
		return "addReportSuccess";
	}
	
	/**
	 * 
	Description :展示照片
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-3-26 下午05:46:06
	 */
	public String fetchReportZp(){
		System.out.println("prID="+prID);
		hyxcHdxcFxwt = patorlReportService.fetchReportDetail(prID);
		
		inputStream = new ByteArrayInputStream(hyxcHdxcFxwt.getXczp());	
		
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
	@Create 2018-3-26 下午05:47:11
	 */
	public String fetchReportZpDetail(){
		System.out.println("prID="+prID);
		hyxcHdxcFxwt = patorlReportService.fetchReportDetail(prID);
		return "reportZpDetail";
	}
	
	/**
	 * 
	Description :
	@param:@param realPath
	@param:@param upload1
	@param:@param uploadfilename
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-3-26 下午05:45:23
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
	/***************************巡查计划************************************/
	
	
	/**
	 * 
	Description :巡查计划
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-4-2 下午04:37:20
	 */
	public String fetchXcjhList(){
		
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
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		xcjhList = patorlReportService.fetchChxcList(patorlSearchForm, pageBean, userName, userRoleName);
		
		
//        xcfkList = islandPatrolService.fetchChxctShList(xcjhEntity, pageBean,userName,userRoleName);
		
		return "xcfk_Index";
	}
	
	
	/***************************巡查信息反馈************************************/
	
	
	
	/**
	 * 
	Description :巡查信息反馈：查询
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-3-28 下午04:56:34
	 */
	public String fetchPatorlFk(){
		System.out.println("xcjhID="+xcjhID);
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		xcfkList = patorlReportService.fetchPatorlFkList(patorlSearchForm, pageBean,xcjhID);
		return "xcfkIndex";
	}
	
	/**
	 * 
	Description :到新增页面
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-4-2 下午05:02:28
	 */
	public String goAddXcxxfk(){
		System.out.println("xcjhID="+xcjhID);
		return "goAddXcxxfk";
	}
	
	
	/**
	 * 
	Description :巡查信息反馈：新增
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-4-2 下午03:42:16
	 */
	public String addXcxxfk(){
		System.out.println("xcjhID="+xcjhID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hyxcHdxcFkjcxx.setAddtime(xzsj);
		hyxcHdxcFkjcxx.setUpdatetime(xzsj);
		hyxcHdxcFkjcxx.setUpdateuser(userXm);
		hyxcHdxcFkjcxx.setFeedbackid(userId);
		hyxcHdxcFkjcxx.setUpdateuserid(userId);
		hyxcHdxcFkjcxx.setPatrolid(xcjhID);
		patorlReportService.addObject(hyxcHdxcFkjcxx);
		
		//查出主键
		String fkxxid = patorlReportService.fetchFkxxId(xcjhID, xzsj);
		
		//判断是否上传
		
		//上传附件
		String[] path = null;
		try{
			path = this.uploadExcel();
		}catch(Exception e){
			System.out.println("上传报错");
		}
		
		THyxcHdxcFkfj hyxcHdxcFkfj1 = null;
		try{
		for(int j=0;j<path.length;j++){
			System.out.println("文件名:   " + uploadFjFileName[j]);
			System.out.println("path="+path[j]);
			hyxcHdxcFkfj1 = new THyxcHdxcFkfj();
			
			File f = new File(path[j]);
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(f);
				byte[] bs = new byte[fis.available()];
				fis.read(bs);
				hyxcHdxcFkfj1.setPhoto(bs);
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			hyxcHdxcFkfj1.setFiletype("照片");
			hyxcHdxcFkfj1.setFilepath(path[j]);
			hyxcHdxcFkfj1.setFilename(uploadFjFileName[j]);
			
			String dqsj=this.getDateTime();
			hyxcHdxcFkfj1.setFeedbacktime(dqsj);
			hyxcHdxcFkfj1.setFeedbackid(userId);
			hyxcHdxcFkfj1.setFeedbackname(userXm);
			
			hyxcHdxcFkfj1.setUpdatetime(dqsj);
			hyxcHdxcFkfj1.setUpdateuser(userXm);
			
			
			hyxcHdxcFkfj1.setPatrolid(xcjhID);
			hyxcHdxcFkfj1.setFkid(fkxxid);
			patorlReportService.addObject(hyxcHdxcFkfj1);
		}
		}catch(Exception e){
			System.out.println("保存附件报错");
		}
		
		//将巡查计划的状态更改为已反馈
		patorlReportService.updateXcjhZt(xcjhID);
		
		
		
		return "addXcxxfkSuccess";
	}
	
	/**
	 * 
	Description :巡查信息反馈：删除
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-4-2 下午05:21:55
	 */
	public String deleteXcxxfk(){
		System.out.println("fkID="+fkID+"，xcjhID="+xcjhID);
		
		patorlReportService.deletePatorlFk(fkID);
		fkfjID="";
		patorlReportService.deleteFkfj(fkID, xcjhID, fkfjID);
		
		return "addXcxxfkSuccess";
	}
	
	/**
	 * 
	Description :巡查信息反馈：详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-4-2 下午02:47:03
	 */
	public String fetchXcxxfkDetail(){
		System.out.println("fkID="+fkID+"，xcjhID="+xcjhID);
		
		hyxcHdxcFkjcxx = patorlReportService.fetchXcxxfkDeatil(fkID);
		//反馈附件列表
		xcfkfjList = patorlReportService.fetchXcxxfkfj(fkID, xcjhID);
		
		return "goXcxxfkDetail";
	}
	/**
	 * 
	Description :巡查信息反馈：修改
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-4-2 下午05:24:42
	 */
	public String getXcxxfkForUpdate(){
		
		System.out.println("fkID="+fkID+"，xcjhID="+xcjhID);
		
		hyxcHdxcFkjcxx = patorlReportService.fetchXcxxfkDeatil(fkID);
		//反馈附件列表
		xcfkfjList = patorlReportService.fetchXcxxfkfj(fkID, xcjhID);
		
		return "goXcxxfkUpdate";
	}
	
	/**
	 * 
	Description :修改巡查反馈信息
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-4-2 下午05:30:29
	 */
	public String updateXcxxfk(){
		System.out.println("fkID="+fkID+"，xcjhID="+xcjhID);
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hyxcHdxcFkjcxx.setUpdatetime(xzsj);
		hyxcHdxcFkjcxx.setUpdateuser(userXm);
		hyxcHdxcFkjcxx.setUpdateuserid(userId);

		patorlReportService.updateObject(hyxcHdxcFkjcxx);
		
		//上传附件
		String[] path = null;
		try{
			path = this.uploadExcel();
		}catch(Exception e){
			System.out.println("上传报错");
		}
		
		THyxcHdxcFkfj hyxcHdxcFkfj1 = null;
		try{
		for(int j=0;j<path.length;j++){
			System.out.println("文件名:   " + uploadFjFileName[j]);
			System.out.println("path="+path[j]);
			hyxcHdxcFkfj1 = new THyxcHdxcFkfj();
			
			File f = new File(path[j]);
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(f);
				byte[] bs = new byte[fis.available()];
				fis.read(bs);
				hyxcHdxcFkfj1.setPhoto(bs);
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			hyxcHdxcFkfj1.setFiletype("照片");
			hyxcHdxcFkfj1.setFilepath(path[j]);
			hyxcHdxcFkfj1.setFilename(uploadFjFileName[j]);
			
			String dqsj=this.getDateTime();
			hyxcHdxcFkfj1.setFeedbacktime(dqsj);
			hyxcHdxcFkfj1.setFeedbackid(userId);
			hyxcHdxcFkfj1.setFeedbackname(userXm);
			
			hyxcHdxcFkfj1.setUpdatetime(dqsj);
			hyxcHdxcFkfj1.setUpdateuser(userXm);
			
			
			hyxcHdxcFkfj1.setPatrolid(xcjhID);
			hyxcHdxcFkfj1.setFkid(fkID);
			patorlReportService.addObject(hyxcHdxcFkfj1);
		}
		}catch(Exception e){
			System.out.println("保存附件报错");
		}
		
		return "addXcxxfkSuccess";
	}

	/**
	 * 
	Description :删除巡查照片
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-4-4 下午04:19:50
	 */
	public String deleteZp(){
		System.out.println("fkID="+fkID+"，xcjhID="+xcjhID+",fkfjID="+fkfjID);
				
		patorlReportService.deleteFkfj(fkID, xcjhID, fkfjID);
		
		return "deleteZpSuccess";
	}
	
	/**
	 * 
	Description :反馈附件详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-3-28 下午05:29:31
	 */
	public String fetchFkfjDetail(){
		System.out.println("fkfjID="+fkfjID);
		hyxcHdxcFkfj = patorlReportService.fetchXcxxfkfjDeatil(fkfjID);
		return "";
	}
	
	public String[] uploadExcel() {
		System.out.println("进入上传EXCEL。。。。 ");
		FileInputStream fis = null; // 为了关闭资源
		FileOutputStream fos = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		String[] paths =new String[uploadFj.length];
		for(int i=0;i<uploadFj.length;i++){
			String path = null;
			try {
				System.out.println("upload:   " + uploadFj[i]);
				System.out.println("文件名:   " + uploadFjFileName[i]);
				System.out.println("文件类型:   " + uploadFjContentType[i]);
				fis = new FileInputStream(uploadFj[i]);
				// FileReader 一次只能读一个字符，一个汉字字符流 读汉字
				// 封装成，缓冲一下，可以读一行
				bis = new BufferedInputStream(fis);
				
			//	String realPath = ServletActionContext.getServletContext().getRealPath("/files");
				
				String realPath = "C:/hydg/hyhd/hdxc/";
				 
				System.out.println("文件路径：" + realPath);
				System.out.println("文件详细路径：" + realPath + File.separator
						+ uploadFjFileName[i]);
				path = realPath + File.separator + uploadFjFileName[i];
	
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
			paths[i]=path;
		}
		return paths;
	}
	/**
	 * 
	Description :反馈附件照片
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-4-4 下午04:09:43
	 */
	public String fetchXcfkZp(){
		
		System.out.println("fkfjID="+fkfjID);
		hyxcHdxcFkfj = patorlReportService.fetchXcxxfkfjDeatil(fkfjID);
		
		inputStream = new ByteArrayInputStream(hyxcHdxcFkfj.getPhoto());	
		
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
	@Create 2018-3-26 下午05:47:11
	 */
	public String fetchXcfkZpDetail(){
		System.out.println("fkfjID="+fkfjID);
		hyxcHdxcFkfj = patorlReportService.fetchXcxxfkfjDeatil(fkfjID);
		return "xcfkxxZpDetail";
	}
	
	//修改
	
	
	
	
	
	
	
	
	public IPatorlReportService getPatorlReportService() {
		return patorlReportService;
	}

	public void setPatorlReportService(IPatorlReportService patorlReportService) {
		this.patorlReportService = patorlReportService;
	}

	public THyxcHdxcFxwt getHyxcHdxcFxwt() {
		return hyxcHdxcFxwt;
	}

	public void setHyxcHdxcFxwt(THyxcHdxcFxwt hyxcHdxcFxwt) {
		this.hyxcHdxcFxwt = hyxcHdxcFxwt;
	}

	public List<?> getReportList() {
		return reportList;
	}

	public void setReportList(List<?> reportList) {
		this.reportList = reportList;
	}

	public String getPrID() {
		return prID;
	}

	public void setPrID(String prID) {
		this.prID = prID;
	}


	public PatorlSearchForm getPatorlSearchForm() {
		return patorlSearchForm;
	}


	public void setPatorlSearchForm(PatorlSearchForm patorlSearchForm) {
		this.patorlSearchForm = patorlSearchForm;
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


	public THyxcHdxcFkjcxx getHyxcHdxcFkjcxx() {
		return hyxcHdxcFkjcxx;
	}


	public void setHyxcHdxcFkjcxx(THyxcHdxcFkjcxx hyxcHdxcFkjcxx) {
		this.hyxcHdxcFkjcxx = hyxcHdxcFkjcxx;
	}


	public THyxcHdxcFkfj getHyxcHdxcFkfj() {
		return hyxcHdxcFkfj;
	}


	public void setHyxcHdxcFkfj(THyxcHdxcFkfj hyxcHdxcFkfj) {
		this.hyxcHdxcFkfj = hyxcHdxcFkfj;
	}


	public List<?> getXcfkList() {
		return xcfkList;
	}


	public void setXcfkList(List<?> xcfkList) {
		this.xcfkList = xcfkList;
	}


	public List<?> getXcfkfjList() {
		return xcfkfjList;
	}


	public void setXcfkfjList(List<?> xcfkfjList) {
		this.xcfkfjList = xcfkfjList;
	}


	public String getFkID() {
		return fkID;
	}


	public void setFkID(String fkID) {
		this.fkID = fkID;
	}


	public String getXcjhID() {
		return xcjhID;
	}


	public void setXcjhID(String xcjhID) {
		this.xcjhID = xcjhID;
	}


	public String getFkfjID() {
		return fkfjID;
	}


	public void setFkfjID(String fkfjID) {
		this.fkfjID = fkfjID;
	}


	public List<?> getXcjhList() {
		return xcjhList;
	}


	public void setXcjhList(List<?> xcjhList) {
		this.xcjhList = xcjhList;
	}


	public File[] getUploadFj() {
		return uploadFj;
	}


	public void setUploadFj(File[] uploadFj) {
		this.uploadFj = uploadFj;
	}


	public String[] getUploadFjFileName() {
		return uploadFjFileName;
	}


	public void setUploadFjFileName(String[] uploadFjFileName) {
		this.uploadFjFileName = uploadFjFileName;
	}


	public String[] getUploadFjContentType() {
		return uploadFjContentType;
	}


	public void setUploadFjContentType(String[] uploadFjContentType) {
		this.uploadFjContentType = uploadFjContentType;
	}
	
	
}
