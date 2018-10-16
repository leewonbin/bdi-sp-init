package com.bdi.sp.vo;

public class Del {
	private Integer num;
	private String name;
	private String age;
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "Del [num=" + num + ", name=" + name + ", age=" + age + "]";
	}

}
