package com.htcf.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.FileObject;

@Controller("sjbfAction")
@Scope("prototype")
public class SjbfAction extends BaseAction {
    
	private List<FileObject> fileList;
	private FileObject fileObject;
	private String deleteFileName;
	/******      0423   start          ********/	
	
	public String showDateList(){
		//System.out.println("在找List的方法中");
		fileList=ListFile();
		return "showDateListSuc";
	}
	
	public List<FileObject> ListFile(){
//	    try {
//		//获取服务器的IP、机器名
//		InetAddress addr = InetAddress.getLocalHost();
//		String  ip= addr.getHostAddress().toString();
//		String name = addr.getHostName().toString();
//		System.out.println("服务器IP="+ip+",name="+name);
//		
//	    } catch (UnknownHostException e1) {
//		// TODO Auto-generated catch block
//		e1.printStackTrace();
//	    }

	    HttpServletRequest request=this.getHttpServletRequest();
	    String newIP = request.getLocalAddr();//加载不了这个方法，request里没有这个方法，
        request.getLocalAddr();
	    System.out.println("服务器IP:"+newIP);
	    
	    File dir = null;
	    if(newIP.equals("10.15.49.182")){
		dir = new File("D:/zdcl_shujubeifen/");
	    }else{
		dir = new File("D:/zdcl_shujubeifen/");
	    }
	    System.out.println("dir="+dir);
		 List<FileObject> fileList=new ArrayList<FileObject>();
		 File[] files = dir.listFiles(); //ls -a . 
		 
		 try{
		    Arrays.sort(files, new Comparator<File>(){
		      public int compare(File o1, File o2) {
		        if(o1.isDirectory()==o2.isDirectory()){
		          return o1.getName().compareTo(o2.getName());
		        }
		        return o1.isDirectory() ? -1 : 1; 
		      }
		    });
		    for(File file:files){
		    	FileObject	f=new FileObject();
		      if(file.isDirectory()){
		    	  //System.out.println("["+file.getName()+"]");
		    	  f.setType("文件夹");
		    	  f.setName("["+file.getName()+"]");
		    	  fileList.add(f);
		      }else{
		    	  f.setType("文件");
		    	  f.setName(file.getName());
		    	  fileList.add(f);
		    	  //System.out.println(file.getName());
		      }
		    }
		 }catch(Exception e){
		     System.out.println("找不到该路径");
		 }
		    
		    
		  return fileList;
	}
	
	/******      0423   stop          ********/	
	
	/******      0424   start         ********/
	//删除文件
	public String deleteFile(){
		//System.out.println("E:/test/"+deleteFileName);
	    HttpServletRequest request=this.getHttpServletRequest();	    
	    String newIP = request.getLocalAddr();
	    System.out.println("服务器IP:"+newIP);
	    
	    File dir = null;
	    
	    
	    if(newIP.equals("10.15.49.182")){
		dir = new File("D:/zdcl_shujubeifen/"+deleteFileName);
	    }else{
		dir = new File("D:/zdcl_shujubeifen/"+deleteFileName);
	    }
	   
		dir.delete(); 
		//System.out.println("删除成功！");
		return "deleteFileSuc";
	}
	
	//定时删除
	public String manyClearList(){
		String[] getTime=getTime();
		String today=getTime[2];
		String yesterday=getTime[3];
		System.out.println("今天日期:"+today+" "+"昨天日期:"+yesterday);
		fileList=ListFile();
//		for(int i=0;i<fileList.size();i++){
//			System.out.println(i);
//			System.out.println(fileList.get(i).getName());
//		}
		for(int i=0;i<fileList.size();i++){
//			System.out.println(fileList.get(i).getName());
//			System.out.println("today="+today);
//			System.out.println("yesterday="+yesterday);
			System.out.println(i);
//			System.out.println(fileList.get(i).getName().contains(today));
//			System.out.println(fileList.get(i).getName().contains(yesterday));
			if(fileList.get(i).getName().contains(today)){
				//如果日期等于今天和昨天，就踢出删除List
				System.out.println("把  "+fileList.get(i).getName()+"  从List中踢出");
				fileList.remove(i);
//				fileList.remove(fileList.get(i));
			}
			if(fileList.get(i).getName().contains(yesterday)){
				//如果日期等于今天和昨天，就踢出删除List
				System.out.println("把  "+fileList.get(i).getName()+"  从List中踢出");
				fileList.remove(i);
//				fileList.remove(fileList.get(i));
			}
		}
		for(int j=0;j<fileList.size();j++){
			//System.out.println("E:/test/"+fileList.get(j).getName());
		    HttpServletRequest request=this.getHttpServletRequest();	    
		    String newIP = request.getLocalAddr();
		    System.out.println("服务器IP:"+newIP);
		    
		    File dir = null;
		    if(newIP.equals("10.15.49.182")){
			dir = new File("D:/zdcl_shujubeifen/"+fileList.get(j).getName());
		    }else{
			dir = new File("D:/zdcl_shujubeifen/"+fileList.get(j).getName());
		    }
		    
			dir.delete(); 
		}
		return "deleteFileSuc";
	}
	
	public String[] getTime(){
		Calendar c = Calendar.getInstance();
		Date date =  c.getTime();
		c.add(c.DATE, -1);//日期往后增加一天。
		Date d = c.getTime();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
		String today1 = dateFormat.format(date);
		String moday1 = dateFormat.format(d);
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyyMMdd");//可以方便地修改日期格式
		String today2=dateFormat2.format(date);
		String moday2 = dateFormat2.format(d);
		String[] T;
		T=new String[]{today1,moday1,today2,moday2};
		
		return T;
	}

	public List<FileObject> getFileList() {
	    return fileList;
	}

	public void setFileList(List<FileObject> fileList) {
	    this.fileList = fileList;
	}

	public String getDeleteFileName() {
	    return deleteFileName;
	}

	public void setDeleteFileName(String deleteFileName) {
	    this.deleteFileName = deleteFileName;
	}

	public FileObject getFileObject() {
	    return fileObject;
	}

	public void setFileObject(FileObject fileObject) {
	    this.fileObject = fileObject;
	}
	
	/******      0424   stop          ********/
	
	
}

