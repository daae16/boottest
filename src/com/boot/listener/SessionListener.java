package com.boot.listener;

import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.boot.vo.UserInfoVO;

@WebListener
public class SessionListener implements HttpSessionListener {

	public static synchronized void checkUserId(String uiId) {
		Iterator<String> it = sessionMap.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			HttpSession hs = sessionMap.get(key);
			if(hs.getAttribute("user")!=null) {
			UserInfoVO user = (UserInfoVO)hs.getAttribute("user");
			if(uiId.equals(user.getUiId())) {
				hs.invalidate();
			}
		}
		}
		
	}
	private static Map<String,HttpSession> sessionMap = new ConcurrentHashMap<>();
    public SessionListener() {
    }

    public void sessionCreated(HttpSessionEvent hse)  { 
    	String sessionId = hse.getSession().getId();
    	sessionMap.put(sessionId, hse.getSession());
    }

    public void sessionDestroyed(HttpSessionEvent hse)  { 
    }
	
}
