package com.mata.persfumeAdmin.coupon.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Coupon {

    private int couponNo;
    private String couponName;
    private int memCouponCount; // 추가

    // 필요에 따라 생성자와 다른 메서드들을 추가할 수 있음
}
