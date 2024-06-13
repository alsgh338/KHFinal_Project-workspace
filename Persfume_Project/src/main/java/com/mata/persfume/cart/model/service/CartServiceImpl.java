package com.mata.persfume.cart.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfume.cart.model.dao.CartDao;
import com.mata.persfume.cart.model.vo.Cart;
import com.mata.persfume.common.model.vo.PageInfo;

@Service
public class CartServiceImpl implements CartService {
	
	

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CartDao cartDao;
	
	//특정 회원의 장바구니 목록을 조회
	@Override
	public ArrayList<Cart> selectCart(int memNo) {
		return cartDao.selectCart(sqlSession,memNo);
	}

	//장바구니에 상품을 추가
	@Override
	public int addCart(Cart c) {
		return cartDao.addCart(sqlSession,c);
	}

	//특정 조건에 맞는 장바구니 목록을 조회
	@Override
	public ArrayList<Cart> cartList(Cart c) {
		return cartDao.cartList(sqlSession,c);
	}

	//장바구니 전체 삭제
	@Override
	public int allDeleteCart(int memNo) {
		return cartDao.allDeleteCart(sqlSession,memNo);
	}


	//특정 회원의 장바구니 목록을 페이징하여 조회
	@Override
	public ArrayList<Cart> selectList(PageInfo pi) {
		return cartDao.selectList(sqlSession,pi);
	}

	//특정 회원의 장바구니 목록 개수를 조회
	@Override
	public int selectListCount() {
		return cartDao.selectListCount(sqlSession);
	}

	//장바구니 수량 수정
	@Override
	public int editCart(Cart c) {
		return cartDao.editCart(sqlSession,c);
	}

	//장바구니 삭제
	@Override
	public int deleteCart(String[] cartNos) {
		return cartDao.deleteCart(sqlSession,cartNos);
	}

	@Override
	public Cart selectList(int memNo) {
		
		return cartDao.selectList(sqlSession, memNo);
	}
}
