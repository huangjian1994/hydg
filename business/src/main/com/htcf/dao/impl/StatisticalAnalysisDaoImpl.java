package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.htcf.dao.IStatisticalAnalysisDao;
import com.htcf.entity.TjfxForm;
/**
 * 统计分析
 * @author yinying
 *
 */
@Repository(value="statisticalAnalysisDao")
public class StatisticalAnalysisDaoImpl extends BaseDAOImpl<Object, Serializable> implements IStatisticalAnalysisDao{

	/**
	 * 
	Description :统计分析——海域使用统计数据
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-3 上午10:41:40
	 */
	public List<?> fetchHysytj(TjfxForm tjfxForm){
		String sql="";
		if(tjfxForm != null && tjfxForm.getTjfs() != null && !tjfxForm.getTjfs().equals("")){
			if(tjfxForm.getTjys().equals("证书数量")){
				if(tjfxForm.getTjfs().equals("按用海批准年份")){
					sql=
						"select substr(y.YHPZRQ, 1, 4),count(z.id)\n" +
						"from t_hysyyw_hysydt_yhxm y,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where y.id=z.xmid and y.YHPZRQ is not null\n" + 
						"group by substr(y.YHPZRQ, 1, 4)\n" + 
						"order by substr(y.YHPZRQ, 1, 4)";
				}
				
				if(tjfxForm.getTjfs().equals("按初始登记年份")){
					sql=
						"select substr(CSDJRQ, 1, 4), count(distinct HYGLH)\n" +
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where CSDJRQ is not null and HYGLH is not null \n" + 
						" group by substr(CSDJRQ, 1, 4)\n" + 
						" order by substr(CSDJRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按配号年份") ){
					sql=
						"select substr(FZRQ, 1, 4), count(distinct HYGLH)\n" +
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where FZRQ is not null and HYGLH is not null\n" + 
						" group by substr(FZRQ, 1, 4)\n" + 
						" order by substr(FZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按用海类型") ){
					//用海类型A
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海类型A' and t.dm=YHLXA)),\n" +
						"count(distinct HYGLH),YHLXA\n" + 
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where YHLXA is not null and HYGLH is not null\n" + 
						" group by YHLXA\n" + 
						" order by YHLXA";
					//用海类型B
//					sql=
//						"select ((select t.value from base_dictionary t where t.key='用海类型B' and t.dm=YHLXB)),\n" +
//						"count(YHLXB),YHLXB\n" + 
//						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
//						" where YHLXB is not null and HYGLH is not null\n" + 
//						" group by YHLXB\n" + 
//						" order by YHLXB;";
				}
				if(tjfxForm.getTjfs().equals("按用海方式") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海方式' and t.dm=t.YHFS)),\n" +
						"count(distinct z.HYGLH),t.YHFS\n" + 
						"  from t_hysyyw_hysydt_yhxm_yhfs t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						" where t.zsid=z.id and t.YHFS is not null and z.HYGLH is not null\n" + 
						" group by t.YHFS\n" + 
						" order by t.YHFS";
				}
				if(tjfxForm.getTjfs().equals("按项目位置") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目位置' and t.dm=t.xmwz),\n" +
						"count(distinct z.hyglh),t.xmwz\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.hyglh is not null and t.xmwz is not null\n" + 
						"group by t.xmwz\n" + 
						"order by t.xmwz";
				}
				
				if(tjfxForm.getTjfs().equals("按批准级别") ){
					//FZJGJB发证机关级别
					sql =
						"select (select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=t.FZJGJB),\n" +
						"count(distinct z.hyglh),t.FZJGJB\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.hyglh is not null and t.FZJGJB is not null\n" + 
						"group by t.FZJGJB\n" + 
						"order by t.FZJGJB";
					//SLJGJB受理机关级别
//					sql=
//						"select (select t.value from base_dictionary t where t.key='受理机关级别' and t.dm=t.SLJGJB),\n" +
//						"count(distinct z.hyglh),t.SLJGJB\n" + 
//						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
//						"where t.id=z.xmid and z.hyglh is not null and t.SLJGJB is not null\n" + 
//						"group by t.SLJGJB\n" + 
//						"order by t.SLJGJB";
				}
			}
			
