package com.htcf.action;

import com.alibaba.fastjson.JSON;
import com.htcf.entity.*;
import com.htcf.service.HdgxDbldxxService;
import com.htcf.service.IBusinessService;
import com.htcf.service.PipelineSafetyService;
import com.htcf.util.Base64Util;
import com.htcf.util.DateUtil;
import com.htcf.util.RequestUtil;
import com.htcf.util.StringUtil;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

/**
 * 海底管线安全
 * @author by hj on 2017-12-14.
 */
@Controller("pipelinesafetyAction")
@Scope("prototype")
public class PipelineSafetyAction extends BaseAction {

    @Autowired
    private PipelineSafetyService safetyService;

    @Autowired
    private IBusinessService  businessService;

    @Autowired
    private HdgxDbldxxService dbldxxService;

    private String leftDown;
    private String rightTop;
    private String cmd;
    private String si;
    private String sicode;
    private String receice;
    private String mmsid;

    /**
     * 统计开始时间-年
     */
    private String beginTimeY;

    /**
     * 统计结束时间-年
     */
    private String endTimeY;

    /**
     * 统计开始时间-月
     */
    private String beginTimeM;

    /**
     * 统计结束时间-月
     */
    private String endTimeM;

    /**D
     * 统计开始时间-日
     */
    private String beginTimeD;

    /**
     * 统计结束时间-日
     */
    private String endTimeYD;

    /**
     * 违规船舶集合
     */
    private List<ThysyywWgcbEntity> wgcbList;

    private List<ThdgxGxyjtjEntity> gxyjtjEntities;

    /**
     * 违规船舶信息
     */
    private ThysyywWgcbEntity wgcbEntity;

    private ThdgxGxyjtjEntity gxyjtjEntity;

    /**
     * 船舶静态数据
     */
    private List<BoatStatic> boatStaticList;

    /**
     * 船舶档案数据
     */
    private List<BoatRecord> boatRecords;

    /**
     * 地波雷达实体
     */
    private HdgxDbldxxEntity dbldxxEntity;

    /**
     * 统计获取的数组
     */
    private List<Object[]> bjlyList;
    private List<Object[]> gxmcList;

    /**
     * 图表展示Map
     */
    private Map<String,Object> bjlyMap = new HashMap<String, Object>(16);
    private Map<String,Object> gxmcMap= new HashMap<String, Object>(16);
    private String bjlyarr;
    private String gxmcarr;

    /**
     * 下载
     */
    private String fileName;
    private String filePath;
    /**
     * 下载文件原始存放路径
     */
    private final static String downloadPath="C:/hydg/download/";
    private String tjsjType;

    /**
     * 展示船舶位置的经纬度
     */
    private String dtjd;
    private String dtwd;



