package com.bdi.sp.dao;

import java.util.List;

import com.bdi.sp.vo.Depart;

public interface DepartDAO {
	public List<Depart> getDepList(Depart d);
	public int insertDepart(Depart d);
	public int updateDepart(Depart d);
 
}
