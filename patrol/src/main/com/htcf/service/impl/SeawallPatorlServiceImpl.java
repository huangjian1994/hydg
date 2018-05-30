package com.htcf.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.htcf.util.PageBeanS;
import net.sf.ezmorph.Morpher;
import net.sf.ezmorph.MorpherRegistry;
import net.sf.ezmorph.bean.BeanMorpher;
import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

import org.springframework.stereotype.Service;

import com.htcf.action.SeawallPatorlAction;
import com.htcf.entity.wsEntity.Case;
import com.htcf.entity.wsEntity.SeawallPatrolFromWs;
import com.htcf.service.SeaPatrolService;
import com.htcf.util.DateUtil;
import com.htcf.util.PageBean;
import com.htcf.util.StringUtil;
import com.htcf.webService.WebServiceGetData;
import com.htcf.webService.WebServiceGetDataSoap;
@Service("seawallPatrolService")
public class SeawallPatorlServiceImpl implements SeaPatrolService{

	@Override
	public Map<String,List<Case>> loadCaseStatistics(String strBT, String strET, String type) {
		
		Map<String,List<Case>> caseMap = new HashMap<String, List<Case>>();
		if ( (DateUtil.StringToUtilDate(strBT, "yyyy-MM-dd")).getTime() >= (DateUtil.StringToUtilDate(strET, "yyyy-MM-dd")).getTime() 
			|| StringUtil.isBlank(type)) {
			return caseMap;
		}
		//调用webService接口
		WebServiceGetData fac = new WebServiceGetData();
		WebServiceGetDataSoap gds = fac.getWebServiceGetDataSoap();
		String jsonStr = gds.getTJTab(strBT, strET, type);
		if ( StringUtil.isNotBlank(jsonStr) && jsonStr.indexOf("暂无数据") == -1 ) {
			
			JSONObject jsonObject = JSONObject.fromObject(jsonStr);
			Map<String, List<MorphDynaBean>> map = (Map<String, List<MorphDynaBean>>) JSONObject.toBean(jsonObject, Map.class);
			Set<String> keys = map.keySet();
			
			for (String key : keys) {
				List<MorphDynaBean> list = new ArrayList<MorphDynaBean>();
				list = map.get(key);
				
				MorpherRegistry morpherRegistry = JSONUtils.getMorpherRegistry();
				Morpher dynaMorpher = new BeanMorpher(Case.class, morpherRegistry);
				morpherRegistry.registerMorpher(dynaMorpher);
				List<Case> cases = new ArrayList<Case>();
				for (int i = 0; i < list.size(); i++) {
					MorphDynaBean bean = list.get(i);
					Case c = (Case) morpherRegistry.morph(Case.class, bean);
					cases.add(c);
				}
				caseMap.put(key, cases);
			}
			
		}
		return caseMap;
	}

	@Override
	public List<SeawallPatrolFromWs> loadPatrol(String strBT, String strET, String type) {

		List<SeawallPatrolFromWs> spList = new ArrayList<SeawallPatrolFromWs>();
		if ( (DateUtil.StringToUtilDate(strBT, "yyyy-MM-dd")).getTime() >= (DateUtil.StringToUtilDate(strET, "yyyy-MM-dd")).getTime() 
			|| StringUtil.isBlank(type)) {
			return spList;
		}
		//调用webService接口
		WebServiceGetData fac = new WebServiceGetData();
		WebServiceGetDataSoap gds = fac.getWebServiceGetDataSoap();
		String jsonStr = gds.getTJTabDetail(strBT, strET, type);
		jsonStr = jsonStr.replaceAll("\r\n|\t|\n", ",换行,");
		if ( StringUtil.isNotBlank(jsonStr) && jsonStr.indexOf("暂无数据") == -1 ) {
			
			JSONObject jsonObject = JSONObject.fromObject(jsonStr);
			Map<String, List<MorphDynaBean>> map = (Map<String, List<MorphDynaBean>>) JSONObject.toBean(jsonObject, Map.class);
			Set<String> keys = map.keySet();
			
			for (String key : keys) {
				List<MorphDynaBean> list = new ArrayList<MorphDynaBean>();
				list = map.get(key);
				
				MorpherRegistry morpherRegistry = JSONUtils.getMorpherRegistry();
				Morpher dynaMorpher = new BeanMorpher(SeawallPatrolFromWs.class, morpherRegistry);
				morpherRegistry.registerMorpher(dynaMorpher);
				for (int i = 0; i < list.size(); i++) {
					MorphDynaBean bean = list.get(i);
					SeawallPatrolFromWs c = (SeawallPatrolFromWs) morpherRegistry.morph(SeawallPatrolFromWs.class, bean);
					spList.add(c);
				}
			}
			
		}
		
		return spList;
	}

