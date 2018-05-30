package com.htcf.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.htcf.entity.SubmarineCableAxes;
import com.htcf.service.SubmarineCableAxesService;
import com.htcf.util.StringUtil;

@Controller("scaAction")
@Scope("prototype")
public class SubmarineCableAxesAction extends BaseAction {
	
	@Autowired
	private SubmarineCableAxesService submarineCableAxesService;
	
	private SubmarineCableAxes sca;
	/**
	 * 坐标类型
	 */
	private String type;
	/**
	 * xy轴坐标json
	 */
	private String coordinateJson;
	
	/**
	 * 根据类型加载坐标数据
	 */
	public void loadScaByType(){
		
		if ( StringUtil.isNotBlank(type) ){

			List<SubmarineCableAxes> scas = submarineCableAxesService.loadScaByType(type);
			Map<String, List<SubmarineCableAxes>> map = new HashMap<String, List<SubmarineCableAxes>>();
			map.put("result", scas);
			JSONObject json = JSONObject.fromObject(map);
			
			HttpServletResponse response=this.getHttpServletResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=null;
			try {
				out = response.getWriter();
				out.print(json.toString());
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 保存xy轴坐标信息
	 */
	public void saveXyCoordinate(){
		
		if ( StringUtil.isBlank(coordinateJson) ) return;
		
		List<SubmarineCableAxes> scas = new ArrayList<SubmarineCableAxes>();
		String[] xyCoordinates = coordinateJson.split(",");
		SubmarineCableAxes sca = null;
			
		for (int i = 0; i < xyCoordinates.length; i++) {
			int key = (i + 1) % 3;
			switch (key) {
				case 0:
					sca.setY(StringUtil.trimToBlank(xyCoordinates[i]));
					scas.add(sca);
					break;
				case 1:
					sca = new SubmarineCableAxes();
					sca.setId(Long.parseLong(StringUtil.trimToBlank(xyCoordinates[i])));
					break;
				case 2:
					sca.setX(StringUtil.trimToBlank(xyCoordinates[i]));
					break;
	
				default:
					break;
			}
		}
		//TODO 保存数据
		submarineCableAxesService.editXyCoordinate(scas);
	}

	public SubmarineCableAxes getSca() {
		return sca;
	}

	public void setSca(SubmarineCableAxes sca) {
		this.sca = sca;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCoordinateJson() {
		return coordinateJson;
	}

	public void setCoordinateJson(String coordinateJson) {
		this.coordinateJson = coordinateJson;
	}
	
}
