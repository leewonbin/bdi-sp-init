package com.bdi.sp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class URIController {
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@RequestMapping(value="/uri/**",method=RequestMethod.GET)
	public String goPage(HttpServletRequest req) {
		String rootPath = req.getContextPath();
		String uri = req.getRequestURI();
		
		logger.debug("name=>{}", rootPath);
		return req.getRequestURI().replace(rootPath+"/uri","");
	}
	@RequestMapping(value="/viewz/uri/**",method=RequestMethod.GET)
	public String goPage2(HttpServletRequest req) {
		String rootPath = req.getContextPath();
		HttpSession hs =req.getSession();
		System.out.println(hs.getAttribute("token"));
		logger.debug("name=>{}", rootPath);
		if(hs.getAttribute("token")==null||hs.getAttribute("token").equals("0")) {
			System.out.println("주소"+req.getRequestURI().replace(rootPath+"/viewz/uri/watermelon/list","/uri/watermelon/login"));
		return req.getRequestURI().replace(rootPath+"/viewz/uri/watermelon/list","/watermelon/login");
			
		}else if(hs.getAttribute("token").equals("1")) {
			return req.getRequestURI().replace(rootPath+"/viewz/uri","");
		}
		return req.getRequestURI().replace(rootPath+"/viewz/uri/watermelon/list","/watermelon/login");
	}
}   