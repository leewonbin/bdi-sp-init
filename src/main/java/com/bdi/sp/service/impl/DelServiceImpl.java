package com.bdi.sp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdi.sp.dao.DelDAO;
import com.bdi.sp.service.DelService;
import com.bdi.sp.vo.Del;

@Service
public class DelServiceImpl implements DelService {
	@Autowired
	private DelDAO ddao;
	
	@Override
	public List<Del> getDelList(Del d) {
		// TODO Auto-generated method stub
		return ddao.getDelList(null);
	}

	@Override
	public Del getDel(int num) {
		// TODO Auto-generated method stub
		return ddao.getDel(num);
	}

}
