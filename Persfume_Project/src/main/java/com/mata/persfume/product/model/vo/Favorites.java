package com.mata.persfume.product.model.vo;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Favorites {

	private int productNo;
	private int memNo;
	public Favorites(int productNo, int memNo) {
		super();
		this.productNo = productNo;
		this.memNo = memNo;
	}
	
	
}
