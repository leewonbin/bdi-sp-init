package com.bdi.sp.dao;

import java.util.Map;

import com.bdi.sp.vo.BoardInfo;

public interface BoardInfoDAO {
	public BoardInfo gettotalcnt();
	public Map<String,Object> getBoardInfo(int num);
}
