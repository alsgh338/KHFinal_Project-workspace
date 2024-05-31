package com.mata.persfume.product.model.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class OrderDetail {

	private int orderNo;
	private String payCode;
	private int totalPrice;
	private String orderWant;
	private String deliveryStatus;
	private Date orderDate;
	private Date refundDate;
	private int memNo;
}
