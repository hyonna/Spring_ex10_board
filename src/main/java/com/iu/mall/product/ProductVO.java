package com.iu.mall.product;

import java.sql.Date;
import java.util.List;

public class ProductVO {
	
	private String pid;
	private String category;
	private String title;
	private int price;
	private String subcontents;
	private String maincontents;
	private int amount;
	private Date reg_date;
	private List<ThumbnailVO> nailVOs;
	
	
	public List<ThumbnailVO> getNailVOs() {
		return nailVOs;
	}
	public void setNailVOs(List<ThumbnailVO> nailVOs) {
		this.nailVOs = nailVOs;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSubcontents() {
		return subcontents;
	}
	public void setSubcontents(String subcontents) {
		this.subcontents = subcontents;
	}
	public String getMaincontents() {
		return maincontents;
	}
	public void setMaincontents(String maincontents) {
		this.maincontents = maincontents;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	

}
