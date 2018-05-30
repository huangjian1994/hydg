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
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywNwbjkZzgl;
import com.htcf.entity.User;
import com.htcf.service.IBusinessService;
import com.htcf.service.IQualificationService;

/**
 * 内外部接口——资质管理接口
 * @author yinying
 *
 */
@Controller("qualificationAction")
@Scope("prototype")
public class QualificationAction extends BaseAction{
	@Autowired
	private IBusinessService businessService;
	
	@Autowired
	private IQualificationService qualificationService;

	//实体
	private THysyywNwbjkZzgl hysyywNwbjkZzgl = new THysyywNwbjkZzgl();
	private SearchForm searchForm = new SearchForm();
	
	//List
	private List<?> zzList;
	
	//变量
	private String zzID;//资质ID
	private String zzType;
	
	private File upload;
	private String uploadFileName;// 文件名
	private String uploadContentType; // 上传的文件类型
	
	private File uploadSjwj;
	private String uploadSjwjFileName;// 文件名
	private String uploadSjwjContentType; // 上传的文件类型
	private String fileName;
	private String filePath;
	private InputStream inputStream;	
	
	/**
	 * 
	Description :查询资质列表
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:38:54
	 */
	public String fetchQualificationList(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		zzList = qualificationService.fetchZzglList(pageBean, searchForm);
		return "qualificationList";
	}
	
