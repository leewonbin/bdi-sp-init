package com.bdi.sp.vo;

public class UserPr {

	private Integer uinum;
	private String uiid;
	private String uipwd;
	private String uiname;
	private String uiemail;
	private String uibirth;
	private String uiaddress;
	private String uihobby;
	private String uidesc;
	private String uitel;
	
	public Integer getUinum() {
		return uinum;
	}
	public void setUinum(Integer uinum) {
		this.uinum = uinum;
	}
	public String getUiid() {
		return uiid;
	}
	public void setUiid(String uiid) {
		this.uiid = uiid;
	}
	public String getUipwd() {
		return uipwd;
	}
	public void setUipwd(String uipwd) {
		this.uipwd = uipwd;
	}
	public String getUiname() {
		return uiname;
	}
	public void setUiname(String uiname) {
		this.uiname = uiname;
	}
	public String getUiemail() {
		return uiemail;
	}
	public void setUiemail(String uiemail) {
		this.uiemail = uiemail;
	}
	public String getUibirth() {
		return uibirth;
	}
	public void setUibirth(String uibirth) {
		this.uibirth = uibirth;
	}
	public String getUiaddress() {
		return uiaddress;
	}
	public void setUiaddress(String uiaddress) {
		this.uiaddress = uiaddress;
	}
	public String getUihobby() {
		return uihobby;
	}
	public void setUihobby(String uihobby) {
		this.uihobby = uihobby;
	}
	public String getUidesc() {
		return uidesc;
	}
	public void setUidesc(String uidesc) {
		this.uidesc = uidesc;
	}
	public String getUitel() {
		return uitel;
	}
	public void setUitel(String uitel) {
		this.uitel = uitel;
	}
	@Override
	public String toString() {
		return "UserPr [uinum=" + uinum + ", uiid=" + uiid + ", uipwd=" + uipwd + ", uiname=" + uiname + ", uiemail="
				+ uiemail + ", uibirth=" + uibirth + ", uiaddress=" + uiaddress + ", uihobby=" + uihobby + ", uidesc="
				+ uidesc + ", uitel=" + uitel + "]";
	}
}
