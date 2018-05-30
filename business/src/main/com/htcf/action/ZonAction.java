package com.htcf.action;

import java.io.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.htcf.entity.*;
import com.htcf.service.IBusinessService;
import com.htcf.util.DateUtil;
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

import com.htcf.service.IZonService;

/**
 * @author hj
 * @date 2017-8-24
 *
 */
@Controller("zonAction")
@Scope("prototype")
public class ZonAction extends BaseAction{

    @Autowired
    private IZonService zonService;

    @Autowired
    private IBusinessService  businessService;

    private THYsyywHygnqhXxgl hygnqhXxgl;
    private THysyywHysydtYhxm hysyywHysydtYhxm;
    private THysyywHygnqhFzhf hysyywHygnqhFzhf;
    private ThysyywHygnqhFb hygnqhFb;
    private Xzgz xzgz;
    private ThysyywHygnqhZxqkjdEntity  zxqkjdEntity;
    private XxglKjxxEntity xxglKjxxEntity;

    /**
     * 功能区划项目列表
     */
    private List<?> gnqhList;

    /**
     * 界址点坐标集合
     */
    private List<XxglKjxxEntity> xxglJzdList;

    /**
     * 辅助划分所有项目列表
     */
    private List<?> fzhfList;

    /**
     * 功能区划发布列表
     */

    private List<?> gnqhfbList;
    /**
     * 变量 项目ID
     */
    private String xmID;

    /**
     * 标识操作类型 0：查看详情
     */
    private String operate;

	/**
	 * 现状跟踪
	 */
	private List<?> xzgzList;

	/**
	 * 执行情况监督信息
	 */
	private List<?> zxjdList;

	private String fgf = ",";

    /**
     * 统计结果
     */
	private String tjarr ;
	private String kfgmarr ;
	private String zlbharr;
	private String yxcdarr ;

	/**
	 * 统计返回集合
	 */
	private List<Object[]> tjList;

	/**
	 * 拼接Map
	 */
	private Map<String, Object> tjMap = new HashMap<String, Object>(16);

	/**
	 * 开发规模统计
	 */
	private Map<String, Object> kfgmMap = new HashMap<String, Object>(16);

	/**
	 * 质量变化统计
	 */
	private Map<String, Object> zlbhMap = new HashMap<String, Object>(16);

	/**
	 * 影响程度统计
	 */
	private Map<String, Object> yxvdMap = new HashMap<String, Object>(16);

    private String[] jzdXh;
    private String[] jzdJd;
    private String[] jzdWd;

    private String jzdID;

	private File upload;
	private String uploadFileName;// 文件名
	private String uploadContentType; // 上传的文件类型
	private String fileName;



	/**
	 * 
	Description :查出所有功能区信息
	@Author：hj
	@Create 2017-8-17下午07:37:38
	 */
    public String fetchGnqh(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		gnqhList = zonService.fetchGnqhList(pageBean, hygnqhXxgl);
		return "gnqhJsp";
    }

    /**
    	 *
    	Description :查出所有功能区信息,用于返回
    	@Author：hj
    	@Create 2017-9-4 11:27
    	 */
    public String fetchGnqhBack(){
        hygnqhXxgl = null;
        HttpServletRequest request = this.getHttpServletRequest();
    	pageBean = this.processPageBean(request);
    	pageBean.setPageRecord(10);
    	gnqhList = zonService.fetchGnqhList(pageBean, hygnqhXxgl);
    	return "gnqhJsp";
	}

    /**
     *
    	 *
    	Description :查询功能区划详细信息
    	@Author：hj
    	@Create 2017-8-29上午09:42:45
     */
    public String fetchGnqhDetaile(){
		hygnqhXxgl = zonService.fetchGnqhDetail(xmID);
		xxglJzdList = zonService.fetchXxglJzd(xmID);
		return "gnqhDetail";
    }

	/**
	 *
	 Description :修改功能区划信息
	 @Author：hj
	 @Create 2017-9-1 9:44
	 */
	public String getGnqhDetaile(){
		hygnqhXxgl = zonService.fetchGnqhDetail(xmID);
		xxglJzdList = zonService.fetchXxglJzd(xmID);
        System.out.println(xxglJzdList);
        System.out.println("查出坐标");
        return "updategnqh";
	}
    
