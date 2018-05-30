package com.htcf.action;

import com.alibaba.fastjson.JSON;
import com.htcf.entity.BoatRecord;
import com.htcf.entity.BoatStateAis;
import com.htcf.entity.BoatStatic;
import com.htcf.entity.Chuanbo;
import com.htcf.util.Base64Util;
import com.htcf.util.RequestUtil;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


/**
 * 船舶数据接入
 * Created by hj on 2017-9-27.
 * @author hj
 */
@Controller("aisAction")
@Scope("prototype")
public class AisAction extends BaseAction {

    /**
    船舶mmsi,cmd参数，拼接的mmsi，参数转码
     */
    private String mmsi;
    private String cmd;
    private String si;
    private String sicode;
    private String cmdlx =",";
    private String mmsid;
    /**
     * 区域实时位置查询参数，矩形（左下角，右上角坐标），圆形（圆心坐标，半径）
     */
    private String leftDown;
    private String rightTop;
    private String circleRadius;

    /**
     * 单船历史轨迹数据：开始时间，结束时间，压缩比
     */
    private String startDt;
    private String endDt;
    private String compress;

    private String receice;
    private List<Chuanbo> chuanbos;
    private List<BoatRecord> boatRecords;
    private List<BoatStateAis> boatStateAis;
    private List<BoatStatic> boatStaticList;




    /**
    	 * 
    	Description :AIS单船实时位置数据查询
    	@Author：hj
    	@Create 2017-10-9 10:27 
    	 */
    public String  oneRealtime(){
        if(!"".equals(mmsi)&& null!=mmsi){
            if(mmsi.contains(cmdlx)){
                si = "{mmsi:\""+mmsi+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                sicode = sicode.replaceAll("\\n", "");
                sicode = sicode.replaceAll("\\t", "");
                sicode = sicode.replaceAll("\\s", "");
                System.out.println("http://31.16.17.22:8099/?cmd=0x0104&param="+sicode);
                receice = RequestUtil.sendPost
                        ("http://31.16.17.22:8099/?cmd=0x0104&param="+sicode,"");
                System.out.println("多船实时位置获取到的信息"+receice);
                chuanbos = JSON.parseArray(receice, Chuanbo.class);
            }else{
                cmd = "0x0106";
                si = "{mmsi:\""+mmsi+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                receice = RequestUtil.sendGet
                        (String.format("http://31.16.17.22:8099/?cmd=%s&param=%s", cmd,sicode), "");
                System.out.println("单船实时位置获取到的信息"+receice);
                chuanbos = JSON.parseArray(receice, Chuanbo.class);
            }
        }
        return "cbswxx";
    }




    /**
    	 * 
    	Description :单（多）船船舶档案数据查询
    	@Author：hj
    	@Create 2017-10-12 16:56
    	 */
    public  String boatRecord(){
        System.out.println("船舶Mmsi"+mmsi);
        if(!"".equals(mmsi)&& null!=mmsi){
            if(mmsi.contains(cmdlx)){
                cmd = "0x0126";
                si = "{mmsi:\""+mmsi+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                sicode = sicode.replaceAll("\\n", "");
                sicode = sicode.replaceAll("\\t", "");
                sicode = sicode.replaceAll("\\s", "");
                receice = RequestUtil.sendGet
                        ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
                System.out.println("多船船档案数据获取到的信息"+receice);
                boatRecords = JSON.parseArray(receice,BoatRecord.class);
            }else{
                cmd = "0x0125";
                si = "{mmsi:\""+mmsi+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                receice = RequestUtil.sendGet
                        ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
                System.out.println("单船档案数据获取到的信息"+receice);
                boatRecords = JSON.parseArray(receice,BoatRecord.class);
            }
        }
        return "cbdaxx";
    }
    /**
    	 * 
    	Description :船舶AIS单船静态数据查询
    	@author：hj
    	@Create 2017-10-23 17:23 
    	 */
    public String aisStaticRecord(){
        System.out.println("静态数据船舶Mmsi"+mmsi);
        if(!"".equals(mmsi)&& null!=mmsi){
            if(mmsi.contains(cmdlx)){
                cmd = "0x0122";
                si = "{mmsi:\""+mmsi+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                sicode = sicode.replaceAll("\\n", "");
                sicode = sicode.replaceAll("\\t", "");
                sicode = sicode.replaceAll("\\s", "");
                receice = RequestUtil.sendGet
                        ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
                System.out.println("多船船静态数据获取到的信息"+receice);
                boatStaticList = JSON.parseArray(receice,BoatStatic.class);
            }else{
                cmd = "0x0121";
                si = "{mmsi:\""+mmsi+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                receice = RequestUtil.sendGet
                        ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
                System.out.println("单船静态数据获取到的信息"+receice);
                boatStaticList = JSON.parseArray(receice,BoatStatic.class);
            }
        }
        return "cbjtsj";
    }

