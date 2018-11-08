package com.bdi.sp.service;

import java.util.List;

import com.bdi.sp.vo.GmjArchitectInfo;

public interface GmjArchitectInfoService {
	public List<GmjArchitectInfo> getList(String gmjArchitectName);
	public GmjArchitectInfo checkAddress(String gmjArchitectBAddress);

}
