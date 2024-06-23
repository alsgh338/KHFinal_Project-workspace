package com.mata.persfumeAdmin.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfumeAdmin.product.model.vo.Product;
import com.mata.persfumeAdmin.product.model.vo.ProductImg;

@Repository
public class ProductDao {

	public ArrayList<Product> selectAllproduct(SqlSessionTemplate sqlSession) {
		
		System.out.println("상품 전체조회 DAO");
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList");
	}

	public ArrayList<Product> selectProduct(SqlSessionTemplate sqlSession, int productNo) {
		
		System.out.println("상품상세조회");
		
		return (ArrayList)sqlSession.selectList("productMapper.selectProduct", productNo);
	}

	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		
		System.out.println("상품추가");
		
		return sqlSession.insert("productMapper.insertProduct", p);
		
	}

	public int insertProductImg(SqlSessionTemplate sqlSession, ProductImg pi) {
		
		System.out.println("상품 사진 추가");
		
		return sqlSession.insert("productMapper.insertProductImg",pi);
	}

	public ArrayList<ProductImg> selectProductpi(SqlSessionTemplate sqlSession, int productNo) {
		
		System.out.println("상품 사진 조회");
		
		return (ArrayList)sqlSession.selectList("productMapper.selectProductpi",productNo);
	}

	public int deleteProduct(SqlSessionTemplate sqlSession, int productNo) {
	
		System.out.println("상품 삭제 DAO ");
		return sqlSession.update("productMapper.deleteProduct",productNo);
	}

	public int productUpdate(SqlSessionTemplate sqlSession, Product p) {
	
		System.out.println("상품 정보 수정하기 DAO");
		
		return sqlSession.update("productMapper.udpateProduct", p);
	}

	
}
