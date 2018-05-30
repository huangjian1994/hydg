package com.htcf.action;

import java.io.BufferedOutputStream;
import java.io.File;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;


import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.action.BaseAction;
import com.htcf.entity.SbdcptFkbdForm;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtYhxm;
import com.htcf.entity.THysyywHysydtYhxmForm;
import com.htcf.entity.THysyywHysydtYhxmZht;
import com.htcf.entity.THysyywHysydtYhxmZhxx;
import com.htcf.entity.THysyywNwbjkSbdcptFk;
import com.htcf.entity.User;
import com.htcf.service.IBusinessService;
import com.htcf.service.ISbdcptService;
import com.htcf.service.ISeaUseGoldService;

/**
 * 内外部接口——市不动产平台接口
 * @author yinying
 *
 */
@Controller("sbdcptAction")
@Scope("prototype")
public class SbdcptAction  extends BaseAction{
	@Autowired
	private IBusinessService businessService;
	@Autowired
	private ISbdcptService sbdcptService;
	
	@Autowired
	private ISeaUseGoldService seaUseGoldService;
	
	//实体
	private THysyywHysydtYhxm hysyywHysydtYhxm = new THysyywHysydtYhxm();
	private THysyywHysydtYhxmZhxx hysyywHysydtYhxmZsxx = new THysyywHysydtYhxmZhxx();
	private THysyywHysydtYhxmForm hysyywHysydtYhxmForm = new THysyywHysydtYhxmForm();
	private SearchForm searchForm =  new SearchForm();
	private THysyywNwbjkSbdcptFk hysyywNwbjkSbdcptFk = new THysyywNwbjkSbdcptFk();
	private SbdcptFkbdForm sbdcptFkbdForm = new SbdcptFkbdForm();
	
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
	private List<?> fkList;//反馈
	
	//变量
	private String xmID;
	private String zsID;
	private String fkID;
	private String approvalNum;
	private String tableName;
	private String zdName;
	private String zdValue;
	
	/**
	 * 
	Description :项目列表
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-18 下午03:44:25
	 */
	public String fetchYhxmList(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		yhxmList = sbdcptService.fetchYhxmList(pageBean, hysyywHysydtYhxmForm);
		return "sbdcptIndex";
	}
	
	/**
	 * 
	Description :第一次推送
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-18 下午03:44:25
	 */
	public String goSendFirst(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		/* */
		//海域变更表		
		try{
			insertSeaAreaMod(xmID, zsID,"1","1");//已审批、新增
		}catch(Exception e){
			System.out.println("第一次推送报错***海域变更表**"+e);
		}
		
		try{
			List<?> yhpwList = sbdcptService.fetchYhpw(xmID,zsID);
			if(yhpwList != null && yhpwList.size() != 0){
				System.out.println("yhpwList记录="+yhpwList.size());
				insertDocSeaUseApprovalDoc(yhpwList,xmID,zsID);//插入  用海批文
				sbdcptService.updateXmzt(xmID,zsID, "1-1,");//修改项目状态
			}else{
				sbdcptService.updateXmzt(xmID,zsID, "1-0,");//修改项目状态
			}
		}catch(Exception e){
			System.out.println("第一次推送报错***用海批文**"+e);
			sbdcptService.updateXmzt(xmID,zsID, "1-2,");//修改项目状态
		}
		System.out.println("**************用海批文fetchDocSeaUseApprovalDoc**************");
		
		try{
			List<?> zhxxList = sbdcptService.fetchZhxx(xmID, zsID);
			if(zhxxList != null && zhxxList.size() != 0){
				insertReuSeaArea(zhxxList,xmID,zsID);//插入  宗海
				sbdcptService.updateXmzt(xmID,zsID, "2-1,");//修改项目状态
			}else{
				sbdcptService.updateXmzt(xmID,zsID, "2-0,");//修改项目状态
			}
		}catch(Exception e){
			System.out.println("第一次推送报错***宗海**"+e);
			sbdcptService.updateXmzt(xmID,zsID, "2-2,");//修改项目状态
		}
		System.out.println("**************宗海fetchReuSeaArea**************");
//		fetchReuSeaArea();//读取  宗海

		try{
			List<?> zhftList = sbdcptService.fetchZhft(xmID, zsID);
			if(zhftList != null && zhftList.size() != 0){
				insertDocSeaAreaMap(zhftList,xmID, zsID);//插入  宗海附图
				sbdcptService.updateXmzt(xmID,zsID, "3-1,");//修改项目状态
			}else{
				sbdcptService.updateXmzt(xmID,zsID, "3-0,");//修改项目状态
			}
		}catch(Exception e){
			System.out.println("第一次推送报错***宗海附图**"+e);
			sbdcptService.updateXmzt(xmID,zsID, "3-2,");//修改项目状态
		}
		System.out.println("**************宗海附图fetchDocSeaAreaMap**************");
//		fetchDocSeaAreaMap();//读取  宗海附图
		
		try{
			List<?> yhqkList = sbdcptService.fetchYhqk(xmID, zsID);
			if(yhqkList != null && yhqkList.size() != 0){
				insertDocSeaUsage(yhqkList,xmID, zsID);//插入   用海情况
				sbdcptService.updateXmzt(xmID,zsID, "4-1,");//修改项目状态
			}else{
				sbdcptService.updateXmzt(xmID,zsID, "4-0,");//修改项目状态
			}
		}catch(Exception e){
			System.out.println("第一次推送报错***用海情况**"+e);
			sbdcptService.updateXmzt(xmID,zsID, "4-2,");//修改项目状态
		}
		System.out.println("**************用海情况fetchDocSeaUsage**************");
//		fetchDocSeaUsage();//读取   用海情况
		
		try{
			List<?> hyzbList = sbdcptService.fetchHyzb(xmID, zsID);
			if(hyzbList != null && hyzbList.size() != 0){
				insertReuSeaCoordinates(hyzbList,xmID, zsID);//插入  海域坐标
				sbdcptService.updateXmzt(xmID,zsID, "5-1,");//修改项目状态
			}else{
				sbdcptService.updateXmzt(xmID,zsID, "5-0,");//修改项目状态
			}
		}catch(Exception e){
			System.out.println("第一次推送报错***海域坐标**"+e);
			sbdcptService.updateXmzt(xmID,zsID, "5-2,");//修改项目状态
		}
		System.out.println("**************海域坐标fetchReuSeaCoordinates**************");
//		fetchReuSeaCoordinates();//读取 海域坐标
		
		try{
			List<?> yhmyddsxbList = sbdcptService.fetchYhmyddsxb(xmID, zsID);
			if(yhmyddsxbList != null && yhmyddsxbList.size() != 0){
				insertDocSeaUsageCoordinates(yhmyddsxbList,xmID, zsID);//插入  用海（岛）面域定点顺序表
				sbdcptService.updateXmzt(xmID,zsID, "6-1,");//修改项目状态
			}else{
				sbdcptService.updateXmzt(xmID,zsID, "6-0,");//修改项目状态
			}
		}catch(Exception e){
			System.out.println("第一次推送报错***用海（岛）面域定点顺序表**"+e);
			sbdcptService.updateXmzt(xmID,zsID, "6-2,");//修改项目状态
		}
		System.out.println("**************用海（岛）面域定点顺序表fetchDocSeaUsageCoordinates**************");
//		fetchDocSeaUsageCoordinates();//读取 用海（岛）面域定点顺序表
		
		return "goYhxmList";
	}
	
	/**
	 * 
	Description :第二次推送
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-19 下午05:42:38
	 */
	public String goSendSecond(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		try{
			List<?> hysyjjnqkList = sbdcptService.fetchHysyjjnqk(xmID, zsID);
			if(hysyjjnqkList != null && hysyjjnqkList.size() != 0){
				insertDocSeaPayments(hysyjjnqkList,xmID, zsID);//插入 海域使用金缴纳情况
				sbdcptService.updateXmzt(xmID,zsID, "7-1,");//修改项目状态
			}else{
				sbdcptService.updateXmzt(xmID,zsID, "7-0,");//修改项目状态
			}
		}catch(Exception e){
			System.out.println("第二次推送报错***海域使用金缴纳情况**"+e);
			sbdcptService.updateXmzt(xmID,zsID, "7-2,");//修改项目状态
		}
		System.out.println("**************海域使用金缴纳情况fetchDocSeaPayments**************");
		fetchDocSeaPayments();//读取  海域使用金缴纳情况
		
		//更新海域变更表：3	已缴金
		try{
			insertSeaAreaMod(xmID, zsID,"3","1");//已缴金、新增
		}catch(Exception e){
			System.out.println("第一次推送报错***海域变更表**"+e);
		}
		//更新宗海表、批文表的变更日期
		try{
			List<?> yhpwList = sbdcptService.fetchYhpw(xmID,zsID);
			if(yhpwList != null && yhpwList.size() != 0){
				System.out.println("yhpwList记录="+yhpwList.size());
				insertDocSeaUseApprovalDoc(yhpwList,xmID,zsID);//插入  用海批文
			}
		}catch(Exception e){
			System.out.println("更新***用海批文**"+e);
		}
		System.out.println("**************用海批文fetchDocSeaUseApprovalDoc**************");
		
		try{
			List<?> zhxxList = sbdcptService.fetchZhxx(xmID, zsID);
			if(zhxxList != null && zhxxList.size() != 0){
				insertReuSeaArea(zhxxList,xmID,zsID);//插入  宗海
			}
		}catch(Exception e){
			System.out.println("更新***宗海**"+e);
		}
		
		return "goYhxmList";
	}
	
