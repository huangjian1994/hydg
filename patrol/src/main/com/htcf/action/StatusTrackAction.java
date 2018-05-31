package com.htcf.action;


import com.htcf.entity.wsEntity.Case;
import com.htcf.entity.wsEntity.SeawallPatrolFromWs;
import com.htcf.service.SeaPatrolService;
import com.htcf.util.DateUtil;
import com.htcf.util.PageBeanS;
import com.htcf.util.StringUtil;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceException;
import java.io.*;
import java.util.*;

/**
 * 状态跟踪模块
 * @author by hj on 2018-3-1.
 */
@Controller("statusAction")
@Scope("prototype")
public class StatusTrackAction extends BaseAction{

    @Autowired
    private SeaPatrolService seawallPatrolService;

    /**
     * 分类：null:查询; 1:月报;2:季报;3:年报;4:查询;
     */
    private Integer classify;
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
     * 是否重新加载：null：不加载；1：重新加载
	 */
    private String reload;

    private String lb;


    /**
     * 从接口查询的海塘巡查信息集合
     */
    private List<SeawallPatrolFromWs> spfws;

    /**
     * 根据状态分类 -海塘巡查信息集合
     */
    private List<SeawallPatrolFromWs> spfwsf = new ArrayList<SeawallPatrolFromWs>(10);

    /**
     * 接口查询返回信息的集合
     */
    private List<SeawallPatrolFromWs> spList;


    /**
     * 从接口查询的海塘巡查信息
     */
    private SeawallPatrolFromWs spfw;

    /**
     * json
     */
    private JSONArray jsonArr;


    /**
     * 流程信息map
     */
    private Map<String, Object> flowMap;

    /**
     * x巡查项目统计Map
     */
    private Map<String,Object> xcXmtjMap = new HashMap<String, Object>(16);;

    private Map<String,Object> hyqytjMap = new HashMap<String, Object>(16);;

    private String hyqytjArr;

    private String xmtjArr;

    public String xmtjXz;

    /**
     * 下载的文件名
     */
    private String fileName;

    private String filePath;

    private final static String downloadPath="C:/hydg/download/";

    protected PageBeanS pageBeanS;
    /**
     * 通过websphere接口查询提防海塘信息
     */
    public String loadSeawallPatorlThroughWs(){
        // 你这是strust？嗯，传数据怎么传，不是需要一个

        System.out.println("接受类别"+lb);
        System.out.println("reload"+reload);

        if ( StringUtil.isBlank(type) ) {
            type = "1";
        }
        if ( StringUtil.isBlank(strBT) ) {
            strBT = DateUtil.dateToString(DateUtil.dateAddMon(new Date(), -1), "yyyy-MM-dd");
        }
        if ( StringUtil.isBlank(strET) ) {
            strET = DateUtil.dateToString(new Date(), "yyyy-MM-dd");
        }

        try {
            spList = seawallPatrolService.loadPatrol(strBT, strET, type);
            SeawallPatorlAction.spMap.put(getSessionUser().getId(), spList);

        } catch (WebServiceException e) {
            e.printStackTrace();
            System.out.println("webservice服务异常！");
            if("1".equals(lb)){
                return "ssjk";
            }if("2".equals(lb)){
                return "gjhf";
            }if("3".equals(lb)){
                return "xcqy";
            }if("4".equals(lb)){
                return "xxzt";
            }
        }

        ResettableStreamRequestWrapper reqWrapper = new ResettableStreamRequestWrapper(this.getHttpServletRequest());
        pageBeanS = processPageBeanS(reqWrapper);

        spfws = seawallPatrolService.pagePatrol1(getSessionUser().getId(), spfw, pageBeanS,lb);

        System.out.println("新的方法查询-=-=-=-");
        jsonArr = JSONArray.fromObject(spfws);
        System.out.println("输出jsonarr"+jsonArr);

        if("1".equals(lb)){
            return "ssjk";
        }if("2".equals(lb)){
            return "gjhf";
        }if("3".equals(lb)){
            return "xcqy";
        }if("4".equals(lb)) {
            return "xxzt";
        }
        return null;

    }