	@Override
	public List<SeawallPatrolFromWs> pagePatrol(String userId, SeawallPatrolFromWs sp, PageBean pageBean) {
		
		List<SeawallPatrolFromWs> spList = SeawallPatorlAction.spMap.get(userId);
		
		if ( null != sp ) {
			//条件过滤
			for (int i = 0; i < spList.size(); i++) {
				SeawallPatrolFromWs s = spList.get(i);
				//状态
				if ( StringUtil.isNotBlank(sp.getNm_state()) ) {
					if ( ! sp.getNm_state().equals(spList.get(i).getNm_state()) ) {
						spList.remove(i);
						i--;
						continue;
					}
				}
				//任务号
				if ( StringUtil.isNotBlank(sp.getSt_eventsn()) ) {
					if ( StringUtil.isBlank(s.getSt_eventsn()) || s.getSt_eventsn().indexOf(sp.getSt_eventsn()) == -1 ) {
						spList.remove(i);
						i--;
						continue;
					}
				}
				//类别
				if ( StringUtil.isNotBlank(sp.getSt_esclass()) ) {
					if ( StringUtil.isBlank(s.getSt_esclass()) ||( s.getSt_esclass().indexOf(sp.getSt_esclass()) == -1 && s.getSt_ebclass().indexOf(sp.getSt_esclass()) == -1 )) {
						spList.remove(i);
						i--;
						continue;
					}
				}
				//地址
				if ( StringUtil.isNotBlank(sp.getSt_name()) ) {
					if ( StringUtil.isBlank(s.getSt_address()) || s.getSt_name().indexOf(sp.getSt_name()) == -1 ) {
						spList.remove(i);
						i--;
						continue;
					}
				}
				//巡查人员
				if ( StringUtil.isNotBlank(sp.getSt_claimperson()) ) {
					if ( StringUtil.isBlank(s.getSt_claimperson()) || s.getSt_claimperson().indexOf(sp.getSt_claimperson()) == -1 ) {
						spList.remove(i);
						i--;
						continue;
					}
				}
				
			}
		}
		
		if ( null == pageBean ) {
			return spList;
		}
		
		pageBean.setTotalRecord(spList.size());
		int endNm = (pageBean.getStartRecordIndex() + pageBean.getPageRecord()) > spList.size() ? spList.size() : (pageBean.getStartRecordIndex() + pageBean.getPageRecord());
		spList = spList.subList(pageBean.getStartRecordIndex(), endNm);
		
		return spList;
	}

	@Override
	public Map<String, List<SeawallPatrolFromWs>> packageCoordinate(List<SeawallPatrolFromWs> spList) {
		
		Map<String, List<SeawallPatrolFromWs>> spMap = new LinkedHashMap<String, List<SeawallPatrolFromWs>>();
		
		List<String> adresses = new ArrayList<String>();
		for (SeawallPatrolFromWs sp : spList) {
			List<SeawallPatrolFromWs> sps = null;
			if ( adresses.contains(sp.getSt_name()) ) {
				sps = spMap.get(sp.getSt_name());
				
			} else {
				adresses.add(sp.getSt_name());
				sps = new ArrayList<SeawallPatrolFromWs>();
			}
			
			sps.add(sp);
			spMap.put(sp.getSt_name(), sps);
		}
		return spMap;
	}

