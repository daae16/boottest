package com.boot.service.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.boot.dao.UserInfoDAO;
import com.boot.dao.impl.UserInfoDAOImpl;
import com.boot.service.UserService;

public class UserServiceImpl implements UserService {
	private UserInfoDAO userDAO = new UserInfoDAOImpl();

	@Override
	public boolean doLogin(Map<String, String> param, HttpSession hs) {
		Map<String,String> user = userDAO.selectUserInfoByIdAndPwd(param);
		if(user!=null) {
			hs.setAttribute("user",user);
			return true;
		}
		return false;
	}

}
