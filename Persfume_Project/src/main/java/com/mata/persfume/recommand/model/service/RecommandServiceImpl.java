package com.mata.persfume.recommand.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.recommand.model.dao.RecommandDao;
import com.mata.persfume.recommand.model.vo.Recommand;

@Service
public class RecommandServiceImpl implements RecommandService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RecommandDao recommandDao;

	@Override
	public Product selectList(Recommand r) {

		return recommandDao.selectList(sqlSession, r);
		
	}

	@Override
	@Transactional
	public int insertCoupone(int memNo) {
		return recommandDao.insertCoupone(sqlSession, memNo);
	}
	

}
