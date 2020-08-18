package com.boot.dao;

import java.util.List;
import java.util.Map;

public interface UserInfoDAO {
	
	public Map<String,String> selectUserInfoByIdAndPwd(Map<String,String> user);

}
