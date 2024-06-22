package com.mata.persfumeAdmin.coupon.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfumeAdmin.coupon.model.dao.CouponDao;
import com.mata.persfumeAdmin.coupon.model.vo.Coupon;
import com.mata.persfumeAdmin.coupon.model.vo.MemCoupon;

@Service
public class CouponServiceImpl implements CouponService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private CouponDao couponDao;

    @Override
    public List<Coupon> selectList() {
        return couponDao.selectList(sqlSession);
    }

    @Override
    public List<MemCoupon> getMemberCoupons(int couponNo) {
        return couponDao.selectMemberCoupons(sqlSession, couponNo);
    }
}