	/**
	 * 
	Description :新增资质
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:41:23
	 */
	public String addQualification(){
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userXm = ((User)session.get("user")).getName();//
		}catch(Exception e){
		    return "dlCs";
		}
		String xzsj=this.getDateTime();
		hysyywNwbjkZzgl.setAddtime(xzsj);
		hysyywNwbjkZzgl.setLastupdatetime(xzsj);
		hysyywNwbjkZzgl.setAddusername(userXm);
		hysyywNwbjkZzgl.setAdduserid(userId);
		//证书等级、、资质等级
		if(hysyywNwbjkZzgl.getZzdj() != null && !hysyywNwbjkZzgl.getZzdj().equals("")){
			hysyywNwbjkZzgl.setZsdj(hysyywNwbjkZzgl.getZzdj());
		}
		//选择某一个，其他为空
		if(hysyywNwbjkZzgl.getZzlx().equals("海域使用论证资质证书")){
			hysyywNwbjkZzgl.setZcdz("");
			hysyywNwbjkZzgl.setZyfw("");
			hysyywNwbjkZzgl.setChzlfcfzr("");
			
			hysyywNwbjkZzgl.setLzbgmc("");
			hysyywNwbjkZzgl.setLzdw("");
			hysyywNwbjkZzgl.setZzdj("");
			hysyywNwbjkZzgl.setXmfzr("");
			hysyywNwbjkZzgl.setZzpsbm("");
			hysyywNwbjkZzgl.setPszjzzz("");
			hysyywNwbjkZzgl.setPsrq("");
			hysyywNwbjkZzgl.setZlpgf("");
			
			hysyywNwbjkZzgl.setChfzr("");
			hysyywNwbjkZzgl.setChdw("");
			hysyywNwbjkZzgl.setChrq("");
			hysyywNwbjkZzgl.setChds("");
			hysyywNwbjkZzgl.setTy("");
			hysyywNwbjkZzgl.setGlblc("");
			hysyywNwbjkZzgl.setZbxmc("");
			
		}
		if(hysyywNwbjkZzgl.getZzlx().equals("测绘资质证书")){
			hysyywNwbjkZzgl.setYwfw("");
			hysyywNwbjkZzgl.setLxdz("");
			hysyywNwbjkZzgl.setLxbm("");
			hysyywNwbjkZzgl.setLxr("");
			hysyywNwbjkZzgl.setDh("");
			hysyywNwbjkZzgl.setE_mail("");
			
			hysyywNwbjkZzgl.setLzbgmc("");
			hysyywNwbjkZzgl.setLzdw("");
			hysyywNwbjkZzgl.setZzdj("");
			hysyywNwbjkZzgl.setXmfzr("");
			hysyywNwbjkZzgl.setZzpsbm("");
			hysyywNwbjkZzgl.setPszjzzz("");
			hysyywNwbjkZzgl.setPsrq("");
			hysyywNwbjkZzgl.setZlpgf("");
			
			hysyywNwbjkZzgl.setChfzr("");
			hysyywNwbjkZzgl.setChdw("");
			hysyywNwbjkZzgl.setChrq("");
			hysyywNwbjkZzgl.setChds("");
			hysyywNwbjkZzgl.setTy("");
			hysyywNwbjkZzgl.setGlblc("");
			hysyywNwbjkZzgl.setZbxmc("");
		}
		if(hysyywNwbjkZzgl.getZzlx().equals("论证报告")){
			hysyywNwbjkZzgl.setZsbh("");
			hysyywNwbjkZzgl.setDwmc("");
			hysyywNwbjkZzgl.setFddbr("");
//			hysyywNwbjkZzgl.setZsdj("");
			hysyywNwbjkZzgl.setYwfw("");
			hysyywNwbjkZzgl.setYxqz("");
			hysyywNwbjkZzgl.setFzjg("");
			hysyywNwbjkZzgl.setFzrq("");
			hysyywNwbjkZzgl.setLxdz("");
			hysyywNwbjkZzgl.setLxbm("");
			hysyywNwbjkZzgl.setLxr("");
			hysyywNwbjkZzgl.setDh("");
			hysyywNwbjkZzgl.setE_mail("");

			hysyywNwbjkZzgl.setZcdz("");
			hysyywNwbjkZzgl.setZyfw("");
			hysyywNwbjkZzgl.setChzlfcfzr("");
			
			hysyywNwbjkZzgl.setChfzr("");
			hysyywNwbjkZzgl.setChdw("");
			hysyywNwbjkZzgl.setChrq("");
			hysyywNwbjkZzgl.setChds("");
			hysyywNwbjkZzgl.setTy("");
			hysyywNwbjkZzgl.setGlblc("");
			hysyywNwbjkZzgl.setZbxmc("");
		}
		if(hysyywNwbjkZzgl.getZzlx().equals("海籍调查信息")){
			hysyywNwbjkZzgl.setZsbh("");
			hysyywNwbjkZzgl.setDwmc("");
			hysyywNwbjkZzgl.setFddbr("");
			hysyywNwbjkZzgl.setZsdj("");
			hysyywNwbjkZzgl.setYwfw("");
			hysyywNwbjkZzgl.setYxqz("");
			hysyywNwbjkZzgl.setFzjg("");
			hysyywNwbjkZzgl.setFzrq("");
			hysyywNwbjkZzgl.setLxdz("");
			hysyywNwbjkZzgl.setLxbm("");
			hysyywNwbjkZzgl.setLxr("");
			hysyywNwbjkZzgl.setDh("");
			hysyywNwbjkZzgl.setE_mail("");

			hysyywNwbjkZzgl.setZcdz("");
			hysyywNwbjkZzgl.setZyfw("");
			hysyywNwbjkZzgl.setChzlfcfzr("");
			
			hysyywNwbjkZzgl.setLzbgmc("");
			hysyywNwbjkZzgl.setLzdw("");
			hysyywNwbjkZzgl.setZzdj("");
			hysyywNwbjkZzgl.setXmfzr("");
			hysyywNwbjkZzgl.setZzpsbm("");
			hysyywNwbjkZzgl.setPszjzzz("");
			hysyywNwbjkZzgl.setPsrq("");
			hysyywNwbjkZzgl.setZlpgf("");
		}
		//文件
		if(uploadSjwjFileName != null && !uploadSjwjFileName.equals("")){
			//附件、文件类型、文件大小
			String dowloadPath_slsjfj="C:/hydg/nwbjk/zzgl/";
			String path=uploadFile(dowloadPath_slsjfj,uploadSjwj,uploadSjwjFileName);//上传
			System.out.println("path="+path);
			hysyywNwbjkZzgl.setFjwj(uploadSjwjFileName);//文件名
		}
		//图片
		if(uploadFileName != null && !uploadFileName.equals("")){
			//附件、文件类型、文件大小
			String dowloadPath_slsjfj="C:/hydg/nwbjk/zzgl/";
			String path=uploadFile(dowloadPath_slsjfj,upload,uploadFileName);//上传
			hysyywNwbjkZzgl.setFjtpmc(uploadFileName);
			
			File f = new File(path);
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(f);
				byte[] bs = new byte[fis.available()];
				fis.read(bs);
				//t.setZp(Hibernate.createBlob(fis));
				hysyywNwbjkZzgl.setFjtp(bs);
				hysyywNwbjkZzgl.setIstp("是");
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			hysyywNwbjkZzgl.setIstp("否");
		}

