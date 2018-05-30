package com.htcf.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.TjfxForm;
import com.htcf.service.IBusinessService;
import com.htcf.service.IStatisticalAnalysisService;

/**
 * 海域使用动态管理——统计分析
 * @author yinying
 *
 */
@Controller("statisticalAnalysisAction")
@Scope("prototype")
public class StatisticalAnalysisAction extends BaseAction{

	@Autowired
	private IBusinessService businessService;
	
	@Autowired
	private IStatisticalAnalysisService statisticalAnalysisService;

	//实体
	private TjfxForm tjfxForm = new TjfxForm();
	
	//List
	private List<?> ewjcbList;
	private List<?> tjbList;
	
	//变量
	private String hysytjData_x;
	private String hysytjData_y;
	private String hysytjData_y2;
	private String jldw;//计量单位
	
	
	
	/**
	 以海域动态监视监测数据为基础，紧密结合海洋行政主管部门日常业务工作，
	 实现对海域使用各类信息进行统计，以量化的指标及时反映上海市海域使用的动态变化状况，
	 满足海域管理的需求，促进海域权属管理和海域有偿使用等制度的落实，为管理者提供量化的决策依据，
	 并为其他相关政府部门和社会公众提供有关海域使用信息的查询服务。
	 除以常规报表形式来统计分析结果外，并提供如二维交叉表、柱状图、饼状图、折线图等
	  表现形式实现更直观的海域动态变化情况。
	 
	功能包括分类统计、自定义统计、动态变化图表分析等。
	具体包括：
	 */
	
	/********统计分析——地面监视监测报告******开始************/
	//1、地面监视监测报告：
	//地面监视监测计划执法情况、（有计划吗？）
	//海域使用新增或变更动态、
	//监测监测成果数据质量评价等。
	
