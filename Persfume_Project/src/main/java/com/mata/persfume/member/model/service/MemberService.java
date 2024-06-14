package com.mata.persfume.member.model.service;

import java.util.ArrayList;

import com.mata.persfume.member.model.vo.Member;
import com.mata.persfume.product.model.vo.ProductReview;

public interface MemberService {

	int idCheck(String checkId);
	
	int insertMember(Member m);
	
	Member loginMember(Member m);
	
	int insertCoupon(int memNo);
	
	int makeCoupon();
	
	int updateMember(Member m);
	
	int deleteMember(Member m);
	
 ArrayList<ProductReview> selectReview(int memNo);
}
