package com.bdi.sp.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bdi.sp.dao.DelDAO;
import com.bdi.sp.vo.Del;
@Repository
public class DelDAOImpl implements DelDAO {
	@Autowired
	private SqlSession ss;

	@Override
	public List<Del> getDelList(Del d) {
		// TODO Auto-generated method stub
		return ss.selectList("com.bdi.sp.vo.DelMapper.selectDelList", d); 
	}

	@Override
	public Del getDel(int num) {
		// TODO Auto-generated method stub
		return ss.selectOne("com.bdi.sp.vo.DelMapper.selectDel",num);
	}

}