			if(tjfxForm.getTjys().equals("用海项目数量")){
				if(tjfxForm.getTjfs().equals("按用海批准年份")){
					sql=
						"select substr(YHPZRQ, 1, 4), count(YHPZRQ)\n" +
						"from t_hysyyw_hysydt_yhxm\n" + 
						"where YHPZRQ is not null\n" + 
						"group by substr(YHPZRQ, 1, 4)\n" + 
						"order by substr(YHPZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按初始登记年份")){
					sql=
						"select substr(CSDJRQ, 1, 4), count(distinct xmid)\n" +
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where CSDJRQ is not null\n" + 
						" group by substr(CSDJRQ, 1, 4)\n" + 
						" order by substr(CSDJRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按配号年份") ){
					sql=
						"select substr(FZRQ, 1, 4), count(distinct xmid)\n" +
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where FZRQ is not null and hyglh is not null \n" + 
						" group by substr(FZRQ, 1, 4)\n" + 
						" order by substr(FZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按用海类型") ){
					//用海类型A
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海类型A' and t.dm=YHLXA)),\n" +
						"count(distinct xmid),YHLXA\n" + 
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where YHLXA is not null\n" + 
						" group by YHLXA\n" + 
						" order by YHLXA";
					//用海类型B
//					sql=
//						"select ((select t.value from base_dictionary t where t.key='用海类型B' and t.dm=YHLXB)),\n" +
//						"count(distinct xmid),YHLXB\n" + 
//						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
//						" where YHLXB is not null\n" + 
//						" group by YHLXB\n" + 
//						" order by YHLXB";
				}
				if(tjfxForm.getTjfs().equals("按用海方式") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海方式' and t.dm=YHFS)),\n" +
						"count(distinct xmid),YHFS\n" + 
						"  from t_hysyyw_hysydt_yhxm_yhfs t\n" + 
						" where YHFS is not null\n" + 
						" and xmid in (select id from T_HYSYYW_HYSYDT_YHXM)\n" + 
						" group by YHFS\n" + 
						" order by YHFS";
				}
				if(tjfxForm.getTjfs().equals("按项目位置") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='项目位置' and t.dm=XMWZ)),\n" +
						"count(distinct id),XMWZ\n" + 
						"  from T_HYSYYW_HYSYDT_YHXM t\n" + 
						" where XMWZ is not null\n" + 
						" group by XMWZ\n" + 
						" order by XMWZ";
				}
				if(tjfxForm.getTjfs().equals("按批准级别") ){
					//FZJGJB发证机关级别
					sql=
						"select (select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=t.FZJGJB),\n" +
						"count(distinct id),t.FZJGJB\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t\n" + 
						"where t.FZJGJB is not null\n" + 
						"group by t.FZJGJB\n" + 
						"order by t.FZJGJB";
					//SLJGJB受理机关级别
//					sql=
//						"select (select t.value from base_dictionary t where t.key='受理机关级别' and t.dm=t.SLJGJB),\n" +
//						"count(distinct id),t.SLJGJB\n" + 
//						"from T_HYSYYW_HYSYDT_YHXM t\n" + 
//						"where t.SLJGJB is not null\n" + 
//						"group by t.SLJGJB\n" + 
//						"order by t.SLJGJB";
				}
			}
			
			if(tjfxForm.getTjys().equals("宗海面积")){
				if(tjfxForm.getTjfs().equals("按用海批准年份")){
					sql=
						"select substr(y.YHPZRQ, 1, 4),sum(z.ZHMJ)\n" +
						"from t_hysyyw_hysydt_yhxm y,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where y.id=z.xmid and y.YHPZRQ is not null\n" + 
						"group by substr(y.YHPZRQ, 1, 4)\n" + 
						"order by substr(y.YHPZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按初始登记年份")){
					sql=
						"select substr(CSDJRQ, 1, 4), sum(ZHMJ)\n" +
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where CSDJRQ is not null and ZHMJ is not null\n" + 
						" group by substr(CSDJRQ, 1, 4)\n" + 
						" order by substr(CSDJRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按配号年份") ){
					sql=
						"select substr(FZRQ, 1, 4), sum(ZHMJ)\n" +
						" from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						"where FZRQ is not null and ZHMJ is not null and HYGLH is not null\n" + 
						"group by substr(FZRQ, 1, 4)\n" + 
						"order by substr(FZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按用海类型") ){
					//用海类型A
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海类型A' and t.dm=YHLXA)),\n" +
						"sum(ZHMJ),YHLXA\n" + 
						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						" where YHLXA is not null and ZHMJ is not null\n" + 
						" group by YHLXA\n" + 
						" order by YHLXA";
					//用海类型B
//					sql=
//						"select ((select t.value from base_dictionary t where t.key='用海类型B' and t.dm=YHLXB)),\n" +
//						"sum(ZHMJ),YHLXB\n" + 
//						"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
//						" where YHLXB is not null and ZHMJ is not null\n" + 
//						" group by YHLXB\n" + 
//						" order by YHLXB";
				}
				if(tjfxForm.getTjfs().equals("按用海方式") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海方式' and t.dm=t.YHFS)),\n" +
						"sum(z.ZHMJ),t.YHFS\n" + 
						"  from t_hysyyw_hysydt_yhxm_yhfs t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						" where t.ZSID=z.id and t.YHFS is not null and z.ZHMJ is not null\n" + 
						" group by t.YHFS\n" + 
						" order by t.YHFS";
				}
				if(tjfxForm.getTjfs().equals("按项目位置") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目位置' and t.dm=t.xmwz),\n" +
						"sum(z.ZHMJ),t.xmwz\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.ZHMJ is not null and t.xmwz is not null\n" + 
						"group by t.xmwz\n" + 
						"order by t.xmwz";
				}
				if(tjfxForm.getTjfs().equals("按批准级别") ){
					//FZJGJB发证机关级别
					sql=
						"select (select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=t.FZJGJB),\n" +
						"sum(z.ZHMJ),t.FZJGJB\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.ZHMJ is not null and t.FZJGJB is not null\n" + 
						"group by t.FZJGJB\n" + 
						"order by t.FZJGJB";
					//SLJGJB受理机关级别
//					sql=
//						"select (select t.value from base_dictionary t where t.key='受理机关级别' and t.dm=t.SLJGJB),\n" +
//						"sum(z.ZHMJ),t.SLJGJB\n" + 
//						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
//						"where t.id=z.xmid and z.ZHMJ is not null and t.SLJGJB is not null\n" + 
//						"group by t.SLJGJB\n" + 
//						"order by t.SLJGJB";
				}
			}
			
			if(tjfxForm.getTjys().equals("海域使用金应征收总额")){
				//T_HYSYYW_HYSYDT_YHXM_ZHXX海域使用金总额SYJZE
				
				if(tjfxForm.getTjfs().equals("按用海批准年份")){
					sql=
						"select substr(y.YHPZRQ, 1, 4),sum(z.SYJZE)\n" +
						"from t_hysyyw_hysydt_yhxm y,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where y.id=z.xmid and y.YHPZRQ is not null\n" + 
						"group by substr(y.YHPZRQ, 1, 4)\n" + 
						"order by substr(y.YHPZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按初始登记年份")){
					sql=
						"select substr(CSDJRQ, 1, 4), sum(SYJZE)\n" +
						"from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						"where CSDJRQ is not null and SYJZE is not null\n" + 
						"group by substr(CSDJRQ, 1, 4)\n" + 
						"order by substr(CSDJRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按配号年份") ){
					sql=
						"select substr(FZRQ, 1, 4), sum(SYJZE)\n" +
						"from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						"where FZRQ is not null and SYJZE is not null and HYGLH is not null\n" + 
						"group by substr(FZRQ, 1, 4)\n" + 
						"order by substr(FZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按用海类型") ){
					//用海类型A
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海类型A' and t.dm=YHLXA)),\n" +
						"sum(SYJZE),YHLXA\n" + 
						"from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
						"where YHLXA is not null and SYJZE is not null\n" + 
						"group by YHLXA\n" + 
						"order by YHLXA";
					//用海类型B
//					sql=
//						"select ((select t.value from base_dictionary t where t.key='用海类型B' and t.dm=YHLXB)),\n" +
//						"sum(SYJZE),YHLXB\n" + 
//						"from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
//						"where YHLXB is not null and SYJZE is not null\n" + 
//						"group by YHLXB\n" + 
//						"order by YHLXB";
				}
				if(tjfxForm.getTjfs().equals("按用海方式") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海方式' and t.dm=t.YHFS)),\n" +
						"sum(z.SYJZE),t.YHFS\n" + 
						"from t_hysyyw_hysydt_yhxm_yhfs t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.ZSID=z.id and t.YHFS is not null and z.SYJZE is not null\n" + 
						"group by t.YHFS\n" + 
						"order by t.YHFS";
				}
				if(tjfxForm.getTjfs().equals("按项目位置") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目位置' and t.dm=t.xmwz),\n" +
						"sum(z.ZHMJ),t.xmwz\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.ZHMJ is not null and t.xmwz is not null\n" + 
						"group by t.xmwz\n" + 
						"order by t.xmwz";
				}
				if(tjfxForm.getTjfs().equals("按批准级别") ){
					//FZJGJB发证机关级别
					sql=
						"select (select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=t.FZJGJB),\n" +
						"sum(z.SYJZE),t.FZJGJB\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
						"where t.id=z.xmid and z.SYJZE is not null and t.FZJGJB is not null\n" + 
						"group by t.FZJGJB\n" + 
						"order by t.FZJGJB";
					//SLJGJB受理机关级别
//					sql=
//						"select (select t.value from base_dictionary t where t.key='受理机关级别' and t.dm=t.SLJGJB),\n" +
//						"sum(z.SYJZE),t.SLJGJB\n" + 
//						"from T_HYSYYW_HYSYDT_YHXM t,t_hysyyw_hysydt_yhxm_zhxx z\n" + 
//						"where t.id=z.xmid and z.SYJZE is not null and t.SLJGJB is not null\n" + 
//						"group by t.SLJGJB\n" + 
//						"order by t.SLJGJB";
				}
			}
			
			if(tjfxForm.getTjys().equals("海域使用金实际征收总额")){
				//T_HYSYYW_HYSYDT_YHXM_HYSYJ海域使用金征收金额：小计（总额）ZSJE_XJ
				if(tjfxForm.getTjfs().equals("按用海批准年份")){
					sql=
						"select substr(y.YHPZRQ, 1, 4),sum(h.ZSJE_XJ)\n" +
						"from t_hysyyw_hysydt_yhxm y,t_hysyyw_hysydt_yhxm_zhxx z,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where y.id=z.xmid and z.id= h.zsid and y.YHPZRQ is not null\n" + 
						"group by substr(y.YHPZRQ, 1, 4)\n" + 
						"order by substr(y.YHPZRQ, 1, 4)";
				}
				
				if(tjfxForm.getTjfs().equals("按初始登记年份")){
					sql=
						"select substr(t.CSDJRQ, 1, 4), sum(h.ZSJE_XJ)\n" +
						"from t_hysyyw_hysydt_yhxm_zhxx t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where t.id=h.zsid and t.CSDJRQ is not null and h.ZSJE_XJ is not null\n" + 
						"group by substr(t.CSDJRQ, 1, 4)\n" + 
						"order by substr(t.CSDJRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按配号年份") ){
					sql=
						"select substr(t.FZRQ, 1, 4), sum(h.ZSJE_XJ)\n" +
						"from t_hysyyw_hysydt_yhxm_zhxx t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where t.id=h.zsid and t.FZRQ is not null and h.ZSJE_XJ is not null and t.HYGLH is not null\n" + 
						"group by substr(t.FZRQ, 1, 4)\n" + 
						"order by substr(t.FZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按用海类型") ){
					//用海类型A
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海类型A' and t.dm=t.YHLXA)),\n" +
						"sum(h.ZSJE_XJ),t.YHLXA\n" + 
						"from t_hysyyw_hysydt_yhxm_zhxx t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where t.id=h.zsid and t.YHLXA is not null and h.ZSJE_XJ is not null\n" + 
						"group by t.YHLXA\n" + 
						"order by t.YHLXA";
					//用海类型B
//					sql=
//						"select ((select t.value from base_dictionary t where t.key='用海类型B' and t.dm=t.YHLXB)),\n" +
//						"sum(h.ZSJE_XJ),t.YHLXB\n" + 
//						"from t_hysyyw_hysydt_yhxm_zhxx t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
//						"where t.id=h.zsid and t.YHLXB is not null and h.ZSJE_XJ is not null\n" + 
//						"group by t.YHLXB\n" + 
//						"order by t.YHLXB";
				}
				if(tjfxForm.getTjfs().equals("按用海方式") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海方式' and t.dm=t.YHFS)),\n" +
						"sum(h.ZSJE_XJ),t.YHFS\n" + 
						"from t_hysyyw_hysydt_yhxm_yhfs t,t_hysyyw_hysydt_yhxm_zhxx z,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where t.ZSID=z.id and z.id=h.zsid and t.YHFS is not null and h.ZSJE_XJ is not null\n" + 
						"group by t.YHFS\n" + 
						"order by t.YHFS";
				}
				if(tjfxForm.getTjfs().equals("按项目位置") ){
					sql=
						"select (select t.value from base_dictionary t where t.key='项目位置' and t.dm=t.xmwz),\n" +
						"sum(h.ZSJE_XJ),t.xmwz\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where t.id=h.xmid and h.ZSJE_XJ is not null and t.xmwz is not null\n" + 
						"group by t.xmwz\n" + 
						"order by t.xmwz";
				}
				if(tjfxForm.getTjfs().equals("按批准级别") ){
					//FZJGJB发证机关级别
					sql=
						"select (select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=t.FZJGJB),\n" +
						"sum(h.ZSJE_XJ),t.FZJGJB\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
						"where t.id=h.xmid and h.ZSJE_XJ is not null and t.FZJGJB is not null\n" + 
						"group by t.FZJGJB\n" + 
						"order by t.FZJGJB";
					//SLJGJB受理机关级别
//					sql=
//						"select (select t.value from base_dictionary t where t.key='受理机关级别' and t.dm=t.SLJGJB),\n" +
//						"sum(h.ZSJE_XJ),t.SLJGJB\n" + 
//						"from T_HYSYYW_HYSYDT_YHXM t,T_HYSYYW_HYSYDT_YHXM_HYSYJ h\n" + 
//						"where t.id=h.xmid and h.ZSJE_XJ is not null and t.SLJGJB is not null\n" + 
//						"group by t.SLJGJB\n" + 
//						"order by t.SLJGJB";
				}
			}
			
			if(tjfxForm.getTjys().equals("占用岸线")){
				if(tjfxForm.getTjfs().equals("按用海批准年份")){
					sql=
						"select substr(y.YHPZRQ, 1, 4),sum(y.zyax)\n" +
						"from t_hysyyw_hysydt_yhxm y\n" + 
						"where y.YHPZRQ is not null\n" + 
						"group by substr(y.YHPZRQ, 1, 4)\n" + 
						"order by substr(y.YHPZRQ, 1, 4)";
				}
				
				if(tjfxForm.getTjfs().equals("按初始登记年份")){
					sql=
						"select substr(t.CSDJRQ, 1, 4), sum(y.zyax)\n" +
						"from t_hysyyw_hysydt_yhxm_zhxx t,t_hysyyw_hysydt_yhxm y\n" + 
						"where t.xmid=y.id and t.CSDJRQ is not null and y.zyax is not null\n" + 
						"group by substr(t.CSDJRQ, 1, 4)\n" + 
						"order by substr(t.CSDJRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按配号年份") ){
					sql=
						"select substr(t.FZRQ, 1, 4), sum(y.zyax)\n" +
						"from t_hysyyw_hysydt_yhxm_zhxx t,t_hysyyw_hysydt_yhxm y\n" + 
						"where t.xmid=y.id and t.FZRQ is not null and hyglh is not null and y.zyax is not null\n" + 
						"group by substr(t.FZRQ, 1, 4)\n" + 
						"order by substr(t.FZRQ, 1, 4)";
				}
				if(tjfxForm.getTjfs().equals("按用海类型") ){
					//用海类型A
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海类型A' and t.dm=YHLXA)),\n" +
						"sum(y.zyax),t.YHLXA\n" + 
						"from t_hysyyw_hysydt_yhxm_zhxx t,t_hysyyw_hysydt_yhxm y\n" + 
						"where t.xmid=y.id and t.YHLXA is not null and y.zyax is not null\n" + 
						"group by t.YHLXA\n" + 
						"order by t.YHLXA";
					//用海类型B
//					sql=
//						"select ((select t.value from base_dictionary t where t.key='用海类型B' and t.dm=YHLXB)),\n" +
//						"sum(y.zyax),t.YHLXB\n" + 
//						"from t_hysyyw_hysydt_yhxm_zhxx t,t_hysyyw_hysydt_yhxm y\n" + 
//						"where t.xmid=y.id and t.YHLXB is not null and y.zyax is not null\n" + 
//						"group by t.YHLXB\n" + 
//						"order by t.YHLXB";
				}
				if(tjfxForm.getTjfs().equals("按用海方式") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='用海方式' and t.dm=YHFS)),\n" +
						"sum(y.zyax),t.YHFS\n" + 
						"from t_hysyyw_hysydt_yhxm_yhfs t,t_hysyyw_hysydt_yhxm y\n" + 
						"where t.xmid=y.id and t.YHFS is not null and y.zyax is not null\n" + 
						"group by t.YHFS\n" + 
						"order by t.YHFS";
				}
				if(tjfxForm.getTjfs().equals("按项目位置") ){
					sql=
						"select ((select t.value from base_dictionary t where t.key='项目位置' and t.dm=XMWZ)),\n" +
						"sum(zyax),XMWZ\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t\n" + 
						"where XMWZ is not null and zyax is not null\n" + 
						"group by XMWZ\n" + 
						"order by XMWZ";
				}
				if(tjfxForm.getTjfs().equals("按批准级别") ){
					//FZJGJB发证机关级别
					sql=
						"select (select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=t.FZJGJB),\n" +
						"sum(zyax),t.FZJGJB\n" + 
						"from T_HYSYYW_HYSYDT_YHXM t\n" + 
						"where t.FZJGJB is not null and zyax is not null\n" + 
						"group by t.FZJGJB\n" + 
						"order by t.FZJGJB";
					//SLJGJB受理机关级别
//					sql=
//						"select (select t.value from base_dictionary t where t.key='受理机关级别' and t.dm=t.SLJGJB),\n" +
//						"sum(zyax),t.SLJGJB\n" + 
//						"from T_HYSYYW_HYSYDT_YHXM t\n" + 
//						"where t.SLJGJB is not null and zyax is not null\n" + 
//						"group by t.SLJGJB\n" + 
//						"order by t.SLJGJB";

				}
			}
		}else{
			System.out.println("DAO**********空值");
			sql=
				"select substr(CSDJRQ, 1, 4), count(CSDJRQ)\n" +
				"  from t_hysyyw_hysydt_yhxm_zhxx t\n" + 
				" where CSDJRQ is not null and HYGLH is not null \n" + 
				" group by substr(CSDJRQ, 1, 4)\n" + 
				" order by substr(CSDJRQ, 1, 4)";
		}
		System.out.println("sql="+sql);
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	
	/**
	 * 
	Description :统计分析——海域资源价值指标统计汇总
	@param:@param qsYear
	@param:@param zzYear
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-7 下午02:32:06
	 */
	public List<?> fetchHyzyjzzb(TjfxForm tjfxForm){
		String sql="";
		if(tjfxForm.getTjfs().equals("按用海批准年份")){
			if(tjfxForm.getTjys().equals("预计就业人数") ){
				sql +=
					"select substr(YHPZRQ,1,4),sum(YJJYRS)\n" +
					"from t_hysyyw_hysydt_yhxm\n" + 
					"where YHPZRQ is not null and YJJYRS is not null\n" + 
					"group by substr(YHPZRQ,1,4)\n" + 
					"order by substr(YHPZRQ,1,4)";
			}
			if(tjfxForm.getTjys().equals("预计拉动区域经济产值") ){
				sql+=
					"select substr(YHPZRQ,1,4),sum(YJLDQYJJCZ)\n" +
					"from t_hysyyw_hysydt_yhxm\n" + 
					"where YHPZRQ is not null and YJLDQYJJCZ is not null\n" + 
					"group by substr(YHPZRQ,1,4)\n" + 
					"order by substr(YHPZRQ,1,4)";
			}
			if(tjfxForm.getTjys().equals("填海成本") ){
				sql+=
					"select substr(YHPZRQ,1,4),sum(THCB)\n" +
					"from t_hysyyw_hysydt_yhxm\n" + 
					"where YHPZRQ is not null and THCB is not null\n" + 
					"group by substr(YHPZRQ,1,4)\n" + 
					"order by substr(YHPZRQ,1,4)";
			}
		}
		
		if(tjfxForm.getTjfs().equals("按项目位置")){
			if(tjfxForm.getTjys().equals("预计就业人数") ){
				sql +=
					"select (select t.value from base_dictionary t where t.key='项目位置' and t.dm=t.xmwz),\n" +
					"sum(YJJYRS),XMWZ\n" + 
					"from t_hysyyw_hysydt_yhxm t\n" + 
					"where XMWZ is not null and YJJYRS is not null\n" + 
					"group by XMWZ\n" + 
					"order by XMWZ";
			}
			if(tjfxForm.getTjys().equals("预计拉动区域经济产值") ){
				sql+=
					"select (select t.value from base_dictionary t where t.key='项目位置' and t.dm=t.xmwz),\n" +
					"sum(YJLDQYJJCZ),XMWZ\n" + 
					"from t_hysyyw_hysydt_yhxm t\n" + 
					"where XMWZ is not null and YJLDQYJJCZ is not null\n" + 
					"group by XMWZ\n" + 
					"order by XMWZ";
			}
			if(tjfxForm.getTjys().equals("填海成本") ){
				sql+=
					"select (select t.value from base_dictionary t where t.key='项目位置' and t.dm=t.xmwz),\n" +
					"sum(THCB),XMWZ\n" + 
					"from t_hysyyw_hysydt_yhxm t\n" + 
					"where XMWZ is not null and THCB is not null\n" + 
					"group by XMWZ\n" + 
					"order by XMWZ";
			}
		}
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	
	/**
	 * 
	Description :海域资源价值指标统计汇总-二维交叉表、环比分析
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-7 下午04:04:50
	 */
	public List<?> fetchHyzyjzzbEwjcb(TjfxForm tjfxForm){
		String sql="";
		if(tjfxForm.getTjfs().equals("按用海批准年份")){
			sql=
				"select substr(YHPZRQ,1,4),sum(YJJYRS),sum(YJLDQYJJCZ),sum(THCB) \n" +
				" from t_hysyyw_hysydt_yhxm where YHPZRQ is not null ";
//			if(tjfxForm != null){
//				if(tjfxForm.getQsYear() != null && !tjfxForm.getQsYear().equals("")){
//					sql += " and substr(YHPZRQ,1,4)>='"+tjfxForm.getQsYear()+"' ";
//				}
//				if(tjfxForm.getZzYear() != null && !tjfxForm.getZzYear().equals("")){
//					sql += " and substr(YHPZRQ,1,4)<='"+tjfxForm.getZzYear()+"' ";
//				}
//			}
			sql += " group by substr(YHPZRQ,1,4)\n" + 
					"order by substr(YHPZRQ,1,4) desc";
			}
		if(tjfxForm.getTjfs().equals("按项目位置")){
			sql += 
				"select (select t.value from base_dictionary t where t.key='项目位置' and t.dm=t.xmwz),\n" +
				"sum(YJJYRS),sum(YJLDQYJJCZ),sum(THCB)\n" + 
				"from t_hysyyw_hysydt_yhxm t where XMWZ is not null\n" + 
				"group by XMWZ\n" + 
				"order by XMWZ";
		}
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	
	/**
	 * 
	Description :海域使用现状图-统计图表
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-11-7 下午06:20:35
	 */
	public List<?> fetchHysyxz(TjfxForm tjfxForm){
		String sql="";
		
		
		List<?> l = this.findBySQL(sql);
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/**
	 * 
	Description :地面监视监测计划执法情况
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-10 上午11:42:52
	 */
	public List<?> fetchDmjsjcTj(TjfxForm tjfxForm){
		String sql="";
		if(tjfxForm != null){
			if(tjfxForm.getTjfs().equals("按监测年份")){
				sql="select substr(jgrq,1,4),count(id) from T_HYSYYW_HYSYDT_YHXMPHJG_DT t " +
						"where 1=1 " +
						" group by substr(jgrq,1,4) order by substr(jgrq,1,4) desc";
			}
			if(tjfxForm.getTjfs().equals("按监测单位")){
				sql="select HCDWMC,count(id) from T_HYSYYW_HYSYDT_YHXMPHJG_DT t " +
					"where 1=1 " +
					" group by HCDWMC order by HCDWMC";
			}
			if(tjfxForm.getTjfs().equals("按监测类型")){
				sql = "select (select t.value from base_dictionary t where t.key='监管方式' and t.dm=t.JGFS),count(id),JGFS  " +
						" from T_HYSYYW_HYSYDT_YHXMPHJG_DT t where 1=1  " +
						" group by JGFS order by JGFS";
			}
		}
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/**
	 * 
	Description :海域使用新增或变更动态
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-10 下午03:40:01
	 */
	public List<?> fetchDmjsjcHysydtTj(TjfxForm tjfxForm){
		String sql="select (select t.value from base_dictionary t where t.key='项目状态' and t.dm=t.zt),count(id),zt" +
				" from T_HYSYYW_HYSYDT_YHXM t where 1=1 " +
				" group by zt order by zt";
		
		if(tjfxForm != null){
//			if(tjfxForm.getTjfs().equals("按监测年份")){
//				sql="select substr(jgrq,1,4),count(id) from T_HYSYYW_HYSYDT_YHXMPHJG_DT t " +
//						"where 1=1 " +
//						" group by substr(jgrq,1,4) order by substr(jgrq,1,4) desc";
//			}
//			if(tjfxForm.getTjfs().equals("按监测单位")){
//				sql="select HCDWMC,count(id) from T_HYSYYW_HYSYDT_YHXMPHJG_DT t " +
//					"where 1=1 " +
//					" group by HCDWMC order by HCDWMC";
//			}
//			if(tjfxForm.getTjfs().equals("按监测类型")){
//				sql = "select (select t.value from base_dictionary t where t.key='监管方式' and t.dm=t.JGFS),count(id),JGFS  " +
//						" from T_HYSYYW_HYSYDT_YHXMPHJG_DT t where 1=1  " +
//						" group by JGFS order by JGFS";
//			}
		}
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	/**
	 * 
	Description :监测监测成果数据质量评价
	@param:@param tjfxForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-10 下午03:42:11
	 */
	public List<?> fetchDmjsjcCgsjzlpj(TjfxForm tjfxForm){
		String sql="select (select t.value from base_dictionary t where t.key='项目状态' and t.dm=t.zt),count(id),zt" +
				" from T_HYSYYW_HYSYDT_YHXM t where 1=1 " +
				" group by zt order by zt";
		
		if(tjfxForm != null){
//			if(tjfxForm.getTjfs().equals("按监测年份")){
//				sql="select substr(jgrq,1,4),count(id) from T_HYSYYW_HYSYDT_YHXMPHJG_DT t " +
//						"where 1=1 " +
//						" group by substr(jgrq,1,4) order by substr(jgrq,1,4) desc";
//			}
//			if(tjfxForm.getTjfs().equals("按监测单位")){
//				sql="select HCDWMC,count(id) from T_HYSYYW_HYSYDT_YHXMPHJG_DT t " +
//					"where 1=1 " +
//					" group by HCDWMC order by HCDWMC";
//			}
//			if(tjfxForm.getTjfs().equals("按监测类型")){
//				sql = "select (select t.value from base_dictionary t where t.key='监管方式' and t.dm=t.JGFS),count(id),JGFS  " +
//						" from T_HYSYYW_HYSYDT_YHXMPHJG_DT t where 1=1  " +
//						" group by JGFS order by JGFS";
//			}
		}
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	
	
}
