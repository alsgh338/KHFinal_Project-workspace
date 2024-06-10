package com.mata.persfume.recommand.model.service;

import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.recommand.model.vo.Recommand;


public interface RecommandService {
	
	// 테스트 결과에 맞는 상품 리스트 조회
	Product selectList(Recommand r);
	
	// 테스트 실행 시 해당 유저에게 쿠폰 증정
	int insertCoupone(int memeNo);

}
