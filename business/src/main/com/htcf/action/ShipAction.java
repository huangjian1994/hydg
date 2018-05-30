package com.htcf.action;


import java.util.ArrayList;

import com.htcf.entity.Ship;
/* 
 * * Author ：TonyLee
 * Date ：2018.5.19
 * 使用前要修改Client.java中的IP和PORT号，使其与服务器保持一致
 * 各功能调用流程说明
 * 首先建立连接getConnection()，船只检测服务端开始运行，然后定时调用getShipList()获取船只列表；
 * 获取全景拼接图调用getPanorama()将图片保存在指定文件夹下；
 * 在发现传船只后可以调用start_Track(String camera_num，int number)开始追踪指定船只，若发送船只编号超出范围则无响应，停止追踪调用stop_Track()；
 * 结束船只检测功能需调用breakConnection()，船只检测服务端停止运行，恢复等待状态；
 * 注：在追踪状态关闭页面，请先调用stop_Track()停止追踪，后调用breakConnection()
 * */
public class ShipAction {
	//与船只检测服务建立连接
	public static void getConnection() {
		try {
			Client.establishConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//与船只检测服务断开连接
	public static void breakConnection() {
		try {
			Client.disconnection(Client.socket_A,Client.inputstream_A,Client.outputstream_A);
			//若两个相机请取消下行注释
			//Client.disconnection(Client.socket_B,Client.inputstream_B,Client.outputstream_B);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	//获取船只列表
	public static ArrayList<Ship> getShipList(){
		ArrayList<Ship> ships = new ArrayList<Ship>();
		try {
			Client.resultData_A = Client.getData(Client.inputstream_A,Client.outputstream_A);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Client.ship_count = Client.getFinalData(Client.resultData_A, Client.resultData);
		for(int i=1;i<=Client.ship_count;i++) {
			Ship ship = new Ship();
			ship.setCamera_num("A");
			ship.setShip_num(i);
			ship.setShip_world_x((int)Client.resultData[i-1][2]);
			ship.setShip_world_y((int)Client.resultData[i-1][3]);
			ships.add(ship);
		}
		//若两个相机请取消以下注释
		/*try {
			Client.resultData_B = Client.getData(Client.inputstream_B,Client.outputstream_B);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Client.ship_count = Client.getFinalData(Client.resultData_B, Client.resultData);
		for(int i=1;i<=Client.ship_count;i++) {
			Ship ship = new Ship();
			ship.setCamera_num("B");
			ship.setShip_num(i);
			ship.setShip_world_x((int)Client.resultData[i-1][2]);
			ship.setShip_world_y((int)Client.resultData[i-1][3]);
			ships.add(ship);
		}*/
		return ships;
	}
	
	//获取全景图，并将全景图存入指定路径path，A_Panorama.png为相机1全景图，B_Panorama.png为相机2全景图
	public static void getPanorama(String cam,String path) {
		try {
			if("A".equals(cam)){
				Client.getPicture(Client.inputstream_A, Client.outputstream_A,path+"/A_Panorama.png");
			}
			/*if("B".equals(cam)){
				Client.getPicture(Client.inputstream_B, Client.outputstream_B,path+"/B_Panorama.png");			
			}*/	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//发送船只编号，开始追踪
	public static void start_Track(String camera_num,int number) {
		try {
			Client.startTracking(camera_num,number);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//停止追踪
	public static void stop_Track(String camera){
		try {
			if("A".equals(camera)){
				Client.stopTracking(Client.outputstream_A);
			}
			/*if("B".equals(camera)){
				Client.stopTracking(Client.outputstream_B);
			}*/
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
