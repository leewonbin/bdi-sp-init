package com.bdi.sp.service;

import java.util.List;

import com.bdi.sp.vo.UserPr;

public interface UserPrService {

	public List<UserPr> getUserPrList(UserPr ui);
	public UserPr getUserPr(int uinum);
	public int insertUserPr(UserPr ui);
	public int updateUserPr(UserPr ui);
	public int deleteUserPr(int uinum);
	public String checkLogin(UserPr ui);
}
