package com.bdi.sp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.bdi.sp.vo.UserPr;

public interface UserPrService {

	public List<UserPr> getUserPrList(UserPr ui);
	public UserPr getUserPr(int uinum);
	public Map<String,String> insertUserPr(UserPr ui);
	public Map<String,String> updateUserPr(UserPr ui);
	public Map<String,String> deleteUserPr(int uinum);
	public Map<String,String> checkLogin(UserPr ui,HttpServletRequest req);
	public Map<String,String> checkLogout(UserPr ui,HttpServletRequest req);
	public Map<String,String> dupCheck(UserPr ui);
}
