package com.bdi.sp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.service.DepartService;
import com.bdi.sp.vo.Depart;

@Controller
public class DepartController {
	@Autowired
	private DepartService ds;
	
	@RequestMapping(value="/depart", method = RequestMethod.GET)
	public @ResponseBody List<Depart> depList(@ModelAttribute Depart d) {
		return ds.getDepList(d);
	}
	@RequestMapping(value="/depart", method = RequestMethod.POST)
	public @ResponseBody int insertDep(@RequestBody Depart d) {
		return ds.saveInsertUpdateDepart(d);
	}
	@RequestMapping(value="/depart", method = RequestMethod.PUT)
	public @ResponseBody int updateDep(@RequestBody Depart d) {
		return ds.saveInsertUpdateDepart(d);
	}

}
