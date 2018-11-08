package com.bdi.sp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdi.sp.dao.impl.GmjFavoriteDAOImpl;
import com.bdi.sp.service.GmjFavoriteService;
import com.bdi.sp.vo.GmjFavorite;

@Service
public class GmjFavoriteServiceImpl implements GmjFavoriteService{
	@Autowired
	public GmjFavoriteDAOImpl gfdi;
	@Override
	public int insertFavorite(GmjFavorite gf) {
		// TODO Auto-generated method stub
		return gfdi.insertFavorite(gf);
	}

}
