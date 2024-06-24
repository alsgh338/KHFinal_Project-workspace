package com.mata.persfume.product.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Product {

	private int productNo;
	private String productName;
	private String productExplain;
	private int productPrice;
	private int productStock;
	private Date registDate;
	private int discount;
	private String category;
	private String gender;
	private String topNote;
	private String middleNote;
	private String baseNote;
	private String productStatus;
	public Product(int productNo, int productStock) {
		super();
		this.productNo = productNo;
		this.productStock = productStock;
	}
	public Product(String productName, String productExplain, int productPrice, int productStock, int discount,
			String category, String gender, String topNote, String middleNote, String baseNote) {
		super();
		this.productName = productName;
		this.productExplain = productExplain;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.discount = discount;
		this.category = category;
		this.gender = gender;
		this.topNote = topNote;
		this.middleNote = middleNote;
		this.baseNote = baseNote;
	}
	
	private String thumbnailImg;
	
}
