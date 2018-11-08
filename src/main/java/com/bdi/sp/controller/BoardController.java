package com.bdi.sp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.dao.impl.BoardInfoDAOImpl;
import com.bdi.sp.vo.BoardInfo;



@Controller
public class BoardController {

	@Autowired
	private BoardInfoDAOImpl bai;
	@GetMapping(value="/board")
	public @ResponseBody BoardInfo getBoardCnt() {
		return bai.gettotalcnt();
	}
	@GetMapping(value="/uri/prj/comment/{num}")
	public @ResponseBody Map<String,Object> getBoardInfo(@PathVariable int num) {
		return bai.getBoardInfo(num);
	}
		
}
