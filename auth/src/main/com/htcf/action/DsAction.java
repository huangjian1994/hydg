package com.htcf.action;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;



@Controller("dsAction")
@Scope("prototype")
public class DsAction extends BaseAction{
	
	//到手动执行页面
	public String goSdzx(){
		System.out.println("到手动执行页面");
		return "goSdzx";
	}
	
}
