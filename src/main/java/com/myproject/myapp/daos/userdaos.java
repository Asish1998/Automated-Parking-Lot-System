package com.myproject.myapp.daos;

import com.myproject.myapp.models.UserInfo;


import com.myproject.myapp.models.User;

public interface userdaos {

	public void userSignup(User u);
	public void userUpdate(User u);
	public User isExist(String un,String psw);
	public boolean isExist(String id);
	public UserInfo getById(long uid);
	public void updateInfo(UserInfo uf);
	public boolean valid(String id);
	public boolean timevalid(String time);
	
}
