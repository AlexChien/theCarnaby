package com.koocaa.thecarnaby.model;

public class Shop {
	public int id;
	public String shop_type, 
		name, description, province, city, address,
		name_en, description_en, province_en, city_en, address_en,
		latitude, longtitude;
	public int image_res_id;
	
	public Shop(){
		
	}
	
//	new Shop(1,"零售", "北京中关村津乐汇","","北京","海淀","北京市海淀区中关村大街15号中关村购物中心D区津乐汇地下二层","Beijing Zhongguancun La Vita","","B2 La Vita, D Area Zhonguancun Shopping Center, No.15 Zhongguancun Street, Haidian District, Beijing","Beijing","Haidian","39.97987","116.316429"),
	public Shop(int id, String shop_type, String name, String description, String province, String city, String address, 
			String name_en, String description_en, String province_en, String city_en, String address_en, String latitude, String longtitude, int image_res_id){
		this.id = id;
		this.shop_type = shop_type;
		this.name = name;
		this.description = description;
		this.province = province;
		this.city = city;
		this.address = address;
		this.name_en = name_en;
		this.description_en = description_en;
		this.province_en = province_en;
		this.city_en = city_en;
		this.address_en = address_en;
		this.latitude = latitude;
		this.longtitude = longtitude;
		this.image_res_id = image_res_id;
	}
}