		businessService.addObject(hysyywNwbjkZzgl);
		return "addSuccess";
	}
	
	/**
	 * 
	Description :资质详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:41:30
	 */
	public String fetchQualificationDetail(){
		System.out.println("zzID="+zzID+",zzType="+zzType);
		hysyywNwbjkZzgl = qualificationService.fetchZzglDetail(zzID);
		return "zzDetail";
	}
	
	/**
	 * 
	Description :获取修改资质详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:43:35
	 */
	public String fetchQualificationUpdate(){
		System.out.println("zzID="+zzID+",zzType="+zzType);
		hysyywNwbjkZzgl = qualificationService.fetchZzglDetail(zzID);
		return "zzUpdate";
	}
	
	/**
	 * 
	Description :修改资质
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:43:40
	 */
	public String updateQualification(){
		System.out.println("zzID="+zzID+",zzType="+zzType);
		String xzsj=this.getDateTime();
		hysyywNwbjkZzgl.setLastupdatetime(xzsj);
		//证书等级、、资质等级
		if(hysyywNwbjkZzgl.getZzdj() != null && !hysyywNwbjkZzgl.getZzdj().equals("")){
			hysyywNwbjkZzgl.setZsdj(hysyywNwbjkZzgl.getZzdj());
		}
		//选择某一个，其他为空
		if(hysyywNwbjkZzgl.getZzlx().equals("海域使用论证资质证书")){
			hysyywNwbjkZzgl.setZcdz("");
			hysyywNwbjkZzgl.setZyfw("");
			hysyywNwbjkZzgl.setChzlfcfzr("");
			
			hysyywNwbjkZzgl.setLzbgmc("");
			hysyywNwbjkZzgl.setLzdw("");
			hysyywNwbjkZzgl.setZzdj("");
			hysyywNwbjkZzgl.setXmfzr("");
			hysyywNwbjkZzgl.setZzpsbm("");
			hysyywNwbjkZzgl.setPszjzzz("");
			hysyywNwbjkZzgl.setPsrq("");
			hysyywNwbjkZzgl.setZlpgf("");
			
			hysyywNwbjkZzgl.setChfzr("");
			hysyywNwbjkZzgl.setChdw("");
			hysyywNwbjkZzgl.setChrq("");
			hysyywNwbjkZzgl.setChds("");
			hysyywNwbjkZzgl.setTy("");
			hysyywNwbjkZzgl.setGlblc("");
			hysyywNwbjkZzgl.setZbxmc("");
			
		}
		if(hysyywNwbjkZzgl.getZzlx().equals("测绘资质证书")){
			hysyywNwbjkZzgl.setYwfw("");
			hysyywNwbjkZzgl.setLxdz("");
			hysyywNwbjkZzgl.setLxbm("");
			hysyywNwbjkZzgl.setLxr("");
			hysyywNwbjkZzgl.setDh("");
			hysyywNwbjkZzgl.setE_mail("");
			
			hysyywNwbjkZzgl.setLzbgmc("");
			hysyywNwbjkZzgl.setLzdw("");
			hysyywNwbjkZzgl.setZzdj("");
			hysyywNwbjkZzgl.setXmfzr("");
			hysyywNwbjkZzgl.setZzpsbm("");
			hysyywNwbjkZzgl.setPszjzzz("");
			hysyywNwbjkZzgl.setPsrq("");
			hysyywNwbjkZzgl.setZlpgf("");
			
			hysyywNwbjkZzgl.setChfzr("");
			hysyywNwbjkZzgl.setChdw("");
			hysyywNwbjkZzgl.setChrq("");
			hysyywNwbjkZzgl.setChds("");
			hysyywNwbjkZzgl.setTy("");
			hysyywNwbjkZzgl.setGlblc("");
			hysyywNwbjkZzgl.setZbxmc("");
		}
		if(hysyywNwbjkZzgl.getZzlx().equals("论证报告")){
			hysyywNwbjkZzgl.setZsbh("");
			hysyywNwbjkZzgl.setDwmc("");
			hysyywNwbjkZzgl.setFddbr("");
//			hysyywNwbjkZzgl.setZsdj("");
			hysyywNwbjkZzgl.setYwfw("");
			hysyywNwbjkZzgl.setYxqz("");
			hysyywNwbjkZzgl.setFzjg("");
			hysyywNwbjkZzgl.setFzrq("");
			hysyywNwbjkZzgl.setLxdz("");
			hysyywNwbjkZzgl.setLxbm("");
			hysyywNwbjkZzgl.setLxr("");
			hysyywNwbjkZzgl.setDh("");
			hysyywNwbjkZzgl.setE_mail("");

			hysyywNwbjkZzgl.setZcdz("");
			hysyywNwbjkZzgl.setZyfw("");
			hysyywNwbjkZzgl.setChzlfcfzr("");
			
			hysyywNwbjkZzgl.setChfzr("");
			hysyywNwbjkZzgl.setChdw("");
			hysyywNwbjkZzgl.setChrq("");
			hysyywNwbjkZzgl.setChds("");
			hysyywNwbjkZzgl.setTy("");
			hysyywNwbjkZzgl.setGlblc("");
			hysyywNwbjkZzgl.setZbxmc("");
		}
		if(hysyywNwbjkZzgl.getZzlx().equals("海籍调查信息")){
			hysyywNwbjkZzgl.setZsbh("");
			hysyywNwbjkZzgl.setDwmc("");
			hysyywNwbjkZzgl.setFddbr("");
			hysyywNwbjkZzgl.setZsdj("");
			hysyywNwbjkZzgl.setYwfw("");
			hysyywNwbjkZzgl.setYxqz("");
			hysyywNwbjkZzgl.setFzjg("");
			hysyywNwbjkZzgl.setFzrq("");
			hysyywNwbjkZzgl.setLxdz("");
			hysyywNwbjkZzgl.setLxbm("");
			hysyywNwbjkZzgl.setLxr("");
			hysyywNwbjkZzgl.setDh("");
			hysyywNwbjkZzgl.setE_mail("");

			hysyywNwbjkZzgl.setZcdz("");
			hysyywNwbjkZzgl.setZyfw("");
			hysyywNwbjkZzgl.setChzlfcfzr("");
			
			hysyywNwbjkZzgl.setLzbgmc("");
			hysyywNwbjkZzgl.setLzdw("");
			hysyywNwbjkZzgl.setZzdj("");
			hysyywNwbjkZzgl.setXmfzr("");
			hysyywNwbjkZzgl.setZzpsbm("");
			hysyywNwbjkZzgl.setPszjzzz("");
			hysyywNwbjkZzgl.setPsrq("");
			hysyywNwbjkZzgl.setZlpgf("");
		}
		//文件
		if(uploadSjwjFileName != null && !uploadSjwjFileName.equals("")){
			//附件、文件类型、文件大小
			String dowloadPath_slsjfj="C:/hydg/nwbjk/zzgl/";
			String path=uploadFile(dowloadPath_slsjfj,uploadSjwj,uploadSjwjFileName);//上传
			System.out.println("path="+path);
			hysyywNwbjkZzgl.setFjwj(uploadSjwjFileName);//文件名
		}
		//图片
		if(uploadFileName != null && !uploadFileName.equals("")){
			//附件、文件类型、文件大小
			String dowloadPath_slsjfj="C:/hydg/nwbjk/zzgl/";
			String path=uploadFile(dowloadPath_slsjfj,upload,uploadFileName);//上传
			System.out.println("path="+path);
			hysyywNwbjkZzgl.setFjtpmc(uploadFileName);
			
			File f = new File(path);
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(f);
				byte[] bs = new byte[fis.available()];
				fis.read(bs);
				//t.setZp(Hibernate.createBlob(fis));
				hysyywNwbjkZzgl.setFjtp(bs);
				hysyywNwbjkZzgl.setIstp("是");
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(hysyywNwbjkZzgl.getFjtpmc() != null && !hysyywNwbjkZzgl.getFjtpmc().equals("")){
			//获取原文件名，再次上传
			System.out.println("图片名称"+hysyywNwbjkZzgl.getFjtpmc());
			String path="C:/hydg/nwbjk/zzgl/"+hysyywNwbjkZzgl.getFjtpmc();
				File f = new File(path);
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(f);
				byte[] bs = new byte[fis.available()];
				fis.read(bs);
				//t.setZp(Hibernate.createBlob(fis));
				hysyywNwbjkZzgl.setFjtp(bs);
				hysyywNwbjkZzgl.setIstp("是");
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			hysyywNwbjkZzgl.setIstp("否");
		}
		businessService.updateObject(hysyywNwbjkZzgl);
		return "addSuccess";
	}
	
	/**
	 * 
	Description :删除资质
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-4 下午05:43:47
	 */
	public String deleteQualification(){
		System.out.println("zzID="+zzID+",zzType="+zzType);
		qualificationService.deleteZzgl(zzID);
		return "addSuccess";
	}
	
	/**
	 * 
	Description :展示图片
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-4 下午07:47:54
	 */
	public String fetchFjtp(){
		System.out.println("zzID="+zzID);
		hysyywNwbjkZzgl = qualificationService.fetchZzglDetail(zzID);
		
		inputStream = new ByteArrayInputStream(hysyywNwbjkZzgl.getFjtp());	
		
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
	Description :图片放大
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-4 下午07:52:10
	 */
	public String fetchFjtpDetail(){
		System.out.println("zzID="+zzID);
		hysyywNwbjkZzgl = qualificationService.fetchZzglDetail(zzID);
		return "fjtpDetail";
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
	
	/**
	 * 
	Description :下载附件文件
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-8-24 下午05:32:23
	 */
	public String downLoadFjwj(){
		System.out.println("fileName="+fileName);
		return "downLoadFjwj";
	}
	public InputStream getDownLoadFileFjwj(){
		System.out.println("进入getDownloadFile.....");
		String dowloadPath_mediafj="C:/hydg/nwbjk/zzgl/";
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
	
	
	public IBusinessService getBusinessService() {
		return businessService;
	}

	public void setBusinessService(IBusinessService businessService) {
		this.businessService = businessService;
	}

	public IQualificationService getQualificationService() {
		return qualificationService;
	}

	public void setQualificationService(IQualificationService qualificationService) {
		this.qualificationService = qualificationService;
	}

	public THysyywNwbjkZzgl getHysyywNwbjkZzgl() {
		return hysyywNwbjkZzgl;
	}

	public void setHysyywNwbjkZzgl(THysyywNwbjkZzgl hysyywNwbjkZzgl) {
		this.hysyywNwbjkZzgl = hysyywNwbjkZzgl;
	}

	public List<?> getZzList() {
		return zzList;
	}

	public void setZzList(List<?> zzList) {
		this.zzList = zzList;
	}

	public String getZzID() {
		return zzID;
	}

	public void setZzID(String zzID) {
		this.zzID = zzID;
	}

	public SearchForm getSearchForm() {
		return searchForm;
	}

	public void setSearchForm(SearchForm searchForm) {
		this.searchForm = searchForm;
	}

	public String getZzType() {
		return zzType;
	}

	public void setZzType(String zzType) {
		this.zzType = zzType;
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

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	
	
	
}
