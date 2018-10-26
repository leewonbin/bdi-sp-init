package com.bdi.sp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.service.NaverService;
import com.bdi.sp.vo.Naver;

@Controller
public class TransController {

	private static final Logger log = LoggerFactory.getLogger(TransController.class);

	@Autowired
	private NaverService ns;
	
	@RequestMapping(value = "/trans", method = RequestMethod.GET,produces="application/json;charset=utf-8")
	public @ResponseBody Naver trans(@RequestParam("source") String source, @RequestParam("target") String target,@RequestParam("text") String text) {
		return ns.getTrans(source,target,text);
	}
}
