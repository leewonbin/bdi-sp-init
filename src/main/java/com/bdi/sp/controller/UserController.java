package com.bdi.sp.controller;

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
	@Autowired
	private UserPrService up;
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public @ResponseBody String logincheck(@RequestBody UserPr user){
		return up.checkLogin(user);
	}
	
}
