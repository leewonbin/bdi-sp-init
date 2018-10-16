package com.bdi.sp.dao;

import java.util.List;

import com.bdi.sp.vo.Del;

public interface DelDAO {
	public List<Del> getDelList(Del d);
	public Del getDel(int num);
}
