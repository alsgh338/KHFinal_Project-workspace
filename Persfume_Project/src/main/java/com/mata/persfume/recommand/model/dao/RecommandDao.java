package com.mata.persfume.recommand.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.recommand.model.vo.Recommand;

@Repository
public class RecommandDao {
	
	public Product selectList(SqlSessionTemplate sqlSession,Recommand r) {

		
		return sqlSession.selectOne("recommandMapper.selectList",r);
		
	}
	
	public int insertCoupone(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.insert("recommandMapper.insertCoupone", memNo);
	}
	
	
	public int selectCoupon(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("recommandMapper.selectCoupon", memNo);
	}

	

}
