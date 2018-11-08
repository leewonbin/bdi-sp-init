package com.bdi.sp.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bdi.sp.dao.GmjArchitectInfoDAO;
import com.bdi.sp.vo.GmjArchitectInfo;
@Component
public class GmjArchitectInfoDAOImpl implements GmjArchitectInfoDAO {
	@Autowired
	public SqlSession ss;
	@Override
	public List<GmjArchitectInfo> getList(String gmjarchitectname) {
		
		return ss.selectList("com.bdi.sp.vo.GmjArchitectInfo.selectList",gmjarchitectname);
	}
	@Override
	public GmjArchitectInfo checkAddress(String gmjArchitectBAddress) {
		// TODO Auto-generated method stub
		return ss.selectOne("com.bdi.sp.vo.GmjArchitectInfo.checkAddress",gmjArchitectBAddress);
	}

}