    /**
     * 根据任务号查询相关的流程信息
     */
    public void loadPatrolFlowsByEventsn(){
        //TODO 流程信息加载
//       /* SeawallPatrolFromWs spfw = new SeawallPatrolFromWs();
//        spfw.setSt_eventsn("XB0420180004");*/
        if (null != spfw) {
        	System.out.println(spfw.getSt_eventsn());
            flowMap = seawallPatrolService.loadFlowsByEventsn(spfw.getSt_eventsn());
        }
        try{
            JSONObject json = JSONObject.fromObject(flowMap);
            returnAjaxResult(json.toString());
            System.out.println("-========="+json.toString());
        }catch (Exception e){
            e.printStackTrace();
        }

    }


    /**
     * 通过接口查询巡查详细信息
     */
    public String loadSeawallPatorlInfoThroughWs(){

        pageBean = processPageBean(this.getHttpServletRequest());
        spfws = seawallPatrolService.pagePatrol(getSessionUser().getId(), spfw, pageBean);
        spfw = spfws.get(classify);
        JSONObject json1 = JSONObject.fromObject(spfw);
        System.out.println("json输出"+json1);
        return null;
    }

    /**
    *Description :巡查项目统计-主要统计的是
    *@param
    *@return
    *@author：hj
    *@Create 2018-4-27 11:04
    */
    public String xcXmtj(){
        //墙身
        int qsgs = 0;
        //墙后地坪
        int qhdp = 0;
        //通信设备
        int txsb = 0;
        //防汛通道或大堤堤顶
        int fxtd = 0;
        //涂鸦
        int ty = 0;
        //杂物、垃圾
        int lj = 0;
        //高杆植物
        int ggzw = 0;
        //堤防绿化
        int dflh = 0;
        //标志标牌
        int bzbp = 0;
        //潮(拍)门
        int cpm = 0;
        //其他
        int qt = 0;
        //限制行为
        int xzxw = 0;
        //禁止行为
        int jzxw = 0;
        //墙前护坡
        int qqhp= 0;
        //防汛闸门
        int fxzm = 0;
        //缺损、倒伏
        int qs = 0;
        //倾倒废液、废渣或者其他废弃物
        int qd = 0;
        //里程桩
        int lcz = 0;
        //沉陷
        int cx = 0;
        //搭建房屋、棚舍或者兴建墓穴
        int djfw = 0;
        //雨淋沟
        int ylg = 0;
        //外观形象
        int wgxx = 0;
        //格梗
        int gg = 0;

        if ( StringUtil.isBlank(type) ) {
            type = "0";
        }
        if ( StringUtil.isBlank(strBT) ) {
            strBT = DateUtil.dateToString(DateUtil.dateAddMon(new Date(), -1), "yyyy-MM-dd");
        }
        if ( StringUtil.isBlank(strET) ) {
            strET = DateUtil.dateToString(new Date(), "yyyy-MM-dd");
        }

        Date strBd = null;
        Date strEd = null;
        if ( null != classify ) {

            switch (classify) {
                case 2:
                    //月报
                    strBT = DateUtil.dateToString(new Date(), "yyyy") + "-" + strBT;
                    strBd = DateUtil.StringToUtilDate(strBT, "yyyy-MM-dd");
                    strEd = DateUtil.dateAddMon(strBd, 1);
                    strET = DateUtil.dateToString(strEd, "yyyy-MM-dd");
                    xcXmtjMap.put("text","各项目类型损坏的次数统计"+strBT+"至"+strET);
//                    xcXmtjMap
                    break;
                case 3:
                    //季报
                    strBT = DateUtil.dateToString(new Date(), "yyyy") + "-" + strBT;
                    strBd = DateUtil.StringToUtilDate(strBT, "yyyy-MM-dd");
                    strEd = DateUtil.dateAddMon(strBd, 3);
                    strET = DateUtil.dateToString(strEd, "yyyy-MM-dd");
                    xcXmtjMap.put("text","各项目类型损坏的次数统计"+strBT+"至"+strET);
                    break;
                case 4:
                    //年报
                    strBd = DateUtil.StringToUtilDate(strBT, "yyyy-MM-dd");
                    strEd = DateUtil.dateAddMon(strBd, 12);
                    strET = DateUtil.dateToString(strEd, "yyyy-MM-dd");
                    xcXmtjMap.put("text","各项目类型损坏的次数统计"+strBT+"至"+strET);
                    break;

                default:
                	 xcXmtjMap.put("text","各项目类型损坏的次数统计"+strBT+"至"+strET); 
                    break;
            }
        }
        System.out.println("type"+type);
        System.out.println("strBT"+strBT);
        System.out.println("strET"+strET);
        System.out.println("classify"+classify);
        List<SeawallPatrolFromWs> spList = seawallPatrolService.loadPatrol(strBT, strET, type);
        for(int i = 0; i< spList.size();i++){
        	
            System.out.println("个数："+spList.size());
            System.out.println("大类："+spList.get(i).getSt_ebclass());
            System.out.println("小类："+spList.get(i).getSt_esclass());

            if(("墙身").equals(spList.get(i).getSt_esclass())){
                qsgs = qsgs+ 1;
            } else if (("墙后地坪").equals(spList.get(i).getSt_esclass())){
                qhdp = qhdp+ 1;
            }else if (("通信设备").equals(spList.get(i).getSt_esclass())){
                txsb = txsb+1;
            }else if (("防汛通道或大堤堤顶").equals(spList.get(i).getSt_esclass())){
                fxtd = fxtd+1;
            }else if (("涂鸦").equals(spList.get(i).getSt_esclass())){
                ty = ty+1;
            }else if (("杂物、垃圾").equals(spList.get(i).getSt_esclass())){
                lj = lj+1;
            }else if(("高杆植物").equals(spList.get(i).getSt_esclass())){
                ggzw = ggzw +1;
            }else if (("堤防绿化").equals(spList.get(i).getSt_esclass())){
                dflh = dflh+1;
            }else if (("标志标牌").equals(spList.get(i).getSt_esclass())){
                bzbp = bzbp+1;
            }else if (("潮(拍)门").equals(spList.get(i).getSt_esclass())){
                cpm = cpm+1;
            }else if (("其他").equals(spList.get(i).getSt_esclass())){
                qt = qt+1;
            }else if (("限制行为").equals(spList.get(i).getSt_esclass())){
                xzxw = xzxw+1;
            }else if (("禁止行为").equals(spList.get(i).getSt_esclass())){
                jzxw = jzxw+1;
            }else if (("墙前护坡").equals(spList.get(i).getSt_esclass())){
                qqhp = qqhp+1;
            }else if (("防汛闸门").equals(spList.get(i).getSt_esclass())){
                fxzm = fxzm+1;
            }else if (("缺损、倒伏").equals(spList.get(i).getSt_esclass())){
                qs = qs+1;
            }else if (("倾倒废液、废渣或者其他废弃物").equals(spList.get(i).getSt_esclass())){
                qd = qd+1;
            } else if (("里程桩").equals(spList.get(i).getSt_esclass())){
                lcz = lcz+1;
            }else if (("沉陷").equals(spList.get(i).getSt_esclass())){
                cx = cx+1;
            }else if (("搭建房屋、棚舍或者兴建墓穴").equals(spList.get(i).getSt_esclass())){
                djfw = djfw+1;
            }else if (("雨淋沟").equals(spList.get(i).getSt_esclass())){
                ylg = ylg+1;
            }else if (("外观形象").equals(spList.get(i).getSt_esclass())){
                wgxx = wgxx+1;
            }else if (("格梗").equals(spList.get(i).getSt_esclass())){
                gg = gg+1;
            }
            System.out.println(qsgs);
            System.out.println(qhdp);
            System.out.println(txsb);
            System.out.println(fxtd);
            System.out.println(ty);
            System.out.println(lj);
            System.out.println("ggzw"+ggzw);
            System.out.println(dflh);
            System.out.println(bzbp);
            System.out.println(cpm);
            System.out.println(qt);
            System.out.println(xzxw);
            System.out.println(jzxw);
            List<Object> name = new ArrayList<Object>();
            List<Object> gs = new ArrayList<Object>();
            name.add("墙身");
            name.add("墙后地坪");
            name.add("通信设备");
            name.add("防汛通道或大堤堤顶");
            name.add("涂鸦");
            name.add("杂物、垃圾");
            name.add("高杆植物");
            name.add("堤防绿化");
            name.add("标志标牌");
            name.add("潮(拍)门");
            name.add("墙前护坡");
            name.add("防汛闸门");
            name.add("缺损、倒伏");
            name.add("倾倒废液、废渣或者其他废弃物");
            name.add("里程桩");
            name.add("沉陷");
            name.add("搭建房屋、棚舍或者兴建墓穴");
            name.add("雨淋沟");
            name.add("外观形象");
            name.add("格梗");
            name.add("其他");
            name.add("限制行为");
            name.add("禁止行为");

            gs.add(qsgs);
            gs.add(qhdp);
            gs.add(txsb);
            gs.add(fxtd);
            gs.add(ty);
            gs.add(lj);
            gs.add(ggzw);
            gs.add(dflh);
            gs.add(bzbp);
            gs.add(cpm);
            gs.add(qqhp);
            gs.add(fxzm);
            gs.add(qs);
            gs.add(qd);
            gs.add(lcz);
            gs.add(cx);
            gs.add(djfw);
            gs.add(ylg);
            gs.add(wgxx);
            gs.add(gg);
            gs.add(qt);
            gs.add(xzxw);
            gs.add(jzxw);
            xcXmtjMap.put("name",name);
            xcXmtjMap.put("gs",gs);
        }
        JSONObject jsonObject = JSONObject.fromObject(xcXmtjMap);
        xmtjArr = jsonObject.toString();
        System.out.println("-======-=-=-=-=-=-=-"+xmtjArr);
        if( null != classify ) {
            HttpServletResponse response=this.getHttpServletResponse();
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=null;
            try {
                out = response.getWriter();
                out.print(xmtjArr);
                out.flush();
                out.close();
            } catch (IOException ee) {
               ee.printStackTrace();
            }
        }

        return "xmtj";
    }

