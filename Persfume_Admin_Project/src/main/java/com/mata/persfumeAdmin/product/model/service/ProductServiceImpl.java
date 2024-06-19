package com.mata.persfumeAdmin.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfumeAdmin.product.model.dao.ProductDao;
import com.mata.persfumeAdmin.product.model.vo.Product;

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


}
