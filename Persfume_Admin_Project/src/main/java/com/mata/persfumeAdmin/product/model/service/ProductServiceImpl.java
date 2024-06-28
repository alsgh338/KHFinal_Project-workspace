package com.mata.persfumeAdmin.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfumeAdmin.product.model.dao.ProductDao;
import com.mata.persfumeAdmin.product.model.vo.OrderDetail;
import com.mata.persfumeAdmin.product.model.vo.OrderProduct;
import com.mata.persfumeAdmin.product.model.vo.Product;
import com.mata.persfumeAdmin.product.model.vo.ProductImg;
import com.mata.persfumeAdmin.product.model.vo.ProductReview;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public ArrayList<Product> selectAllproduct() {
		
		System.out.println("상품 전체 조회 서비스");
		
		return productDao.selectAllproduct(sqlSession);
	}

	@Override
	public ArrayList<Product> selectProduct(int productNo) {
		
		System.out.println("상품 상세조회 서비스");
		
		return productDao.selectProduct(sqlSession, productNo);
	}

	@Override
	public int insertProduct(Product p) {
		
		System.out.println("상품 추가 서비스 ");
		
		return productDao.insertProduct(sqlSession, p);
	}

	@Override
	public int insertProductImg(ProductImg pi) {
		
		System.out.println("상품 이미지 추가 서비스");
		
		return  productDao.insertProductImg(sqlSession, pi);
	}

	@Override
	public ArrayList<ProductImg> selectProductpi(int productNo) {
		
		return  productDao.selectProductpi(sqlSession, productNo);
	}

	@Override
	public int deleteProduct(int productNo) {
		
		System.out.println("상품 삭제 서비스");
		
		return productDao.deleteProduct(sqlSession, productNo);
	}

	@Override
	public int productUpdate(Product p) {
		
		return productDao.productUpdate(sqlSession, p);
	}

	@Override
	public int productImgUpdate(ProductImg pi) {
		
		return productDao.productImgUpdate(sqlSession, pi);
	}

	@Override
	public ArrayList<ProductReview> selectAllreview() {
		
		return productDao.selectAllreview(sqlSession);
	}

	@Override
	public int reviewDelete(int reviewNo) {
		
		return productDao.reviewDelete(sqlSession,reviewNo);
	}

	@Override
	public int productImgdele(String delimgPath) {
		
		return productDao.productImgdele(sqlSession, delimgPath);
	}

	@Override
	public int insertProductImg2(ProductImg pi2) {
		
		return productDao.insertProductImg2(sqlSession, pi2);
	}

	@Override
	public ArrayList<OrderDetail> selectOrderDetail(int mno) {
		return productDao.selectOrderDetail(sqlSession, mno);
	}

	@Override
	public ArrayList<OrderProduct> selectOrderProduct1(int ono) {
		return productDao.selectOrderProduct1(sqlSession, ono);
	}

	@Override
	public Product selectProduct1(int pno) {
		return productDao.selectProduct1(sqlSession, pno);
	}

	@Override
	public int orderDelivery(int ono) {
		return productDao.orderDelivery(sqlSession, ono);
	}

	@Override
	public int doRefund(int odId) {
		return productDao.doRefund(sqlSession, odId);
	}

	@Override
	public ArrayList<OrderDetail> selectOrderDetail1() {
		return productDao.selectOrderDetail1(sqlSession);
	}
	
	



}
