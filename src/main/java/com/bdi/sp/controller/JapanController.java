package com.bdi.sp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.service.JapanService;
import com.bdi.sp.vo.Japan;

@Controller
public class JapanController {
	@Autowired
	private JapanService js;
	
	private static final Logger logger = LoggerFactory.getLogger(JapanController.class);

	@RequestMapping(value="/japans",method=RequestMethod.GET)
	public @ResponseBody List<Japan> japanList(@ModelAttribute Japan j) {
		return js.getJapanList(j);
	}
	
	@RequestMapping(value="/japans/{jpnum}", method=RequestMethod.GET)
	public @ResponseBody Japan japanList(@PathVariable Integer jpnum) {
		return js.getJapan(jpnum);
	}
	
	@RequestMapping(value="/japans/{jpnum}", method=RequestMethod.POST)
	public @ResponseBody int insertJapan(@ModelAttribute Japan j,@PathVariable Integer jpnum) {
		
		return js.insertJapan(j);
	}
	
	@RequestMapping(value="/japans/{jpnum}",method=RequestMethod.PUT)
	public @ResponseBody int updateJapan(@RequestBody Japan j,@PathVariable Integer jpnum) {
		return js.updateJapan(j);
	}
	

	@RequestMapping(value="/japans/{jpnum}",method=RequestMethod.DELETE)
	public @ResponseBody int deleteJapan(@PathVariable int jpnum) {
		return js.deleteJapan(jpnum);
	}
	
}