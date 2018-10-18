package com.bdi.sp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.service.UserPrService;
import com.bdi.sp.vo.UserPr;

@Controller
public class UserPrController {

	@Autowired
	private UserPrService uis;
	
	@RequestMapping(value="/userpr", method=RequestMethod.GET)
	public @ResponseBody List<UserPr> userprList(@ModelAttribute UserPr ui) {
		return uis.getUserPrList(ui);
	}
	
	@RequestMapping(value="/userpr/{uinum}", method=RequestMethod.GET)
	public @ResponseBody UserPr userprList(@PathVariable Integer uinum) {
		return uis.getUserPr(uinum);
	}
	
	@RequestMapping(value="/userpr", method=RequestMethod.POST)
	public @ResponseBody int insertUserPr(@RequestBody UserPr ui) {
		return uis.insertUserPr(ui);
	}
	@RequestMapping(value="/userprs", method=RequestMethod.POST)
	public @ResponseBody int dupcheck(@RequestBody UserPr ui) {
		return uis.insertUserPr(ui);
	}
	
	@RequestMapping(value="/userpr/{uinum}", method=RequestMethod.PUT)
	public @ResponseBody int updateUserPr(@RequestBody UserPr ui, @PathVariable Integer uinum) {
		return uis.updateUserPr(ui);  
	}
	
	@RequestMapping(value="/userpr/{uinum}", method=RequestMethod.DELETE)
	public @ResponseBody int deleteUserPr(@PathVariable Integer uinum) {
		return uis.deleteUserPr(uinum); 
	}
}
