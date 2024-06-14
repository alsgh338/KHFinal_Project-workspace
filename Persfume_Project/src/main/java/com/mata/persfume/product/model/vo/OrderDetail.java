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
public class OrderDetail {

	private int orderNo;
	private String payCode;
	private int totalPrice;
	private String orderWant;
	private String deliveryStatus;
	private Date orderDate;
	private Date refundDate;
	private int memNo;
	// 주문테이블 만들기 위한 매개변수 4개자리 생성자
	
	public OrderDetail(String payCode, int totalPrice, String orderWant, int memNo) {
		super();
		this.payCode = payCode;
		this.totalPrice = totalPrice;
		this.orderWant = orderWant;
		this.memNo = memNo;
	}
	
	
}

