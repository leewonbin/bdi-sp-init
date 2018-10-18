package com.bdi.sp.dao;

import java.util.List;

import com.bdi.sp.vo.UserPr;

public interface UserPrDAO {

	public List<UserPr> getUserPrList(UserPr ui);
	public UserPr getUserPr(int uinum);
	public int insertUserPr(UserPr ui); 
	public int updateUserPr(UserPr ui);
	public int deleteUserPr(int uinum);
	public UserPr checkUser(UserPr ui);
}
