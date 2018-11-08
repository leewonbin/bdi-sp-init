package com.bdi.sp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.dao.impl.GmjArchitectInfoDAOImpl;
import com.bdi.sp.service.UserPrService;
import com.bdi.sp.service.impl.GmjArchitectInfoServiceImpl;
import com.bdi.sp.service.impl.GmjFavoriteServiceImpl;
import com.bdi.sp.vo.GmjArchitectInfo;
import com.bdi.sp.vo.GmjFavorite;
import com.bdi.sp.vo.UserPr;

@Controller
public class MapController {

	@Autowired
	private GmjArchitectInfoServiceImpl gaisi;
	@Autowired
	private GmjFavoriteServiceImpl gfsi;
	
	@GetMapping(value="/gmjArchitectName/{gmjArchitectName}")
	public @ResponseBody List<GmjArchitectInfo> userprList(@PathVariable String gmjArchitectName) {
		return gaisi.getList(gmjArchitectName);
	}
	@GetMapping(value="/gmjArchitectBAddress/{gmjArchitectBAddress}")
	public @ResponseBody GmjArchitectInfo checkAddress(@PathVariable String gmjArchitectBAddress) {
		return gaisi.checkAddress(gmjArchitectBAddress);
	}
	@PostMapping(value="/gmjFavorite")
	public @ResponseBody int checkAddress(@RequestBody GmjFavorite gf) {
		System.out.println(gf);
		return gfsi.insertFavorite(gf);
	}
	
}