    public  String areaQuery() {
        leftDown = "127.82632815,28.5618139";
        rightTop = "121.0870224,32.0753904";
        System.out.println("单船区域实时位置参数左下角"+leftDown);
        System.out.println("单船区域实时位置参数右上角"+rightTop);
        cmd = "0x5109";
        si = "{lb:\""+leftDown+"\",rt:\""+rightTop+"\"}";
        sicode = Base64Util.encode(si.getBytes());
        sicode = sicode.replaceAll("\\n", "");
        sicode = sicode.replaceAll("\\t", "");
        sicode = sicode.replaceAll("\\s", "");
        receice = RequestUtil.sendGet
                ("http://31.16.17.22:8099/?", String.format("cmd=%s&param=%s", cmd,sicode));
        System.out.println("Json区域船舶实时位置获取到的信息（矩形）"+receice);

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
    	Description :保存违规记录的船舶信息
    	@author：hj
    	@Create 2017-12-18 16:24
    	 */
    public void saveWgcb(){
        try{
            System.out.println("保存前");
            String xzsj = this.getDateTime();
            wgcbEntity.setAddtime(xzsj);
            safetyService.saveWgcbInfo(wgcbEntity);
            System.out.println("保存后");
        }catch (Exception e){
            System.out.println("保存失败");
            e.printStackTrace();
        }
    }

    /**
    	 *
    	Description :违规船舶查询

    	@return 查询页面
    	@author：hj
    	@Create 2017-12-21 15:28
    	 */
    public String fetchWgcb(){
        HttpServletRequest request= this.getHttpServletRequest();
        pageBean=this.processPageBean(request);
        pageBean.setPageRecord(10);
        wgcbList = safetyService.fetchWgcb(wgcbEntity,pageBean);
        return "znyjJsp";

    }

    /**
    	 *
    	Description :删除违规船舶
        @return true false
    	@author：hj
    	@Create 2017-12-25 10:17
    	 */
    public void removeWgcb(){
        String result = "0";
        if (this.safetyService.removeWgcbId(this.wgcbEntity)) {
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
    	Description :船舶详情页面，包括静态数据，船舶档案数据--船舶预警
    	@param
    	@return
    	@author：hj
    	@Create 2017-12-25 10:45
    	 */
    public String fetchBoatxq(){
        System.out.println("预警船舶详情mmsi"+mmsid);
        System.out.println("预警船舶经度"+dtjd);
        System.out.println("预警船舶维度"+dtwd);
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

        return "yjcbxq";
    }

    /**
    	 *
    	Description :更新海缆预警条件信息
    	@author：hj
    	@Create 2018-1-2 17:21
    	 */
    public void updateYjtj(){
        try{
            System.out.println("更新前");
            String xzsj = this.getDateTime();
            gxyjtjEntity.setUpdateuserid(this.getSessionUser().getId());
            gxyjtjEntity.setUpdateuser(this.getSessionUser().getName());
            gxyjtjEntity.setUpdatetime(xzsj);
            businessService.updateObject(gxyjtjEntity);
            System.out.println("更新后");
        }catch (Exception e){
            System.out.println("更新失败");
            e.printStackTrace();
        }
    }

    /**
    	 *
    	Description :查询所有海缆的预警条件
    	@author：hj
    	@Create 2018-1-2 19:27
    	 */
    public void fetchGxyjtj(){
        System.out.println("开始查询");
        gxyjtjEntities = safetyService.fetchYjtj(gxyjtjEntity);
        Map<String,List<ThdgxGxyjtjEntity>> map = new HashMap<String, List<ThdgxGxyjtjEntity>>(16);
        map.put("gxyjtjEntities",gxyjtjEntities);

        Object json =JSON.toJSON(map);
        System.out.println("json"+json);

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

    /**
    	 *
    	Description :根据ID查询地波雷达详情-预警模块中的返回的页面
    	@param
    	@return
    	@author：hj
    	@Create 2018-1-22 11:23
    	 */
    public String fetchDbldDetaile(){
        dbldxxEntity = dbldxxService.fetchDbldxxDetailById(dbldxxEntity);
        return "aqdbldxq";
    }

    /**
    	 *
    	Description :根据年统计
    	@return
    	@author：hj
    	@Create 2018-1-22 11:35
    	 */
    public String yjtjYear(){
        System.out.println("查询年份"+beginTimeY);
        if(StringUtil.isBlank(beginTimeY)){
            beginTimeY = DateUtil.dateToString(new Date(),"yyyy");
        }
        System.out.println("查询年份赋值"+beginTimeY);
        List<Object> name = new ArrayList<Object>();
        List<Object> gs = new ArrayList<Object>();
        List<Object> namegx = new ArrayList<Object>();
        List<Object> gsgx = new ArrayList<Object>();
        Integer strBd =null;
        if(StringUtil.isNotBlank(beginTimeY)){
             strBd = Integer.valueOf(beginTimeY) + 1;
             endTimeY = String.valueOf(strBd);
        }
        System.out.println("开始年份"+beginTimeY);
        System.out.println("结束年份"+endTimeY);
        this.bjlyList = safetyService.tjBjly(beginTimeY,endTimeY);
        this.gxmcList = safetyService.tjGxmc(beginTimeY,endTimeY);
        if(null != bjlyList){
            System.out.println("size"+bjlyList.size());
            for (int i = 0 ;i < bjlyList.size();i++){
                System.out.println("----================"+bjlyList.get(i)[0]);
                System.out.println("----================"+bjlyList.get(i)[1]);
                name.add(bjlyList.get(i)[0]);
                gs.add(bjlyList.get(i)[1]);
            }
            bjlyMap.put("text","预警来源汇总统计"+beginTimeY+"至"+endTimeY);
            bjlyMap.put("subtext","预警来源汇总统计");
            bjlyMap.put("name",name);
            bjlyMap.put("gs",gs);
        }
        bjlyarr = JSON.toJSONString(bjlyMap);
        System.out.println("bjarr"+bjlyarr);

        if(null != gxmcList){
            System.out.println("size"+gxmcList.size());
            for (int i = 0 ;i < gxmcList.size();i++){
                System.out.println("----================"+gxmcList.get(i)[0]);
                System.out.println("----================"+gxmcList.get(i)[1]);
                namegx.add(gxmcList.get(i)[0]);
                gsgx.add(gxmcList.get(i)[1]);
            }
            gxmcMap.put("text","管线名称汇总统计"+beginTimeY+"至"+endTimeY);
            gxmcMap.put("subtext","管线名称汇总统计");
            gxmcMap.put("name",namegx);
            gxmcMap.put("gs",gsgx);
        }
        gxmcarr = JSON.toJSONString(gxmcMap);
        System.out.println("gxmcarr"+gxmcarr);

        return "yjtjYear";
    }

    /**
    	 *
    	Description :按月分查询统计
    	@return Json
    	@author：hj
    	@Create 2018-1-29 11:44
    	 */
    public String yjtjMonth(){
        System.out.println("查询月份"+beginTimeM);
        List<Object> name = new ArrayList<Object>();
        List<Object> gs = new ArrayList<Object>();
        List<Object> namegx = new ArrayList<Object>();
        List<Object> gsgx = new ArrayList<Object>();
        System.out.println("开始月份"+beginTimeM);
        System.out.println("结束月份"+endTimeM);
       /* if(StringUtil.isBlank(beginTimeM)){
            beginTimeM = DateUtil.dateToString(DateUtil.dateAddMon(new Date(),-1),"yyyy-MM");
            endTimeM = DateUtil.dateToString(new Date(),"yyyy-MM");
        }*/
        this.bjlyList = safetyService.tjBjly(beginTimeM,endTimeM);
        this.gxmcList = safetyService.tjGxmc(beginTimeM,endTimeM);
        if(null != bjlyList){
            System.out.println("size"+bjlyList.size());
            for (int i = 0 ;i < bjlyList.size();i++){
                System.out.println("----================"+bjlyList.get(i)[0]);
                System.out.println("----================"+bjlyList.get(i)[1]);
                name.add(bjlyList.get(i)[0]);
                gs.add(bjlyList.get(i)[1]);

            }
            bjlyMap.put("text","预警来源汇总统计"+beginTimeM+"至"+endTimeM);
            bjlyMap.put("subtext","预警来源汇总统计");
            bjlyMap.put("name",name);
            bjlyMap.put("gs",gs);
        }
        bjlyarr = JSON.toJSONString(bjlyMap);
        System.out.println("bjarr"+bjlyarr);

        if(null != gxmcList){
            System.out.println("size"+gxmcList.size());
            for (int i = 0 ;i < gxmcList.size();i++){
                System.out.println("----================"+gxmcList.get(i)[0]);
                System.out.println("----================"+gxmcList.get(i)[1]);
                namegx.add(gxmcList.get(i)[0]);
                gsgx.add(gxmcList.get(i)[1]);

            }
            gxmcMap.put("text","管线名称汇总统计"+beginTimeM+"至"+endTimeM);
            gxmcMap.put("subtext","管线名称汇总统计");
            gxmcMap.put("name",namegx);
            gxmcMap.put("gs",gsgx);
        }
        gxmcarr = JSON.toJSONString(gxmcMap);
        System.out.println("gxmcarr"+gxmcarr);

        return "yjtjMonth";
    }

    /**
    	 *
    	Description :按日期
    	@return Json
    	@author：hj
    	@Create 2018-1-29 11:44
    	 */
    public String yjtjDay(){
        System.out.println("查询日期"+beginTimeD);
        List<Object> name = new ArrayList<Object>();
        List<Object> gs = new ArrayList<Object>();
        List<Object> namegx = new ArrayList<Object>();
        List<Object> gsgx = new ArrayList<Object>();
       /* if(beginTimeD == null ){
            Date days = new Date();
            Date strEd = DateUtil.dateAddDay(days,1);
            System.out.println("加1的日期"+strEd);
            beginTimeD = DateUtil.dateToString(days,"yyyy-MM-dd");
            endTimeYD = DateUtil.dateToString(strEd,"yyyy-MM-dd");
        }*/
      /* if(StringUtil.isBlank(beginTimeD)){
           beginTimeD = DateUtil.dateToString(DateUtil.dateAddDay(new Date(),-1),"yyyy-MM-dd");
           endTimeYD = DateUtil.dateToString(new Date(),"yyyy-MM-dd");
       }*/
        System.out.println("开始日期 "+beginTimeD);
        System.out.println("结束日期"+endTimeYD);
        this.bjlyList = safetyService.tjBjly(beginTimeD,endTimeYD);
        this.gxmcList = safetyService.tjGxmc(beginTimeD,endTimeYD);
        if(null != bjlyList){
            System.out.println("size"+bjlyList.size());
            for (int i = 0 ;i < bjlyList.size();i++){
                System.out.println("----================"+bjlyList.get(i)[0]);
                System.out.println("----================"+bjlyList.get(i)[1]);
                name.add(bjlyList.get(i)[0]);
                gs.add(bjlyList.get(i)[1]);

            }
            bjlyMap.put("text","预警来源汇总统计"+beginTimeD+"至"+endTimeYD);
            bjlyMap.put("subtext","预警来源统计");
            bjlyMap.put("name",name);
            bjlyMap.put("gs",gs);
        }
        bjlyarr = JSON.toJSONString(bjlyMap);
        System.out.println("bjarr"+bjlyarr);

        if(null != gxmcList){
            System.out.println("size"+gxmcList.size());
            for (int i = 0 ;i < gxmcList.size();i++){
                System.out.println("----================"+gxmcList.get(i)[0]);
                System.out.println("----================"+gxmcList.get(i)[1]);
                namegx.add(gxmcList.get(i)[0]);
                gsgx.add(gxmcList.get(i)[1]);

            }
            gxmcMap.put("text","管线名称汇总统计"+beginTimeD+"至"+endTimeYD);
            gxmcMap.put("subtext","管线名称汇总统计");
            gxmcMap.put("name",namegx);
            gxmcMap.put("gs",gsgx);
        }
        gxmcarr = JSON.toJSONString(gxmcMap);
        System.out.println("gxmcarr"+gxmcarr);

        return "yjtjDay";
    }

    /**
    	 *
    	Description :下载年报表
    	@param
    	@return
    	@author：hj
    	@Create 2018-1-29 11:59
    	 */
    public String downLoadYearData(){
        System.out.println("fileName="+fileName);

        return "downLoadYearData";
    }
    public InputStream getDownLoadFileYearData(){
        System.out.println("进入getDownloadFile.....");
        if(beginTimeY != null && !"".equals(beginTimeY)){

        }else{
            beginTimeY = this.getYear();
        }
        Integer strBd =null;
        if(StringUtil.isNotBlank(beginTimeY)){
            strBd = Integer.valueOf(beginTimeY) + 1;
            endTimeY = String.valueOf(strBd);
        }
       /* this.bjlyList = safetyService.tjBjly(beginTimeY,endTimeY);
        this.gxmcList = safetyService.tjGxmc(beginTimeY,endTimeY);*/
        fileName="预警船舶统计-"+""+beginTimeY+"年报";
        System.out.println("开始年份"+beginTimeY);
        System.out.println("结束年份"+endTimeY);
        List<Object[]> tjList = (List<Object[]>) safetyService.tjGxmc(beginTimeY, endTimeY);
        String path = null;
        try {
            path = this.tableData(fileName,tjList);
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
    	 *
    	Description :按月统计
    	@return
    	@author：hj
    	@Create 2018-1-29 16:41
    	 */
    public String downLoadMonthData(){
        System.out.println("月fileName="+fileName);

        return "downLoadMonthData";
    }
    public InputStream getDownLoadFileMonthData(){
        System.out.println("进入getDownloadFile.....");

        fileName="预警船舶统计-"+""+beginTimeM+"月报";
        System.out.println("开始月份"+beginTimeM);
        System.out.println("结束月份"+endTimeM);
        List<Object[]> tjList = (List<Object[]>) safetyService.tjGxmc(beginTimeM, endTimeM);
        String path = null;
        try {
            path = this.tableData(fileName,tjList);
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
     *
     Description :按日期统计
     @return
     @author：hj
     @Create 2018-1-29 16:41
     */
    public String downLoadDayData(){
        System.out.println("fileName="+fileName);

        return "downLoadDayData";
    }
    public InputStream getDownLoadFileDayData(){
        System.out.println("进入getDownloadFile.....");

        fileName="预警船舶统计-"+""+beginTimeD+"日";
        System.out.println("开始日期"+beginTimeD);
        System.out.println("结束日期"+endTimeYD);
        List<Object[]> tjList = (List<Object[]>) safetyService.tjGxmc(beginTimeD, endTimeYD);
        String path = null;
        try {
            path = this.tableData(fileName,tjList);
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

    public String tableData(String fileName,List<Object[]> dataList) throws IOException, RowsExceededException, WriteException{
        String path = downloadPath;
        File filePath = new File(path);
        if(!filePath.exists()) {
            filePath.mkdirs();
        }
        FileOutputStream fis = new FileOutputStream(path+File.separator+fileName+".xls");

        System.out.println("dataList:"+dataList);
        WritableWorkbook book = Workbook.createWorkbook(fis);
        WritableSheet sheet = book.createSheet(fileName, 0);
        //数据项表导出
        sheet.addCell(new Label(0,0,fileName));
        sheet.addCell(new Label(0,1,"序号"));
        sheet.addCell(new Label(1,1,"管线名称"));
        sheet.addCell(new Label(2,1,"预警船舶数量"));

        int k =1;
        if(dataList!=null && !"".equals(dataList)){
            for(int i=0;i<dataList.size();i++){
                jxl.write.Number number = new jxl.write.Number(0, i+2, k);
                sheet.addCell(number);
                try{
                    sheet.addCell(new Label(1,i+2,dataList.get(i)[0].toString()));
                }catch(Exception e){
                    sheet.addCell(new Label(1,i+2,""));
                    System.out.println("1");
                }
                try{
                    sheet.addCell(new Label(2,i+2,dataList.get(i)[1].toString()));
                }catch(Exception e){
                    sheet.addCell(new Label(2,i+2,""));
                    System.out.println("2");
                }
                k++;
            }
        }
        book.write();
        book.close();
        return (fileName+".xls");
    }



    public static void main(String[] args) {
        String j =
                "[{\"id\":3,\"unit\":\"米\",\"distance\":\"500\",\"updatetime\":\"2018-01-02\",\"piplinename\":\"海缆3号\",\"piplineid\":102,\"soglevel\":\"二级\",\"updateuser\":\"huangjian\"},{\"id\":2,\"unit\":\"米\",\"distance\":\"500\",\"updatetime\":\"2018-01-01\",\"piplinename\":\"海缆1号\",\"piplineid\":102,\"soglevel\":\"二级\",\"updateuser\":\"huangjian\"},{\"id\":1,\"unit\":\"米\",\"distance\":\"500\",\"updatetime\":\"2017-12-31\",\"piplinename\":\"海缆2号\",\"piplineid\":102,\"soglevel\":\"二级\",\"updateuser\":\"huangjian\"}]";
        List<ThdgxGxyjtjEntity> chuanbos = JSON.parseArray(j, ThdgxGxyjtjEntity.class);
        System.out.println(chuanbos);
        String s = "2018";
        Integer d = Integer.parseInt(s) + 1;
        String m = String.valueOf(d);
        System.out.println(m);

    }













    /**
     set、get
     */
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

    public String getCmd() {
        return cmd;
    }

    public void setCmd(String cmd) {
        this.cmd = cmd;
    }

    public String getSi() {
        return si;
    }

    public void setSi(String si) {
        this.si = si;
    }

    public String getSicode() {
        return sicode;
    }

    public void setSicode(String sicode) {
        this.sicode = sicode;
    }

    public String getReceice() {
        return receice;
    }

    public void setReceice(String receice) {
        this.receice = receice;
    }

    public ThysyywWgcbEntity getWgcbEntity() {
        return wgcbEntity;
    }

    public void setWgcbEntity(ThysyywWgcbEntity wgcbEntity) {
        this.wgcbEntity = wgcbEntity;
    }

    public PipelineSafetyService getSafetyService() {
        return safetyService;
    }

    public void setSafetyService(PipelineSafetyService safetyService) {
        this.safetyService = safetyService;
    }

    public IBusinessService getBusinessService() {
        return businessService;
    }

    public void setBusinessService(IBusinessService businessService) {
        this.businessService = businessService;
    }

    public List<ThysyywWgcbEntity> getWgcbList() {
        return wgcbList;
    }

    public void setWgcbList(List<ThysyywWgcbEntity> wgcbList) {
        this.wgcbList = wgcbList;
    }

    public String getMmsid() {
        return mmsid;
    }

    public void setMmsid(String mmsid) {
        this.mmsid = mmsid;
    }

    public List<BoatStatic> getBoatStaticList() {
        return boatStaticList;
    }

    public void setBoatStaticList(List<BoatStatic> boatStaticList) {
        this.boatStaticList = boatStaticList;
    }

    public List<BoatRecord> getBoatRecords() {
        return boatRecords;
    }

    public void setBoatRecords(List<BoatRecord> boatRecords) {
        this.boatRecords = boatRecords;
    }

    public ThdgxGxyjtjEntity getGxyjtjEntity() {
        return gxyjtjEntity;
    }

    public void setGxyjtjEntity(ThdgxGxyjtjEntity gxyjtjEntity) {
        this.gxyjtjEntity = gxyjtjEntity;
    }

    public List<ThdgxGxyjtjEntity> getGxyjtjEntities() {
        return gxyjtjEntities;
    }

    public void setGxyjtjEntities(List<ThdgxGxyjtjEntity> gxyjtjEntities) {
        this.gxyjtjEntities = gxyjtjEntities;
    }

    public HdgxDbldxxEntity getDbldxxEntity() {
        return dbldxxEntity;
    }

    public void setDbldxxEntity(HdgxDbldxxEntity dbldxxEntity) {
        this.dbldxxEntity = dbldxxEntity;
    }

    public HdgxDbldxxService getDbldxxService() {
        return dbldxxService;
    }

    public void setDbldxxService(HdgxDbldxxService dbldxxService) {
        this.dbldxxService = dbldxxService;
    }


    public List<Object[]> getBjlyList() {
        return bjlyList;
    }

    public void setBjlyList(List<Object[]> bjlyList) {
        this.bjlyList = bjlyList;
    }

    public List<Object[]> getGxmcList() {
        return gxmcList;
    }

    public void setGxmcList(List<Object[]> gxmcList) {
        this.gxmcList = gxmcList;
    }

    public Map<String, Object> getBjlyMap() {
        return bjlyMap;
    }

    public void setBjlyMap(Map<String, Object> bjlyMap) {
        this.bjlyMap = bjlyMap;
    }

    public Map<String, Object> getGxmcMap() {
        return gxmcMap;
    }

    public void setGxmcMap(Map<String, Object> gxmcMap) {
        this.gxmcMap = gxmcMap;
    }

    public String getBjlyarr() {
        return bjlyarr;
    }

    public void setBjlyarr(String bjlyarr) {
        this.bjlyarr = bjlyarr;
    }

    public String getGxmcarr() {
        return gxmcarr;
    }

    public void setGxmcarr(String gxmcarr) {
        this.gxmcarr = gxmcarr;
    }

    public String getBeginTimeY() {
        return beginTimeY;
    }

    public void setBeginTimeY(String beginTimeY) {
        this.beginTimeY = beginTimeY;
    }

    public String getEndTimeY() {
        return endTimeY;
    }

    public void setEndTimeY(String endTimeY) {
        this.endTimeY = endTimeY;
    }

    public String getBeginTimeM() {
        return beginTimeM;
    }

    public void setBeginTimeM(String beginTimeM) {
        this.beginTimeM = beginTimeM;
    }

    public String getEndTimeM() {
        return endTimeM;
    }

    public void setEndTimeM(String endTimeM) {
        this.endTimeM = endTimeM;
    }

    public String getBeginTimeD() {
        return beginTimeD;
    }

    public void setBeginTimeD(String beginTimeD) {
        this.beginTimeD = beginTimeD;
    }

    public String getEndTimeYD() {
        return endTimeYD;
    }

    public void setEndTimeYD(String endTimeYD) {
        this.endTimeYD = endTimeYD;
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

    public String getTjsjType() {
        return tjsjType;
    }

    public void setTjsjType(String tjsjType) {
        this.tjsjType = tjsjType;
    }

    public String getDtjd() {
        return dtjd;
    }

    public void setDtjd(String dtjd) {
        this.dtjd = dtjd;
    }

    public String getDtwd() {
        return dtwd;
    }

    public void setDtwd(String dtwd) {
        this.dtwd = dtwd;
    }
}
