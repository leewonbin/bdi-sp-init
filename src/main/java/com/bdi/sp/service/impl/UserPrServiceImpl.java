package com.bdi.sp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public  Map<String,String> insertUserPr(UserPr ui) {
		
		
		
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("msg", "회원가입이 정상적으로 처리되지 않았습니다. 다시 시도해주시길 바랍니다..");
		rMap.put("success", "fail");
		
		if(uidao.insertUserPr(ui)==1){//return 값이 숫자: 1이면 성공 0이면  실패.
			rMap.put("msg", "회원가입이 완료되었습니다.");
			rMap.put("success", "success");
			
		}
		return rMap;
	}

	@Override
	public  Map<String,String> updateUserPr(UserPr ui) {
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("msg", "정상적으로 수정되지 않았습니다.");
		rMap.put("success", "fail");
		
		if(uidao.updateUserPr(ui)==1){//return 값이 숫자: 1이면 성공 0이면  실패.
			rMap.put("msg", "수정이  완료되었습니다.");
			rMap.put("success", "success");
			
		}
		return rMap;
	}

	@Override
	public  Map<String,String> deleteUserPr(int uinum) {
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("msg", "삭제되지 않았습니다. 다시 확인바랍니다.");
		rMap.put("success", "fail");
		
		if(uidao.deleteUserPr(uinum)==1){//return 값이 숫자: 1이면 성공 0이면  실패.
			rMap.put("msg", "삭제가  완료되었습니다.");
			rMap.put("success", "success");
		}
		return rMap;
	}

	@Override
	public Map<String,String> checkLogin(UserPr ui,HttpServletRequest req) {
		HttpSession hs = req.getSession();
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("msg", "로그인 실패입니다.");
		rMap.put("success", "fail");
		hs.setAttribute("token", "0");
		if(uidao.checkUser(ui)!=null){
			hs.setAttribute("ssuser", uidao.checkUser(ui));
			hs.setAttribute("token", "1");
			rMap.put("msg", "로그인 성공입니다.");
			rMap.put("success", "success");
			hs.setAttribute("token", "1");
		}
		return rMap;
	}

	@Override
	public Map<String, String> dupCheck(UserPr ui) {
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("msg", "쓸 수 있는 아이디입니다.");
		rMap.put("success", "success");
		if(uidao.dupCheckId(ui)==1){
			rMap.put("msg", "중복입니다.");
			rMap.put("success", "fail");
		}
		return rMap;
	}

	@Override
	public Map<String, String> checkLogout(UserPr ui, HttpServletRequest req) {
		
		HttpSession hs = req.getSession();
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("msg", "로그아웃하셨습니다.");
		rMap.put("success", "success");
		hs.setAttribute("token", null);
		hs.setAttribute("ssuser", null);
		return rMap;
	}
	
}
