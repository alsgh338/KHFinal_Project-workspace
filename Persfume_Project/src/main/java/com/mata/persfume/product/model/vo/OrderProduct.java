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
	
}