    /**
    	 *
    	Description :船舶详情页面，包括静态数据，船舶档案数据
    	@return string
    	@author：hj
    	@Create 2017-11-2 14:55
    	 */
    public String fetchBoatxq(){
        System.out.println("船舶详情mmsi"+mmsid);
        String cmd1 = "0x0121";
        si = "{mmsi:\""+mmsid+"\"}";
        sicode = Base64Util.encode(si.getBytes());

        receice = RequestUtil.sendGet
                ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd1,sicode));
        System.out.println("单船静态数据获取到的信息"+receice);
        boatStaticList = JSON.parseArray(receice,BoatStatic.class);

        String cmd2 = "0x0125";
        sicode = Base64Util.encode(si.getBytes());
        receice = RequestUtil.sendGet
                ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd2,sicode));
        System.out.println("单船档案数据获取到的信息"+receice);
        boatRecords = JSON.parseArray(receice,BoatRecord.class);

        return "cbxq";
    }

    /**
    	 *
    	Description :获取船舶定位信息Json给Gis
    	@return string
    	@author：hj
    	@Create 2017-11-8 18:59
    	 */
    public String  shiPosition(){
        if(!"".equals(mmsi)&& null!=mmsi){
            if(mmsi.contains(cmdlx)){
                cmd = "0x0104";
                si = "{mmsi:\""+mmsi+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                sicode = sicode.replaceAll("\\n", "");
                sicode = sicode.replaceAll("\\t", "");
                sicode = sicode.replaceAll("\\s", "");
                receice = RequestUtil.sendGet
                        ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
                System.out.println("Json多船实时位置获取到的信息"+receice);
            }else{
                cmd = "0x0106";
                si = "{mmsi:\""+mmsi+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                receice = RequestUtil.sendGet
                        ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
                System.out.println("Json单船实时位置获取到的信息"+receice);
            }
        }
        HttpServletResponse re = this.getHttpServletResponse();
        re.setContentType("text/plain;charset=utf-8");
        PrintWriter out = null;
        try {
            out = re.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        JsonConfig config = new JsonConfig();
        // 自动为我排除circle
        config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray arr = JSONArray.fromObject(receice, config);
        System.out.println("输出json"+arr);
        if (out != null) {
            out.print(arr.toString());
        }
        try{
            out.flush();
        }catch (Exception e){
            e.printStackTrace();
        }

        return null;
    }

    /**
    	 *
    	Description :船舶档案信息Json给GIs
    	@return json
    	@author：hj
    	@Create 2017-11-8 19:08
    	 */
    public  String shipFile(){
        System.out.println("船舶Mmsi"+mmsi);
        if(!"".equals(mmsi)&& null!=mmsi){
            if(mmsi.contains(cmdlx)){
                cmd = "0x0126";
                si = "{mmsi:\""+mmsi+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                sicode = sicode.replaceAll("\\n", "");
                sicode = sicode.replaceAll("\\t", "");
                sicode = sicode.replaceAll("\\s", "");
                receice = RequestUtil.sendGet
                        ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
                System.out.println("Json多船船档案数据获取到的信息"+receice);
            }else{
                cmd = "0x0125";
                si = "{mmsi:\""+mmsi+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                receice = RequestUtil.sendGet
                        ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
                System.out.println("Json单船档案数据获取到的信息"+receice);
            }
        }
        HttpServletResponse re = this.getHttpServletResponse();
        re.setContentType("text/plain;charset=utf-8");
        PrintWriter out = null;
        try {
            out = re.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        JsonConfig config = new JsonConfig();
        // 自动为我排除circle
        config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray arr = JSONArray.fromObject(receice, config);
        System.out.println("输出json"+arr);
        out.print(arr.toString());
        out.flush();
        return null;
    }

    /**
    	 *
    	Description :船舶静态数据Json给GIS
    	@return string
    	@author：hj
    	@Create 2017-11-8 19:12
    	 */
    public  String aisStaticRecordGis() {
        System.out.println("静态数据船舶Mmsi"+mmsi);
        if(!"".equals(mmsi)&& null!=mmsi){
            if(mmsi.contains(cmdlx)){
                cmd = "0x0122";
                si = "{mmsi:\""+mmsi+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                sicode = sicode.replaceAll("\\n", "");
                sicode = sicode.replaceAll("\\t", "");
                sicode = sicode.replaceAll("\\s", "");
                receice = RequestUtil.sendGet
                        ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
                System.out.println("Json多船船静态数据获取到的信息"+receice);
            }else{
                cmd = "0x0121";
                si = "{mmsi:\""+mmsi+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                receice = RequestUtil.sendGet
                        ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
                System.out.println("Json单船静态数据获取到的信息"+receice);
            }
        }
        HttpServletResponse re = this.getHttpServletResponse();
        re.setContentType("text/plain;charset=utf-8");
        PrintWriter out = null;
        try {
            out = re.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        JsonConfig config = new JsonConfig();
        // 自动为我排除circle
        config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray arr = JSONArray.fromObject(receice, config);
        System.out.println("输出json"+arr);
        if (out != null) {
            out.print(arr.toString());
        }
        out.flush();
        return null;
    }

    /**
     *
     Description :区域实时位置信息Json给GIS
     @return json
     @author：hj
     @Create @Create 2017-11-9 14:12
     */

    public  String areaQuery() {
        System.out.println("单船区域实时位置参数左下角"+leftDown);
        System.out.println("单船区域实时位置参数右上角"+rightTop);
        System.out.println("单船区域实时位置参数圆心半径"+circleRadius);
        cmd = "0x5109";
        if(!"".equals(circleRadius) && null!=circleRadius){
                si = "{circle:\""+circleRadius+"\"}";
                sicode = Base64Util.encode(si.getBytes());
                sicode = sicode.replaceAll("\\n", "");
                sicode = sicode.replaceAll("\\t", "");
                sicode = sicode.replaceAll("\\s", "");

                receice = RequestUtil.sendGet
                        ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
                System.out.println("Json区域船舶实时位置获取到的信息(圆形)"+receice);
        }else {
            si = "{lb:\""+leftDown+"\",rt:\""+rightTop+"\"}";
            sicode = Base64Util.encode(si.getBytes());
            sicode = sicode.replaceAll("\\n", "");
            sicode = sicode.replaceAll("\\t", "");
            sicode = sicode.replaceAll("\\s", "");
            receice = RequestUtil.sendGet
                    ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
            System.out.println("Json区域船舶实时位置获取到的信息（矩形）"+receice);
        }
        HttpServletResponse re = this.getHttpServletResponse();
        re.setContentType("text/plain;charset=utf-8");
        PrintWriter out = null;
        try {
            out = re.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        JsonConfig config = new JsonConfig();
        // 自动为我排除circle
        config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray arr = JSONArray.fromObject(receice, config);
        System.out.println("输出json"+arr);
        if (out != null) {
            out.print(arr.toString());
            out.flush();
        }
        return null;
    }

    /**
    	 *
    	Description :单船历史轨迹数据信息Json给GIS
    	@return json
    	@author：hj
    	@Create 2017-11-9 14:09
    	 */
    public  String historyLocus() {
        System.out.println("船舶mmsi"+mmsi);

        System.out.println("起始时间"+startDt);
        System.out.println("结束时间"+endDt);
        System.out.println("压缩比"+compress);
        cmd = "0x0151";
        si = "{mmsi:\""+mmsi+"\",startdt:\"" + startDt + "\",enddt:\"" + endDt + "\",compress:\"" + compress + "\"}";
        sicode = Base64Util.encode(si.getBytes());
        sicode = sicode.replaceAll("\\n", "");
        sicode = sicode.replaceAll("\\t", "");
        sicode = sicode.replaceAll("\\s", "");
        receice = RequestUtil.sendGet
                ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
        System.out.println("Json单船历史轨迹信息"+receice);

        HttpServletResponse re = this.getHttpServletResponse();
        re.setContentType("text/plain;charset=utf-8");
        PrintWriter out = null;
        try {
            out = re.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        JsonConfig config = new JsonConfig();
        // 自动为我排除circle
        config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray arr = JSONArray.fromObject(receice, config);
        System.out.println("输出json"+arr);
        if (out != null) {
            out.print(arr.toString());
            out.flush();

        }
        return null;
    }

    public  String historyArea() {
        System.out.println("船舶mmsi"+mmsi);

        startDt = "1516671988";
        endDt ="1517363188";
        compress = "5";
        System.out.println("起始时间"+startDt);
        System.out.println("结束时间"+endDt);
        System.out.println("压缩比"+compress);
        String circle = "117.72,38.99,5";
        cmd = "0x011a";
        si = "{startdt:\"" + startDt + "\",enddt:\"" + endDt + "\",circle:\"" + circle + "\",compress:\"" + compress + "\"}";
        sicode = Base64Util.encode(si.getBytes());
        sicode = sicode.replaceAll("\\n", "");
        sicode = sicode.replaceAll("\\t", "");
        sicode = sicode.replaceAll("\\s", "");
        receice = RequestUtil.sendGet
                ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
        System.out.println("Json区域历史轨迹信息"+receice);

        HttpServletResponse re = this.getHttpServletResponse();
        re.setContentType("text/plain;charset=utf-8");
        PrintWriter out = null;
        try {
            out = re.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        JsonConfig config = new JsonConfig();
        // 自动为我排除circle
        config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
        JSONArray arr = JSONArray.fromObject(receice, config);
        System.out.println("输出json"+arr);
        if (out != null) {
            out.print(arr.toString());
            out.flush();

        }
        return null;
    }


    public static void main(String[] args) {
        String response = "[{\"type\":\"18\",\"forward\":\"0\",\"mmsi\":\"000000005\",\"sog\":\"44\",\"posacur\":\"0\",\"longitude\":\"108.315263\",\"latitude\":\"21.56135\",\"cog\":\"832\",\"thead\":\"511\",\"utctime\":\"45\",\"raim\":\"0\",\"receivetime\":\"1507675928884\",\"devicemark\":\"1\",\"dispmark\":\"1\",\"dscmark\":\"0\",\"bandmark\":\"1\",\"msg22mark\":\"1\",\"patternmark\":\"0\"},{\"type\":\"18\",\"forward\":\"0\",\"mmsi\":\"000000006\",\"sog\":\"33\",\"posacur\":\"1\",\"longitude\":\"122.04164\",\"latitude\":\"29.314727\",\"cog\":\"400\",\"thead\":\"511\",\"utctime\":\"55\",\"raim\":\"0\",\"receivetime\":\"1507690161383\",\"devicemark\":\"0\",\"dispmark\":\"1\",\"dscmark\":\"0\",\"bandmark\":\"1\",\"msg22mark\":\"0\",\"patternmark\":\"0\"}]\n";
        List<Chuanbo> chuanbos = JSON.parseArray(response, Chuanbo.class);
        System.out.println(chuanbos);

    }




    public String getMmsi() {
        return mmsi;
    }

    public void setMmsi(String mmsi) {
        this.mmsi = mmsi;
    }

    public String getReceice() {
        return receice;
    }

    public void setReceice(String receice) {
        this.receice = receice;
    }

    public List<Chuanbo> getChuanbos() {
        return chuanbos;
    }

    public void setChuanbos(List<Chuanbo> chuanbos) {
        this.chuanbos = chuanbos;
    }

    public List<BoatRecord> getBoatRecords() {
        return boatRecords;
    }

    public void setBoatRecords(List<BoatRecord> boatRecords) {
        this.boatRecords = boatRecords;
    }

    public List<BoatStateAis> getBoatStateAis() {
        return boatStateAis;
    }

    public void setBoatStateAis(List<BoatStateAis> boatStateAis) {
        this.boatStateAis = boatStateAis;
    }

    public String getCmd() {
        return cmd;
    }

    public void setCmd(String cmd) {
        this.cmd = cmd;
    }

    public String getSicode() {
        return sicode;
    }

    public void setSicode(String sicode) {
        this.sicode = sicode;
    }

    public String getSi() {
        return si;
    }

    public void setSi(String si) {
        this.si = si;
    }

    public String getCmdlx() {
        return cmdlx;
    }

    public void setCmdlx(String cmdlx) {
        this.cmdlx = cmdlx;
    }

    public List<BoatStatic> getBoatStaticList() {
        return boatStaticList;
    }

    public void setBoatStaticList(List<BoatStatic> boatStaticList) {
        this.boatStaticList = boatStaticList;
    }

    public String getMmsid() {
        return mmsid;
    }

    public void setMmsid(String mmsid) {
        this.mmsid = mmsid;
    }

    public String getLeftDown() {
        return leftDown;
    }

    public void setLeftDown(String leftDown) {
        this.leftDown = leftDown;
    }

    public String getRightTop() {
        return rightTop;
    }

    public void setRightTop(String rightTop) {
        this.rightTop = rightTop;
    }

    public String getCircleRadius() {
        return circleRadius;
    }

    public void setCircleRadius(String circleRadius) {
        this.circleRadius = circleRadius;
    }

    public String getStartDt() {
        return startDt;
    }

    public void setStartDt(String startDt) {
        this.startDt = startDt;
    }

    public String getEndDt() {
        return endDt;
    }

    public void setEndDt(String endDt) {
        this.endDt = endDt;
    }

    public String getCompress() {
        return compress;
    }

    public void setCompress(String compress) {
        this.compress = compress;
    }
}
