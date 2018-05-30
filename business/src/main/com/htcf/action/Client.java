package com.htcf.action;


import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 * Author ：TonyLee
 * Date ：2018.5.19
 */

public class Client  {
    public static final String HOST_A = "31.16.6.45";   //1号相机IP
    public static final int PORT_A = 23198;              //1号相机PORT端口号
    public static double[] resultData_A ;
    public static InputStream inputstream_A;
    public static OutputStream outputstream_A;
    public static Socket socket_A;

    public static final String HOST_B = "31.16.6.45";//2号相机IP
    public static final int PORT_B = 23190;             //2号相机PORT端口号
    public static double[] resultData_B ;
    public static InputStream inputstream_B;
    public static OutputStream outputstream_B;
    public static Socket socket_B;

    public static double[][] resultData = new double[100][4];
    public static int ship_count;


    //与两相机建立连接，开始服务端检测算法
    public static void establishConnection ()throws Exception {
        socket_A = new Socket(HOST_A, PORT_A);
        outputstream_A = socket_A.getOutputStream();
        inputstream_A = socket_A.getInputStream();
        
        //若连接2号相机，请取消以下三行代码注释
        //socket_B = new Socket(HOST_B, PORT_B);
        //outputstream_B = socket_B.getOutputStream();
        //inputstream_B = socket_B.getInputStream();
    }
   
    
    //从单一相机获取原始船只数据，返回原始数据列表
    public static double[] getData (InputStream ips,OutputStream ops)throws Exception {
        int len = 0;
        ArrayList<Double> temp = new ArrayList<Double>();
        byte[] dataBuffer = new byte[1024];
        ops.write(("Data").getBytes());
        while(len<1){
            len = ips.read(dataBuffer);
            Thread.currentThread();
			Thread.sleep(100);
        } 
        String tempString = new String(dataBuffer);
        Pattern compile = Pattern.compile("-*\\d+\\.\\d+");
        Matcher matcher = compile.matcher(tempString);
        while (matcher.find()) {
            temp.add(Double.parseDouble(matcher.group()));
        }
        double[] temp_al = new double[temp.size()];
        for(int i=0;i<temp.size();i++){
            temp_al[i]=Double.parseDouble(temp.get(i).toString());
        }
        return temp_al;
    }
    
  //对原始船只数据列表进行处理，获得二维船只数据列表，并返回船只数量
    public static int getFinalData (double[] al,double[][] result) {
 	   int count = 0;
 	   int len_al;
 	   if((al.length%4)!=0){
            return 0;
        }
 	   len_al = (al.length)/4;
        count = len_al;
        double[][] list_a = new double[len_al][4];
        for(int i = 0;i < len_al;i++){
            for(int j = 0;j < 4;j++){
                list_a[i][j] = al[4*i+j];
            }
        }
        for(int i = 0;i<len_al;i++){
            result[i]=list_a[i];
        }
 	   return count;
    }

   //获取指定相机全景图，path为图片存放路径
    public static void getPicture (InputStream ips,OutputStream ops,String path)throws Exception {
        int len;
        int hasRecieved = 0;
        int size = 0;
        byte[] dataBuffer = new byte[1024];
        ops.write(("Picture").getBytes());
        FileOutputStream fos = new FileOutputStream(path);
        ips.read(dataBuffer);
        String tempString = new String(dataBuffer);
        Pattern compile = Pattern.compile("[1-9]\\d+");
        Matcher matcher = compile.matcher(tempString);
        while (matcher.find()) {
            size = Integer.parseInt(matcher.group());
        }
        try{
            while(hasRecieved < size){
                len = ips.read(dataBuffer);
                ops.write(("continue").getBytes());
                hasRecieved += len;
                fos.write(dataBuffer);
            }
        }catch (Exception e){
            System.out.println("error");
            e.printStackTrace();
        }
        fos.close();
    }

    //开始追踪，参数为相机编号，船只编号
    public static void startTracking (String camera_num,int ship_num)throws Exception {
    	System.out.print("------------");
    	System.out.print(camera_num);
    	System.out.print(ship_num);
    	if("A".equals(camera_num)){
            outputstream_A.write(("StartTracking").getBytes());
            Thread.currentThread();
			Thread.sleep(100);
            outputstream_A.write(String.valueOf(ship_num).getBytes());
            Thread.currentThread();
			Thread.sleep(100);
        }
    	//若连接2号相机，请取消以下代码注释
        /*if("B".equals(camera_num)){
            outputstream_B.write(("StartTracking").getBytes());
            Thread.currentThread();
			Thread.sleep(100);
            outputstream_B.write(String.valueOf(ship_num).getBytes());
            Thread.currentThread();
			Thread.sleep(100);
        }*/
    }

    //指定相机停止追踪
    public static void stopTracking (OutputStream ops)throws Exception {
        ops.write(("StopTracking").getBytes());
        Thread.currentThread();
		Thread.sleep(500);
    }

    //指定相机断开连接
    public static void disconnection (Socket socket,InputStream ips,OutputStream ops)throws Exception {
        ops.write(("Disconnect").getBytes());
        ips.close();
        socket.close();
    }
   
   
    
}