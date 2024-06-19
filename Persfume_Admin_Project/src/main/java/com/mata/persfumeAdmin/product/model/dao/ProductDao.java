package com.mata.persfumeAdmin.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfumeAdmin.product.model.vo.Product;

@Repository
public class ProductDao {

	public ArrayList<Product> selectAllproduct(SqlSessionTemplate sqlSession) {
		
		System.out.println("상품 전체조회 DAO");
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList");
	}

	
}
