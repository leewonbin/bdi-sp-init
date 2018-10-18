package com.bdi.sp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdi.sp.dao.UserPrDAO;
import com.bdi.sp.service.UserPrService;
import com.bdi.sp.vo.UserPr;

@Service
public class UserPrServiceImpl implements UserPrService {

	@Autowired
	private UserPrDAO uidao;
	
	@Override
	public List<UserPr> getUserPrList(UserPr ui) {
		return uidao.getUserPrList(ui);
	}

	@Override
	public UserPr getUserPr(int uinum) {
		return uidao.getUserPr(uinum);
	}

	@Override
	public int insertUserPr(UserPr ui) {
		
		return uidao.insertUserPr(ui);//return 값이 숫자: 1이면 성공 0이면 실패.
	}

	@Override
	public int updateUserPr(UserPr ui) {
		return uidao.updateUserPr(ui);
	}

	@Override
	public int deleteUserPr(int uinum) {
		return uidao.deleteUserPr(uinum); 
	}

	@Override
	public String checkLogin(UserPr ui) {
		if(uidao.checkUser(ui)!=null) {
		System.out.println(uidao.checkUser(ui));
		return "success";
		}else {
			return "fail";
		}
	}
	
}
