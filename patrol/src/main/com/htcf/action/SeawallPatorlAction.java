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
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceException;

import net.sf.ezmorph.Morpher;
import net.sf.ezmorph.MorpherRegistry;
import net.sf.ezmorph.bean.BeanMorpher;
import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.code.Consts;
import com.htcf.entity.Dictionary;
import com.htcf.entity.SeaUseInfoCompare;
import com.htcf.entity.SeaUseInfoCompareResult;
import com.htcf.entity.SeawallPatrolAttachment;
import com.htcf.entity.SeawallPatrolFlow;
import com.htcf.entity.SeawallPatrolReport;
import com.htcf.entity.THysyywHysydtYhxm;
import com.htcf.entity.THysyywHysydtYhxmHysyj;
import com.htcf.entity.THysyywHysydtYhxmYhfsForm;
import com.htcf.entity.User;
import com.htcf.entity.wsEntity.Case;
import com.htcf.entity.wsEntity.SeawallPatrolFromWs;
import com.htcf.service.IBusinessService;
import com.htcf.service.SeaPatrolService;
import com.htcf.service.SeaUseInfoCompareService;
import com.htcf.service.SeawallPatrolAttachmentService;
import com.htcf.service.SeawallPatrolFlowService;
import com.htcf.service.SeawallPatrolReportService;
import com.htcf.util.DateUtil;
import com.htcf.util.StringUtil;
/**
 * 
 * @author lwb
 *
 */
@Controller("seawallPatorlAction")
@Scope("prototype")
public class SeawallPatorlAction extends BaseAction{
	
	@Autowired
	private IBusinessService businessService;
	@Autowired
	private SeaPatrolService seawallPatrolService;
	@Autowired
	private SeawallPatrolReportService seawallPatrolReportService;
	@Autowired
	private SeawallPatrolAttachmentService seawallPatrolAttachmentService;
	@Autowired
	private SeawallPatrolFlowService seawallPatrolFlowService;
	@Autowired
	private SeaUseInfoCompareService seaUseInfoCompareService;
	
	/**
	 * 分类：null:查询; 1:月报;2:季报;3:年报;4:查询;
	 */
	private Integer classify;
	/**
	 * 统计要素 1:分区;2:状态
	 */
	private String element;
	/**
	 * 统计-开始时间
	 */
	private String strBT;
	/**
	 * 统计-结束时间
	 */
	private String strET;
	/**
	 * 统计-类型
	 */
	private String type;
	/**
	 * 统计项目
	 */
	private String part;
	/**
	 * 统计查询结果
	 */
	private String result;
	/**
	 * 巡查上报信息
	 */
	private SeawallPatrolReport spr;
	/**
	 * 巡查上报信息集合
	 */
	private List<SeawallPatrolReport> sprs;
	
	/**
	 * 附件保存基础路径
	 */
	private String fileBasePath_attachment = "C:/hydg/SeawallPatorl/";
	/**
	 * 附件
	 */
	private List<File> attachmentFiles;
	/**
	 * 附件名
	 */
	private List<String> attachmentFilesFileName;
	/**
	 * 上传的文件类型
	 */
	private List<String> attachmentFilesContentType; 
	
	/**
	 * 在loadSprById方法中		1:修改  2:详情 (流程处理) 3:详情(只读)
	 * <br>在提交巡查上报信息方法中		0:保存	1:提交
	 * <br>在系统比对中				0/null:未比对	1:已比对
	 */
	private String op;
	/**
	 * 文件路径
	 */
	private String path;
	/**
	 * 审批人ID
	 */
	private String apprPersonId;
	/**
	 * 审批人姓名
	 */
	private String apprPersonName;
	/**
	 * 流程信息map
	 */
	private Map<String, Object> flowMap;
	/**
	 * 上报流程
	 */
	private SeawallPatrolFlow flow;
	
	private List<SeawallPatrolFlow> flows;
	/**
	 * 确认流程附件
	 */
	private File dealFile;
	private String dealFileFileName;
	private String dealFileContentType;
	/**
     * 文件下载
     */
    private InputStream fileInputStream;
    /**
     * 下载文件名
     */
    private String fileName;
	/**
	 * 流程附件基础路径
	 */
	private String fileBasePath_flow_attachment = "C:/hydg/SeawallPatorl/0flow";
	
	/**
	 * 用户ID为键，查询结果为值
	 */
	public static final Map<String, List<SeawallPatrolFromWs>> spMap = new HashMap<String, List<SeawallPatrolFromWs>>();
	/**
	 * 是否重新加载：null：不加载；1：重新加载
	 */
	private String reload;
	/**
	 * 从接口查询的海塘巡查信息集合
	 */
	private List<SeawallPatrolFromWs> spfws;
	
	/**
	 * 从接口查询的海塘巡查信息
	 */
	private SeawallPatrolFromWs spfw;
	/**
	 * 对比信息
	 */
	private SeaUseInfoCompare compare;
	/**
	 * 对比信息集合
	 */
	private List<SeaUseInfoCompare> compares;
	
	/**
	 * 对比信息(用于展示)
	 */
	private SeaUseInfoCompareResult compareResult;
	/**
	 * 对比信息集合(用于展示)
	 */
	private List<SeaUseInfoCompareResult> compareResults;
	
