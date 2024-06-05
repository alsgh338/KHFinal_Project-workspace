package com.mata.persfume.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.product.model.dao.ProductDao;
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




}
