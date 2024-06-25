package com.mata.persfumeAdmin.coupon.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

	
    /*
    //쿠폰 사용처리
    @PostMapping("adDelete.co")
    public String deleteCoupon(@RequestParam("memNo") Integer mno,
                             
                               Model model,
                               HttpSession session) {
        if (mno == null) {
            model.addAttribute("errorMsg", "유효하지 않은 회원 번호입니다.");
            return "common/errorPage";
        }

        int result = couponService.deleteCoupon(mno);

        if(result > 0) { // 성공
           
            session.setAttribute("alertMsg", "성공적으로 삭제 되었습니다.");
            return "redirect:/list.co";
        } else { // 실패
            model.addAttribute("errorMsg", "게시글 삭제 실패");
            return "common/errorPage";
        }
    }//메소드 영억 끝
*/
}