	@Override
	public Map<String, Object> loadFlowsByEventsn(String eventsn) {
		Map<String, Object> map = null;
		if (!StringUtil.isBlank(eventsn)) {
			WebServiceGetData fac = new WebServiceGetData();
			WebServiceGetDataSoap gds = fac.getWebServiceGetDataSoap();
			String strBT = "2000-01-01";
			String strET = DateUtil.dateToString(new Date(), "yyyy-MM-dd");
			String jsonStr = gds.getWGHEvent(strBT, strET, "", "", "", "", eventsn);
			//jsonStr = jsonStr.replace(strBT + "至" + strET + "事件", "result");
			jsonStr = jsonStr.substring(jsonStr.indexOf("[") + 1, jsonStr.lastIndexOf("]"));
			
			Map<String, Class> classMap = new HashMap<String, Class>();
			classMap.put("FX", Map.class);
			classMap.put("LA", Map.class);
			classMap.put("PQ", Map.class);
			classMap.put("CL", Map.class);
			classMap.put("JA", Map.class);
			JSONObject jsonObject = JSONObject.fromObject(jsonStr);
			map = (Map<String, Object>) JSONObject.toBean(jsonObject, Map.class, classMap);
		}
		return map;
	}

	@Override
	public List<SeawallPatrolFromWs> pagePatrol1(String userId,
												 SeawallPatrolFromWs sp,
												 PageBeanS pageBeanS,
												 String lb) {

		List<SeawallPatrolFromWs> spList = SeawallPatorlAction.spMap.get(userId);

		if(StringUtil.isNotBlank(lb)){
			if("1".equals(lb)){
				for(int i = 0; i < spList.size(); i++){
					SeawallPatrolFromWs s = spList.get(i);
					if(  "5".equals(s.getNm_state())){
						spList.remove(i);
						i--;
						continue;
					}
				}
			}
			if("2".equals(lb)){
				for(int i = 0; i < spList.size(); i++){
					SeawallPatrolFromWs s = spList.get(i);
					if(  !"5".equals(s.getNm_state()) ){
						spList.remove(i);
						i--;
						continue;
					}
				}
			}

		}

		if ( null != sp ) {
			//条件过滤
			for (int i = 0; i < spList.size(); i++) {
				SeawallPatrolFromWs s = spList.get(i);
				//状态
				if ( StringUtil.isNotBlank(sp.getNm_state()) ) {
					if ( ! sp.getNm_state().equals(spList.get(i).getNm_state()) ) {
						spList.remove(i);
						i--;
						continue;
					}
				}
				//任务号
				if ( StringUtil.isNotBlank(sp.getSt_eventsn()) ) {
					if ( StringUtil.isBlank(s.getSt_eventsn()) || s.getSt_eventsn().indexOf(sp.getSt_eventsn()) == -1 ) {
						spList.remove(i);
						i--;
						continue;
					}
				}
				//类别
				if ( StringUtil.isNotBlank(sp.getSt_esclass()) ) {
					if ( StringUtil.isBlank(s.getSt_esclass()) ||( s.getSt_esclass().indexOf(sp.getSt_esclass()) == -1 && s.getSt_ebclass().indexOf(sp.getSt_esclass()) == -1 )) {
						spList.remove(i);
						i--;
						continue;
					}
				}
				//地址
				if ( StringUtil.isNotBlank(sp.getSt_name()) ) {
					if ( StringUtil.isBlank(s.getSt_address()) || s.getSt_name().indexOf(sp.getSt_name()) == -1 ) {
						spList.remove(i);
						i--;
						continue;
					}
				}
				//巡查人员
				if ( StringUtil.isNotBlank(sp.getSt_claimperson()) ) {
					if ( StringUtil.isBlank(s.getSt_claimperson()) || s.getSt_claimperson().indexOf(sp.getSt_claimperson()) == -1 ) {
						spList.remove(i);
						i--;
						continue;
					}
				}

			}
		}

		if ( null == pageBeanS ) {
			return spList;
		}

		pageBeanS.setTotalRecord(spList.size());
		int endNm = (pageBeanS.getStartRecordIndex() + pageBeanS.getPageRecord()) > spList.size() ? spList.size() : (pageBeanS.getStartRecordIndex() + pageBeanS.getPageRecord());
		spList = spList.subList(pageBeanS.getStartRecordIndex(), endNm);

		return spList;
	}
}
