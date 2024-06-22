package com.mata.persfumeAdmin.coupon.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class MemCoupon {
	
	private int memCouponNo;	
	private String registDate;
	private String status;	
	private int memNo;	
	private int couponNo;
}
