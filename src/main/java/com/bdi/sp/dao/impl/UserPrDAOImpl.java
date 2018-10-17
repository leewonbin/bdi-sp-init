
package com.bdi.sp.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bdi.sp.dao.UserPrDAO;
import com.bdi.sp.vo.UserPr;

@Repository
public class UserPrDAOImpl implements UserPrDAO {

	@Autowired
	private SqlSession ss;
	
	@Override
	public List<UserPr> getUserPrList(UserPr ui) {
		return ss.selectList("com.bdi.sp.vo.UserPrMapper.selectUserPrList", ui);
	}

	@Override
	public UserPr getUserPr(int uinum) {
		return ss.selectOne("com.bdi.sp.vo.UserPrMapper.selectUserPr", uinum);
	}

	@Override
	public int insertUserPr(UserPr ui) {
		return ss.insert("com.bdi.sp.vo.UserPrMapper.insertUserPr", ui);
	}

	@Override
	public int updateUserPr(UserPr ui) {
		return ss.update("com.bdi.sp.vo.UserPrMapper.updateUserPr", ui);
	}
	@Override
	public int deleteUserPr(int uinum) { 
		return ss.delete("com.bdi.sp.vo.UserPrMapper.deleteUserPr", uinum);
	}

}