    /**
    	Description :新增功能区划信息
    	@Author：hj
    	@Create 2017-8-29下午05:27:23
     */
   public String addGnqh(){
	    String userId = "";
	    String userXm = "";
        try{
            //登陆人ID
            userId = ((User)session.get("user")).getId();
            userXm = ((User)session.get("user")).getName();
        }catch(Exception e){
            return "dlCs";
        }
        String xzsj=this.getDateTime();
        hygnqhXxgl.setAddtime(xzsj);
        hygnqhXxgl.setLastupdatetime(xzsj);
        hygnqhXxgl.setAdduserid(userId);
        hygnqhXxgl.setAddusername(userXm);
        //调用保存实体
        businessService.addObject(hygnqhXxgl);

        String tablename ="T_HYSYYW_HYGNQH_XXGL";
        xmID = businessService.fetchYhxmID(tablename,xzsj, userId);
	    gnqhList = zonService.fetchGnqhList(pageBean, hygnqhXxgl);
	    return "goAddSuccess";
   }

    /**
     * 保存成功后返回原页面
     * @Author：hj
     * @return string
     */

   public String addGnqhSuccess(){

	   System.out.println("xmId"+xmID);
	   hygnqhXxgl = zonService.fetchGnqhDetail(xmID);
	   xxglJzdList = zonService.fetchXxglJzd(xmID);

       return "addGnqhSuccess";
   }

