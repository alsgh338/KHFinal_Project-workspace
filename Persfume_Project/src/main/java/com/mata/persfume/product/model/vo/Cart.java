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
	public Cart(int price, int quantity, int memNo, int productNo) {
		super();
		this.price = price;
		this.quantity = quantity;
		this.memNo = memNo;
		this.productNo = productNo;
	}
	public Cart(int cartNo, int price, int quantity) {
		super();
		this.cartNo = cartNo;
		this.price = price;
		this.quantity = quantity;
	}
	
	
	
}// 클래스종료
