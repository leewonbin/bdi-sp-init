package com.bdi.sp.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bdi.sp.dao.DepartDAO;
import com.bdi.sp.vo.Depart;

@Repository
public class DepartDAOImpl implements DepartDAO {
	@Autowired
	private SqlSession ss;
	
	@Override
	public List<Depart> getDepList(Depart d) {
		return ss.selectList("com.bdi.sp.vo.DepMapper.selectDepList", d);
	}

	@Override
	public int insertDepart(Depart d) {
		return ss.insert("com.bdi.sp.vo.DepMapper.insertDep",d);
	}

	@Override
	public int updateDepart(Depart d) {
		return ss.update("com.bdi.sp.vo.DepMapper.updateDep",d);
	}

}
