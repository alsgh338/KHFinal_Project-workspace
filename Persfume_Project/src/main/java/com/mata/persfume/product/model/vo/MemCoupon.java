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
public class MemCoupon {

		private Date registDate;
		private String status;
		private int memNo;
		private int couponNo;
		public MemCoupon(int memNo, int couponNo) {
			super();
			this.memNo = memNo;
			this.couponNo = couponNo;
		}
		
		
}
