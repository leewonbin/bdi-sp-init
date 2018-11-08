package com.bdi.sp.vo;

public class BoardInfo {
	public Integer num;
	public String texta;
	public Integer binum;
	public Integer totalBoard;
	public Integer sblock;
	public Integer eblock;
	public Integer currentpage;
	public Integer getTotalBoard() {
		return totalBoard;
	}
	public void setTotalBoard(Integer totalBoard) {
		this.totalBoard = totalBoard;
	}
	public Integer getSblock() {
		return sblock;
	}
	public void setSblock(Integer sblock) {
		this.sblock = sblock;
	}
	public Integer getEblock() {
		return eblock;
	}
	public void setEblock(Integer eblock) {
		this.eblock = eblock;
	}
	public Integer getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(Integer currentpage) {
		this.currentpage = currentpage;
	}
}
