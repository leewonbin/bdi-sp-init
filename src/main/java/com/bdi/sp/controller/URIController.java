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
		HttpSession hs =req.getSession();
		String rootPath = req.getContextPath();
		String uri = req.getRequestURI();
		//if(!req.getRequestURI().equals("/uri/watermelon/login")) {
		/*	logger.debug("name=>{}", 22);
			if(hs.getAttribute("token")==null||hs.getAttribute("ssuser")==null||hs.getAttribute("token").equals(0)) {
				logger.debug("name=>{}", 24);
				return req.getRequestURI().replace(req.getRequestURI(),"/watermelon/login");
			}else {
				logger.debug("name=>{}", 27);
				return req.getRequestURI().replace(rootPath+"/uri","");
			}
		}
		logger.debug("name=>{}", rootPath);*/
		return req.getRequestURI().replace(rootPath+"/uri","");
		
		
	}
	
	

}   