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
public class OrderDetail {
	private int orderNo;
	private String payCode;
	private int totalPrice;
	private String orderWant;
	private String deliveryStatus;
	private Date orderDate;
	private Date refundDate;
	private int memNo;
	private int addressNo;
	private String address;
	private String phone;
}
