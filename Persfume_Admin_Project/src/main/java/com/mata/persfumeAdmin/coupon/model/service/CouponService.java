package com.mata.persfumeAdmin.coupon.model.service;

import java.util.List;

import com.mata.persfumeAdmin.coupon.model.vo.Coupon;
import com.mata.persfumeAdmin.coupon.model.vo.MemCoupon;

public interface CouponService {

    // 쿠폰 리스트 조회
    List<Coupon> selectList();

    // 쿠폰 상세 조회
    List<MemCoupon> getMemberCoupons(int couponNo);

//	/int deleteCoupon(int mno);
}
