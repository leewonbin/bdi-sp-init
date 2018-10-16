package com.bdi.sp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.service.DelService;
import com.bdi.sp.vo.Del;

@Controller
public class DelController {
	@Autowired
	private DelService ds;

	@RequestMapping(value = "/del", method = RequestMethod.GET)
	public @ResponseBody List<Del> delList(@ModelAttribute Del d) {
		return ds.getDelList(d);
	}
	
	@RequestMapping(value="/del/{num}", method=RequestMethod.GET)
	public @ResponseBody Del delList(@PathVariable int num) {
		return ds.getDel(num);
	}
}
