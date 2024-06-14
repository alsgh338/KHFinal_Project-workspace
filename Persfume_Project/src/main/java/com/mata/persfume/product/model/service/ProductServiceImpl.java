package com.mata.persfume.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.product.model.dao.ProductDao;
import com.mata.persfume.product.model.vo.Cart;
import com.mata.persfume.product.model.vo.Coupon;
import com.mata.persfume.product.model.vo.MemCoupon;
import com.mata.persfume.product.model.vo.OrderDetail;
import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.product.model.vo.ProductImg;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ProductDao productDao;
	
	
	@Override
	public int selectListCount() {
	
		return productDao.selectListCount(sqlSession);
		
	}

	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		
		return productDao.selectList(sqlSession, pi);
	}

	@Override
	public ArrayList<ProductImg> selectImgList(PageInfo pi) {

		return productDao.selectImgList(sqlSession, pi);
	}

	@Override
	public Product selectProduct(int pno) {
		
		return productDao.selectProduct(sqlSession, pno);
	}

	@Override
	public ArrayList<ProductImg> selectProductImgList(int pno) {
	
		return productDao.selectProductImgList(sqlSession, pno);
	}

	@Override
	public ProductImg selectProductImg(int pno) {
		
		return productDao.selectProductImg(sqlSession, pno);
	}

	@Override
	public ArrayList<MemCoupon> searchCoupon(int mno) {
		
		return productDao.searchCoupon(sqlSession, mno);
	}

	@Override
	public Coupon searchCouponName(int cno) {
		
		return productDao.searchCouponName(sqlSession, cno);
	}

	@Override
	public int orderComplete(String merchant_uid, int amount, String want5, int mno) {
	
		return productDao.orderComplete(sqlSession, merchant_uid, amount, want5, mno);
	}

	@Override
	public OrderDetail orderview(String merchant_uid) {
		
		return productDao.orderview(sqlSession, merchant_uid);
	}

	@Override
	public int cartAdd(int account, int quantity, int mno, int pno) {
		
		return productDao.cartAdd(sqlSession, account, quantity, mno, pno );
	}

	@Override
	public ArrayList<Cart> selectCartList(int mno) {
		
		return productDao.selectCartList(sqlSession, mno);
	}

	@Override
	public int cartdelete(int deletecartNo) {
		
		return productDao.cartdelete(sqlSession, deletecartNo);
	}

	@Override
	public int cartUpdate(int basketNo, int quantity, int price) {
		
		return  productDao.cartUpdate(sqlSession, basketNo, quantity, price);
	}

	@Override
	public Cart cartSelect(int basketNo) {
		
		return  productDao.cartSelect(sqlSession, basketNo);
	}




}
