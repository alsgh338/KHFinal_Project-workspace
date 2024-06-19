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
		return 0;
	}
	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		return null;
	}
	@Override
	public ArrayList<ProductImg> selectImgList(PageInfo pi) {
		return null;
	}
	@Override
	public Product selectProduct(int pno) {
		return null;
	}
	@Override
	public ArrayList<ProductImg> selectProductImgList(int pno) {
		return null;
	}
	@Override
	public ProductImg selectProductImg(int pno) {
		return null;
	}
	@Override
	public ArrayList<MemCoupon> searchCoupon(int mno) {
		return null;
	}
	@Override
	public Coupon searchCouponName(int cno) {
		return null;
	}
	@Override
	public int orderComplete(String merchant_uid, int amount, String want5, int mno) {
		return 0;
	}
	@Override
	public OrderDetail orderview(String merchant_uid) {
		return null;
	}
	@Override
	public int cartAdd(int account, int quantity, int mno, int pno) {
		return 0;
	}
	@Override
	public ArrayList<Cart> selectCartList(int mno) {
		return null;
	}
	@Override
	public int cartdelete(int deletecartNo) {
		return 0;
	}
	@Override
	public int cartUpdate(int basketNo, int quantity, int price) {
		return 0;
	}
	@Override
	public Cart cartSelect(int basketNo) {
		return null;
	}



}
