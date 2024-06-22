package com.mata.persfumeAdmin.coupon.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfumeAdmin.coupon.model.vo.Coupon;
import com.mata.persfumeAdmin.coupon.model.vo.MemCoupon;

@Repository
public class CouponDao {

    // 쿠폰 리스트 조회
    public List<Coupon> selectList(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("couponMapper.selectList");
    }

    // 쿠폰 상세 조회
    public List<MemCoupon> selectMemberCoupons(SqlSessionTemplate sqlSession, int couponNo) {
        return sqlSession.selectList("couponMapper.selectMemberCoupons", couponNo);
    }
}
