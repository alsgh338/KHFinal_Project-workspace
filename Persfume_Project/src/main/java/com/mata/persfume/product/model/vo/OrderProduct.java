package com.mata.persfume.product.model.vo;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class OrderProduct {

	private int odId;
	private int quantity;
	private int price;
	private int orderNo;
	private int productNo;
	private String refundRequest;
	public OrderProduct(int quantity, int price, int orderNo, int productNo) {
		super();
		this.quantity = quantity;
		this.price = price;
		this.orderNo = orderNo;
		this.productNo = productNo;
	}
	
	
	
}
