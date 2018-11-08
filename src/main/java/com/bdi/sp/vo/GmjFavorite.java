package com.bdi.sp.vo;

public class GmjFavorite {
private int gmjuserno;
private int gmjarchitectbno;
private int favoritecnt;
public int getGmjuserno() {
	return gmjuserno;
}
public void setGmjuserno(int gmjuserno) {
	this.gmjuserno = gmjuserno;
}
public int getGmjarchitectbno() {
	return gmjarchitectbno;
}
public void setGmjarchitectbno(int gmjarchitectbno) {
	this.gmjarchitectbno = gmjarchitectbno;
}
public int getFavoritecnt() {
	return favoritecnt;
}
public void setFavoritecnt(int favoritecnt) {
	this.favoritecnt = favoritecnt;
}
@Override
public String toString() {
	return "GmjFavorite [gmjuserno=" + gmjuserno + ", gmjarchitectbno=" + gmjarchitectbno + ", favoritecnt="
			+ favoritecnt + "]";
}
}
