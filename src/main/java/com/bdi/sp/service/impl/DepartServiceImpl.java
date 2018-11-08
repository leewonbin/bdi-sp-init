package com.bdi.sp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdi.sp.dao.DepartDAO;
import com.bdi.sp.service.DepartService;
import com.bdi.sp.vo.Depart;

@Service
public class DepartServiceImpl implements DepartService {
	
	@Autowired
	private DepartDAO ddao;
	
	@Override
	public List<Depart> getDepList(Depart d) {

		return ddao.getDepList(null);
	}
	
	@Override
	public int saveInsertUpdateDepart(Depart d) {
		int cnt = ddao.insertDepart(d);
		cnt += ddao.updateDepart(d);
		return cnt;
	}

}
