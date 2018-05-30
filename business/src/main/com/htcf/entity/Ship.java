package com.htcf.entity;


public class Ship {
	private String camera_num;    //相机编号 A or B
	private int ship_num;         //船只编号
	private int ship_world_x;  //船只坐标X
	private int ship_world_y;  //船只坐标Y

	public void setCamera_num(String camera_num) {
		this.camera_num = camera_num;
	}

	public String getCamera_num() {
		return camera_num;
	}
	
	public int getShip_num() {
		return ship_num;
	}

	public void setShip_num(int ship_num) {
		this.ship_num = ship_num;
	}

	public double getShip_world_x() {
		return ship_world_x;
	}

	public void setShip_world_x(int ship_world_x) {
		this.ship_world_x = ship_world_x;
	}

	public double getShip_world_y() {
		return ship_world_y;
	}

	public void setShip_world_y(int ship_world_y) {
		this.ship_world_y = ship_world_y;
	}
	
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("相机编号 ："+camera_num+"\n");
		sb.append("船只编号 ："+ship_num+"\n");
		sb.append("船只坐标X ："+ship_world_x+"\n");
		sb.append("船只坐标Y ："+ship_world_y+"\n");
		return sb.toString();
	}


}
