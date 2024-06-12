package com.mata.persfume.product.model.service;

import java.util.ArrayList;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.product.model.vo.Coupon;
import com.mata.persfume.product.model.vo.MemCoupon;
import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.product.model.vo.ProductImg;

public interface ProductService {

	
	
	// 상품조회 상품 총 갯수 조회
		int selectListCount();
		// 상품조회 (등록일순) 조회
		ArrayList<Product> selectList(PageInfo pi);
		// 상품조회(등록일순) 이미지 조회
		ArrayList<ProductImg> selectImgList(PageInfo pi);
		// 상품상세조회(상품번호) 
		Product selectProduct(int pno);
		// 상품상세조회이미지(상품번호)
		ArrayList<ProductImg> selectProductImgList(int pno);
		// 상품상세조회이미지 썸네일(상품번호)
		ProductImg selectProductImg(int pno);
		// 회원번호로 등록된 쿠폰 가져오기(회원번호)
		ArrayList<MemCoupon> searchCoupon(int mno);
		// 쿠폰 이름을 위한 리스트
		Coupon searchCouponName(int cno);
		
}//인터페이스 종료