	/**
	 * 加载用海项目下拉列表
	 */
	public void getXmCode(){
		String userId = "";
		String userRoleName="";
		try{
			userId = ((User)session.get("user")).getId();//登陆人ID
			userRoleName = ((User)session.get("user")).getRole().getRoleName();//角色
		}catch(Exception e){
			e.printStackTrace();
		}
		
		List yhxmList = businessService.fetchYhxmList(null, null, userId, userRoleName);
		JSONArray json = JSONArray.fromObject(yhxmList);
		returnAjaxResult(json.toString());
	}
	
	/**
	 * 将查询结果封装为便于页面展示的形式
	 * @param compare
	 * @return SeaUseInfoCompareResult
	 */
	private SeaUseInfoCompareResult packageCompareResult(SeaUseInfoCompare compare){
		SeaUseInfoCompareResult result = new SeaUseInfoCompareResult();
		
		Field[] fields1 = SeaUseInfoCompare.class.getDeclaredFields();
		Field[] fields2 = SeaUseInfoCompareResult.class.getDeclaredFields();
		Map<String, Field> fieldMap = new HashMap<String, Field>();
		for (Field field : fields2) {
			field.setAccessible(true);
			fieldMap.put(field.getName(), field);
		}
		
		for (int i = 0; i < fields1.length; i++) {
			//获取属性名
			Field f = fields1[i];
			String name = fields1[i].getName();
			f.setAccessible(true);
			try {
			//通用字段和非String类型字段
			if ( (! f.getType().toString().contains("String"))
					|| name.startsWith("add")
					|| name.endsWith("time")
					|| "projectId".equals(name)
					|| "projectName".equals(name) ) {
				
				fieldMap.get(f.getName()).set(result, f.get(compare));
				continue;
			}
				
				String jsonStr = (String)f.get(compare);
				JSONArray json = JSONArray.fromObject(jsonStr);
				List<String> list = JSONArray.toList(json);
				fieldMap.get(f.getName()).set(result, list);
			
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/**
	 * 根据查询条件分页加载巡查系统对比信息
	 */
	public String loadCompares(){
		
		pageBean = processPageBean(this.getHttpServletRequest());
		compares = seaUseInfoCompareService.loadPageCompare(compare, pageBean);
		if ( null == compares ) compares = new ArrayList<SeaUseInfoCompare>();
		compareResults = new ArrayList<SeaUseInfoCompareResult>();
		for (SeaUseInfoCompare c : compares) {
			SeaUseInfoCompareResult result = packageCompareResult(c);
			compareResults.add(result);
		}
		return "loadCompares";
	}
	
	/**
	 * 删除对比记录
	 */
	public String delCompareResult(){
		seaUseInfoCompareService.delSeaUseInfoCompareById(compare);
		return "reloadCompares";
	}
	
	/**
	 * 加载比对结果
	 */
	public String loadCompareResult(){
		compare = seaUseInfoCompareService.loadCompareById(compare);
		compareResult = packageCompareResult(compare);
		return "compareResult";
	}
	
	/**
	 * 进行系统比对
	 */
	public String compareInfo(){
		
		this.op = "1";
		compares = new ArrayList<SeaUseInfoCompare>();
		compares.add(this.compare);
		
		//用海方式列表
		List<THysyywHysydtYhxmYhfsForm> yhxmyhfsList = null;
		//海域使用金列表
		List<THysyywHysydtYhxmHysyj> yhxmsyjList = null;
		//宗海信息详情
		List<Object[]> yhxmzsxxList = null;
		
		if ( StringUtil.isNotBlank(compare.getProjectId()) ) {
			yhxmzsxxList = (List<Object[]>) businessService.fetchYhxmZsxx(compare.getProjectId());
		}
		
		if ( null != yhxmzsxxList && yhxmzsxxList.size() > 0 ) {
			//用海方式列表
			yhxmyhfsList = (List<THysyywHysydtYhxmYhfsForm>) businessService.fetchYhxmYhfs(compare.getProjectId(), yhxmzsxxList.get(0)[0].toString());
			//海域使用金列表
			yhxmsyjList = (List<THysyywHysydtYhxmHysyj>) businessService.fetchYhxmHysyj(compare.getProjectId(), yhxmzsxxList.get(0)[0].toString());
		}
		
		
		THysyywHysydtYhxm yhxm = businessService.fetchYhxmDetail(compare.getProjectId());
		SeaUseInfoCompare compare = new SeaUseInfoCompare();
		//项目ID
		compare.setProjectId(yhxm.getId().toString());
		//项目名称
		compare.setProjectName(yhxm.getYhxmmc());
		this.compare.setProjectName(yhxm.getYhxmmc());
		//海域用途
		compare.setSeaAreaUse("未找到字段");
		//项目性质
		compare.setProjectNature(yhxm.getXmxz());
		//用海方式
		if ( null != yhxmyhfsList && yhxmyhfsList.size() > 0 ) {
			compare.setSeaUseWay(yhxmyhfsList.get(0).getYhfs());
		}
		//用海范围
		compare.setSeaUseRange("未找到字段");
		//用海面积
		compare.setSeaUseAreage(yhxm.getYhzmj());
		if ( null != yhxmsyjList && yhxmsyjList.size() > 0 ) {
			//用海期限
			compare.setSeaUseDeadline(yhxmsyjList.get(0).getYhsx());
			//是否缴纳海域使用金
			compare.setIsPay((DateUtil.StringToUtilDate(yhxmsyjList.get(0).getSyjdqrq(), "yyyy-MM-dd").getTime() > new Date().getTime()) ? "1" : "0");
		}
		compares.add(compare);
		//return "compareInfo";
		return "compare";
	}
	
	/**
	 * 保存此次对比结果
	 */
	public String saveCompare(){
		
		SeaUseInfoCompare compare = new SeaUseInfoCompare();
		List<String> cp = new ArrayList<String>();
		
		Field[] field = SeaUseInfoCompare.class.getDeclaredFields();
		for (int i = 0; i < field.length; i++) {
			//获取属性名
			Field f = field[i];
			String name = field[i].getName();
			//过滤掉通用字段和非String类型字段
			if ( (! f.getType().toString().contains("String"))
					|| name.startsWith("add")
					|| name.endsWith("time")
					|| "projectId".equals(name)
					|| "projectName".equals(name) ) {
				continue;
			}
			f.setAccessible(true);
			try {
				cp.clear();
				String value0 = (String)f.get(compares.get(0));
				String value1 = (String)f.get(compares.get(1));
				value0 = StringUtil.isBlank(value0) ? "暂无数据" : value0;
				value1 = StringUtil.isBlank(value1) ? "暂无数据" : value1;
				
				if (value0.equals(value1)) {
					//对比结果一致
					cp.add("1");
				} else {
					cp.add("0");
				}
				cp.add(value0);
				cp.add(value1);
				
				f.set(compare, JSONArray.fromObject(cp).toString());
			
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		
		compare.setAddtime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		compare.setLastupdatetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		compare.setAdduserid(this.getSessionUser().getId());
		compare.setAddusername(this.getSessionUser().getName());
		compare.setProjectId(this.compare.getProjectId());
		compare.setProjectName(this.compare.getProjectName());
		seaUseInfoCompareService.addSeaUseInfoCompare(compare);
		
		return "reloadCompares";
	}
	
	/**
	 * 跳转到信息比对界面
	 */
	public String toCompare(){
		return "compare";
	}
	
	
	/**
	 * 根据查询条件分页加载巡查上报信息
	 */
	public String loadSprs(){
		
		JSONObject stEsclass = JSONObject.fromObject("{'1':'重点围填海在建项目地面监视监测','2':'疑点疑区监视监测'}");
		List<Dictionary> dmList = (List<Dictionary>) businessService.fetchDictionary("项目位置","");
		
		Map<String, String> stEsclassMap = (Map<String, String>) JSONObject.toBean(stEsclass, Map.class);
		Map<String, String> addressMap = new HashMap<String, String>();
		for (Dictionary dic : dmList) {
			addressMap.put(dic.getDm(), dic.getValue());
		}
		
		pageBean = processPageBean(this.getHttpServletRequest());
		sprs = seawallPatrolReportService.loadSeawallPatrolReportPage(spr, pageBean, this.getSessionUser().getId());
		if ( null == sprs ) sprs = new ArrayList<SeawallPatrolReport>();
		for (int i = 0; i < sprs.size(); i++) {
			SeawallPatrolReport spr = sprs.get(i);
			spr.setStEsclass(stEsclassMap.get(spr.getStEsclass()));
			spr.setStAreacode(addressMap.get(spr.getStAreacode()));
		}
		
		if ( "1".equals(op) ) {
			return "sprsShow";
		}
		
		return "seawallPatrolReports";
	}
	
	/**
	 * 根据查询条件分页加载流程信息
	 */
	public String loadFlows(){
		
		JSONObject stEsclass = JSONObject.fromObject("{'1':'重点围填海在建项目地面监视监测','2':'疑点疑区监视监测'}");
		Map<String, String> stEsclassMap = (Map<String, String>) JSONObject.toBean(stEsclass, Map.class);
		
		pageBean = processPageBean(this.getHttpServletRequest());
		if ( null == flow ) flow = new SeawallPatrolFlow();
		flow.setPersonId(this.getSessionUser().getId());
		Long stPatrolId = flow.getStPatrolId();
		flow.setStPatrolId(null);
		flows = seawallPatrolFlowService.loadSeawallPatrolFlow(flow, pageBean, stPatrolId, 1);
		StringBuffer stPatrolIds = new StringBuffer();
		
		for (int i = 0; i < flows.size(); i++) {
			if ( StringUtil.isNotBlank(stPatrolIds.toString()) ) {
				stPatrolIds.append(",");
			}
			stPatrolIds.append(flows.get(i).getStPatrolId());
		}
		sprs = seawallPatrolReportService.loadSeawallPatrolReportByIds(stPatrolIds.toString());
		if ( null != sprs ) {
			for (int i = 0; i < sprs.size(); i++) {
				SeawallPatrolReport spr = sprs.get(i);
				if ( null != spr ) {
					if ( null != stEsclassMap.get(spr.getStEsclass())) {
						spr.setStEsclass(stEsclassMap.get(spr.getStEsclass()));
					}
				}
			}
		}
		
		return "loadFlows";
	}
	
	/**
	 * 跳转到海塘巡查上报页面
	 */
	public String toAddSpr(){
		return "addSpr";
	}
	
	/**
	 * 保存巡查上报信息
	 */
	public String addSpr(){
		String result = "{'result':'0'}";
		if ( null != spr ) {
			spr = common4AddSpr(spr);
			spr.setStReportDepartmentId(getSessionUser().getDepartmentId());
			spr.setStReportDepartment(getSessionUser().getDepartment());
			if ( seawallPatrolReportService.addSeawallPatrolReport(spr) ) {
				//保存附件
				List<SeawallPatrolAttachment> attachments = uploadAttachments(spr.getId());
				seawallPatrolAttachmentService.addSeawallPatrolAttachments(attachments);
				//result = "{'result':'1','id':" + spr.getId() + "}";
			}
		}
		//returnAjaxResult(result);
		return "addSpr";
	}
	
	/**
	 * 提交巡查上报信息
	 */
	public String submitSpr(){
		if ( "1".equalsIgnoreCase(op) ) {
			spr.setNmState(Short.parseShort(Consts.SEAWALL_PATORL_LA));
		} else {
			spr.setNmState(Short.parseShort(Consts.SEAWALL_PATORL_SB));
		}
		//保存上报信息
		if( null == spr.getId() ) {
			addSpr();
		} else {
			editSpr();
		}
		
		if ( "1".equalsIgnoreCase(op) ) {
			SeawallPatrolFlow flow = new SeawallPatrolFlow();
			flow = commonInsertFlow(flow);
			flow.setPerson(apprPersonName);
			flow.setPersonId(apprPersonId);
			flow.setStPatrolId(spr.getId());
			flow.setOpType(Consts.SEAWALL_PATORL_LA);
			flow.setOpStatus("0");
			seawallPatrolFlowService.addSeawallPatrolFlow(flow);
			return "toViewSpr";
		}

		return "addSpr";
	}
	
	private SeawallPatrolFlow commonInsertFlow(SeawallPatrolFlow flow){
		flow.setAddtime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		flow.setLastupdatetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		flow.setAdduserid(this.getSessionUser().getId());
		flow.setAddusername(this.getSessionUser().getName());
		return flow;
	}
	
	/**
	 * 完成某步流程
	 */
	public String finishStep(){
		if ( null != flows ) {
			
			SeawallPatrolFlow flow = new SeawallPatrolFlow();
			for (SeawallPatrolFlow f : flows) {
				if ( null != f ) {
					flow = f;
					break;
				}
			}
			//如果当前流程不处于“确认”且未指定下一步审批人
			if ( StringUtil.isBlank(apprPersonId) && Integer.parseInt(flow.getOpType()) != 5 ) return "toViewSpr";
			if ( null != dealFile ) {
				FileInputStream fis = null;
				FileOutputStream fos = null;
				BufferedInputStream bis = null;
				BufferedOutputStream bos = null;
				String path = null;
				
				try {
					fis = new FileInputStream(dealFile);
					
					// FileReader 一次只能读一个字符，一个汉字字符流 读汉字
					// 封装成，缓冲一下，可以读一行
					bis = new BufferedInputStream(fis);
					
					path = fileBasePath_flow_attachment + File.separator
					+ getSessionUser().getUserId() + File.separator
					+ DateUtil.dateToString(new Date(), "yyyyMMdd");
					File serFile = new File(path);
					// 判断服务器上该目录是否存在，不存在则创建目录
					if (!serFile.exists()) {
						serFile.mkdirs();
					}
					path += File.separator + (new Date()).getTime() + "-" + this.dealFileFileName;
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
					
					flow.setAttachment(path);
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			flow.setOpTime(new Date());
			flow.setOpStatus("1");
			flow.setLastupdatetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
			seawallPatrolFlowService.editSeawallPatrolFlow(flow);
			
			SeawallPatrolFlow nextFlow = new SeawallPatrolFlow();
			nextFlow = commonInsertFlow(nextFlow);
			nextFlow.setPerson(apprPersonName);
			nextFlow.setPersonId(apprPersonId);
			nextFlow.setStPatrolId(flow.getStPatrolId());
			nextFlow.setOpStatus("0");
			switch (Integer.parseInt(flow.getOpType())) {
				case 2:
					//立案
					nextFlow.setOpType(Consts.SEAWALL_PATORL_PQ);
					if ( "10".equals(flow.getOpWay()) ){
						nextFlow = null;
					}
					break;
				case 3:
					//派遣
					nextFlow.setOpType(Consts.SEAWALL_PATORL_CL);
					break;
				case 4:
					//处理
					nextFlow.setOpType(Consts.SEAWALL_PATORL_QR);
					break;
				case 5:
					//确认
					if ( "00".equals(flow.getOpWay()) ){
						SeawallPatrolFlow f = new SeawallPatrolFlow();
						f.setOpType(Consts.SEAWALL_PATORL_CL);
						f.setOpStatus("1");
						f.setStPatrolId(flow.getStPatrolId());
						List<SeawallPatrolFlow> fs = seawallPatrolFlowService.loadSeawallPatrolFlow(f, null, null, 0);
						f = fs.get(fs.size() - 1);
						
						nextFlow.setPerson(f.getPerson());
						nextFlow.setPersonId(f.getPersonId());
						nextFlow.setOpType(Consts.SEAWALL_PATORL_CL);
					}
					break;
					
				default:
					break;
			}
			
			
			if ( null != nextFlow && StringUtil.isNotBlank(nextFlow.getOpType()) ) {
				seawallPatrolFlowService.addSeawallPatrolFlow(nextFlow);
				
				SeawallPatrolReport spr = new SeawallPatrolReport();
				spr.setId(nextFlow.getStPatrolId());
				spr.setNmState(Short.parseShort(nextFlow.getOpType()));
				seawallPatrolReportService.editSeawallPatrolReportStatus(spr);
			}
			
			
			
		}
		return "toViewSpr";
	}
	
	/**
	 * 下载流程附件
	 */
	public String downloadFlowAttachment(){
		
		if ( null != flow ) {
			flow = seawallPatrolFlowService.loadSeawallPatrolFlowById(flow.getId());
			String path = this.flow.getAttachment();
			try {
				this.fileInputStream = new FileInputStream(path);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			this.fileName = "确认流程附件" + path.substring(path.lastIndexOf("."), path.length());	
			try {
				this.fileName = URLEncoder.encode(this.fileName, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		return "downloadFlowAttachment";
	}
	
	/**
	 * 加载巡查上报信息详情
	 */
	public String loadSprById() throws FileNotFoundException{
		if ( "1".equals(op) ) {
			//修改
			spr = seawallPatrolReportService.loadSeawallPatrolReportByID(spr, false);
			return "addSpr";
		} else {
			//详情
			spr = seawallPatrolReportService.loadSeawallPatrolReportByID(spr, true);
			
			flows = seawallPatrolFlowService.loadSeawallPatrolFlowByPatrolId(spr.getId());
			if ( null == flows ) flows = new ArrayList<SeawallPatrolFlow>();
			return "sprInfo";
		}
	}
	
	/**
	 * 加载图片
	 */
	public void loadImg(){
		if ( StringUtil.isBlank(path) ) return;
		//File img = new File(spr.getAttachments().get(0).getPath());
		InputStream is = null;
		OutputStream os = null;
		try {
			is = new FileInputStream(path);
			HttpServletResponse response = getHttpServletResponse();
			response.setContentType("text/html");
			os = response.getOutputStream();
			int num = 0;
			byte buf[] = new byte[1024];
			while ( (num = is.read(buf)) != -1) {
				os.write(buf, 0, num);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if ( null != is ) is.close();
				if ( null != os ) os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 更新巡查上报信息
	 */
	public String editSpr(){
		String result = "{'result':'0'}";
		if ( null != spr ) {
			spr = common4UpdateSpr(spr);
			spr.setStReportDepartmentId(getSessionUser().getDepartmentId());
			spr.setStReportDepartment(getSessionUser().getDepartment());
			if ( seawallPatrolReportService.editSeawallPatrolReport(spr) ) {
				List<SeawallPatrolAttachment> attachments = uploadAttachments(spr.getId());
				seawallPatrolAttachmentService.addSeawallPatrolAttachments(attachments);
				//result = "{'result':'1'}";
			}
		}
		//returnAjaxResult(result);
		return "addSpr";
	}
	
	/**
	 * 根据ID删除上报记录
	 */
	public String delSprById(){
		if ( null != spr && null != spr.getId())
		seawallPatrolReportService.removeSeawallPatrolReportById(spr.getId());
		return "toViewSpr";
	}
	
	/**
	 * 上传附件
	 * @param patrolId 海塘巡查上报ID
	 * @return List<SeawallPatrolAttachment>
	 */
	public List<SeawallPatrolAttachment> uploadAttachments(long patrolId){
		
		FileInputStream fis = null; // 为了关闭资源
		FileOutputStream fos = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		String path = null;
		List<SeawallPatrolAttachment> attachments = new ArrayList<SeawallPatrolAttachment>();
		try {
			
			for (int i = 0; i < (null == attachmentFiles ? 0 : attachmentFiles.size()); i++) {
				
				SeawallPatrolAttachment attachment = new SeawallPatrolAttachment();
				attachment.setAddtime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
				attachment.setLastupdatetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
				attachment.setAdduserid(this.getSessionUser().getId());
				attachment.setAddusername(this.getSessionUser().getName());
				attachment.setStPatrolId(patrolId);
				attachment.setStatus("1");
				
				fis = new FileInputStream(attachmentFiles.get(i));
				// FileReader 一次只能读一个字符，一个汉字字符流 读汉字
				// 封装成，缓冲一下，可以读一行
				bis = new BufferedInputStream(fis);
				
				path = fileBasePath_attachment + File.separator
					+ getSessionUser().getUserId() + File.separator
					+ DateUtil.dateToString(new Date(), "yyyyMMdd");
				File serFile = new File(path);
				// 判断服务器上该目录是否存在，不存在则创建目录
				if (!serFile.exists()) {
					serFile.mkdirs();
				}
				path += File.separator + (new Date()).getTime() + "-" + this.attachmentFilesFileName.get(i);
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
				
				attachment.setPath(path);
				attachments.add(attachment);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return attachments;
	}
	
	/**
	 * 通过websphere接口查询提防海塘信息
	 */
	public String loadSeawallPatorlThroughWs(){
		
		if ( StringUtil.isBlank(type) ) type = "1";
		if ( StringUtil.isBlank(strBT) ) strBT = DateUtil.dateToString(DateUtil.dateAddMon(new Date(), -1), "yyyy-MM-dd");
		if ( StringUtil.isBlank(strET) ) strET = DateUtil.dateToString(new Date(), "yyyy-MM-dd");
		if( "1".equals(reload) ) {
			try {
				List<SeawallPatrolFromWs> spList = seawallPatrolService.loadPatrol(strBT, strET, type);
				spMap.put(getSessionUser().getId(), spList);
				reload = null;
			} catch (WebServiceException e) {
				e.printStackTrace();
				System.out.println("webservice服务异常！");
				return "zhcx";
			}
		}
		ResettableStreamRequestWrapper reqWrapper = new ResettableStreamRequestWrapper(this.getHttpServletRequest());
		pageBean = processPageBean(reqWrapper);
		spfws = seawallPatrolService.pagePatrol(getSessionUser().getId(), spfw, pageBean);
		
		return "zhcx";
	}
	
	/**
	 * 通过接口查询巡查详细信息
	 */
	public String loadSeawallPatorlInfoThroughWs(){
		
		pageBean = processPageBean(this.getHttpServletRequest());
		spfws = seawallPatrolService.pagePatrol(getSessionUser().getId(), spfw, pageBean);
		spfw = spfws.get(classify);
		return "spfw_detail";
	}
	
	/**
	 * 根据任务号查询相关的流程信息
	 */
	public String loadPatrolFlowsByEventsn(){
		//TODO 流程信息加载
		if (null != spfw) {
			flowMap = seawallPatrolService.loadFlowsByEventsn(spfw.getSt_eventsn());
		}
		return "spfw_flows";
	}
	
	/**
	 * 查询坐标
	 */

	public void loadCoordinate(){
		
		if ( StringUtil.isBlank(type) ) type = "2";
		if ( StringUtil.isBlank(strBT) ) strBT = DateUtil.dateToString(DateUtil.dateAddDay(new Date(), -30), "yyyy-MM-dd");
		if ( StringUtil.isBlank(strET) ) strET = DateUtil.dateToString(new Date(), "yyyy-MM-dd");
		if( "1".equals(reload) ) {
			try {
				List<SeawallPatrolFromWs> spList = seawallPatrolService.loadPatrol(strBT, strET, type);
				spMap.put(getSessionUser().getId(), spList);
				
				pageBean = null;
				//条件过滤（page为空时显示全部）
				spfws = seawallPatrolService.pagePatrol(getSessionUser().getId(), spfw, pageBean);
				//封装坐标
				Map<String, List<SeawallPatrolFromWs>> spMap = seawallPatrolService.packageCoordinate(spfws);
				
				JSONObject json = JSONObject.fromObject(spMap);
				returnAjaxResult(json.toString());
				
			} catch (WebServiceException e) {
				e.printStackTrace();
				System.out.println("webservice服务异常！");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 加载海塘案件统计数据
	 */
	public String statistic(){
		
		if ( StringUtil.isBlank(type) ) type = "1";
		if ( StringUtil.isBlank(part) ) part = "fx";
		if ( StringUtil.isBlank(strBT) ) strBT = DateUtil.dateToString(DateUtil.dateAddMon(new Date(), -1), "yyyy-MM-dd");
		if ( StringUtil.isBlank(strET) ) strET = DateUtil.dateToString(new Date(), "yyyy-MM-dd");
		
		Date strBd = null;
		Date strEd = null;
		Map<String, Object> distMap = new HashMap<String, Object>();
		if ( null != classify ) {
			
			switch (classify) {
			case 1:
				//月报
				strBT = DateUtil.dateToString(new Date(), "yyyy") + "-" + strBT;
				strBd = DateUtil.StringToUtilDate(strBT, "yyyy-MM-dd");
				strEd = DateUtil.dateAddMon(strBd, 1);
				strET = DateUtil.dateToString(strEd, "yyyy-MM-dd");
				distMap.put("text", "海塘巡查案件统计"+strBT+"至"+strEd);
				break;
			case 2:
				//季报
				strBT = DateUtil.dateToString(new Date(), "yyyy") + "-" + strBT;
				strBd = DateUtil.StringToUtilDate(strBT, "yyyy-MM-dd");
				strEd = DateUtil.dateAddMon(strBd, 3);
				strET = DateUtil.dateToString(strEd, "yyyy-MM-dd");
				distMap.put("text", "海塘巡查案件统计"+strBT+"至"+strEd);
				break;
			case 3:
				//年报
				strBd = DateUtil.StringToUtilDate(strBT, "yyyy-MM-dd");
				strEd = DateUtil.dateAddMon(strBd, 12);
				strET = DateUtil.dateToString(strEd, "yyyy-MM-dd");
				distMap.put("text", "海塘巡查案件统计"+strBT+"至"+strEd);
				break;
				
			default:
				break;
			}
		}
		Map<String,List<Case>> caseMap = new HashMap<String, List<Case>>();
		try {
			caseMap = seawallPatrolService.loadCaseStatistics(strBT, strET, type);
		} catch (WebServiceException e) {
			e.printStackTrace();
			System.out.println("webservice服务异常！");
			return "statistic";
		}

		if ( "2".equalsIgnoreCase(element) ) {
			//状态
			distMap.put("subtext", "(本上期)案件总量");
			for ( String key : caseMap.keySet() ) {
				//获取统计结果
				List<Case> cases = caseMap.get(key);
				distMap = packingMap4Status(distMap, cases);
			}
		} else {
			//分区
			if ( "fx".equals(part) ) {
				distMap.put("subtext", "发现(次)");
			}
			if ( "la".equals(part) ) {
				distMap.put("subtext", "立案阶段");
			}
			if ( "pq".equals(part) ) {
				distMap.put("subtext", "派遣阶段");
			}
			if ( "ja".equals(part) ) {
				distMap.put("subtext", "结案阶段");
			}
			
			for ( String key : caseMap.keySet() ) {
				//获取统计结果
				List<Case> cases = caseMap.get(key);
				distMap = packingMap(distMap, cases, part);
			}
		}
		
		JSONObject json = JSONObject.fromObject(distMap);
		result = json.toString();
		
		if( null != classify ) {
			
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
		
		return "statistic";
	}
	
	/**
	 * 统计要素为分区时，封装统计json Map
	 * @param distMap 区域map
	 * @param cases 封装好的webservice返回数据
	 * @param part 统计项目
	 * @return
	 */
	private Map<String, Object> packingMap(Map<String, Object> distMap, List<Case> cases, String part){
		
		List<Map<String, Object>> maps = new ArrayList<Map<String,Object>>();
		List<String> dataType = new ArrayList<String>();
		//区县list
		List<String> dis = new ArrayList<String>();
		//发现/本期list
		List<String> nows = new ArrayList<String>();
		//上期list
		List<String> pasts = new ArrayList<String>();
		//占比list
		List<Double> percent = new ArrayList<Double>();
		
		Map<String, Object> map0 = null;
		Map<String, Object> map1 = null;
		Map<String, Object> map2 = null;
		Map<String, Object> map3 = null;
		
		
		if ( "fx".equals(part) ) {
			map0 = new HashMap<String, Object>();
			for (Case c : cases) {
				nows.add(c.getFx());
				dis.add(c.getDist());
			}
		}
		if ( "la".equals(part) ) {
			map1 = new HashMap<String, Object>();
			map2 = new HashMap<String, Object>();
			for (Case c : cases) {
				nows.add(c.getLaNow());
				pasts.add(c.getLaPast());
				dis.add(c.getDist());
			}
		}
		if ( "pq".equals(part) ) {
			map1 = new HashMap<String, Object>();
			map2 = new HashMap<String, Object>();
			for (Case c : cases) {
				nows.add(c.getPqNow());
				pasts.add(c.getPqPast());
				dis.add(c.getDist());
			}
		}
		if ( "ja".equals(part) ) {
			map1 = new HashMap<String, Object>();
			map2 = new HashMap<String, Object>();
			map3 = new HashMap<String, Object>();
			for (Case c : cases) {
				nows.add(c.getJaNow());
				pasts.add(c.getJaPast());
				percent.add(Double.parseDouble(c.getJal().replace("%", "")));
				dis.add(c.getDist());
			}
		}
		
		if ( null != map0) {
			dataType.add("发现(次)");
			map0.put("name", "发现(次)");
			map0.put("val", nows);
			maps.add(map0);
		}
		if ( null != map1) {
			dataType.add("本期");
			map1.put("name", "本期");
			map1.put("val", nows);
			maps.add(map1);
		}
		if ( null != map2) {
			dataType.add("上期");
			map2.put("name", "上期");
			map2.put("val", pasts);
			maps.add(map2);
		}
		if ( null != map3) {
			dataType.add("本期结案率(%)");
			map3.put("name", "本期结案率(%)");
			map3.put("val", percent);
			maps.add(map3);
		}
		
		distMap.put("data", maps);
		distMap.put("dis", dis);
		distMap.put("dataType", dataType);
		
		return distMap;
	}
	
	/**
	 * 统计要素为状态时，封装统计json Map
	 * @param distMap 区域map
	 * @param cases 封装好的webservice返回数据
	 * @return
	 */
	private Map<String, Object> packingMap4Status(Map<String, Object> distMap, List<Case> cases){
		
		List<Map<String, Object>> maps = new ArrayList<Map<String,Object>>();
		List<String> dataType = new ArrayList<String>();
		//状态list
		List<String> statusList = new ArrayList<String>();
		//数量list
		List<Integer> nums = new ArrayList<Integer>();
		
		Map<String, Object> map0 = new HashMap<String, Object>();
		
		Integer fx = 0, la = 0, pq = 0, ja = 0;
		
		for (Case c : cases) {
			//发现次数
			if ( StringUtil.isNotBlank(c.getFx()) ) fx += Integer.parseInt(c.getFx());
			//派遣
			if ( StringUtil.isNotBlank(c.getPqNow()) ) pq += Integer.parseInt(c.getPqNow());
			if ( StringUtil.isNotBlank(c.getPqPast()) ) pq += Integer.parseInt(c.getPqPast());
			//立案
			if ( StringUtil.isNotBlank(c.getLaNow()) ) la += Integer.parseInt(c.getLaNow());
			if ( StringUtil.isNotBlank(c.getLaPast()) ) la += Integer.parseInt(c.getLaPast());
			//结案
			if ( StringUtil.isNotBlank(c.getJaNow()) ) ja += Integer.parseInt(c.getJaNow());
			if ( StringUtil.isNotBlank(c.getJaPast()) ) ja += Integer.parseInt(c.getJaPast());
		}
		nums.add(fx);
		nums.add(la);
		nums.add(pq);
		nums.add(ja);
		
		statusList.add("发现");
		statusList.add("立案");
		statusList.add("派遣");
		statusList.add("破案");
		
		dataType.add("数量");
		map0.put("name", "数量");
		map0.put("val", nums);
		maps.add(map0);
		
		distMap.put("data", maps);
		distMap.put("dis", statusList);
		distMap.put("dataType", dataType);
		
		return distMap;
	}
	
	
	
	/**
	 * ajax返回结果
	 * @param result
	 */
	private void returnAjaxResult(String result){
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
	 * 新增通用字段赋值
	 * @param spr
	 * @return
	 */
	private SeawallPatrolReport common4AddSpr(SeawallPatrolReport spr){
		
		spr.setAddtime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		spr.setLastupdatetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		spr.setAdduserid(this.getSessionUser().getId());
		spr.setAddusername(this.getSessionUser().getName());
		return spr;
	}
	
	/**
	 * 更新通用字段赋值
	 * @param spr
	 * @return
	 */
	private SeawallPatrolReport common4UpdateSpr(SeawallPatrolReport spr){
		
		spr.setLastupdatetime(DateUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		return spr;
	}
	
	public String getStrBT() {
		return strBT;
	}
	public void setStrBT(String strBT) {
		this.strBT = strBT;
	}
	public String getStrET() {
		return strET;
	}
	public void setStrET(String strET) {
		this.strET = strET;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public SeawallPatrolReport getSpr() {
		return spr;
	}

	public void setSpr(SeawallPatrolReport spr) {
		this.spr = spr;
	}

	public List<SeawallPatrolReport> getSprs() {
		return sprs;
	}

	public void setSprs(List<SeawallPatrolReport> sprs) {
		this.sprs = sprs;
	}

	public Integer getClassify() {
		return classify;
	}

	public void setClassify(Integer classify) {
		this.classify = classify;
	}

	public String getElement() {
		return element;
	}

	public void setElement(String element) {
		this.element = element;
	}

	public List<File> getAttachmentFiles() {
		return attachmentFiles;
	}

	public void setAttachmentFiles(List<File> attachmentFiles) {
		this.attachmentFiles = attachmentFiles;
	}

	public List<String> getAttachmentFilesFileName() {
		return attachmentFilesFileName;
	}

	public void setAttachmentFilesFileName(List<String> attachmentFilesFileName) {
		this.attachmentFilesFileName = attachmentFilesFileName;
	}

	public List<String> getAttachmentFilesContentType() {
		return attachmentFilesContentType;
	}

	public void setAttachmentFilesContentType(
			List<String> attachmentFilesContentType) {
		this.attachmentFilesContentType = attachmentFilesContentType;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public SeawallPatrolFlow getFlow() {
		return flow;
	}

	public void setFlow(SeawallPatrolFlow flow) {
		this.flow = flow;
	}

	public List<SeawallPatrolFlow> getFlows() {
		return flows;
	}

	public void setFlows(List<SeawallPatrolFlow> flows) {
		this.flows = flows;
	}

	public File getDealFile() {
		return dealFile;
	}

	public void setDealFile(File dealFile) {
		this.dealFile = dealFile;
	}

	public String getDealFileFileName() {
		return dealFileFileName;
	}

	public void setDealFileFileName(String dealFileFileName) {
		this.dealFileFileName = dealFileFileName;
	}

	public String getDealFileContentType() {
		return dealFileContentType;
	}

	public void setDealFileContentType(String dealFileContentType) {
		this.dealFileContentType = dealFileContentType;
	}

	public InputStream getFileInputStream() {
		return fileInputStream;
	}

	public void setFileInputStream(InputStream fileInputStream) {
		this.fileInputStream = fileInputStream;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public List<SeawallPatrolFromWs> getSpfws() {
		return spfws;
	}

	public void setSpfws(List<SeawallPatrolFromWs> spfws) {
		this.spfws = spfws;
	}

	public SeawallPatrolFromWs getSpfw() {
		return spfw;
	}

	public void setSpfw(SeawallPatrolFromWs spfw) {
		this.spfw = spfw;
	}

	public String getReload() {
		return reload;
	}

	public void setReload(String reload) {
		this.reload = reload;
	}

	private static class ResettableStreamRequestWrapper extends HttpServletRequestWrapper {

		
		public ResettableStreamRequestWrapper(HttpServletRequest request) {
			super(request);
		}
		
		@Override
		public Map getParameterMap(){
			
			Map map1 = this.getRequest().getParameterMap();
			if ( map1.containsKey("reload") ) {
				Map map2 = new HashMap();
				BeanUtils.copyProperties(map1, map2);
				map2.remove("reload");
				return map2;
			}
			
			return map1;
		}
	}

	public SeaUseInfoCompare getCompare() {
		return compare;
	}



	public void setCompare(SeaUseInfoCompare compare) {
		this.compare = compare;
	}



	public List<SeaUseInfoCompare> getCompares() {
		return compares;
	}



	public void setCompares(List<SeaUseInfoCompare> compares) {
		this.compares = compares;
	}

	public String getApprPersonId() {
		return apprPersonId;
	}

	public void setApprPersonId(String apprPersonId) {
		this.apprPersonId = apprPersonId;
	}

	public String getApprPersonName() {
		return apprPersonName;
	}

	public void setApprPersonName(String apprPersonName) {
		this.apprPersonName = apprPersonName;
	}

	public SeaUseInfoCompareResult getCompareResult() {
		return compareResult;
	}

	public void setCompareResult(SeaUseInfoCompareResult compareResult) {
		this.compareResult = compareResult;
	}

	public List<SeaUseInfoCompareResult> getCompareResults() {
		return compareResults;
	}

	public void setCompareResults(List<SeaUseInfoCompareResult> compareResults) {
		this.compareResults = compareResults;
	}

	public Map<String, Object> getFlowMap() {
		return flowMap;
	}

	public void setFlowMap(Map<String, Object> flowMap) {
		this.flowMap = flowMap;
	}

}