    public String downXmtj(){
        System.out.println("下载的arr"+xmtjXz);
        fileName="项目统计报表";
        return "downXmtjXz";
    }
    /**
    *Description :下载文件
    *@param
    *@return
    *@author：hj
    *@Create 2018-5-4 17:05
    */
    public InputStream getDownXmtjXz(){
        System.out.println("进入getDownXmtjXz.....");
        String path = null;
        System.out.println(fileName);
        Date strBd = null;
        Date strEd = null;
        if(null != classify){
            switch (classify) {
                case 1:
                    //查询
                    fileName = fileName + strBT+"至"+strET;
                    break;
                case 2:
                    //月报
                    strBT = DateUtil.dateToString(new Date(), "yyyy") + "-" + strBT;
                    fileName = fileName + strBT+"月份";
                    break;
                case 3:
                  //季报
                    String year = DateUtil.dateToString(new Date(),"yyyy");
                    if (("01-01").equals(strBT)){
                      fileName = fileName + year +"年第一季度";
                    }
                    if (("04-01").equals(strBT)){
                        fileName = fileName + year +"年第二季度";
                    }
                    if (("07-01").equals(strBT)){
                        fileName = fileName + year +"年第三季度";
                    }
                    if (("10-01").equals(strBT)){
                        fileName = fileName + year +"年第四季度";
                    }
                    break;
                case 4:
                    //年报
                    strBT = DateUtil.dateToString(new Date(),"yyyy");
                    fileName = fileName + strBT+"年";
                    break;

                default:
                    break;
            }
        }
        try {
            path = this.xmtjData(fileName,xmtjXz);
        } catch (RowsExceededException e1) {
            e1.printStackTrace();
        } catch (WriteException e1) {
            e1.printStackTrace();
        } catch (IOException e1) {
            e1.printStackTrace();
        }

        filePath = downloadPath+path;
        System.out.println("filePath="+filePath);
        FileInputStream fis =null;
        try {
            fis = new FileInputStream(filePath);
        } catch (FileNotFoundException e) {
            System.out.println("找不到该文件。");
            e.printStackTrace();
        }

        return fis;
    }

