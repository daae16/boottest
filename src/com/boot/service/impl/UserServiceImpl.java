package com.boot.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.boot.dao.UserInfoDAO;
import com.boot.dao.impl.UserDAOImpl;
import com.boot.listener.SessionListener;
import com.boot.service.UserService;
import com.boot.servlet.InitServlet;
import com.boot.vo.UserInfoVO;

public class UserServiceImpl implements UserService {
	private UserInfoDAO udao = new UserDAOImpl();

	@Override
	public int insertUser(UserInfoVO user) {
		return 0;
	}

	@Override
	public int deleteUser(UserInfoVO user, HttpSession hs) {
		int cnt = udao.updateUser(user);
		if(cnt==1) {
			hs.invalidate();
		}
		return cnt;
	}

	@Override
	public int updateUser(UserInfoVO user, HttpSession hs) {
		int cnt = udao.updateUser(user);
		if(cnt==1) {
			hs.setAttribute("user",udao.selectUser(user));
			
		}
		return cnt;
	}

	@Override
	public UserInfoVO selectUser(UserInfoVO user) {
		return udao.selectUser(user);
	}

	public UserInfoVO selectUserForLogin(UserInfoVO user) {
		
		return null;
	}

	@Override
	public List<UserInfoVO> selectUserList(UserInfoVO user) {
		return udao.selectUserList(user); 
	}
	
	@Override
	public boolean checkUserId (String uiId) {
		UserInfoVO user1 = udao.selectUserById(uiId);
		if(user1==null) {
			return true;
		}  
		return false;
	}

	@Override
	public boolean doLogin(UserInfoVO user, HttpSession hs) {
		user = udao.selectUserForLogin(user);
		if(user!=null) {
			SessionListener.checkUserId(user.getUiId());
			hs.setAttribute("user",user); 
			return true;
		}
		return false;
	}
	public static void main(String[] args) {
		InitServlet is = new InitServlet();
		is.init();
		UserService usSer = new UserServiceImpl();
		UserInfoVO user = new UserInfoVO();
		user.setUiId("test");
		user.setUiPassword("test");
		boolean isLogin = usSer.doLogin(user,null);
		System.out.println(isLogin);
	}

}