	/**
	 * 
	Description :地面监视监测计划执法情况
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-10 下午03:26:10
	 */
	public String fetchDmjsjcJhzfqk(){
		System.out.println("地面监视监测计划执法情况");
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		hysytjData_x="";
		hysytjData_y="";
		
		if(tjfxForm != null && tjfxForm.getTjfs() != null && !tjfxForm.getTjfs().equals("") 
				//&& tjfxForm.getTjys() != null && !tjfxForm.getTjys().equals("")
				&& tjfxForm.getZsfs() != null && !tjfxForm.getZsfs().equals("")){
		}else{
			System.out.println("塞默认值");
			tjfxForm.setTjfs("按监测年份");
			tjfxForm.setZsfs("柱状图");
		}
		
		List<?> tjList = statisticalAnalysisService.fetchDmjsjcTj(tjfxForm);
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					if(obj[0] != null && !obj[0].equals("")){
						hysytjData_x += obj[0].toString() + "";
					}else{
						hysytjData_x += "0";
					}
					if(obj[1] != null && !obj[1].equals("")){
						hysytjData_y += obj[1].toString() + "";
					}else{
						hysytjData_y += "0";
					}
				}else{
					if(obj[0] != null && !obj[0].equals("")){
						hysytjData_x += obj[0].toString() + ",";
					}else{
						hysytjData_x += "0,";
					}
					if(obj[1] != null && !obj[1].equals("")){
						hysytjData_y += obj[1].toString() + ",";
					}else{
						hysytjData_y += "0,";
					}
				}
			}
		}
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		
		System.out.println("hysytjData_x="+hysytjData_x);
		System.out.println("hysytjData_y="+hysytjData_y);
		
		//jldw
		jldw="个";
		
		if(tjfxForm.getZsfs().equals("柱状图")){
			return "goDmjsjcbgJhzfqk";
		}else if(tjfxForm.getZsfs().equals("折线图")){
			return "goDmjsjcbgJhzfqk2";
		}else if(tjfxForm.getZsfs().equals("饼状图")){
			return "goDmjsjcbgJhzfqk3";
		}else{
			//默认柱状图
			return "goDmjsjcbgJhzfqk";
		}
		
	}
	/**
	 * 
	Description :海域使用新增或变更动态
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-10 下午03:26:10
	 */
	public String fetchDmjsjcHysydt(){
		System.out.println("海域使用新增或变更动态");
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		hysytjData_x="";
		hysytjData_y="";
		
		
//		if(tjfxForm != null && tjfxForm.getTjfs() != null && !tjfxForm.getTjfs().equals("") 
//				//&& tjfxForm.getTjys() != null && !tjfxForm.getTjys().equals("")
//				&& tjfxForm.getZsfs() != null && !tjfxForm.getZsfs().equals("")){
//		}else{
//			System.out.println("塞默认值");
//			tjfxForm.setTjfs("按海域使用状态");
//			tjfxForm.setZsfs("柱状图");
//		}
		
		List<?> tjList = statisticalAnalysisService.fetchDmjsjcHysydtTj(tjfxForm);
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					if(obj[0] != null && !obj[0].equals("")){
						hysytjData_x += obj[0].toString() + "";
					}else{
						hysytjData_x += "0";
					}
					if(obj[1] != null && !obj[1].equals("")){
						hysytjData_y += obj[1].toString() + "";
					}else{
						hysytjData_y += "0";
					}
				}else{
					if(obj[0] != null && !obj[0].equals("")){
						hysytjData_x += obj[0].toString() + ",";
					}else{
						hysytjData_x += "0,";
					}
					if(obj[1] != null && !obj[1].equals("")){
						hysytjData_y += obj[1].toString() + ",";
					}else{
						hysytjData_y += "0,";
					}
				}
			}
		}
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		
		System.out.println("hysytjData_x="+hysytjData_x);
		System.out.println("hysytjData_y="+hysytjData_y);
		
		//jldw
		jldw="个";
		
		if(tjfxForm.getZsfs().equals("柱状图")){
			return "goDmjsjcbgHysydt";
		}else if(tjfxForm.getZsfs().equals("折线图")){
			return "goDmjsjcbgHysydt2";
		}else if(tjfxForm.getZsfs().equals("饼状图")){
			return "goDmjsjcbgHysydt3";
		}else{
			//默认柱状图
			return "goDmjsjcbgHysydt";
		}
	}
	
	
	
	/**
	 * 
	Description :监测监测成果数据质量评价
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2018-1-10 下午03:26:47
	 */
	public String fetchDmjsjcCgsjzlpj(){
		System.out.println("监测监测成果数据质量评价");
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		hysytjData_x="";
		hysytjData_y="";
		
		return "";
	}
	
	
	
	
	/********统计分析——地面监视监测报告******结束************/

	/********统计分析——海域使用统计数据******开始************/
	//2、海域使用统计数据：
	//各类型海域使用面积、占用岸线、新增或变更用海类型与面积、占用滩涂浅海面积、功能区利用状况等
	
	
	
	//各类型海域使用面积---ok用海类型、宗海面积
	//占用岸线----ok
	//新增或变更用海类型与面积：？
	//占用滩涂浅海面积：无数据表？
	//功能区利用状况：怎么判别利用状况？每个功能区有几个用海项目？怎么有关联关系

	//针对海域具体使用率、使用了多少面积、占用了多少岸线、
	
	
	/**
	 * 
	Description :海域使用统计数据
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-2 下午05:05:48
	 */
	public String fetchHysytj(){
		System.out.println("海域使用统计数据");
		
		
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		hysytjData_x="";
		hysytjData_y="";
		
		if(tjfxForm != null && tjfxForm.getTjfs() != null && !tjfxForm.getTjfs().equals("") 
				&& tjfxForm.getTjys() != null && !tjfxForm.getTjys().equals("")
				&& tjfxForm.getZsfs() != null && !tjfxForm.getZsfs().equals("")){
			
		}else{
			System.out.println("塞默认值");
			tjfxForm.setTjfs("按用海批准年份");
			tjfxForm.setTjys("证书数量");
			tjfxForm.setZsfs("柱状图");
		}
		
		List<?> tjList = statisticalAnalysisService.fetchHysytj(tjfxForm);
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					if(obj[0] != null && !obj[0].equals("")){
						hysytjData_x += obj[0].toString() + "";
					}else{
						hysytjData_x += "0";
					}
					if(obj[1] != null && !obj[1].equals("")){
						hysytjData_y += obj[1].toString() + "";
					}else{
						hysytjData_y += "0";
					}
				}else{
					if(obj[0] != null && !obj[0].equals("")){
						hysytjData_x += obj[0].toString() + ",";
					}else{
						hysytjData_x += "0,";
					}
					if(obj[1] != null && !obj[1].equals("")){
						hysytjData_y += obj[1].toString() + ",";
					}else{
						hysytjData_y += "0,";
					}
				}
			}
		}
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		
		System.out.println("hysytjData_x="+hysytjData_x);
		System.out.println("hysytjData_y="+hysytjData_y);
		
		//jldw
		if(tjfxForm.getTjys().equals("证书数量") || tjfxForm.getTjys().equals("用海项目数量")){
			jldw="个";
		}
		if(tjfxForm.getTjys().equals("宗海面积")){
			jldw="公顷";
		}
		if(tjfxForm.getTjys().equals("海域使用金应征收总额") || tjfxForm.getTjys().equals("海域使用金实际征收总额")){
			jldw="元";
		}
		if(tjfxForm.getTjys().equals("占用岸线")){
			jldw="米";
		}
		
		if(tjfxForm.getZsfs().equals("柱状图")){
			return "goHysytj";
		}else if(tjfxForm.getZsfs().equals("折线图")){
			return "goHysytj2";
		}else if(tjfxForm.getZsfs().equals("饼状图")){
			return "goHysytj3";
		}else{
			//默认柱状图
			return "goHysytj";
		}
	}
	
	/********统计分析——海域使用统计数据******结束************/
	
	/********统计分析——海域使用现状图******开始************/
	//3、海域使用现状图：市、区县明确标示的现有宗海位置、编号、海域使用分类、分布、统计图表等。
	
	//海域使用分类：用海类型
	
	
	/**
	 * 
	Description :海域使用现状图-地图
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-6 下午04:17:55
	 */
	public String fetchHysyxzt(){
		System.out.println("地图展示");
		
		return "goHysyxzt";
	}
	/**
	 * 
	Description :海域使用现状图-统计图
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-6 下午04:17:55
	 */
	public String fetchHysyxzt2(){
		System.out.println("统计图");
		//复用海域使用统计数据
		return "goHysyxzt2";
	}
	public String fetchHysytj2(){
		System.out.println("海域使用统计数据");
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		hysytjData_x="";
		hysytjData_y="";
		
		if(tjfxForm != null && tjfxForm.getTjfs() != null && !tjfxForm.getTjfs().equals("") 
				&& tjfxForm.getTjys() != null && !tjfxForm.getTjys().equals("")
				&& tjfxForm.getZsfs() != null && !tjfxForm.getZsfs().equals("")){
			
		}else{
			System.out.println("塞默认值");
			tjfxForm.setTjfs("按用海批准年份");
			tjfxForm.setTjys("证书数量");
			tjfxForm.setZsfs("柱状图");
		}
		
		List<?> tjList = statisticalAnalysisService.fetchHysytj(tjfxForm);
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					if(obj[0] != null && !obj[0].equals("")){
						hysytjData_x += obj[0].toString() + "";
					}else{
						hysytjData_x += "0";
					}
					if(obj[1] != null && !obj[1].equals("")){
						hysytjData_y += obj[1].toString() + "";
					}else{
						hysytjData_y += "0";
					}
				}else{
					if(obj[0] != null && !obj[0].equals("")){
						hysytjData_x += obj[0].toString() + ",";
					}else{
						hysytjData_x += "0,";
					}
					if(obj[1] != null && !obj[1].equals("")){
						hysytjData_y += obj[1].toString() + ",";
					}else{
						hysytjData_y += "0,";
					}
				}
			}
		}
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		
		System.out.println("hysytjData_x="+hysytjData_x);
		System.out.println("hysytjData_y="+hysytjData_y);
		
		//jldw
		if(tjfxForm.getTjys().equals("证书数量") || tjfxForm.getTjys().equals("用海项目数量")){
			jldw="个";
		}
		if(tjfxForm.getTjys().equals("宗海面积")){
			jldw="公顷";
		}
		if(tjfxForm.getTjys().equals("海域使用金应征收总额") || tjfxForm.getTjys().equals("海域使用金实际征收总额")){
			jldw="元";
		}
		if(tjfxForm.getTjys().equals("占用岸线")){
			jldw="米";
		}
		
		if(tjfxForm.getZsfs().equals("柱状图")){
			return "goHysyxzt2_1";
		}else if(tjfxForm.getZsfs().equals("折线图")){
			return "goHysyxzt2_2";
		}else if(tjfxForm.getZsfs().equals("饼状图")){
			return "goHysyxzt2_3";
		}else{
			//默认柱状图
			return "goHysyxzt2_1";
		}
	}
	
	

	/**
	 * 
	Description :海域使用现状图-统计表
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-8 下午05:32:03
	 */
	public String fetchHysyxzt3(){
		System.out.println("统计表");
		System.out.println("海域使用统计数据");
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		
		if(tjfxForm != null && tjfxForm.getTjfs() != null && !tjfxForm.getTjfs().equals("") 
				&& tjfxForm.getTjys() != null && !tjfxForm.getTjys().equals("")){
			
		}else{
			System.out.println("塞默认值");
			tjfxForm.setTjfs("按用海批准年份");
			tjfxForm.setTjys("证书数量");
//			tjfxForm.setZsfs("柱状图");
		}
		
		tjbList = statisticalAnalysisService.fetchHysytj(tjfxForm);
		if(tjfxForm.getTjys().equals("证书数量") || tjfxForm.getTjys().equals("用海项目数量")){
			jldw="个";
		}
		if(tjfxForm.getTjys().equals("宗海面积")){
			jldw="公顷";
		}
		if(tjfxForm.getTjys().equals("海域使用金应征收总额") || tjfxForm.getTjys().equals("海域使用金实际征收总额")){
			jldw="元";
		}
		if(tjfxForm.getTjys().equals("占用岸线")){
			jldw="米";
		}
		return "goHysyxzt3";
	}
	
	
	
	/********统计分析——海域使用现状图******结束************/
	
	
	/********统计分析——海域资源价值指标统计汇总******开始************/
	//4、海域资源价值指标统计汇总。
	//用海项目：预计就业人数YJJYRS、预计拉动区域经济产值（万元）YJLDQYJJCZ、填海成本（万元/公顷）THCB

	/**
	 * 
	Description :海域资源价值指标统计汇总
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-7 下午02:47:47
	 */
	public String fetchHyzyjzzb(){
		System.out.println("统计方式="+tjfxForm.getTjfs()+"，统计要素="+tjfxForm.getTjys()+"，展示方式="+tjfxForm.getZsfs());
		hysytjData_x="";
		hysytjData_y="";
		if(tjfxForm != null && tjfxForm.getTjfs() != null && !tjfxForm.getTjfs().equals("") 
				&& tjfxForm.getTjys() != null && !tjfxForm.getTjys().equals("")
				&& tjfxForm.getZsfs() != null && !tjfxForm.getZsfs().equals("")){
			
		}else{
			System.out.println("塞默认值");
			tjfxForm.setTjfs("按用海批准年份");
			tjfxForm.setTjys("预计就业人数");
			tjfxForm.setZsfs("柱状图");
		}
		
		List<?> tjList = statisticalAnalysisService.fetchHyzyjzzb(tjfxForm);
		
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					if(obj[0] != null && !obj[0].equals("")){
						hysytjData_x += obj[0].toString() + "";
					}else{
						hysytjData_x += "0";
					}
					if(obj[1] != null && !obj[1].equals("")){
						hysytjData_y += obj[1].toString() + "";
					}else{
						hysytjData_y += "0";
					}
				}else{
					if(obj[0] != null && !obj[0].equals("")){
						hysytjData_x += obj[0].toString() + ",";
					}else{
						hysytjData_x += "0,";
					}
					if(obj[1] != null && !obj[1].equals("")){
						hysytjData_y += obj[1].toString() + ",";
					}else{
						hysytjData_y += "0,";
					}
				}
			}
		}

		System.out.println("hysytjData_x="+hysytjData_x);
		System.out.println("hysytjData_y="+hysytjData_y);
		
		if(tjfxForm.getTjys().equals("预计就业人数")){
			jldw="人";
		}
		if(tjfxForm.getTjys().equals("预计拉动区域经济产值")){
			jldw="万元";
		}
		if(tjfxForm.getTjys().equals("填海成本")){
			jldw="万元/公顷";
		}
		
		if(tjfxForm.getZsfs().equals("柱状图")){
			return "goHyzyjzzb";
		}else if(tjfxForm.getZsfs().equals("折线图")){
			return "goHyzyjzzb2";
		}else if(tjfxForm.getZsfs().equals("饼状图")){
			return "goHyzyjzzb3";
		}else{
			//默认柱状图
			return "goHyzyjzzb";
		}
		
	}
	
	/**
	 * 
	Description :二维交叉表
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-7 下午04:02:40
	 */
	public String fetchHyzyjzzbEwjcb(){
		System.out.println("统计方式="+tjfxForm.getTjfs());
		if(tjfxForm != null && tjfxForm.getTjfs() != null && !tjfxForm.getTjfs().equals("")){
			
		}else{
			System.out.println("塞默认值");
			tjfxForm.setTjfs("按用海批准年份");
		}
		ewjcbList=statisticalAnalysisService.fetchHyzyjzzbEwjcb(tjfxForm);
		return "goHyzyjzzbEwjcb";
	}
	
	/**
	 * 
	Description :环比统计图
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-11-7 下午04:53:44
	 */
	public String fetchHyzyjzzbHbtj(){
		System.out.println("统计方式="+tjfxForm.getTjfs());
		hysytjData_x="";
		hysytjData_y="";
		hysytjData_y2="";
		if(tjfxForm != null && tjfxForm.getTjfs() != null && !tjfxForm.getTjfs().equals("")
				&& tjfxForm.getZsfs() != null && !tjfxForm.getZsfs().equals("")){
			
		}else{
			System.out.println("塞默认值");
			tjfxForm.setTjfs("按用海批准年份");
			tjfxForm.setZsfs("柱状图");
		}
		List<?> tjList = statisticalAnalysisService.fetchHyzyjzzbEwjcb(tjfxForm);
		if(tjList != null && tjList.size() != 0){
			for(int i=0;i<tjList.size();i++){
				Object[] obj = (Object[]) tjList.get(i);
				if(i == tjList.size()-1){
					if(obj[0] != null && !obj[0].equals("")){
						hysytjData_x += obj[0].toString() + "";
					}else{
						hysytjData_x += "0";
					}
					if(obj[1] != null && !obj[1].equals("")){
						hysytjData_y += obj[1].toString() + "";
					}else{
						hysytjData_y += "0";
					}
					if(obj[2] != null && !obj[2].equals("")){
						hysytjData_y2 += obj[2].toString()+ "";
					}else{
						hysytjData_y2 += "0";
					}
				}else{
					if(obj[0] != null && !obj[0].equals("")){
						hysytjData_x += obj[0].toString() + ",";
					}else{
						hysytjData_x += "0,";
					}
					if(obj[1] != null && !obj[1].equals("")){
						hysytjData_y += obj[1].toString() + ",";
					}else{
						hysytjData_y += "0,";
					}
					if(obj[2] != null && !obj[2].equals("")){
						hysytjData_y2 += obj[2].toString() + ",";
					}else{
						hysytjData_y2 += "0,";
					}
				}
			}
		}
		
		System.out.println("hysytjData_x="+hysytjData_x);
		System.out.println("hysytjData_y="+hysytjData_y);
		System.out.println("hysytjData_y2="+hysytjData_y2);
		
		if(tjfxForm.getZsfs().equals("柱状图")){
			return "goHyzyjzzbHbtj";
		}else if(tjfxForm.getZsfs().equals("折线图")){
			return "goHyzyjzzbHbtj2";
		}else{
			//默认柱状图
			return "goHyzyjzzbHbtj";
		}
	}
	
	
	
	
	
	/********统计分析——海域资源价值指标统计汇总******结束************/
	
	
	
	

	public IBusinessService getBusinessService() {
		return businessService;
	}

	public void setBusinessService(IBusinessService businessService) {
		this.businessService = businessService;
	}

	public IStatisticalAnalysisService getStatisticalAnalysisService() {
		return statisticalAnalysisService;
	}

	public void setStatisticalAnalysisService(
			IStatisticalAnalysisService statisticalAnalysisService) {
		this.statisticalAnalysisService = statisticalAnalysisService;
	}

	public TjfxForm getTjfxForm() {
		return tjfxForm;
	}

	public void setTjfxForm(TjfxForm tjfxForm) {
		this.tjfxForm = tjfxForm;
	}

	public String getHysytjData_x() {
		return hysytjData_x;
	}

	public void setHysytjData_x(String hysytjDataX) {
		hysytjData_x = hysytjDataX;
	}
	public String getHysytjData_y() {
		return hysytjData_y;
	}

	public void setHysytjData_y(String hysytjDataY) {
		hysytjData_y = hysytjDataY;
	}

	public String getJldw() {
		return jldw;
	}

	public void setJldw(String jldw) {
		this.jldw = jldw;
	}

	public List<?> getEwjcbList() {
		return ewjcbList;
	}

	public void setEwjcbList(List<?> ewjcbList) {
		this.ewjcbList = ewjcbList;
	}

	public String getHysytjData_y2() {
		return hysytjData_y2;
	}

	public void setHysytjData_y2(String hysytjDataY2) {
		hysytjData_y2 = hysytjDataY2;
	}

	public List<?> getTjbList() {
		return tjbList;
	}

	public void setTjbList(List<?> tjbList) {
		this.tjbList = tjbList;
	}

	
}
