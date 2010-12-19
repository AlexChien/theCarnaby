package com.koocaa.thecarnaby.model;

public class Coupon {
	public int id;
	public int shop_id;
	public String name, name_en, description, description_en, startdate, enddate;

	
	public Coupon(int id, int shop_id, String name, String name_en, 
					String description, String description_en, 
					String startdate, String enddate){
		this.id = id;
		this.shop_id = shop_id;
		this.name = name;
		this.name_en = name_en;
		this.description = description;
		this.description_en = description_en;
		this.startdate = startdate;
		this.enddate = enddate;
	}
}
