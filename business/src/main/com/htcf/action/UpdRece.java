package com.htcf.action;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

//接收端
public class UpdRece {

	/**
	Description :
	@param:@param args
	@return:void
	@throws
	@Author：yinying
	@Create 2017-12-7 下午04:06:10
	 */
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub

		//创建upd socket，建立端口
		DatagramSocket ds = new DatagramSocket(10086);
		System.out.println("接收端已开启");
		while(true){//循环监听
			byte[] buf = new byte[1024];
			DatagramPacket dp = new DatagramPacket(buf,buf.length);
			//通过socket服务的receive方法将接收到的数据存入数据包中
			ds.receive(dp);
			//receive方法是阻塞式方法
			//通过数据包的方式获取其中的数据
			String ip = dp.getAddress().getHostAddress();
			String data = new String(dp.getData(),0,dp.getLength());
			int port = dp.getPort();
			System.out.println("发送端IP："+ip+"，端口:"+port+"，数据："+data);
			
		}
		//关闭资源
//		ds.close()args;
		
	}

}
