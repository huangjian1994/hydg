package com.htcf.action;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;

//发送端
public class UdpSend {
	public static void main(String[] args) throws Exception{
		//通过DatagramSocket对象，创建upd服务
		DatagramSocket ds = new DatagramSocket();
		//确定数据，并封装成数据包
		Date d= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		byte[] buf = (sdf.format(d).toString()).concat("  hello udp").getBytes();
		//this id a dataPacket
		DatagramPacket dp = new DatagramPacket(buf,buf.length,InetAddress.getByName("10.15.53.153"),10086);
		//通过socket服务，将已有的数据包发送出去，通过send方法
		ds.send(dp);
		//关闭资源
		ds.close();
		System.out.println("程序执行完毕，数据已发送！");
		
	}

}
