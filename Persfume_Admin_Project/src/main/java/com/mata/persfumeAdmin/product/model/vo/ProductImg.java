package com.mata.persfumeAdmin.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ProductImg {

	private int productImgNo;
	private String productImgPath;
	private String productImgOrigin;
	private String productImgChange;	
	private int imgType;
	private int productNo;
	private String status;
	
}
