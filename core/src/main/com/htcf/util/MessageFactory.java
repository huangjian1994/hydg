package com.htcf.util;

import java.util.Collection;

import javax.servlet.ServletException;

import org.directwebremoting.Browser;
import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ScriptSessionFilter;
import org.directwebremoting.WebContextFactory;


/**
 * 消息推送
 * @author lwb
 *
 */
public class MessageFactory {

	/**
	 * 初始化DWR服务并添加userId到scriptSession
	 * @param userId
	 */
	public void onPageLoad(String userId) {
		ScriptSession scriptSession = WebContextFactory.get().getScriptSession();
		scriptSession.setAttribute(userId, userId);
		DwrScriptSessionManagerUtil dwrScriptSessionManagerUtil = new DwrScriptSessionManagerUtil();
		try {
			dwrScriptSessionManagerUtil.init();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 给用户userId发送消息 
	 * @param userId 用户ID
	 * @param message 消息内容
	 */
	public void sendMessageAuto(String userId,String message) {
		
		if ( null == userId ) return;
		final String userID = userId ;
		final String autoMessage = message;
		Browser.withAllSessionsFiltered(new ScriptSessionFilter() {
			public boolean match(ScriptSession session) {
				return userID.equalsIgnoreCase((String) session.getAttribute("userId"));
			}
		}, new Runnable(){
			private ScriptBuffer script = new ScriptBuffer();
			public void run() {
				script.appendCall("showMessage", autoMessage);
				Collection<ScriptSession> sessions = Browser
				.getTargetSessions();
				for (ScriptSession scriptSession : sessions) {
					scriptSession.addScript(script);
				}
			}
			
		});
	}
}
