package com.bdi.sp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	public @ResponseBody  Map<String,String> insertUserPr(@RequestBody UserPr ui) {
		return uis.insertUserPr(ui);
	}
	@RequestMapping(value="/userprdup", method=RequestMethod.POST)
	public @ResponseBody Map<String,String> dupcheck(@RequestBody UserPr ui) {
		return uis.dupCheck(ui);
	}
	
	@RequestMapping(value="/userpr/{uinum}", method=RequestMethod.PUT)
	public @ResponseBody  Map<String,String> updateUserPr(@RequestBody UserPr ui, @PathVariable Integer uinum) {
		return uis.updateUserPr(ui);  
	}
	@RequestMapping(value="/userpr", method=RequestMethod.PUT)
	public @ResponseBody  Map<String,String> updateUserPr2(@RequestBody UserPr ui) {
		return uis.updateUserPr(ui);  
	}
	
	@RequestMapping(value="/userpr/{uinum}", method=RequestMethod.DELETE)
	public @ResponseBody  Map<String,String> deleteUserPr(@PathVariable Integer uinum) {
		return uis.deleteUserPr(uinum); 
	}
	@RequestMapping(value="/userprs/", method=RequestMethod.DELETE)
	public @ResponseBody  Map<String,String> deleteUserPrAll(@RequestBody int[] uinumCheckSet) {
		return uis.deleteUserPrAll(uinumCheckSet); 
	}
	
	@Autowired
	private UserPrService up;
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public @ResponseBody Map<String,String> logincheck(@RequestBody UserPr user,HttpServletRequest req){
		return up.checkLogin(user,req);
	};
	@RequestMapping(value="/logout",method=RequestMethod.POST)
	public @ResponseBody Map<String,String> logoutcheck(@RequestBody UserPr user,HttpServletRequest req){
		return up.checkLogout(user,req);
	};
}
