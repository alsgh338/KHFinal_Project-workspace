package com.mata.persfumeAdmin.product.model.vo;

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
	private String thumbnailImg;
}