    /**
    *Description :下载文件数据
    *@param fileName 文件么名
    *@param xmtjXz 数据
    *@return file
    *@author：hj
    *@Create 2018-5-4 17:04
    */
    public String xmtjData(String fileName,String xmtjXz) throws IOException,RowsExceededException,WriteException{
        String path = downloadPath;
        File filePath = new File(path);
        if(!filePath.exists())  {
            filePath.mkdirs();
        }
        FileOutputStream fis = new FileOutputStream(path+File.separator+fileName+".xls");

        WritableWorkbook workbook = Workbook.createWorkbook(fis);
        WritableSheet sheet = workbook.createSheet(fileName,0);
        sheet.addCell(new Label(0,0,"序号"));
        sheet.addCell(new Label(1,0,"项目类别"));
        sheet.addCell(new Label(2,0,"损坏次数"));
        int k = 1;
        if(null != xmtjXz && !("").equals(xmtjXz)){
            JSONObject json = JSONObject.fromObject(xmtjXz);
            List name = json.getJSONArray("name");
            List gs = json.getJSONArray("gs");
            for(int i = 0; i < name.size() ;i++){
                jxl.write.Number number = new jxl.write.Number(0,i+1,k);
                sheet.addCell(number);
                try{
                   sheet.addCell(new Label(1,i+1,name.get(i).toString()));
                }catch (Exception e){
                    sheet.addCell(new Label(1,i+1,""));
                    System.out.println("第一列");
                }
                try{
                    sheet.addCell(new Label(2,i+1,gs.get(i).toString()));
                }catch (Exception e){
                    sheet.addCell(new Label(2,i+1,""));
                    System.out.println("第二列");
                }
                k++;
            }
        }
        workbook.write();
        workbook.close();
        return (fileName+".xls");

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
        String downloadChineseFileName = fileName+".xls";
        System.out.println("文件名："+ fileName+".xls");
        try {

            downloadChineseFileName = new String(downloadChineseFileName.getBytes(), "ISO8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return downloadChineseFileName;
    }

    /**
    *Description :海域区域统计
    *@param
    *@return String
    *@author：hj
    *@Create 2018-5-4 17:07
    */
    public String hyqytj () {

        if (StringUtil.isBlank(type)) {
            type = "0";
        }
        if (StringUtil.isBlank(strBT)) {
            strBT = DateUtil.dateToString(DateUtil.dateAddMon(new Date(), -1), "yyyy-MM-dd");
        }
        if (StringUtil.isBlank(strET)) {
            strET = DateUtil.dateToString(new Date(), "yyyy-MM-dd");
        }

        Date strBd = null;
        Date strEd = null;
        if ( null != classify ) {
            switch (classify) {
                case 2:
                    //月报
                    strBT = DateUtil.dateToString(new Date(), "yyyy") + "-" + strBT;
                    strBd = DateUtil.StringToUtilDate(strBT, "yyyy-MM-dd");
                    strEd = DateUtil.dateAddMon(strBd, 1);
                    strET = DateUtil.dateToString(strEd, "yyyy-MM-dd");
                    hyqytjMap.put("text", "区域巡查信息量统计分布图"+strBT+"至"+strET);
                    break;
                case 3:
                    //季报
                    strBT = DateUtil.dateToString(new Date(), "yyyy") + "-" + strBT;
                    strBd = DateUtil.StringToUtilDate(strBT, "yyyy-MM-dd");
                    strEd = DateUtil.dateAddMon(strBd, 3);
                    strET = DateUtil.dateToString(strEd, "yyyy-MM-dd");
                    hyqytjMap.put("text", "区域巡查信息量统计月对比图"+strBT+"至"+strET);
                    break;
                case 4:
                    //年报
                    strBd = DateUtil.StringToUtilDate(strBT, "yyyy-MM-dd");
                    strEd = DateUtil.dateAddMon(strBd, 12);
                    strET = DateUtil.dateToString(strEd, "yyyy-MM-dd");
                    hyqytjMap.put("text", "区域巡查信息量统计年对比图"+strBT+"至"+strET);
                    break;

                default:
                    break;
            }
        }


        List<String> dis = new ArrayList<String>();
        List<String> gs = new ArrayList<String>();
        Map<String,Object> sj = new HashMap<String, Object>(16);
        Map<String, List<Case>> caseMap = new HashMap<String, List<Case>>(16);
        try {
            caseMap = seawallPatrolService.loadCaseStatistics(strBT, strET, type);
        } catch (WebServiceException e) {
            e.printStackTrace();
            System.out.println("webservice服务异常！");
            return "statistic";
        }
        for (String key : caseMap.keySet()) {
            //获取统计结果
            List<Case> cases = caseMap.get(key);
            System.out.println(cases);
            for (int i = 0; i < cases.size(); i++) {
                System.out.println("-=-=-=-=-=-" + cases.get(i).getDist());
                dis.add(cases.get(i).getDist());
                gs.add(cases.get(i).getFx());
                sj.put("name",cases.get(i).getDist());
                sj.put("value",cases.get(i).getFx());
            }
        }

        hyqytjMap.put("sj",sj);
        hyqytjMap.put("name", dis);
        hyqytjMap.put("gs", gs);

        JSONObject jsonObject = JSONObject.fromObject(hyqytjMap);
        hyqytjArr = jsonObject.toString();
        System.out.println("-======-=-=-=-=-=-=-" + hyqytjArr);
        System.out.println(classify);
        if (null != classify) {
            HttpServletResponse response = this.getHttpServletResponse();
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = null;
            try {
                out = response.getWriter();
                out.print(hyqytjArr);
                out.flush();
                out.close();
            } catch (IOException ee) {
                ee.printStackTrace();
            }
        }
        return "hyqytj";
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

    private static class ResettableStreamRequestWrapper extends HttpServletRequestWrapper {


        public ResettableStreamRequestWrapper(HttpServletRequest request) {
            super(request);
        }

        @Override
        public Map getParameterMap(){

            Map map1 = this.getRequest().getParameterMap();
            if ( map1.containsKey("reload") ) {
                Map map2 = new HashMap(16);
                BeanUtils.copyProperties(map1, map2);
                map2.remove("reload");
                return map2;
            }
            return map1;
        }
    }




    public SeaPatrolService getSeawallPatrolService() {
        return seawallPatrolService;
    }

    public void setSeawallPatrolService(SeaPatrolService seawallPatrolService) {
        this.seawallPatrolService = seawallPatrolService;
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

    public String getReload() {
        return reload;
    }

    public void setReload(String reload) {
        this.reload = reload;
    }

    public Integer getClassify() {
        return classify;
    }

    public void setClassify(Integer classify) {
        this.classify = classify;
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



    public String getLb() {
        return lb;
    }

    public void setLb(String lb) {
        this.lb = lb;
    }

    public Map<String, Object> getFlowMap() {
        return flowMap;
    }

    public void setFlowMap(Map<String, Object> flowMap) {
        this.flowMap = flowMap;
    }

    public JSONArray getJsonArr() {
        return jsonArr;
    }

    public void setJsonArr(JSONArray jsonArr) {
        this.jsonArr = jsonArr;
    }

    public Map<String, Object> getXcXmtjMap() {
        return xcXmtjMap;
    }

    public void setXcXmtjMap(Map<String, Object> xcXmtjMap) {
        this.xcXmtjMap = xcXmtjMap;
    }

    public String getXmtjArr() {
        return xmtjArr;
    }

    public void setXmtjArr(String xmtjArr) {
        this.xmtjArr = xmtjArr;
    }

    public String getXmtjXz() {
        return xmtjXz;
    }

    public void setXmtjXz(String xmtjXz) {
        this.xmtjXz = xmtjXz;
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

    public static String getDownloadPath() {
        return downloadPath;
    }

    public Map<String, Object> getHyqytjMap() {
        return hyqytjMap;
    }

    public void setHyqytjMap(Map<String, Object> hyqytjMap) {
        this.hyqytjMap = hyqytjMap;
    }

    public List<SeawallPatrolFromWs> getSpfwsf() {
        return spfwsf;
    }

    public void setSpfwsf(List<SeawallPatrolFromWs> spfwsf) {
        this.spfwsf = spfwsf;
    }

    public String getHyqytjArr() {
        return hyqytjArr;
    }

    public void setHyqytjArr(String hyqytjArr) {
        this.hyqytjArr = hyqytjArr;
    }

    public List<SeawallPatrolFromWs> getSpList() {
        return spList;
    }

    public void setSpList(List<SeawallPatrolFromWs> spList) {
        this.spList = spList;
    }

    public PageBeanS getPageBeanS() {
        return pageBeanS;
    }

    public void setPageBeanS(PageBeanS pageBeanS) {
        this.pageBeanS = pageBeanS;
    }
}
