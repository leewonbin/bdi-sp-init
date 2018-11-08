package com.bdi.sp.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.bdi.sp.vo.GmjArchitectInfo;

public interface GmjArchitectInfoDAO {
	public List<GmjArchitectInfo> getList(String gmjarchitectname);
	public GmjArchitectInfo checkAddress(String gmjArchitectBAddress);
	
}
