package com.jmt.pojo;

import java.util.List;

/**
 * 机构区域的扩展类
 * @author T430
 *
 */
public class OfficeArea extends Office {
	/*private Area area;//区域编号
*/	private String name;//区域名
	private List<Area> arealist;//区域集合
	
	
	/*public Area getArea() {
		return area;
	}
	public void setArea(Area area) {
		this.area = area;
	}*/
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Area> getArealist() {
		return arealist;
	}
	public void setArealist(List<Area> arealist) {
		this.arealist = arealist;
	}
	
	
	
}
