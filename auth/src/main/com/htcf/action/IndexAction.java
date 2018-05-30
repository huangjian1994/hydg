package com.htcf.action;

import javax.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;



/**
 * @author Administrator
 *
 */
@Controller("indexAction")
@Scope("prototype")
public class IndexAction extends BaseAction {
	
	private static long serialVersionUID = 1L;
	


	public String init(){	
		HttpServletRequest request= this.getHttpServletRequest();
		pageBean=this.processPageBean(request);
		return "content";
	}



	public static long getSerialVersionUID() {
		return serialVersionUID;
	}



	public static void setSerialVersionUID(long serialVersionUID) {
		IndexAction.serialVersionUID = serialVersionUID;
	}

	
	
}
