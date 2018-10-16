package com.bdi.sp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdi.sp.dao.JapanDAO;
import com.bdi.sp.service.JapanService;
import com.bdi.sp.vo.Japan;

@Service
public class JapanServiceImpl implements JapanService{

	@Autowired
	private JapanDAO jdao;
	
	@Override
	public List<Japan> getJapanList(Japan j){
		return jdao.getJapanList(null);
	}

	@Override
	public Japan getJapan(int jpnum) {
		return jdao.getJapan(jpnum);
	}

	@Override
	public int insertJapan(Japan j) {
		return jdao.insertJapan(j);
	}

	@Override
	public int deleteJapan(int j) {
		return jdao.deleteJapan(j);
	}

	@Override
	public int updateJapan(Japan j) {
		return jdao.updateJapan(j);
	}

}