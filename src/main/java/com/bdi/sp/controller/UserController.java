package com.bdi.sp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.service.UserPrService;
import com.bdi.sp.vo.UserPr;

@Controller
public class UserController {

	
/*
	@RequestMapping(value="/login",method=RequestMethod.PUT)
	public @ResponseBody Map<String,String> userUpdate(@RequestBody Map<String,String> user){
		Map<String,String> rMap = new HashMap<String,String>();
		System.out.println(user.get("id"));
		rMap.put("수정", "fail");
		rMap.put("msg", "아이디 및 비민번호를 확인하세요");
		if(user.get("id")==null) {
			System.out.println("널값이 나와요");
			return rMap;
		}else if(user.get("id").equals("hong")) {
			System.out.println("수정이 왜 안될까?"+user.get("id"));
				rMap.put("수정", "success");
				rMap.put("msg", "수정되었습니다.");
			
		}
		return rMap;	
	}*/



	

}
