package com.mata.persfumeAdmin.coupon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mata.persfumeAdmin.coupon.model.service.CouponService;
import com.mata.persfumeAdmin.coupon.model.vo.Coupon;
import com.mata.persfumeAdmin.coupon.model.vo.MemCoupon;

@Controller
public class CouponController {

    @Autowired
    private CouponService couponService;

    // 쿠폰 목록 조회
    @GetMapping("/list.co")
    public String couponList(Model model) {
        List<Coupon> couponList = couponService.selectList();
        model.addAttribute("couponList", couponList);
        return "coupon/couponListView";
    }

    // 쿠폰 상세 조회
    @GetMapping("/detail.co")
    public String couponDetail(@RequestParam("cno") int couponNo, Model model) {
        List<MemCoupon> memCouponList = couponService.getMemberCoupons(couponNo);
        
        System.out.println(couponNo);
        model.addAttribute("memCouponList", memCouponList);
        return "coupon/couponDetailView";
    }
}
