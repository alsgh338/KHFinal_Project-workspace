package com.mata.persfumeAdmin.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfumeAdmin.product.model.vo.Product;
import com.mata.persfumeAdmin.product.model.vo.ProductImg;
import com.mata.persfumeAdmin.product.model.vo.ProductReview;

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
		
		return sqlSession.update("productMapper.updateProduct", p);
	}

	public int productImgUpdate(SqlSessionTemplate sqlSession, ProductImg pi) {
		
		System.out.println("상품 사진 수정하기 DAO");
		
		return sqlSession.update("productMapper.updateProductImg",pi);
	}

	public ArrayList<ProductReview> selectAllreview(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("productMapper.selectAllreview");

	}

	public int reviewDelete(SqlSessionTemplate sqlSession, int reviewNo) {
		
		return sqlSession.update("productMapper.reviewDelete",reviewNo);
	}

	public int productImgdele(SqlSessionTemplate sqlSession, String delimgPath) {
		
		return sqlSession.delete("productMapper.productImgdele3",delimgPath);
	}
	
	public int insertProductImg2(SqlSessionTemplate sqlSession, ProductImg pi) {
		
		System.out.println("상품 사진 바꿔넣기 DAO");
		
		return sqlSession.insert("productMapper.insertProductImg2",pi);
	}

	
}