    /**
     *
     Description :保存界址点
     @param
     @return
     @throws
     @Author：hj
     @Create 2017-8-28 下午05:04:57
     */
    public String saveJzd(){
        System.out.println("xmID="+xmID);
        //删除已有的
        zonService.deleteXxglJzdAll(xmID);
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
            XxglKjxxEntity xxglKjxxEntity = new XxglKjxxEntity();
            xxglKjxxEntity.setAddtime(xzsj);
            xxglKjxxEntity.setLastupdatetime(xzsj);
            xxglKjxxEntity.setAddusername(userXm);
            xxglKjxxEntity.setAdduserid(userId);
            xxglKjxxEntity.setGnqhid(Long.parseLong(xmID));
            xxglKjxxEntity.setXh(jzdXh[i]);
            xxglKjxxEntity.setJd(jzdJd[i]);
            xxglKjxxEntity.setWd(jzdWd[i]);
            xxglKjxxEntity.setXsxx(Long.parseLong(nn+""));
            businessService.addObject(xxglKjxxEntity);
            nn++;
        }
        return "goAddSuccess";
    }

    /**
     * 删除坐标
     * @return
     */
    public String deleteJdz(){
        System.out.println("xmID="+xmID+",jzdID="+jzdID);
        zonService.deleteXxglJzd(jzdID);
        return "goAddSuccess";
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
	public String downLoadGnqhJzdmb(){
		System.out.println("下载用海方式界址点坐标上传模板.....");
		fileName="用海功能区划坐标上传模板.xls";
		return "downLoadGnqhJzdmb";
	}
	public InputStream getDownLoadFileGnqhJzdmb(){
		System.out.println("进入getDownloadFile.....");
		System.out.println(ServletActionContext.getServletContext().getResourceAsStream("/files/"+fileName));
		//FileInputStream fis=ServletActionContext.getServletContext().getResourceAsStream("/hcbdmb/"+fileName);
		return ServletActionContext.getServletContext().getResourceAsStream("/files/"+fileName);
	}
	/**
	 *
	 Description :如果下载文件名为中文，进行字符编码转换
	 @param
	 @return
	 @throws
	 @Author：huangjian
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
	 Description :上传用海方式的界址点
	 @param:@return
	 @return:String
	 @throws
	 @Author：yinying
	 @Create 2018-1-22 下午04:46:13
	 */
	public String  uploadJzdData(){
		System.out.println("xmID="+xmID);
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

		return "goAddSuccess";
	}
	//解析上传的EXCEL
	public String insertData(String path) {
		System.out.println("xmID="+xmID);
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

		XxglKjxxEntity xxglKjxxEntity = null;
		int tSize = tables.length;
		Sheet sheet = le.getSheet(workbook, 0);
		int row = sheet.getRows();// 表行
		int columns = sheet.getColumns();// 表列
		System.out.println(path);
		System.out.println("colu mns列数："+columns);

		if (columns == 4) {// 读内容
			List<Object> jzdList = new ArrayList();

			try{
				for (int i = 1; i < row; i++){ // 循环一张表的行
					xxglKjxxEntity = new XxglKjxxEntity();
					Cell[] cell = le.readLine(sheet, i);
					int cellLength = cell.length;
					System.out.println("cellLength="+cellLength);
//					System.out.println("000="+cell[0].getContents());
//					System.out.println("111="+cell[1].getContents());
//					System.out.println("222="+cell[2].getContents());
					String xh = cell[0].getContents().trim();
					String zbxh = cell[1].getContents().trim();
					String wd = cell[2].getContents().trim();
					String jd = cell[3].getContents().trim();

					if(cellLength>=1){
						if( !"".equals(cell[0].getContents().trim()) && cell[0].getContents().trim() != null){
							xxglKjxxEntity.setXsxx(Long.parseLong(cell[0].getContents().trim()) );
						}
					}
					if(cellLength>=2){
						if( !"".equals(cell[1].getContents().trim()) && cell[1].getContents().trim() != null){
							xxglKjxxEntity.setXh(cell[1].getContents().trim());
						}
					}
					if(cellLength>=3){
						if( !"".equals(cell[2].getContents().trim()) && cell[2].getContents().trim() != null){
							xxglKjxxEntity.setWd(cell[2].getContents().trim());
						}
					}
					if(cellLength>=4){
						if( !"".equals(cell[3].getContents().trim()) && cell[3].getContents().trim() != null){
							xxglKjxxEntity.setJd(cell[3].getContents().trim());
						}
					}
					if(xh != null && !xh.equals("") && wd != null && !wd.equals("") && jd != null && !jd.equals("")){
						xxglKjxxEntity.setAddtime(xzsj);
						xxglKjxxEntity.setLastupdatetime(xzsj);
						xxglKjxxEntity.setAddusername(userXm);
						xxglKjxxEntity.setAdduserid(userId);
						xxglKjxxEntity.setGnqhid(Long.parseLong(xmID));
					}
					jzdList.add(xxglKjxxEntity);
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
   	Description :更新功能区划信息
   	@return 区划信息
   	@Author：hj
   	@Create 2017-8-31 16:19
   	 */
    public String updateGnqh(){
		String userId = "";
		String userXm = "";
		try{
			//登陆人ID
			userId = ((User)session.get("user")).getId();
			userXm = ((User)session.get("user")).getName();
		}catch(Exception e){
			return "dlCs";
		}
        hygnqhXxgl.setLastupdatetime(this.getDateTime());
        hygnqhXxgl.setUpdateuserid(userId);
        hygnqhXxgl.setUpdateusername(userXm);
        zonService.UpdateObj(hygnqhXxgl);

       return "gognquIndex";
    }

    /**
    	 *
    	Description :删除功能区划信息
    	@return
    	@Author：hj
    	@Create 2017-8-31 18:09
    	 */
    public String deleteGnqh(){
        zonService.deleteGnqh(xmID);
        //重定向
        return "gognquIndex";
    }

	/**
		 *
		Description :查询功能区辅助划分信息
		@Author：hj
		@Create 2017-9-6 16:07
		 */
	public String fetchFzhf(){
		HttpServletRequest request= this.getHttpServletRequest();
        pageBean=this.processPageBean(request);
        pageBean.setPageRecord(10);
        fzhfList = zonService.fetchFzhf(hysyywHygnqhFzhf,pageBean);
	    return "fzhfJsp";
    }

    /**
    	 *
    	Description :删除辅助功能区划
    	@Author：hj
    	@Create 2017-9-11 9:48
    	 */
	public String deleteFzhf(){
		zonService.deleteFzqh(xmID);
		//重定向
		return "gofzhfIndex";
	}

	/**
		 *
		Description :查看辅助划分详情
		@Author：hj
		@Create 2017-9-11 16:59
		 */
	public String fetchFzhfDetaile(){
        //项目信息
        hysyywHygnqhFzhf = zonService.fetchFzhfDetail(xmID);
        return "fzgnqhDetail";

    }

	/**
	 *
	 Description :查看辅助划分详情-进入修改页面
	 @Author：hj
	 @Create 2017-9-11 16:59
	 */
	public String getFzhfDetaile(){
		//项目信息
		hysyywHygnqhFzhf = zonService.fetchFzhfDetail(xmID);
		return "addFzqhSuccess";

	}

    /**
    	 *
    	Description :选择功能区划名称
    	@Author：hj
    	@Create 2017-9-15 14:49
    	 */
    public String fetchGnqhMc(){
    	List<?> mclist = zonService.fetchMcList();
		HttpServletResponse response = this.getHttpServletResponse();
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		JsonConfig config=new JsonConfig();
        //自动为我排除circle
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray arr=JSONArray.fromObject(mclist,config);
		out.print(arr.toString());
		out.flush();
		return null;
	}

	/**
		 *
		Description :保存辅助功能区划
		@Author：hj
		@Create 2017-9-19 16:11
		 */
	public String addFzhf(){
        String userId = "";
        String userXm = "";
        try{
            //登陆人ID
            userId = ((User)session.get("user")).getId();
            userXm = ((User)session.get("user")).getName();
        }catch(Exception e){
            return "dlCs";
        }
        String xzsj=this.getDateTime();
        hysyywHygnqhFzhf.setAddtime(xzsj);
        hysyywHygnqhFzhf.setLastupdatetime(xzsj);
        hysyywHygnqhFzhf.setAdduserid(userId);
        hysyywHygnqhFzhf.setAddusername(userXm);
        //功能区划id和功能区划名称，需要分割
        //调用保存实体
        businessService.addObject(hysyywHygnqhFzhf);
        String tablename ="T_HYSYYW_HYGNQH_FZHF";
        xmID = businessService.fetchYhxmID(tablename,xzsj, userId);

        return "gofzhfIndex";

	}

	/**
		 *
		Description :保存成功后返回显示信息
		@Author：hj
		@Create 2017-9-21 14:38
		 */
	public String addFzqhSuccess(){
		hysyywHygnqhFzhf = zonService.fetchFzhfDetail(xmID);
		return "gofzhfIndex";
	}

	/**
		 *
		Description :保存后修改信息，再更新
		@Author：hj
		@Create 2017-9-26 18:34
		 */
	public  String updateFzqh(){
		String userId = "";
		String userXm = "";
		try{
			//登陆人ID
			userId = ((User)session.get("user")).getId();
			userXm = ((User)session.get("user")).getName();
		}catch(Exception e){
			return "dlCs";
		}
		hysyywHygnqhFzhf.setLastupdatetime(this.getDateTime());
		hysyywHygnqhFzhf.setUpdateuserid(userId);
		hysyywHygnqhFzhf.setUpdateusername(userXm);
		zonService.UpdateObj(hysyywHygnqhFzhf);
		return "gofzhfIndex";
	}
	/**
		 *
		Description :保存后返回
		@Author：hj
		@Create 2017-9-26 18:35
		 */
	public String gobackFzhf(){
		hysyywHygnqhFzhf = null;
		HttpServletRequest request = this.getHttpServletRequest();
		pageBean = this.processPageBean(request);
		pageBean.setPageRecord(10);
		fzhfList = zonService.fetchFzhf( hysyywHygnqhFzhf,pageBean);
		return "fzhfJsp";
	}


	/**
		 *
		Description :查出已发布
		@author：hj
		@Create 2017-10-25 14:50
		 */
	public String fetchFb(){
        HttpServletRequest request= this.getHttpServletRequest();
        pageBean=this.processPageBean(request);
        pageBean.setPageRecord(10);
        gnqhfbList = zonService.fetchGnqhfbList(hygnqhFb,pageBean);
        return "fbJsp";
    }

    /**
    	 *
    	Description :功能区划发布详情
    	@return hygnqhFb
    	@author：hj
    	@Create 2017-10-26 13:35
    	 */
    public String gnqhfbDetaile(){
		hygnqhFb = zonService.fetchFbDetail(xmID);
		return "fbDetaile";
	}

	/**
		 *
		Description :新增功能区划发布
		@author：hj
		@Create 2017-10-25 14:47
		 */
	public String addFb(){
        String userId = "";
        String userXm = "";
        try{
            userId = ((User)session.get("user")).getId();
            userXm = ((User)session.get("user")).getName();
        }catch(Exception e){
            return "dlCs";
        }
        String xzsj=this.getDateTime();
        hygnqhFb.setAddtime(xzsj);
        hygnqhFb.setAdduserid(userId);
        hygnqhFb.setAddusername(userXm);

        //调用保存实体
        businessService.addObject(hygnqhFb);
        String tablename ="T_HYSYYW_HYGNQH_FB";
        xmID = businessService.fetchYhxmID(tablename,xzsj, userId);
        return "goFbIndex";

    }
    /**
     *
     Description :删除功能区划信息
     @return
     @Author：hj
     @Create 2017-8-31 18:09
     */
    public String deleteFb(){
        zonService.deleteFb(xmID);
        //重定向
        return "goFbIndex";
    }

    /**
    	 *
    	Description :获取详情-修改
    	@param
    	@return
    	@author：hj
    	@Create 2017-10-26 20:38
    	 */
    public String getFbDetaile(){
        hygnqhFb = zonService.fetchFbDetail(xmID);
        return "amendFbJsp";

    }

    /**
    	 *
    	Description :发布修改-返回
    	@param
    	@return
    	@author：hj
    	@Create 2017-10-26 20:38
    	 */
    public String gobackFb(){
        hygnqhFb = null;
        HttpServletRequest request = this.getHttpServletRequest();
        pageBean = this.processPageBean(request);
        pageBean.setPageRecord(10);
        gnqhfbList = zonService.fetchGnqhfbList(hygnqhFb,pageBean);
        return "fbJsp";
    }

    /**
     *
     Description :更新功能区划发布
     @return
     @Author：hj
     @Create 2017-8-31 16:19
     */
    public String updateFb(){
		String userId = "";
		String userXm = "";
		try{
			userId = ((User)session.get("user")).getId();
			userXm = ((User)session.get("user")).getName();
		}catch(Exception e){
			return "dlCs";
		}
		String xzsj=this.getDateTime();
		hygnqhFb.setUpdateuserid(userId);
		hygnqhFb.setUpdateusername(userXm);
		hygnqhFb.setLastupdatetime(xzsj);
        zonService.UpdateObj(hygnqhFb);
        return "goFbIndex";
    }


    /**
    	 *
    	Description : 查询建立利用与跟踪保护中的功能区名称
    	@return 功能区名称
    	@author：hj
    	@Create 2017-11-23 16:41
    	 */
    public void fetchLybhGnqmc(){
        List<?> lybhmcList = zonService.fetchLybhGnqmc();
        HttpServletResponse response = this.getHttpServletResponse();
        response.setContentType("text/plain;charset=utf-8");
        JsonConfig config=new JsonConfig();
        config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray arr=JSONArray.fromObject(lybhmcList,config);
        PrintWriter out=null;
        try {
            out = response.getWriter();
            out.print(arr.toString());
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
    	 *
    	Description :查询出所有的利用与保护信息
    	@return 返回利用与保护
    	@author：hj
    	@Create 2017-11-24 11:09
    	 */
    public String fetchLybh(){
        HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		xzgzList = zonService.fetchLybh(xzgz,pageBean);
		this.tjXzgzKfgm();
		this.tjXzgzZlbh();
		this.tjXzgzYxcd();
        return "lybhIndex";

	}

	/**
		 *
		Description : 跳转到新增页面
		@return 页面
		@author：hj
		@Create 2017-12-8 18:46
		 */
	public String toAddxzgz(){
		this.tjXzgzKfgm();
		this.tjXzgzZlbh();
		this.tjXzgzYxcd();
		return "toaddxzgz";
	}


	/**
		 *
		Description :新增现状跟踪信息
		@return String
		@author：hj
		@Create 2017-11-27 17:21
		 */
	public String addXzgz(){
		String fg = xzgz.getGnqhmc();
		if(fg.contains(fgf)){
			String [] mc = new String[2];
			mc = fg.split(",");
			xzgz.setGnqhmcid(mc[0]);
			xzgz.setGnqhmc(mc[1]);
		}
		String xzsj=this.getDateTime();
		xzgz.setAddtime(xzsj);
		xzgz.setAdduserid(this.getSessionUser().getId());
		xzgz.setAddusername(this.getSessionUser().getName());
		//调用保存实体
		businessService.addObject(xzgz);
		return "tolybhList";
	}

	/**
		 *
		Description :s删除现状跟踪
		@author：hj
		@Create 2017-11-28 9:39
		 */
	public void removeXzgz() {
        String result = "0";
        if (this.zonService.removeXzgzById(this.xzgz)) {
            result = "1";
        }
        HttpServletResponse response = this.getHttpServletResponse();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
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
    	 *
    	Description :跳转修改页面
    	@return xzgz
    	@author：hj
    	@Create 2017-11-28 10:38
    	 */
    public String toEditXzgz(){
        this.xzgz = this.zonService.loadXzgzById(this.xzgz);
		this.tjXzgzKfgm();
		this.tjXzgzZlbh();
		this.tjXzgzYxcd();
        return "toEditXzgz";
    }

    /**
    	 *
    	Description :修改现状跟踪
    	@return xzgz
    	@author：hj
    	@Create 2017-11-28 13:50
    	 */
    public String updateXzgz(){
        this.xzgz.setLastupdatetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
        xzgz.setUpdateuserid(this.getSessionUser().getUserId());
        xzgz.setUpdateusername(this.getSessionUser().getUserName());
        String fg = xzgz.getGnqhmc();
        if(fg.contains(fgf)){
            String [] mc = new String[2];
            mc = fg.split(",");
            xzgz.setGnqhmcid(mc[0]);
            xzgz.setGnqhmc(mc[1]);
        }
        zonService.UpdateObj(xzgz);
        return "tolybhList";
    }

    /**
    	 *
    	Description :查询执行监督信息
    	@retur 列表展示页面
    	@author：hj
    	@Create 2017-11-30 15:06
    	 */
	public String fetchzxjd(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		zxjdList = zonService.fetchZxjd(zxqkjdEntity,pageBean);
        this.tj();
        return "zxjdIndex";
	}

	/**
		 *
		Description :跳转到新增
		@return 新增页面
		@author：hj
		@Create 2017-12-7 15:51
		 */
	public String toAddzxjd(){
		this.tj();
		return "toaddzxjd";
	}

	/**
		 * 
		Description :新增执行监督信息
		@return 列表展示页面
		@author：hj
		@Create 2017-12-1 9:58 
		 */
	public String addZxjd(){
        System.out.println("新增执行监督信息"+zxqkjdEntity.getId());
        String fg = zxqkjdEntity.getGnqhmc();
        if(fg.contains(fgf)){
            String [] mc = new String[2];
            mc = fg.split(",");

            zxqkjdEntity.setGnqhmcid(mc[0]);
            zxqkjdEntity.setGnqhmc(mc[1]);
        }
        String xzsj=this.getDateTime();
        zxqkjdEntity.setAddtime(xzsj);
        zxqkjdEntity.setAdduserid(this.getSessionUser().getId());
        zxqkjdEntity.setAddusername(this.getSessionUser().getName());
    /*    System.out.println("-=-=-=-=-="+zxqkjdEntity.getBz());
        System.out.println("-=-=-=-=-"+zxqkjdEntity.getGnqhmc());*/
        //调用保存实体
        businessService.addObject(zxqkjdEntity);
        return "tozxjdList";
	}

	/**
		 *
		Description :删除执行监督
		@author：hj
		@Create 2017-12-1 10:22
		 */
	public void removeZxjd(){
        String result = "0";
        if (this.zonService.removeZxjdById(this.zxqkjdEntity)) {
            result = "1";
        }
        HttpServletResponse response = this.getHttpServletResponse();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
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
     *
         Description :跳转修改页面
         @return xzgz
         @author：hj
    	@Create 2017-12-1 10:31 
    	 */
    public String toEditZxjd(){

		this.zxqkjdEntity = this.zonService.loadzxqkjdEntityById(zxqkjdEntity);
		this.tj();
        return "toEditzxjd";
    }

    /**
    	 *
    	Description :修改执行情况监督
    	@return zxqkjd
    	@author：hj
    	@Create 2017-12-1 10:54
    	 */
    public String editZxqkjd(){
        this.zxqkjdEntity.setLastupdatetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
        zxqkjdEntity.setUpdateuserid(this.getSessionUser().getUserId());
        zxqkjdEntity.setUpdateusername(this.getSessionUser().getUserName());
        String fg = zxqkjdEntity.getGnqhmc();
        if(fg.contains(fgf)){
            String [] mc = new String[2];
            mc = fg.split(fgf);
            zxqkjdEntity.setGnqhmcid(mc[0]);
            zxqkjdEntity.setGnqhmc(mc[1]);
        }
        zonService.UpdateObj(zxqkjdEntity);
        return "tozxjdList";
    }

    /**
    	 *
    	Description :执行情况监督统计图表
    	@author：hj
    	@Create 2017-12-8 14:39
    	 */
	public void tj(){
        tjList = zonService.fetchtj();
        List<Object> name = new ArrayList<Object>();
        List<Object> gs = new ArrayList<Object>();
        List<Object> mj = new ArrayList<Object>();
        // {name: [海洋局，信息中心]，gs: [1，2]}
        if(null != tjList){
            for (int i = 0 ;i < tjList.size();i++){
                name.add(tjList.get(i)[0]);
                gs.add(tjList.get(i)[1]);
                mj.add(tjList.get(i)[2]);
                tjMap.put("subtext","各单位执行监督情况上报个数");
                tjMap.put("subtext1","各单位执行监督情况违规面积");
                tjMap.put("name",name);
                tjMap.put("gs",gs);
                tjMap.put("mj",mj);
              /*  System.out.println(tjMap.get("name"));
                System.out.println(tjMap.get("gs"));
                System.out.println(tjMap.get("mj"));*/
            }
        }
        tjarr = JSON.toJSONString(tjMap);
	}

	/**
		 *
		Description :利用保护与现状跟踪统计-开发规模
		@author：hj
		@Create 2017-12-8 14:41
		 */
	public void tjXzgzKfgm(){
		this.tjList = zonService.fetchtjXzgzKfgm();
		List<Object> name = new ArrayList<Object>();
		List<Object> gs = new ArrayList<Object>();
		// {name: [海洋局，信息中心]，gs: [1，2]}
		if(null != tjList){
			for (int i = 0 ;i < tjList.size();i++){
				System.out.println("----================"+tjList.get(i)[0]);
				name.add(tjList.get(i)[0]);
				gs.add(tjList.get(i)[1]);
				kfgmMap.put("subtext","开发规模个数统计");
				kfgmMap.put("name",name);
				kfgmMap.put("gs",gs);

			}
		}
		kfgmarr = JSON.toJSONString(kfgmMap);
	}

	/**
	 *
	 Description :利用保护与现状跟踪统计-质量变化
	 @author：hj
	 @Create 2017-12-8 14:41
	 */
	public void tjXzgzZlbh(){
		tjList = zonService.fetchtjXzgzZlbh();
		List<Object> name = new ArrayList<Object>();
		List<Object> gs = new ArrayList<Object>();
		// {name: [海洋局，信息中心]，gs: [1，2]}
		if(null != tjList){
			for (int i = 0 ;i < tjList.size();i++){
				System.out.println("----================"+tjList.get(i)[0]);
				name.add(tjList.get(i)[0]);
				gs.add(tjList.get(i)[1]);
				tjMap.put("subtext","质量变化个数统计");
				tjMap.put("name",name);
				tjMap.put("gs",gs);

			}
		}
		zlbharr = JSON.toJSONString(tjMap);
	}

	/**
	 *
	 Description :利用保护与现状跟踪统计-影响程度
	 @author：hj
	 @Create 2017-12-8 14:41
	 */
	public void tjXzgzYxcd(){
		tjList = zonService.fetchtjXzgzYxcd();
		List<Object> name = new ArrayList<Object>();
		List<Object> gs = new ArrayList<Object>();
		// {name: [海洋局，信息中心]，gs: [1，2]}
		if(null != tjList){
			for (int i = 0 ;i < tjList.size();i++){
				System.out.println("----================"+tjList.get(i)[0]);
				name.add(tjList.get(i)[0]);
				gs.add(tjList.get(i)[1]);
				tjMap.put("subtext","对邻近功能区影响程度统计");
				tjMap.put("name",name);
				tjMap.put("gs",gs);

			}
		}
		yxcdarr = JSON.toJSONString(tjMap);
	}







    
    /*--------------------------get   set-----------------------*/
    
	
	public IZonService getZonService() {
		return zonService;
	}

	public void setZonService(IZonService zonService) {
		this.zonService = zonService;
	}

	public THYsyywHygnqhXxgl getHygnqhXxgl() {
		return hygnqhXxgl;
	}

	public void setHygnqhXxgl(THYsyywHygnqhXxgl hygnqhXxgl) {
		this.hygnqhXxgl = hygnqhXxgl;
	}

	public List<?> getGnqhList() {
		return gnqhList;
	}

	public void setGnqhList(List<?> gnqhList) {
		this.gnqhList = gnqhList;
	}

	public String getXmID() {
		return xmID;
	}

	public void setXmID(String xmID) {
		this.xmID = xmID;
	}

    public ThysyywHygnqhFb getHygnqhFb() {
        return hygnqhFb;
    }

    public void setHygnqhFb(ThysyywHygnqhFb hygnqhFb) {
        this.hygnqhFb = hygnqhFb;
    }

    public List<?> getGnqhfbList() {
        return gnqhfbList;
    }

    public void setGnqhfbList(List<?> gnqhfbList) {
        this.gnqhfbList = gnqhfbList;
    }

    public THysyywHysydtYhxm getHysyywHysydtYhxm() {
		return hysyywHysydtYhxm;
	}


	public void setHysyywHysydtYhxm(THysyywHysydtYhxm hysyywHysydtYhxm) {
		this.hysyywHysydtYhxm = hysyywHysydtYhxm;
	}

    public IBusinessService getBusinessService() {
        return businessService;
    }

    public void setBusinessService(IBusinessService businessService) {
        this.businessService = businessService;
    }

    public THysyywHygnqhFzhf getHysyywHygnqhFzhf() {
        return hysyywHygnqhFzhf;
    }

    public void setHysyywHygnqhFzhf(THysyywHygnqhFzhf hysyywHygnqhFzhf) {
        this.hysyywHygnqhFzhf = hysyywHygnqhFzhf;
    }

    public List<?> getFzhfList() {
        return fzhfList;
    }

    public void setFzhfList(List<?> fzhfList) {
        this.fzhfList = fzhfList;
    }



	public Xzgz getXzgz() {
		return xzgz;
	}

	public void setXzgz(Xzgz xzgz) {
		this.xzgz = xzgz;
	}

    public List<?> getXzgzList() {
        return xzgzList;
    }

    public void setXzgzList(List<?> xzgzList) {
        this.xzgzList = xzgzList;
    }

    public String getOperate() {
        return operate;
    }

    public void setOperate(String operate) {
        this.operate = operate;
    }

	public List<?> getZxjdList() {
		return zxjdList;
	}

	public void setZxjdList(List<?> zxjdList) {
		this.zxjdList = zxjdList;
	}

	public ThysyywHygnqhZxqkjdEntity getZxqkjdEntity() {
		return zxqkjdEntity;
	}

	public void setZxqkjdEntity(ThysyywHygnqhZxqkjdEntity zxqkjdEntity) {
		this.zxqkjdEntity = zxqkjdEntity;
	}

    public String getTjarr() {
        return tjarr;
    }

    public void setTjarr(String tjarr) {
        this.tjarr = tjarr;
    }

	public List<Object[]> getTjList() {
		return tjList;
	}

	public void setTjList(List<Object[]> tjList) {
		this.tjList = tjList;
	}

	public Map<String, Object> getTjMap() {
		return tjMap;
	}

	public void setTjMap(Map<String, Object> tjMap) {
		this.tjMap = tjMap;
	}

	public Map<String, Object> getKfgmMap() {
		return kfgmMap;
	}

	public void setKfgmMap(Map<String, Object> kfgmMap) {
		this.kfgmMap = kfgmMap;
	}

	public Map<String, Object> getZlbhMap() {
		return zlbhMap;
	}

	public void setZlbhMap(Map<String, Object> zlbhMap) {
		this.zlbhMap = zlbhMap;
	}

	public Map<String, Object> getYxvdMap() {
		return yxvdMap;
	}

	public void setYxvdMap(Map<String, Object> yxvdMap) {
		this.yxvdMap = yxvdMap;
	}

	public String getKfgmarr() {
		return kfgmarr;
	}

	public void setKfgmarr(String kfgmarr) {
		this.kfgmarr = kfgmarr;
	}

	public String getZlbharr() {
		return zlbharr;
	}

	public void setZlbharr(String zlbharr) {
		this.zlbharr = zlbharr;
	}

	public String getYxcdarr() {
		return yxcdarr;
	}

	public void setYxcdarr(String yxcdarr) {
		this.yxcdarr = yxcdarr;
	}

    public List<XxglKjxxEntity> getXxglJzdList() {
        return xxglJzdList;
    }

    public void setXxglJzdList(List<XxglKjxxEntity> xxglJzdList) {
        this.xxglJzdList = xxglJzdList;
    }

    public XxglKjxxEntity getXxglKjxxEntity() {
        return xxglKjxxEntity;
    }

    public void setXxglKjxxEntity(XxglKjxxEntity xxglKjxxEntity) {
        this.xxglKjxxEntity = xxglKjxxEntity;
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
}
