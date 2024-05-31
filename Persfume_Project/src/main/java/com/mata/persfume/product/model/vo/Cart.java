package com.mata.persfume.product.model.vo;

import lombok.Getter;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Cart {

	private int cartNo;
	private int price;
	private int quantity;
	private int memNo;
	private int productNo;
	
}