	/**
	 * 
	Description :第三次推送
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-19 下午07:15:18
	 */
	public String goSendThird(){
		System.out.println("xmID="+xmID+",zsID="+zsID);
		try{
			List<?> phbList = sbdcptService.fetchPhb(xmID, zsID);
			if(phbList != null && phbList.size() != 0){
				insertDocSeaDistribution(phbList,xmID, zsID);//插入 配号表
				sbdcptService.updateXmzt(xmID,zsID, "8-1,");//修改项目状态
			}else{
				sbdcptService.updateXmzt(xmID,zsID, "8-0,");//修改项目状态
			}
		}catch(Exception e){
			System.out.println("第三次推送报错***配号表**"+e);
			sbdcptService.updateXmzt(xmID,zsID, "8-2,");//修改项目状态
		}
		System.out.println("************** 配号表fetchDocSeaDistribution**************");
		fetchDocSeaDistribution();//读取  配号表
		
		//更新海域变更表：4	已配号
		try{
			insertSeaAreaMod(xmID, zsID,"4","1");//已配号、新增
		}catch(Exception e){
			System.out.println("第一次推送报错***海域变更表**"+e);
		}
		//更新宗海表、批文表的变更日期
		try{
			List<?> yhpwList = sbdcptService.fetchYhpw(xmID,zsID);
			if(yhpwList != null && yhpwList.size() != 0){
				System.out.println("yhpwList记录="+yhpwList.size());
				insertDocSeaUseApprovalDoc(yhpwList,xmID,zsID);//插入  用海批文
			}
		}catch(Exception e){
			System.out.println("更新***用海批文**"+e);
		}
		System.out.println("**************用海批文fetchDocSeaUseApprovalDoc**************");
		
		try{
			List<?> zhxxList = sbdcptService.fetchZhxx(xmID, zsID);
			if(zhxxList != null && zhxxList.size() != 0){
				insertReuSeaArea(zhxxList,xmID,zsID);//插入  宗海
			}
		}catch(Exception e){
			System.out.println("更新***宗海**"+e);
		}
		return "goYhxmList";
	}
	
	
	/**
	 * 
	Description :数据库连接
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-16 下午08:03:22
	 */
	public Connection getConnection(){
//		String mdb_filepath = System.getProperty("user.dir").replace('\\', '/') + "/files/nwbjk/SeaTemplate20170921.mdb";
//		String mdb_filepath = "D:/apache-tomcat-6.0.37/webapps/hydg/files/nwbjk/SeaTemplate20170921.mdb";

//		String realPath = ServletActionContext.getServletContext().getRealPath("/files/nwbjk");
//		String mdb_filepath =realPath+File.separator+"SeaTemplate.mdb";
		
		String mdb_filepath = "C:/hydg/nwbjk/SeaTemplate.mdb";
		System.out.println("mdb_filepath="+mdb_filepath);
		try {
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} //驱动程序
		Connection conn=null;
		try {
			conn = DriverManager.getConnection("jdbc:ucanaccess://" + mdb_filepath + ";memory=true");
			System.out.println("conn="+conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	
	/**
	 * 
	Description :获取当前日期
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-17 上午10:40:20
	 */
	public String getDate(){
		Calendar c = Calendar.getInstance();
		Date date = c.getTime();
		System.out.println("系统当前时间："+date);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String datetime = dateFormat.format(date);
	    return datetime;
	}
	/**
	 * 
	Description :获取当前日期
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-17 上午10:49:02
	 */
	public Date getSysDate(){
		Calendar c = Calendar.getInstance();
		Date date = (Date) c.getTime();
		System.out.println("系统当前时间："+date);
	    return date;
	}
	/********************************第一次*******************************/
	
	
	
	/**
	 * 
	Description :海域变更表
	@param:@param yhpwList
	@param:@param xmID
	@param:@param zsID
	@return:void
	@throws
	@Author：yinying
	@Create 2017-11-27 下午02:22:13
	 */
	public void insertSeaAreaMod(String xmID,String zsID,String bgzt,String bglx){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			System.out.println("bgzt="+bgzt+",bglx="+bglx);
			ps = conn.prepareStatement("INSERT INTO sea_area_mod " +
					"(ApprovalDocId,modeStatus,modeType)" +
					" VALUES(?,"+bgzt+","+bglx+")");
			
			String pwbh = sbdcptService.fetchPwbhByXmid(xmID,zsID);
			if(pwbh != null && !pwbh.equals("")){
				//先删除文件中已有的该项目记录
				try{
					PreparedStatement psD=null;
					psD = conn.prepareStatement("delete from sea_area_mod " +
							"where ApprovalDocId = '"+pwbh+"'");
					psD.executeUpdate();
					System.out.println("删除重复批文变更表成功！");
				}catch(Exception e){
					System.out.println("删除重复批文变更表失败！");
				}
			}else{
				pwbh = sbdcptService.fetchPwbh();
				sbdcptService.addPwbh(xmID, pwbh,zsID);
			}
			ps.setString(1,pwbh);//批文编号-主键  NUMBER
					
//			ps.setString(2, bgzt);//变更状态：1已审批;2已注销;3已缴金;4已配号
//			ps.setString(3, bglx);//变更类型:1新增
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	
	
	
	/**
	 * 
	Description :插入 用海批文DOC_SeaUse_ApprovalDoc  14
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-17 上午10:33:09
	 */
	public void insertDocSeaUseApprovalDoc(List<?> yhpwList,String xmID,String zsID){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			String d = getDate();
			d="#"+d+"#";
			System.out.println("d="+d);
			
			ps = conn.prepareStatement("INSERT INTO DOC_SeaUse_ApprovalDoc " +
					"(ApprovalDocId,APPROVALNUM,ApprovalDocName,ProjectName," +
					"CorpName,SeaUseKind,UsedArea,AreaUnit," +
					"ApprovalName,modeType,modeDate)" +//beginDate,duedate,ApplyYear,modeType
					" VALUES(?,?,?,?,?,?,?,?,?,?,"+d+")");
//					" VALUES('1','1','1','1','1','1','1','1','1',"+d+")");
			
			if(yhpwList != null && yhpwList.size() != 0){
				for(int i=0;i<yhpwList.size();i++){
					//PWH,PWMC,YHXMMC,HYSYQR,XMXZ,YHZMJ,MJDW,FWDW
					Object[] obj = (Object[]) yhpwList.get(i);
					
					String pwbh = sbdcptService.fetchPwbhByXmid(xmID,zsID);
					if(pwbh != null && !pwbh.equals("")){
						//先删除文件中已有的该项目记录
						PreparedStatement psD=null;
						psD = conn.prepareStatement("delete from DOC_SeaUse_ApprovalDoc " +
								"where ApprovalDocId = '"+pwbh+"'");
						psD.executeUpdate();
						System.out.println("删除重复批文成功！");
					}else{
						pwbh = sbdcptService.fetchPwbh();
						sbdcptService.addPwbh(xmID, pwbh,zsID);
					}
					ps.setString(1,pwbh);//批文编号-主键  NUMBER
					
					if(obj[0] != null && !obj[0].toString().equals("")){
						ps.setString(2,obj[0].toString());//批文号 VARCHAR2
					}else{
						ps.setString(2,"");
					}
					
					//if(obj[1] != null && !obj[1].toString().equals("")){
					ps.setString(3,"上海市人民政府关于同意"+obj[2].toString()+"用海的批复");//批文名称 VARCHAR2
					//}else{
						
					//	ps.setString(3,"上海市人民政府关于同意此项目用海的批复");
					//}
					
					if(obj[2] != null && !obj[2].toString().equals("")){
						ps.setString(4,obj[2].toString());//项目名称 VARCHAR2
					}else{
						ps.setString(4,"");
					}
					
					if(obj[3] != null && !obj[3].toString().equals("")){
						ps.setString(5,obj[3].toString());//公司名称 VARCHAR2
					}else{
						ps.setString(5,"");
					}
					ps.setString(6,obj[4].toString());//用海性质  NUMBER 代码CT_SeaUse_Kind【select dm,value from base_dictionary t where key='用海性质'】
					ps.setString(7,obj[5].toString());//用海总面积 NUMBER
					ps.setString(8,obj[6].toString());//面积单位 NUMBER 代码CT_AREA_UNIT【select dm,value from base_dictionary t where key='面积单位'】
					
					if(obj[7] != null && !obj[7].toString().equals("")){
						ps.setString(9,obj[7].toString());//发文单位 VARCHAR2
					}else{
						ps.setString(9,"");
					}
					
					ps.setString(10, "1");//变更类型:1新增
					ps.executeUpdate();
				}
			}
			//
//			ps.setString(5,"");//起始时间 DATE
//			ps.setString(11,"");//截止日期 DATE
//			ps.setString(9,"");//年限 NUMBER
//			ps.setString(10,"");//变更类型 NUMBER
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * 
	Description :查询 用海批文DOC_SeaUse_ApprovalDoc  14
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-17 上午10:36:34
	 */
	public static void fetchDocSeaUseApprovalDoc(){
//		Connection conn=getConnection();
		
		String mdb_filepath = "C:/hydg/nwbjk/SeaTemplate.mdb";
		Connection conn=null;
		try {
			conn = DriverManager.getConnection("jdbc:ucanaccess://" + mdb_filepath + ";memory=true");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//读取
		ResultSet rs=null;
		try {
			rs = conn.createStatement().executeQuery("" +
					"SELECT ApprovalDocId,APPROVALNUM,ApprovalDocName,ProjectName,beginDate," +
					"CorpName,SeaUseKind,UsedArea,AreaUnit,ApplyYear,duedate,ApprovalName," +
					"modeType,modeDate" +
					" FROM DOC_SeaUse_ApprovalDoc");
			int i=1;
			while(rs.next()){
				System.out.println("-------------------"+i+"--------------------");
				System.out.println("值ApprovalDocId="+rs.getString("ApprovalDocId"));
				System.out.println("值APPROVALNUM="+rs.getString("APPROVALNUM"));
				System.out.println("值ApprovalDocName="+rs.getString("ApprovalDocName"));
				System.out.println("值ProjectName="+rs.getString("ProjectName"));
				System.out.println("值beginDate="+rs.getString("beginDate"));
				
				System.out.println("值CorpName="+rs.getString("CorpName"));
				System.out.println("值SeaUseKind="+rs.getString("SeaUseKind"));
				System.out.println("值UsedArea="+rs.getString("UsedArea"));
				System.out.println("值AreaUnit="+rs.getString("AreaUnit"));
				System.out.println("值ApplyYear="+rs.getString("ApplyYear"));
				
				System.out.println("值duedate="+rs.getString("duedate"));
				System.out.println("值ApprovalName="+rs.getString("ApprovalName"));
				System.out.println("值modeType="+rs.getString("modeType"));
				System.out.println("值modeDate="+rs.getString("modeDate"));
				i++;
			}				
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	Description :插入 宗海REU_SEA_AREA  28
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-17 上午11:35:34
	 */
	public void insertReuSeaArea(List<?> zhxxList,String xmID,String zsID){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			String d = getDate();
			d="#"+d+"#";
			System.out.println("d="+d);
			
			ps = conn.prepareStatement("INSERT INTO REU_SEA_AREA " +
					"(AreaId,ApprovalDocId,DistrictCode,SeaAreaNum,RealtyUnitCode," +
					"AdminRegionCode,RealtyUnitType,Location,Area,AreaUnit," +
					"Grade,CoastLen,PayFee,SeaUseTypeA,SeaUseTypeB," +
					"Infrastructure,IslandName,Bounds,IslandUse,Note," +
					"FeeStandard,PaymentType,FeeStandardBasis,apply_num,item_name," +
					"modeType,modeDate)" +//ApplyYear、
					" VALUES(?,?,?,?,?,?,?,?,?,?," +
							"?,?,?,?,?,?,?,?,?,?," +
							"?,?,?,?,?,?," +
							""+d+")");
			if(zhxxList != null && zhxxList.size() != 0){
				for(int i=0;i<zhxxList.size();i++){
//					宗海编号、批文编号、不动产类型、
//					坐落、面积、面积单位、海域等级、占用海岸线、使用金总额、用海类型A、用海类型B、
//					使用金征收标准、使用金缴纳方式、使用金征收标准依据、项目编号、项目名称
					Object[] obj = (Object[]) zhxxList.get(i);
					if(obj[0] != null && !obj[0].toString().equals("")){
						
						//先删除文件中已有的该项目记录
						PreparedStatement psD=null;
						psD = conn.prepareStatement("delete from REU_SEA_AREA " +
								"where AreaId='"+obj[0].toString()+"' " +
								" and ApprovalDocId = '"+obj[1].toString()+"'");
						psD.executeUpdate();
						System.out.println("删除重复 宗海REU_SEA_AREA成功！");
						
						ps.setString(1,obj[0].toString());//宗海编号-主键  NUMBERd
					}else{
						ps.setString(1,"0");
					}
					
					if(obj[1] != null && !obj[1].toString().equals("")){
						ps.setString(2,obj[1].toString());//批文编号  NUMBER
					}else{
						ps.setString(2,"0");
					}
					//金山区	310116
					//浦东新区	310115
					//宝山区	310113
					//奉贤区	310226
					//南汇区	310119
					//崇明区	310230
					
					//区县代码 VARCHAR2
					if(obj[16] != null && !obj[16].toString().equals("")){//项目位置
						String xmwz=obj[16].toString();
						if(xmwz.equals("1")){
							ps.setString(3,"11");//宝山区
						}else if(xmwz.equals("2")){
							ps.setString(3,"14");//浦东新区
						}else if(xmwz.equals("3")){
							ps.setString(3,"18");//金山区
						}else if(xmwz.equals("4")){
							ps.setString(3,"15");//南汇区
						}else if(xmwz.equals("5")){
							ps.setString(3,"16");//奉贤区
						}else if(xmwz.equals("6")){
							ps.setString(3,"20");//崇明区
						}
						//ps.setString(25,obj[16].toString());
					}else{
						ps.setString(3,"");
					}
					
//					ps.setString(3,"18");//区县代码 VARCHAR2
					ps.setString(4,"");//宗海/海岛代码 VARCHAR2
					ps.setString(5,"");//不动产单元号 VARCHAR2
					ps.setString(6,"");//属地代码 VARCHAR2
					
					if(obj[2] != null && !obj[2].toString().equals("")){
						ps.setString(7,obj[2].toString());//不动产类型 NUMBER 代码【select dm,value from base_dictionary t where key='不动产类型'】
					}else{
						ps.setString(7,"20");
					}
					
					if(obj[3] != null && !obj[3].toString().equals("")){
						ps.setString(8,obj[3].toString());//坐落VARCHAR2
					}else{
						ps.setString(8,"");
					}
					
					if(obj[4] != null && !obj[4].toString().equals("")){
						ps.setString(9,obj[4].toString());//面积  NUMBER
					}else{
						ps.setString(9,"0");
					}

					if(obj[5] != null && !obj[5].toString().equals("")){
						ps.setString(10,obj[5].toString());//面积单位  NUMBER 代码【select dm,value from base_dictionary t where key='面积单位'】
					}else{
						ps.setString(10,"3");
					}
					
					if(obj[6] != null && !obj[6].toString().equals("")){
						ps.setString(11,obj[6].toString());//海域等级 NUMBER 代码【select dm,value from base_dictionary t where key='海域等别'】
					}else{
						ps.setString(11,"0");
					}
					
					if(obj[7] != null && !obj[7].toString().equals("")){
						ps.setString(12,obj[7].toString());//占用海岸线 NUMBER
					}else{
						ps.setString(12,"0");
					}
					
					if(obj[8] != null && !obj[8].toString().equals("")){
						ps.setString(13,obj[8].toString());//使用金总额  NUMBER
					}else{
						ps.setString(13,"0");
					}
					
					if(obj[9] != null && !obj[9].toString().equals("")){
						ps.setString(14,obj[9].toString());//用海类型A VARCHAR2 代码【select dm,value from base_dictionary t where key='用海类型A'】
					}else{
						ps.setString(14,"");
					}
					
					if(obj[10] != null && !obj[10].toString().equals("")){
						ps.setString(15,obj[10].toString());//用海类型B VARCHAR2 代码【select dm,value from base_dictionary t where key='用海类型B'】
					}else{
						ps.setString(15,"");
					}

					ps.setString(16,"");//用海设施  VARCHAR2
					ps.setString(17,"");//海岛名称  VARCHAR2
					ps.setString(18,"");//用岛范围  VARCHAR2
					ps.setString(19,"");//海岛用途  VARCHAR2
					ps.setString(20,"");//备注  VARCHAR2
					
					if(obj[11] != null && !obj[11].toString().equals("")){
						ps.setString(21,obj[11].toString());//使用金征收标准  VARCHAR2
					}else{
						ps.setString(21,"");
					}
					
					if(obj[12] != null && !obj[12].toString().equals("")){
						ps.setString(22,obj[12].toString());//使用金缴纳方式  NUMBER 代码【select dm,value from base_dictionary t where key='使用金缴纳方式'】
					}else{
						ps.setString(22,"0");
					}
					
					if(obj[13] != null && !obj[13].toString().equals("")){
						ps.setString(23,obj[13].toString());//使用金征收标准依据  VARCHAR2
					}else{
						ps.setString(23,"");
					}
					
					if(obj[14] != null && !obj[14].toString().equals("")){
						ps.setString(24,obj[14].toString());//项目编号  VARCHAR2
					}else{
						ps.setString(24,"");
					}
					
					if(obj[15] != null && !obj[15].toString().equals("")){
						ps.setString(25,obj[15].toString());//项目名称  VARCHAR2
					}else{
						ps.setString(25,"");
					}

					ps.setString(26,"1");//变更类型:1新增
					
					ps.executeUpdate();
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	/**
	 * 
	Description :读取 宗海REU_SEA_AREA  28
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-17 上午11:36:07
	 */
	public void fetchReuSeaArea(){
		Connection conn=getConnection();
		//读取
		ResultSet rs=null;
		try {
			rs = conn.createStatement().executeQuery("" +
					"SELECT AreaId,ApprovalDocId,DistrictCode,SeaAreaNum,RealtyUnitCode," +
					"AdminRegionCode,RealtyUnitType,Location,Area,AreaUnit," +
					"Grade,CoastLen,ApplyYear,PayFee,SeaUseTypeA," +
					"SeaUseTypeB,Infrastructure,IslandName,Bounds,IslandUse," +
					"Note,FeeStandard,PaymentType,FeeStandardBasis,apply_num," +
					"item_name,modeType,modeDate" +
					" FROM REU_SEA_AREA");
			int i =1;
			while(rs.next()){
				System.out.println("-------------------"+i+"--------------------");

				System.out.println("值AreaId="+rs.getString("AreaId"));
				System.out.println("值ApprovalDocId="+rs.getString("ApprovalDocId"));
				System.out.println("值DistrictCode="+rs.getString("DistrictCode"));
				System.out.println("值SeaAreaNum="+rs.getString("SeaAreaNum"));
				System.out.println("值RealtyUnitCode="+rs.getString("RealtyUnitCode"));
				
				System.out.println("值AdminRegionCode="+rs.getString("AdminRegionCode"));
				System.out.println("值RealtyUnitType="+rs.getString("RealtyUnitType"));
				System.out.println("值Location="+rs.getString("Location"));
				System.out.println("值Area="+rs.getString("Area"));
				System.out.println("值AreaUnit="+rs.getString("AreaUnit"));
				
				System.out.println("值Grade="+rs.getString("Grade"));
				System.out.println("值CoastLen="+rs.getString("CoastLen"));
				System.out.println("值ApplyYear="+rs.getString("ApplyYear"));
				System.out.println("值PayFee="+rs.getString("PayFee"));
				System.out.println("值SeaUseTypeA="+rs.getString("SeaUseTypeA"));
				
				System.out.println("值SeaUseTypeB="+rs.getString("SeaUseTypeB"));
				System.out.println("值Infrastructure="+rs.getString("Infrastructure"));
				System.out.println("值IslandName="+rs.getString("IslandName"));
				System.out.println("值Bounds="+rs.getString("Bounds"));
				System.out.println("值IslandUse="+rs.getString("IslandUse"));
				
				System.out.println("值Note="+rs.getString("Note"));
				System.out.println("值FeeStandard="+rs.getString("FeeStandard"));
				System.out.println("值PaymentType="+rs.getString("PaymentType"));
				System.out.println("值FeeStandardBasis="+rs.getString("FeeStandardBasis"));
				System.out.println("值apply_num="+rs.getString("apply_num"));
				
				System.out.println("值item_name="+rs.getString("item_name"));
				System.out.println("值modeType="+rs.getString("modeType"));
				System.out.println("值modeDate="+rs.getString("modeDate"));
				i++;
			}				
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * 
	Description :插入  宗海附图DOC_SeaArea_Map  4  图片
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-17 上午11:24:56
	 */
	public void insertDocSeaAreaMap(List<?> zhftList,String xmID,String zsID){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement("INSERT INTO DOC_SeaArea_Map " +
					"(MapId,AreaId,MapLocation,MapBoundary)" +
					" VALUES(?,?,?,?)");
			if(zhftList != null && zhftList.size() != 0){
				THysyywHysydtYhxmZht hysyywHysydtYhxmYhfsZht = new THysyywHysydtYhxmZht();
				for(int i=0;i<zhftList.size();i++){
//					附图编号、（项目ID）、宗海编号、宗海位置图、宗海界址图
					hysyywHysydtYhxmYhfsZht = (THysyywHysydtYhxmZht) zhftList.get(i);
					if(hysyywHysydtYhxmYhfsZht.getId() != null && !hysyywHysydtYhxmYhfsZht.getId().equals("")){
						
						//先删除文件中已有的该项目记录
						PreparedStatement psD=null;
						psD = conn.prepareStatement("delete from DOC_SeaArea_Map " +
								"where AreaId='"+hysyywHysydtYhxmYhfsZht.getZsid()+"' " +
								" and MapId = '"+hysyywHysydtYhxmYhfsZht.getId()+"'");
						psD.executeUpdate();
						System.out.println("删除重复 宗海附图DOC_SeaArea_Map成功！");
						
						ps.setString(1,hysyywHysydtYhxmYhfsZht.getId()+"");//附图编号-主键  NUMBER
					}else{
						ps.setString(1,"0");
					}
					if(hysyywHysydtYhxmYhfsZht.getZsid() != null && !hysyywHysydtYhxmYhfsZht.getZsid().equals("")){
						ps.setString(2,hysyywHysydtYhxmYhfsZht.getZsid()+"");//宗海编号-外键  NUMBER
					}else{
						ps.setString(2,"0");
					}
					
					ps.setObject(3,hysyywHysydtYhxmYhfsZht.getYhwzt());//宗海位置图  BLOB
					ps.setObject(4,hysyywHysydtYhxmYhfsZht.getJzt());//宗海界址图  BLOB
					ps.executeUpdate();
				}
			}

//			String filePath = System.getProperty("user.dir").replace('\\', '/') + "/WebRoot/files/nwbjk/11.jpg";
//			System.out.println("filePath="+filePath);
//			File f = new File(filePath);
//			FileInputStream fis = null;
//			fis = new FileInputStream(f);
//			byte[] bs = new byte[fis.available()];
//			fis.read(bs);
//
//			ps.setObject(3,bs);//宗海位置图  BLOB
//			ps.setObject(4,bs);//宗海界址图  BLOB

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
	}
	/**
	 * 
	Description :查询  宗海附图DOC_SeaArea_Map  4  图片
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-17 上午11:24:56
	 */
	public void fetchDocSeaAreaMap(){
		Connection conn=getConnection();
		//读取
		ResultSet rs=null;
		try {
			rs = conn.createStatement().executeQuery("" +
					"SELECT MapId,AreaId,MapLocation,MapBoundary" +
					" FROM DOC_SeaArea_Map");
			
			String filePath = "C://hydg/nwbjk";
//			String filePath = System.getProperty("user.dir").replace('\\', '/') + "/WebRoot/files/nwbjk";
			File file = new File(filePath);
			if(!file.exists())
				file.mkdirs();
			FileOutputStream fos = null;
			BufferedOutputStream bos = null;

			int i=1;
			while(rs.next()){
				System.out.println("-------------------"+i+"--------------------");
				System.out.println("值MapId="+rs.getString("MapId"));
				System.out.println("值AreaId="+rs.getString("AreaId"));

				String path1 = filePath +File.separator+ "outWzt"+i+".jpg";
				fos = new FileOutputStream(path1);
				bos = new BufferedOutputStream(fos);
				bos.write(rs.getBytes("MapLocation"));
				
				String path2 = filePath +File.separator+ "outJzt"+i+".jpg";
				fos = new FileOutputStream(path2);
				bos = new BufferedOutputStream(fos);
				bos.write(rs.getBytes("MapBoundary"));
				i++;
			}				
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	/**
	 * 
	Description :插入   用海情况DOC_SeaUsage  9
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-17 上午10:15:35
	 */
	public void insertDocSeaUsage(List<?> yhqkList,String xmID,String zsID){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement("INSERT INTO DOC_SeaUsage " +
					"(UsageId,AreaId,SeaUseMode,Area,AreaUnit,UsageDetail,Royalties,corbounds,Note)" +
					" VALUES(?,?,?,?,?,?,?,?,?)");
			
			if(yhqkList != null && yhqkList.size() != 0){
				for(int i=0;i<yhqkList.size();i++){
//					用海编号、宗海编号、用海方式、面积、面积单位、具体用途、使用金数额
					Object[] obj = (Object[]) yhqkList.get(i);
					if(obj[0] != null && !obj[0].toString().equals("")){
						//先删除文件中已有的该项目记录
						PreparedStatement psD=null;
						psD = conn.prepareStatement("delete from DOC_SeaUsage " +
								"where UsageId='"+obj[0].toString()+"'" +
								" and AreaId = '"+obj[1].toString()+"'");
						psD.executeUpdate();
						System.out.println("删除重复 用海情况DOC_SeaUsage成功！");
						
						
						ps.setString(1,obj[0].toString());//用海编号-主键  NUMBER
					}else{
						ps.setString(1,"0");
					}
					
					if(obj[1] != null && !obj[1].toString().equals("")){
						ps.setString(2,obj[1].toString());//宗海编号-外键  NUMBER
					}else{
						ps.setString(2,"0");
					}
					
					if(obj[2] != null && !obj[2].toString().equals("")){
						ps.setString(3,obj[2].toString());//用海方式  NUMBER 代码CT_SeaUse_Mode【select dm,value from base_dictionary t where key='用海方式'】
					}else{
						ps.setString(3,"0");
					}
					
					if(obj[3] != null && !obj[3].toString().equals("")){
						ps.setString(4,obj[3].toString());//面积  NUMBER
					}else{
						ps.setString(4,"0");
					}
					
					if(obj[4] != null && !obj[4].toString().equals("")){
						ps.setString(5,obj[4].toString());//面积单位  NUMBER 代码CT_AREA_UNIT【select dm,value from base_dictionary t where key='面积单位'】
					}else{
						ps.setString(5,"0");
					}
					
					if(obj[5] != null && !obj[5].toString().equals("")){
						ps.setString(6,obj[5].toString());//具体用途  VARCHAR2
					}else{
						ps.setString(6,"");
					}
					
					if(obj[6] != null && !obj[6].toString().equals("")){
						ps.setString(7,obj[6].toString());//使用金数额  NUMBER
					}else{
						ps.setString(7,"0");
					}
					
					ps.setString(8,"");//坐标范围
					ps.setString(9,"");//备注
					ps.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * 
	Description :查询  用海情况DOC_SeaUsage  9
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-17 上午10:18:41
	 */
	public void fetchDocSeaUsage(){
		Connection conn=getConnection();
		//读取
		ResultSet rs=null;
		try {
			rs = conn.createStatement().executeQuery("" +
					"SELECT UsageId,AreaId,SeaUseMode,Area,AreaUnit,UsageDetail,Royalties,corbounds,Note" +
					" FROM DOC_SeaUsage");
			int i=1;
			while(rs.next()){
				System.out.println("-------------------"+i+"--------------------");
				System.out.println("值UsageId="+rs.getString("UsageId"));
				System.out.println("值AreaId="+rs.getString("AreaId"));
				System.out.println("值SeaUseMode="+rs.getString("SeaUseMode"));
				System.out.println("值Area="+rs.getString("Area"));
				System.out.println("值AreaUnit="+rs.getString("AreaUnit"));
				System.out.println("值UsageDetail="+rs.getString("UsageDetail"));
				System.out.println("值Royalties="+rs.getString("Royalties"));
				System.out.println("值corbounds="+rs.getString("corbounds"));
				System.out.println("值Note="+rs.getString("Note"));
				i++;
			}				
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	Description :插入   海域坐标REU_SeaCoordinates  7
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-16 下午08:02:58
	 */
	public void insertReuSeaCoordinates(List<?> hyzbList,String xmID,String zsID){
//		String mdb_filepath = System.getProperty("user.dir").replace('\\', '/') + "/WebRoot/files/nwbjk/SeaTemplate.mdb";
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
//			conn = DriverManager.getConnection("jdbc:ucanaccess://" + mdb_filepath + ";memory=true");
//			System.out.println(mdb_filepath);
//			System.out.println(conn.getMetaData());
			
			ps = conn.prepareStatement("INSERT INTO REU_SeaCoordinates" +
					" (CoordId,AreaId,PtNum,Latitudes,Longtitudes)" +
					" VALUES(?,?,?,?,?)");
			
			if(hyzbList != null && hyzbList.size() != 0){
				for(int i=0;i<hyzbList.size();i++){
					//坐标编号、宗海编号、序号、北纬、东经
					Object[] obj = (Object[]) hyzbList.get(i);
					if(obj[0] != null && !obj[0].toString().equals("")){
						//先删除文件中已有的该项目记录
						PreparedStatement psD=null;
						psD = conn.prepareStatement("delete from REU_SeaCoordinates " +
								"where CoordId='"+obj[0].toString()+"'" +
								" and AreaId = '"+obj[1].toString()+"'");
						psD.executeUpdate();
						System.out.println("删除重复 海域坐标REU_SeaCoordinates成功！");
						
						ps.setString(1,obj[0].toString());//坐标编号-主键  NUMBER
					}else{
						ps.setString(1,"0");
					}
					
					if(obj[1] != null && !obj[1].toString().equals("")){
						ps.setString(2,obj[1].toString());//宗海编号-外键  NUMBER
					}else{
						ps.setString(2,"0");
					}
					
					if(obj[2] != null && !obj[2].toString().equals("")){
						ps.setString(3,obj[2].toString());//序号  NUMBER
					}else{
						ps.setString(3,"0");
					}
					
					if(obj[3] != null && !obj[3].toString().equals("")){
						ps.setString(4,obj[3].toString());//北纬  VARCHAR2
					}else{
						ps.setString(4,"");
					}
					
					if(obj[4] != null && !obj[4].toString().equals("")){
						ps.setString(5,obj[4].toString());//东经  VARCHAR2
					}else{
						ps.setString(5,"");
					}
					ps.executeUpdate();
				}
			}
//			ps = conn.prepareStatement("INSERT INTO REU_SeaCoordinates" +
//					" (CoordId,AreaId,PtNum,Latitudes,Longtitudes)" +
//					" VALUES('2','1','3','44.66','77.77')");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * 
	Description :查询  海域坐标REU_SeaCoordinates  7
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-16 下午08:02:58
	 */
	public void fetchReuSeaCoordinates(){
		Connection conn=getConnection();
//		try {
//			System.out.println(conn.getMetaData());
//		} catch (SQLException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		//读取
		ResultSet rs=null;
		try {
			rs = conn.createStatement().executeQuery("" +
					"SELECT CoordId,AreaId,PtNum,Latitudes,Longtitudes " +
					" FROM REU_SeaCoordinates");
			int i=1;
			while(rs.next()){
				System.out.println("-------------------"+i+"--------------------");
				System.out.println("值CoordId="+rs.getString("CoordId"));
				System.out.println("值AreaId="+rs.getString("AreaId"));
				System.out.println("值PtNum="+rs.getString("PtNum"));
				System.out.println("值Latitudes="+rs.getString("Latitudes"));
				System.out.println("值Longtitudes="+rs.getString("Longtitudes"));
				i++;
			}				
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	Description :插入 用海（岛）面域定点顺序表DOC_SeaUsage_Coordinates  5
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-17 上午11:18:27
	 */
	public void insertDocSeaUsageCoordinates(List<?> yhmyddsxbList,String xmID,String zsID){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement("INSERT INTO DOC_SeaUsage_Coordinates " +
					"(CoordId,AreaId,UsageId,PtNum,ApprovalDocId)" +
					" VALUES(?,?,?,?,?)");
			if(yhmyddsxbList != null && yhmyddsxbList.size() != 0){
				for(int i=0;i<yhmyddsxbList.size();i++){
					//坐标编号、宗海编号、用海编号、序号、批文编号
					Object[] obj = (Object[]) yhmyddsxbList.get(i);
					if(obj[0] != null && !obj[0].toString().equals("")){
						//先删除文件中已有的该项目记录
						PreparedStatement psD=null;
						psD = conn.prepareStatement("delete from DOC_SeaUsage_Coordinates " +
								"where CoordId='"+obj[0].toString()+"'" +
								" and AreaId = '"+obj[1].toString()+"'");
						psD.executeUpdate();
						System.out.println("删除重复 用海（岛）面域定点顺序表DOC_SeaUsage_Coordinates成功！");
						
						
						ps.setString(1,obj[0].toString());//坐标编号-主键  NUMBER
					}else{
						ps.setString(1,"0");
					}
					
					if(obj[1] != null && !obj[1].toString().equals("")){
						ps.setString(2,obj[1].toString());//宗海编号-外键  NUMBER
					}else{
						ps.setString(2,"0");
					}
					
					if(obj[2] != null && !obj[2].toString().equals("")){
						ps.setString(3,obj[2].toString());//用海编号  NUMBER
					}else{
						ps.setString(3,"0");
					}
					
					if(obj[3] != null && !obj[3].toString().equals("")){
						ps.setString(4,obj[3].toString());//序号  NUMBER
					}else{
						ps.setString(4,"0");
					}
					
					if(obj[4] != null && !obj[4].toString().equals("")){
						ps.setString(5,obj[4].toString());//批文编号  NUMBER
					}else{
						ps.setString(5,"0");
					}
					ps.executeUpdate();
				}
				//再执行下第一行
				for(int i=0;i<1;i++){
					//坐标编号、宗海编号、用海编号、序号、批文编号
					Object[] obj = (Object[]) yhmyddsxbList.get(i);
					if(obj[0] != null && !obj[0].toString().equals("")){
//						//先删除文件中已有的该项目记录
//						PreparedStatement psD=null;
//						psD = conn.prepareStatement("delete from DOC_SeaUsage_Coordinates " +
//								"where CoordId='"+obj[0].toString()+"'" +
//								" and AreaId = '"+obj[1].toString()+"'");
//						psD.executeUpdate();
//						System.out.println("删除重复 用海（岛）面域定点顺序表DOC_SeaUsage_Coordinates成功！");

						ps.setString(1,obj[0].toString());//坐标编号-主键  NUMBER
					}else{
						ps.setString(1,"0");
					}
					
					if(obj[1] != null && !obj[1].toString().equals("")){
						ps.setString(2,obj[1].toString());//宗海编号-外键  NUMBER
					}else{
						ps.setString(2,"0");
					}
					
					if(obj[2] != null && !obj[2].toString().equals("")){
						ps.setString(3,obj[2].toString());//用海编号  NUMBER
					}else{
						ps.setString(3,"0");
					}
					
					if(obj[3] != null && !obj[3].toString().equals("")){
						ps.setString(4,obj[3].toString());//序号  NUMBER
					}else{
						ps.setString(4,"0");
					}
					
					if(obj[4] != null && !obj[4].toString().equals("")){
						ps.setString(5,obj[4].toString());//批文编号  NUMBER
					}else{
						ps.setString(5,"0");
					}
					ps.executeUpdate();
				}
				
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * 
	Description :查询  用海（岛）面域定点顺序表DOC_SeaUsage_Coordinates  5
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-17 上午11:20:33
	 */
	public void fetchDocSeaUsageCoordinates(){
		Connection conn=getConnection();
		//读取
		ResultSet rs=null;
		try {
			rs = conn.createStatement().executeQuery("" +
					"SELECT CoordId,AreaId,UsageId,PtNum,ApprovalDocId" +
					" FROM DOC_SeaUsage_Coordinates");
			int i=1;
			while(rs.next()){
				System.out.println("-------------------"+i+"--------------------");
				System.out.println("值CoordId="+rs.getString("CoordId"));
				System.out.println("值AreaId="+rs.getString("AreaId"));
				System.out.println("值UsageId="+rs.getString("UsageId"));
				System.out.println("值PtNum="+rs.getString("PtNum"));
				System.out.println("值ApprovalDocId="+rs.getString("ApprovalDocId"));
				i++;
			}				
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	/********************************第二次*******************************/
	
	/**
	 * 
	Description :插入  海域使用金缴纳情况DOC_Sea_Payments  9
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-18 上午11:34:33
	 */
	public void insertDocSeaPayments(List<?> hysyjjnqkList,String xmID,String zsID){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
//			String d = getDate();
//			d="#"+d+"#";
//			System.out.println("d="+d);
			ps = conn.prepareStatement("INSERT INTO DOC_Sea_Payments " +
					"(AreaId,PaymentId,Payer,PaymentInfo,Note,payee,amount,PayDate)" +
					" VALUES(?,?,?,?,?,?,?,?)");//"+d+"
			if(hysyjjnqkList != null && hysyjjnqkList.size() != 0){
				for(int i=0;i<hysyjjnqkList.size();i++){
					//宗海编号、使用金缴纳编号、缴纳人、缴纳情况、备注、收款人、收款金额、缴纳日期
					Object[] obj = (Object[]) hysyjjnqkList.get(i);
					if(obj[0] != null && !obj[0].toString().equals("")){
						//先删除文件中已有的该项目记录
						PreparedStatement psD=null;
						psD = conn.prepareStatement("delete from DOC_Sea_Payments " +
								"where PaymentId='"+obj[1].toString()+"'" +
								" and AreaId = '"+obj[0].toString()+"'");
						psD.executeUpdate();
						System.out.println("删除重复 海域使用金缴纳情况DOC_Sea_Payments成功！");
						
						
						ps.setString(1,obj[0].toString());//宗海编号  NUMBER
					}else{
						ps.setString(1,"0");
					}
					
					if(obj[1] != null && !obj[1].toString().equals("")){
						ps.setString(2,obj[1].toString());//使用金缴纳编号 NUMBER
					}else{
						ps.setString(2,"0");
					}
					
					if(obj[2] != null && !obj[2].toString().equals("")){
						ps.setString(3,obj[2].toString());//缴纳人  VARCHAR2
					}else{
						ps.setString(3,"");
					}
					
					if(obj[3] != null && !obj[3].toString().equals("")){
						ps.setString(4,obj[3].toString());//缴纳情况  VARCHAR2
					}else{
						ps.setString(4,"已缴纳");
					}
					
					if(obj[4] != null && !obj[4].toString().equals("")){
						ps.setString(5,obj[4].toString());//备注  VARCHAR2
					}else{
						ps.setString(5,"");
					}
					
					if(obj[5] != null && !obj[5].toString().equals("")){
						ps.setString(6,obj[5].toString());//收款人  VARCHAR2
					}else{
						ps.setString(6,"上海市国库收付中心");
					}
					
					if(obj[6] != null && !obj[6].toString().equals("")){
						ps.setString(7,obj[6].toString());//收款金额  NUMBER
					}else{
						ps.setString(7,"0");
					}
					
					System.out.println("缴纳日期="+obj[7].toString());
					if(obj[7] != null && !obj[7].toString().equals("")){
						Calendar cal = Calendar.getInstance();
						java.sql.Timestamp timestampnow = new java.sql.Timestamp(cal.getTimeInMillis());
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						ParsePosition pos = new ParsePosition(0);
						Date current = dateFormat.parse(obj[7].toString(), pos);
						timestampnow = new java.sql.Timestamp(current.getTime());
						ps.setObject(8,timestampnow);//缴纳日期  DATE
					}else{
						Calendar cal = Calendar.getInstance();
						java.sql.Timestamp timestampnow = new java.sql.Timestamp(cal.getTimeInMillis());
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						ParsePosition pos = new ParsePosition(0);
						Date current = dateFormat.parse(getDate(), pos);
						timestampnow = new java.sql.Timestamp(current.getTime());
						ps.setObject(8,timestampnow);//缴纳日期  DATE
					}
					
//					ps.setString(8,"11");//缴纳日期  DATE
					ps.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * 
	Description :查询  海域使用金缴纳情况DOC_Sea_Payments  9
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-18 上午11:34:33
	 */
	public void fetchDocSeaPayments(){
		Connection conn=getConnection();
		//读取
		ResultSet rs=null;
		try {
			rs = conn.createStatement().executeQuery("" +
					"SELECT AreaId,PaymentId,Payer,PayDate,PaymentInfo,Note,payee,amount" +
					" FROM DOC_Sea_Payments");
			while(rs.next()){
				System.out.println("值AreaId="+rs.getString("AreaId"));
				System.out.println("值PaymentId="+rs.getString("PaymentId"));
				System.out.println("值Payer="+rs.getString("Payer"));
				System.out.println("值PayDate="+rs.getString("PayDate"));
				System.out.println("值PaymentInfo="+rs.getString("PaymentInfo"));
				System.out.println("值Note="+rs.getString("Note"));
				System.out.println("值payee="+rs.getString("payee"));
				System.out.println("值amount="+rs.getString("amount"));
			}				
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/********************************第三次*******************************/
	
	/**
	 * 
	Description :插入  配号表 doc_sea_distribution  7
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-18 上午11:40:25
	 */
	public void insertDocSeaDistribution(List<?> phbList,String xmID,String zsID){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
//			String d = getDate();
//			d="#"+d+"#";
//			System.out.println("d="+d);
			ps = conn.prepareStatement("INSERT INTO doc_sea_distribution " +
					"(areaid,APPROVALNUM,applyNum," +
					"distributionResult,distributer,begindate,distributiondate)" +
					" VALUES(?,?,?,?,?,?,?)");//,"+d+","+d+"
			if(phbList != null && phbList.size() != 0){
				for(int i=0;i<phbList.size();i++){
					//宗海编号、批文号、受理编号、配号结果、配号人、开始日期、配号日期
					Object[] obj = (Object[]) phbList.get(i);
					if(obj[0] != null && !obj[0].toString().equals("")){
						//先删除文件中已有的该项目记录
						PreparedStatement psD=null;
						psD = conn.prepareStatement("delete from doc_sea_distribution " +
								"where areaid='"+obj[0].toString()+"'" +
								" and APPROVALNUM = '"+obj[1].toString()+"' " +
								" and applyNum ='"+obj[2].toString()+"' ");
						psD.executeUpdate();
						System.out.println("删除重复 配号表doc_sea_distribution成功！");
						
						
						ps.setString(1,obj[0].toString());//宗海编号  NUMBER
					}else{
						ps.setString(1,"0");
					}
					
					if(obj[1] != null && !obj[1].toString().equals("")){
						ps.setString(2,obj[1].toString());//批文号 varchar2
					}else{
						ps.setString(2,"0");
					}
					
					
					ps.setString(3,"");
					
					
					if(obj[2] != null && !obj[2].toString().equals("")){
						ps.setString(4,obj[2].toString());//配号结果  varchar2
					}else{
						ps.setString(4,"");
					}
					
					if(obj[4] != null && !obj[4].toString().equals("")){
						ps.setString(5,obj[4].toString());//配号人  varchar2
					}else{
						ps.setString(5,"国家动管系统配号");
					}
					System.out.println("开始日期/配号日期="+obj[5].toString());
					
					if(obj[5] != null && !obj[5].toString().equals("")){
						Calendar cal = Calendar.getInstance();
						java.sql.Timestamp timestampnow = new java.sql.Timestamp(cal.getTimeInMillis());
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						ParsePosition pos = new ParsePosition(0);
						Date current = dateFormat.parse(obj[5].toString(), pos);
						timestampnow = new java.sql.Timestamp(current.getTime());

						ps.setObject(6,timestampnow);//开始日期  date
						ps.setObject(7,timestampnow);//配号日期  date
					}else{
						Calendar cal = Calendar.getInstance();
						java.sql.Timestamp timestampnow = new java.sql.Timestamp(cal.getTimeInMillis());
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						ParsePosition pos = new ParsePosition(0);
						Date current = dateFormat.parse(getDate(), pos);
						timestampnow = new java.sql.Timestamp(current.getTime());
						ps.setObject(6,timestampnow);//开始日期  date
						ps.setObject(7,timestampnow);//配号日期  date
					}
					
					ps.executeUpdate();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * 
	Description :查询  配号表 doc_sea_distribution  7
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-18 上午11:40:25
	 */
	public void fetchDocSeaDistribution(){
		Connection conn=getConnection();
		//读取
		ResultSet rs=null;
		try {
			rs = conn.createStatement().executeQuery("" +
					"SELECT areaid,APPROVALNUM,applyNum,begindate," +
					"distributionResult,distributer,distributiondate" +
					" FROM doc_sea_distribution");
			while(rs.next()){
				System.out.println("值areaid="+rs.getString("areaid"));
				System.out.println("值APPROVALNUM="+rs.getString("APPROVALNUM"));
				System.out.println("值applyNum="+rs.getString("applyNum"));
				System.out.println("值begindate="+rs.getString("begindate"));
				System.out.println("值distributionResult="+rs.getString("distributionResult"));
				System.out.println("值distributer="+rs.getString("distributer"));
				System.out.println("值distributiondate="+rs.getString("distributiondate"));
			}				
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/********************************代码表*******************************/
	
	
	/***********************open项目、宗海详情******开始*****************/
	/**
	 * 
	Description :项目详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-24 下午04:38:17
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
	Description :宗海信息详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-24 下午04:39:55
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
		
		
		//项目信息
		hysyywHysydtYhxm = businessService.fetchYhxmDetail(xmID);
		//项目附件列表
		yhxmfjList = businessService.fetchYhxmXmfj(xmID,"");
		//宗海信息详情
		yhxmzsxxList = businessService.fetchYhxmZsxx(xmID);
		
		session.put("yhxmmc", hysyywHysydtYhxm.getYhxmmc());
	
		return "zhxxDetail";
	}
	
	
	/***********************open项目、宗海详情****结束*******************/
	
	
	/**
	 * 
	Description :项目详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-24 下午04:38:17
	 */
	public String fetchYhxmDetaile2(){
		System.out.println("xmID="+xmID);
		//项目信息
		hysyywHysydtYhxm = businessService.fetchYhxmDetail(xmID);
		//项目附件列表
		yhxmfjList = businessService.fetchYhxmXmfj(xmID,"");
		//宗海信息详情
		yhxmzsxxList = businessService.fetchYhxmZsxx(xmID);
		
		session.put("yhxmmc", hysyywHysydtYhxm.getYhxmmc());
		return "yhxmDetail2";
	}
	
	/**
	 * 
	Description :宗海信息详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-24 下午04:39:55
	 */
	public String fetchZhxxDetail2(){
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
		
		
		return "yhxmZhxxDetail2";
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
	public String fetchZhxxDetailByHyglh2(){
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
		
		
		//项目信息
		hysyywHysydtYhxm = businessService.fetchYhxmDetail(xmID);
		//项目附件列表
		yhxmfjList = businessService.fetchYhxmXmfj(xmID,"");
		//宗海信息详情
		yhxmzsxxList = businessService.fetchYhxmZsxx(xmID);
		
		session.put("yhxmmc", hysyywHysydtYhxm.getYhxmmc());
	
		return "zhxxDetail2";
	}
	
	
	/**************************市规土局反馈*******************************/
	
	/**
	 * 
	Description :反馈信息的JDBC
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-16 下午04:45:54
	 */
	public Connection getConnectionFk(){
		String mdb_filepath = "C:/hydg/nwbjk/SeaTemplate_realty.mdb";
		System.out.println("mdb_filepath="+mdb_filepath);
		try {
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} //驱动程序
		Connection conn=null;
		try {
			conn = DriverManager.getConnection("jdbc:ucanaccess://" + mdb_filepath + ";memory=true");
			System.out.println("conn="+conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * 
	Description :执行并展示
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-22 上午10:36:30
	 */
	public String fetchSbdcptFk(){
		this.fetchVwSeaRightinfo();
		
		return "goFkIndex";
	}
	
	
	/**
	 * 
	Description :读取反馈信息
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-16 下午04:45:54
	 */
	public void fetchVwSeaRightinfo(){
		Connection conn=getConnectionFk();
		//读取
		ResultSet rs=null;
		try {
			rs = conn.createStatement().executeQuery("" +
						"SELECT LEGALNAME,LEGALPOSITION,LEGALCARDNO,AGENTADDRESS,AGENTZIP,AGENTNAME," +
						"AGENTTEL,PROJECTNAME,NAME,TEL,SEAUSEKIND,APPROVALNUM,USEDAREA,AREA," +
						"SEAUSETYPEA,SEAUSETYPEB,SEAUSEMODE,APPLYYEAR,BEGINDATE,DUEDATE,OTHER," +
						"OTHER_PASSDATE,LIMIT,LIMIT_PASSDATE,DISSENT,DISSENT_PASSDATE,CORRECT," +
						"realNO,UNITCODE,PASSDATE,ENDDATE,ACCEPTUSER,AUDITUSER" +
						" FROM Vw_Sea_Rightinfo");
			THysyywNwbjkSbdcptFk hysyywNwbjkSbdcptFk = null;
			while(rs.next()){
				
//					System.out.println("值LEGALNAME="+rs.getString("LEGALNAME"));
//					System.out.println("值LEGALPOSITION="+rs.getString("LEGALPOSITION"));
//					System.out.println("值LEGALCARDNO="+rs.getString("LEGALCARDNO"));
//					System.out.println("值AGENTADDRESS="+rs.getString("AGENTADDRESS"));
//					System.out.println("值AGENTZIP="+rs.getString("AGENTZIP"));
//					System.out.println("值AGENTNAME="+rs.getString("AGENTNAME"));
//					
//					System.out.println("值AGENTTEL="+rs.getString("AGENTTEL"));
//					System.out.println("值PROJECTNAME="+rs.getString("PROJECTNAME"));
//					System.out.println("值NAME="+rs.getString("NAME"));
//					System.out.println("值TEL="+rs.getString("TEL"));
//					System.out.println("值SEAUSEKIND="+rs.getString("SEAUSEKIND"));
//					System.out.println("值APPROVALNUM="+rs.getString("APPROVALNUM"));
//					System.out.println("值USEDAREA="+rs.getString("USEDAREA"));
//					System.out.println("值AREA="+rs.getString("AREA"));
//					
//					System.out.println("值SEAUSETYPEA="+rs.getString("SEAUSETYPEA"));
//					System.out.println("值SEAUSETYPEB="+rs.getString("SEAUSETYPEB"));
//					System.out.println("值SEAUSEMODE="+rs.getString("SEAUSEMODE"));
//					System.out.println("值APPLYYEAR="+rs.getString("APPLYYEAR"));
//					System.out.println("值BEGINDATE="+rs.getString("BEGINDATE"));
//					System.out.println("值DUEDATE="+rs.getString("DUEDATE"));
//					System.out.println("值OTHER="+rs.getString("OTHER"));
//					
//					System.out.println("值OTHER_PASSDATE="+rs.getString("OTHER_PASSDATE"));
//					System.out.println("值LIMIT="+rs.getString("LIMIT"));
//					System.out.println("值LIMIT_PASSDATE="+rs.getString("LIMIT_PASSDATE"));
//					System.out.println("值DISSENT="+rs.getString("DISSENT"));
//					System.out.println("值DISSENT_PASSDATE="+rs.getString("DISSENT_PASSDATE"));
//					System.out.println("值CORRECT="+rs.getString("CORRECT"));
//					
//					System.out.println("值realNO="+rs.getString("realNO"));
//					System.out.println("值UNITCODE="+rs.getString("UNITCODE"));
//					System.out.println("值PASSDATE="+rs.getString("PASSDATE"));
//					System.out.println("值ENDDATE="+rs.getString("ENDDATE"));
//					System.out.println("值ACCEPTUSER="+rs.getString("ACCEPTUSER"));
//					System.out.println("值AUDITUSER="+rs.getString("AUDITUSER"));
					
					hysyywNwbjkSbdcptFk = new THysyywNwbjkSbdcptFk();
					//插入表中
					if(rs.getString("LEGALNAME") != null && !rs.getString("LEGALNAME").equals("") && !rs.getString("LEGALNAME").equals("null")){
						hysyywNwbjkSbdcptFk.setLegalname(rs.getString("LEGALNAME"));
					}else{
						hysyywNwbjkSbdcptFk.setLegalname("");
					}
					if(rs.getString("legalposition") != null && !rs.getString("legalposition").equals("") && !rs.getString("legalposition").equals("null")){
						hysyywNwbjkSbdcptFk.setLegalposition(rs.getString("legalposition"));
					}else{
						hysyywNwbjkSbdcptFk.setLegalposition("");
					}
					if(rs.getString("legalcardno") != null && !rs.getString("legalcardno").equals("") && !rs.getString("legalcardno").equals("null")){
						hysyywNwbjkSbdcptFk.setLegalcardno(rs.getString("legalcardno"));
					}else{
						hysyywNwbjkSbdcptFk.setLegalcardno("");
					}
					if(rs.getString("agentaddress") != null && !rs.getString("agentaddress").equals("") && !rs.getString("agentaddress").equals("null")){
						hysyywNwbjkSbdcptFk.setAgentaddress(rs.getString("agentaddress"));
					}else{
						hysyywNwbjkSbdcptFk.setAgentaddress("");
					}
					if(rs.getString("agentzip") != null && !rs.getString("agentzip").equals("") && !rs.getString("agentzip").equals("null")){
						hysyywNwbjkSbdcptFk.setAgentzip(rs.getString("agentzip"));
					}else{
						hysyywNwbjkSbdcptFk.setAgentzip("");
					}
					if(rs.getString("agentname") != null && !rs.getString("agentname").equals("") && !rs.getString("agentname").equals("null")){
						hysyywNwbjkSbdcptFk.setAgentname(rs.getString("agentname"));
					}else{
						hysyywNwbjkSbdcptFk.setAgentname("");
					}
					if(rs.getString("agenttel") != null && !rs.getString("agenttel").equals("") && !rs.getString("agenttel").equals("null")){
						hysyywNwbjkSbdcptFk.setAgenttel(rs.getString("agenttel"));
					}else{
						hysyywNwbjkSbdcptFk.setAgenttel("");
					}
					if(rs.getString("projectname") != null && !rs.getString("projectname").equals("") && !rs.getString("projectname").equals("null")){
						hysyywNwbjkSbdcptFk.setProjectname(rs.getString("projectname"));
					}else{
						hysyywNwbjkSbdcptFk.setProjectname("");
					}
					if(rs.getString("name") != null && !rs.getString("name").equals("") && !rs.getString("name").equals("null")){
						hysyywNwbjkSbdcptFk.setName(rs.getString("name"));
					}else{
						hysyywNwbjkSbdcptFk.setName("");
					}
					if(rs.getString("tel") != null && !rs.getString("tel").equals("") && !rs.getString("tel").equals("null")){
						hysyywNwbjkSbdcptFk.setTel(rs.getString("tel"));
					}else{
						hysyywNwbjkSbdcptFk.setTel("");
					}
					
					if(rs.getString("seausekind") != null && !rs.getString("seausekind").equals("") && !rs.getString("seausekind").equals("null")){
					hysyywNwbjkSbdcptFk.setSeausekind(rs.getString("seausekind"));
					}else{
						hysyywNwbjkSbdcptFk.setSeausekind("");
					}
					if(rs.getString("approvalnum") != null && !rs.getString("approvalnum").equals("") && !rs.getString("approvalnum").equals("null")){
					hysyywNwbjkSbdcptFk.setApprovalnum(rs.getString("approvalnum"));
					}else{
						hysyywNwbjkSbdcptFk.setApprovalnum("");
					}
					if(rs.getString("usedarea") != null && !rs.getString("usedarea").equals("") && !rs.getString("usedarea").equals("null")){
					hysyywNwbjkSbdcptFk.setUsedarea(rs.getString("usedarea"));
					}else{
						hysyywNwbjkSbdcptFk.setUsedarea("");
					}
					if(rs.getString("area") != null && !rs.getString("area").equals("") && !rs.getString("area").equals("null")){
					hysyywNwbjkSbdcptFk.setArea(rs.getString("area"));
					}else{
						hysyywNwbjkSbdcptFk.setArea("");
					}
					if(rs.getString("seausetypea") != null && !rs.getString("seausetypea").equals("") && !rs.getString("seausetypea").equals("null")){
					hysyywNwbjkSbdcptFk.setSeausetypea(rs.getString("seausetypea"));
					}else{
						hysyywNwbjkSbdcptFk.setSeausetypea("");
					}
					if(rs.getString("seausetypeb") != null && !rs.getString("seausetypeb").equals("") && !rs.getString("seausetypeb").equals("null")){
					hysyywNwbjkSbdcptFk.setSeausetypeb(rs.getString("seausetypeb"));
					}else{
						hysyywNwbjkSbdcptFk.setSeausetypeb("");
					}
					if(rs.getString("seausemode") != null && !rs.getString("seausemode").equals("") && !rs.getString("seausemode").equals("null")){
					hysyywNwbjkSbdcptFk.setSeausemode(rs.getString("seausemode"));
					}else{
						hysyywNwbjkSbdcptFk.setSeausemode("");
					}
					if(rs.getString("applyyear") != null && !rs.getString("applyyear").equals("") && !rs.getString("applyyear").equals("null")){
					hysyywNwbjkSbdcptFk.setApplyyear(rs.getString("applyyear"));
					}else{
						hysyywNwbjkSbdcptFk.setApplyyear("");
					}
					
					String begindate = rs.getString("begindate");
					if(begindate != null && !begindate.equals("") && !begindate.equals("null")){
						begindate = rs.getString("begindate").substring(0, 10);
						hysyywNwbjkSbdcptFk.setBegindate(begindate);//日期
					}else{
						hysyywNwbjkSbdcptFk.setBegindate("");
					}
					
					String duedate = rs.getString("duedate");
					if(duedate != null && !duedate.equals("") && !duedate.equals("null")){
						duedate = rs.getString("duedate").substring(0, 10);
						hysyywNwbjkSbdcptFk.setDuedate(duedate);//日期
					}else{
						hysyywNwbjkSbdcptFk.setDuedate("");
					}
					
					if(rs.getString("other") != null && !rs.getString("other").equals("") && !rs.getString("other").equals("null")){
						hysyywNwbjkSbdcptFk.setOther(rs.getString("other"));
					}else{
						hysyywNwbjkSbdcptFk.setOther("");
					}
					String other_passdate = rs.getString("other_passdate");
					if(other_passdate != null && !other_passdate.equals("") && !other_passdate.equals("null")){
						other_passdate = rs.getString("other_passdate").substring(0, 19);
						hysyywNwbjkSbdcptFk.setOther_passdate(other_passdate);//日期时间
					}else{
						hysyywNwbjkSbdcptFk.setOther_passdate("");
					}
					if(rs.getString("limit") != null && !rs.getString("limit").equals("") && !rs.getString("limit").equals("null")){
					hysyywNwbjkSbdcptFk.setLimit(rs.getString("limit"));
					}else{
						hysyywNwbjkSbdcptFk.setLimit("");
					}
					String limit_passdate = rs.getString("limit_passdate");
					if(limit_passdate != null && !limit_passdate.equals("") && !limit_passdate.equals("null")){
						limit_passdate = rs.getString("limit_passdate").substring(0, 19);
						hysyywNwbjkSbdcptFk.setLimit_passdate(limit_passdate);//日期时间
					}else{
						hysyywNwbjkSbdcptFk.setLimit_passdate("");
					}
					if(rs.getString("dissent") != null && !rs.getString("dissent").equals("") && !rs.getString("dissent").equals("null")){
					hysyywNwbjkSbdcptFk.setDissent(rs.getString("dissent"));
					}else{
						hysyywNwbjkSbdcptFk.setDissent("");
					}
					String dissent_passdate = rs.getString("dissent_passdate");
					if(dissent_passdate != null && !dissent_passdate.equals("") && !dissent_passdate.equals("null")){
						dissent_passdate = rs.getString("dissent_passdate").substring(0, 19);
						hysyywNwbjkSbdcptFk.setDissent_passdate(dissent_passdate);//日期时间
					}else{
						hysyywNwbjkSbdcptFk.setDissent_passdate("");
					}
					if(rs.getString("correct") != null && !rs.getString("correct").equals("") && !rs.getString("correct").equals("null")){
					hysyywNwbjkSbdcptFk.setCorrect(rs.getString("correct"));
					}else{
						hysyywNwbjkSbdcptFk.setCorrect("");
					}
					if(rs.getString("realno") != null && !rs.getString("realno").equals("") && !rs.getString("realno").equals("null")){
					hysyywNwbjkSbdcptFk.setRealno(rs.getString("realno"));
					}else{
						hysyywNwbjkSbdcptFk.setRealno("");
					}
					if(rs.getString("unitcode") != null && !rs.getString("unitcode").equals("") && !rs.getString("unitcode").equals("null")){
					hysyywNwbjkSbdcptFk.setUnitcode(rs.getString("unitcode"));
					}else{
						hysyywNwbjkSbdcptFk.setUnitcode("");
					}
					String passdate = rs.getString("passdate");
					if(passdate != null && !passdate.equals("") && !passdate.equals("null")){
						passdate = rs.getString("passdate").substring(0, 19);
						hysyywNwbjkSbdcptFk.setPassdate(passdate);//日期时间
					}else{
						hysyywNwbjkSbdcptFk.setPassdate("");
					}
					
					String enddate = rs.getString("enddate");
					if(enddate != null && !enddate.equals("") && !enddate.equals("null")){
						enddate = rs.getString("enddate").substring(0, 19);
						hysyywNwbjkSbdcptFk.setEnddate(enddate);//日期时间
					}else{
						hysyywNwbjkSbdcptFk.setEnddate("");
					}
					
					if(rs.getString("acceptuser") != null && !rs.getString("acceptuser").equals("") && !rs.getString("acceptuser").equals("null")){
					hysyywNwbjkSbdcptFk.setAcceptuser(rs.getString("acceptuser"));
					}else{
						hysyywNwbjkSbdcptFk.setAcceptuser("");
					}
					if(rs.getString("audituser") != null && !rs.getString("audituser").equals("") && !rs.getString("audituser").equals("null")){
					hysyywNwbjkSbdcptFk.setAudituser(rs.getString("audituser"));
					}else{
						hysyywNwbjkSbdcptFk.setAudituser("");
					}
					String userId = "";
					String userXm = "";
					try{
						userId = ((User)session.get("user")).getId();//登陆人ID
						userXm = ((User)session.get("user")).getName();//
					}catch(Exception e){
					   
					}
					String xzsj=this.getDateTime();
					hysyywNwbjkSbdcptFk.setAddtime(xzsj);
					hysyywNwbjkSbdcptFk.setLastupdatetime(xzsj);
					hysyywNwbjkSbdcptFk.setAddusername(userXm);
					hysyywNwbjkSbdcptFk.setAdduserid(userId);

					//检查用海批文编号	用海批文表主键	APPROVALNUM
					String approvalNum=rs.getString("APPROVALNUM");
					System.out.println("用海批文编号approvalNum"+approvalNum);
//					sbdcptService.deleteSbdcptFk(approvalNum);//删除再插入
					//应该是修改
					
					//库中已存在就修改
					int num = sbdcptService.fetchSbdcptFkIs(approvalNum);
					if(num !=0 ){
						sbdcptService.updateSbdcptFk(approvalNum, hysyywNwbjkSbdcptFk);
					}else{
						//否则新增
						businessService.addObject(hysyywNwbjkSbdcptFk);
					}
					
					
			}				
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("更新反馈信息结束");
	}

	/**
	 * 
	Description :反馈列表
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-16 下午06:19:33
	 */
	public String fetchSbhcptFk(){
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		pageBean.setPageRecord(10);
		fkList = sbdcptService.fetchSbdcptFk(pageBean, searchForm);
		return "sbdcptFkIndex";
	}
	
	/**
	 * 
	Description :反馈详情
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-16 下午06:19:43
	 */
	public String fetchFkDetail(){
		System.out.println("fkID="+fkID);
		hysyywNwbjkSbdcptFk = sbdcptService.fetchSbdcptFkDetail(fkID);
		return "sbdcptFkDetail";
	}

	/**
	 * 
	Description :比对展示
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-19 下午05:49:34
	 */
	public String fetchFkBd(){
		System.out.println("fkID="+fkID+",approvalNum="+approvalNum);
		
		hysyywNwbjkSbdcptFk = sbdcptService.fetchSbdcptFkDetail(fkID);
		
		sbdcptFkbdForm = sbdcptService.fetchYhxmZhxxBd(approvalNum);
		
		return "sbdcptFkBd";
	}
	
	/**
	 * 
	Description :更新比对结果
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-19 下午05:49:30
	 */
	public String updateSbhcptFk(){
		System.out.println("tableName="+tableName+",zdName="+zdName+",zdValue="+zdValue+",xmID="+xmID+"，zsID="+zsID);
		//更新
		int num = sbdcptService.updateFkbd(tableName, zdName, zdValue, xmID, zsID);
		System.out.println("更新记录数="+num);
		
		System.out.println("fkID="+fkID+",approvalNum="+approvalNum);
		hysyywNwbjkSbdcptFk = sbdcptService.fetchSbdcptFkDetail(fkID);
		sbdcptFkbdForm = sbdcptService.fetchYhxmZhxxBd(approvalNum);
		
		
		return "sbdcptFkBd";
	}
	
	/**
	 * 
	Description :清空MDB
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-25 下午04:34:32
	 */
	public String clearMdbFile(){
		this.deleteSeaAreaMod();//清空MDB海域变更表
		this.deleteDocSeaUseApprovalDoc();//清空MDB用海批文
		this.deleteReuSeaArea();//清空MDB宗海
		this.deleteDocSeaAreaMap();//清空MDB宗海附图
		this.deleteDocSeaUsage();//清空MDB用海情况
		this.deleteReuSeaCoordinates();//清空MDB海域坐标
		this.deleteDocSeaUsageCoordinates();//清空MDB用海（岛）面域定点顺序表
		
		this.deleteDocSeaPayments();//清空MDB海域使用金缴纳情况
		this.insertDocSeaDistribution();//清空MDB配号表
		
		return "goYhxmList";
	}
	
	/**
	 * 
	Description :清空MDB海域变更表
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-25 下午04:23:47
	 */
	public void deleteSeaAreaMod(){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement("delete from sea_area_mod ");
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * 
	Description :清空MDB用海批文
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-25 下午04:23:39
	 */
	public void deleteDocSeaUseApprovalDoc(){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement("delete from DOC_SeaUse_ApprovalDoc");
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * 
	Description :清空MDB宗海
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-25 下午04:25:15
	 */
	public void deleteReuSeaArea(){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement("delete from REU_SEA_AREA");
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	/**
	 * 
	Description :清空MDB宗海附图
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-25 下午04:27:03
	 */
	public void deleteDocSeaAreaMap(){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement("delete from DOC_SeaArea_Map");
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
	}
	
	/**
	 * 
	Description :清空MDB用海情况
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-25 下午04:28:05
	 */
	public void deleteDocSeaUsage(){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement("delete from DOC_SeaUsage");
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * 
	Description :清空MDB海域坐标
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-25 下午04:28:52
	 */
	public void deleteReuSeaCoordinates(){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement("delete from REU_SeaCoordinates ");
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	/**
	 * 
	Description :清空MDB用海（岛）面域定点顺序表
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-25 下午04:30:00
	 */
	public void deleteDocSeaUsageCoordinates(){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement("delete from DOC_SeaUsage_Coordinates ");
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	/**
	 * 
	Description :清空MDB海域使用金缴纳情况
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-25 下午04:33:05
	 */
	public void deleteDocSeaPayments(){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement("delete from DOC_Sea_Payments");
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	/**
	 * 
	Description :清空MDB配号表
	@param:
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-25 下午04:34:04
	 */
	public void insertDocSeaDistribution(){
		Connection conn=getConnection();
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement("delete from doc_sea_distribution ");
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	
	
	//海域管理号详情、用海项目详情-展示哪些字段是推送给规土局的
	
	
	//修改-推送给规土局的字段
	
	
	
	//1.读取国家数据库/读取Word文档内容（目前是在海域使用动态管理-用海项目信息管理模块新增的信息）
	
	
	//2.传输给库文件，规土局（3次）：（确认是否有记录，是否可以推送）
	
	
	//3.读取规土局的库文件插入数据库中（反馈信息内容和方式不定）
	
	
	//4.比对，分析哪些字段是规土局反馈的、不一致的（可直接引用）
	
	
	
	
	
	
	
	
	
	
	public IBusinessService getBusinessService() {
		return businessService;
	}

	public void setBusinessService(IBusinessService businessService) {
		this.businessService = businessService;
	}

	public ISbdcptService getSbdcptService() {
		return sbdcptService;
	}

	public void setSbdcptService(ISbdcptService sbdcptService) {
		this.sbdcptService = sbdcptService;
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

	public List<?> getYhxmsyjList() {
		return yhxmsyjList;
	}

	public void setYhxmsyjList(List<?> yhxmsyjList) {
		this.yhxmsyjList = yhxmsyjList;
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

	public List<?> getZsxxList() {
		return zsxxList;
	}

	public void setZsxxList(List<?> zsxxList) {
		this.zsxxList = zsxxList;
	}

	public ISeaUseGoldService getSeaUseGoldService() {
		return seaUseGoldService;
	}

	public void setSeaUseGoldService(ISeaUseGoldService seaUseGoldService) {
		this.seaUseGoldService = seaUseGoldService;
	}

	public THysyywHysydtYhxmForm getHysyywHysydtYhxmForm() {
		return hysyywHysydtYhxmForm;
	}

	public void setHysyywHysydtYhxmForm(THysyywHysydtYhxmForm hysyywHysydtYhxmForm) {
		this.hysyywHysydtYhxmForm = hysyywHysydtYhxmForm;
	}

	public SearchForm getSearchForm() {
		return searchForm;
	}

	public void setSearchForm(SearchForm searchForm) {
		this.searchForm = searchForm;
	}

	public List<?> getFkList() {
		return fkList;
	}

	public void setFkList(List<?> fkList) {
		this.fkList = fkList;
	}

	public String getFkID() {
		return fkID;
	}

	public void setFkID(String fkID) {
		this.fkID = fkID;
	}

	public THysyywNwbjkSbdcptFk getHysyywNwbjkSbdcptFk() {
		return hysyywNwbjkSbdcptFk;
	}

	public void setHysyywNwbjkSbdcptFk(THysyywNwbjkSbdcptFk hysyywNwbjkSbdcptFk) {
		this.hysyywNwbjkSbdcptFk = hysyywNwbjkSbdcptFk;
	}

	public SbdcptFkbdForm getSbdcptFkbdForm() {
		return sbdcptFkbdForm;
	}

	public void setSbdcptFkbdForm(SbdcptFkbdForm sbdcptFkbdForm) {
		this.sbdcptFkbdForm = sbdcptFkbdForm;
	}

	public String getApprovalNum() {
		return approvalNum;
	}

	public void setApprovalNum(String approvalNum) {
		this.approvalNum = approvalNum;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getZdName() {
		return zdName;
	}

	public void setZdName(String zdName) {
		this.zdName = zdName;
	}

	public String getZdValue() {
		return zdValue;
	}

	public void setZdValue(String zdValue) {
		this.zdValue = zdValue;
	}
	
	
	
	
	
	
	
	
}
