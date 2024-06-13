package com.mata.persfume.cart.model.service;

import java.util.ArrayList;

import com.mata.persfume.cart.model.vo.Cart;
import com.mata.persfume.common.model.vo.PageInfo;

public interface CartService {
	
	

	// 장바구니 리스트 조회 + 페이징 처리
	//장바구니 총 갯수 조회
	int selectListCount();
	
	// 특정 회원의 장바구니 목록을 조회
	ArrayList<Cart> selectList(PageInfo pi);

	
	// 장바구니에 상품 추가 
	int addCart(Cart c); 

	// 특정 조건에 맞는 장바구니 목록을 조회
	ArrayList<Cart> cartList(Cart c);


	// 페이징을 사용하여 특정 회원의 장바구니 목록을 조회
	Cart selectList(int memNo);
	
	ArrayList<Cart> selectCart(int memNo);
	
	// 장바구니 전체 삭제
	int allDeleteCart(int memNo);


	// 장바구니 수정
	int editCart(Cart c);

	// 장바구니 삭제
	int deleteCart(String[] cartNos);











	

}
	
	
	
	

