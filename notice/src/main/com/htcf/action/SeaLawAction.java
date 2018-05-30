package com.htcf.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.Dictionary;
import com.htcf.entity.HysyywHyflfg;
import com.htcf.service.HysyywHyflfgService;
import com.htcf.util.DateUtil;
import com.htcf.util.PageBean;
@Controller("seaLawAction")
@Scope("prototype")
public class SeaLawAction extends BaseAction {
	
	/**
	 * 法律法规service
	 */
	@Autowired
	private HysyywHyflfgService lawService;
	/**
	 * 法律法规参数
	 */
	private HysyywHyflfg seaLaw;
	/**
	 * 法律法规集合
	 */
	private List<HysyywHyflfg> seaLaws;
	/**
	 * 法律文件
	 */
	private File law;
	/**
	 * 文件名
	 */
	private String lawFileName;
	/**
	 * 上传的文件类型
	 */
	private String lawContentType; 
	/**
	 * 下载文件原始存放路径  
	 */
    private final static String fileBasePath_seaLaw="C:/hydg/seaLaw/";
    
    /**
     * 文件下载
     */
    private InputStream fileInputStream;
    /**
     * 标识操作类型 0：查看详情
     */
    private String operate;
    /**
     * 海洋法律法规分类Map
     */
    private Map<String,String> lawTypeMap;
    
	
    /**
     * 跳转到添加海洋法律法规页面
     */
    public String toAddSeaLaw(){
    	lawTypeMap = loadLawTypeMap();
    	return "editSeaLaw";
    }
    
    public String toEditSeaLaw(){
    	lawTypeMap = loadLawTypeMap();
    	this.seaLaw = this.lawService.loadLawById(this.seaLaw);
    	return "editSeaLaw";
    }
	/**
	 * 加载详情
	 */
    public String loadLaw(){
    	lawTypeMap = loadLawTypeMap();
    	this.seaLaw = this.lawService.loadLawById(this.seaLaw);
    	return "seaLawInfo";
    }
	/**
	 * 法律法规分类展示页面
	 */
	public String loadLawPage(){
		
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		
		this.seaLaws = this.lawService.loadLawPage(this.seaLaw, this.pageBean);
		if ( null == this.seaLaws ) this.seaLaws = new ArrayList<HysyywHyflfg>();
		return "lawList";
	}
	
	/**
	 * 添加海洋法律法规
	 */
	public String addSeaLaw(){
		
		String result = "0";
		if ( null != this.seaLaw ) {
			this.seaLaw.setAddtime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
			this.seaLaw.setLastupdatetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
			this.seaLaw.setAdduserid(this.getSessionUser().getId());
			this.seaLaw.setAddusername(this.getSessionUser().getName());
			if ( null != this.law ) {
				this.seaLaw.setFilePath(this.uploadFile());
			}
			if ( this.lawService.addLaw(this.seaLaw) ) {
				result = "1";
			}
		}
		
		/*HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		return "toSeaLawList";
	}
	
	/**
	 * 删除海洋法律法规
	 */
	public void removeSeaLaw(){
		String result = "0";
		if ( this.lawService.removeLawById(this.seaLaw) ) {
			result = "1";
		}
		
		HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改海洋法律法规
	 */
	public String editSeaLaw(){
		
		this.seaLaw.setLastupdatetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		if ( null != this.law ) {
			this.seaLaw.setFilePath(this.uploadFile());
		}
		String result = "0";
		if ( this.lawService.editLaw(this.seaLaw) ) {
			result = "1";
		}
		
		/*HttpServletResponse response=this.getHttpServletResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		return "toSeaLawList";
	}
	
	/**
	 * 上传附件，返回路径
	 * @return String：文件路径
	 */
	public String uploadFile(){
		
		FileInputStream fis = null; // 为了关闭资源
		FileOutputStream fos = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		String path = null;
		try {
			fis = new FileInputStream(this.law);
			// FileReader 一次只能读一个字符，一个汉字字符流 读汉字
			// 封装成，缓冲一下，可以读一行
			bis = new BufferedInputStream(fis);
			
			path = fileBasePath_seaLaw + File.separator
					+ DateUtil.dateToString(new Date(), "yyyyMMdd");
			File serFile = new File(path);
			// 判断服务器上该目录是否存在，不存在则创建目录
			if (!serFile.exists()) {
				serFile.mkdirs();
			}
			path += File.separator + (new Date()).getTime() + this.lawFileName;
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
		
		return path;
	}
	
	/**
	 * 文件下载
	 */
	public String downloadFile(){
		
		this.seaLaw = this.lawService.loadLawById(this.seaLaw);
		if( null != this.seaLaw ) {
			
			String path = this.seaLaw.getFilePath();
			try {
				this.fileInputStream = new FileInputStream(path);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			this.lawFileName = this.seaLaw.getLawName() + path.substring(path.lastIndexOf("."), path.length());	
			try {
				this.lawFileName = URLEncoder.encode(this.lawFileName, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		return "downloadFile";
	}
	
	/**
	 * 生成海洋法律法规分类map
	 */
	private Map<String,String> loadLawTypeMap(){
		
		Dictionary dictionary = new Dictionary();
		dictionary.setKey("海洋法律法规分类");
		Map<String, String> dicMap = this.lawService.loadDicMapByKey(dictionary);
		//JSONObject json = JSONObject.fromObject(dicMap);
		return dicMap;
	}
	
	
	public HysyywHyflfg getSeaLaw() {
		return seaLaw;
	}
	public void setSeaLaw(HysyywHyflfg seaLaw) {
		this.seaLaw = seaLaw;
	}
	public List<HysyywHyflfg> getSeaLaws() {
		return seaLaws;
	}
	public void setSeaLaws(List<HysyywHyflfg> seaLaws) {
		this.seaLaws = seaLaws;
	}

	public File getLaw() {
		return law;
	}

	public void setLaw(File law) {
		this.law = law;
	}

	public String getLawFileName() {
		return lawFileName;
	}

	public void setLawFileName(String lawFileName) {
		this.lawFileName = lawFileName;
	}

	public String getLawContentType() {
		return lawContentType;
	}

	public void setLawContentType(String lawContentType) {
		this.lawContentType = lawContentType;
	}

	public InputStream getFileInputStream() {
		return fileInputStream;
	}

	public void setFileInputStream(InputStream fileInputStream) {
		this.fileInputStream = fileInputStream;
	}

	public String getOperate() {
		return operate;
	}

	public void setOperate(String operate) {
		this.operate = operate;
	}

	public Map<String, String> getLawTypeMap() {
		return lawTypeMap;
	}

	public void setLawTypeMap(Map<String, String> lawTypeMap) {
		this.lawTypeMap = lawTypeMap;
	}

}
