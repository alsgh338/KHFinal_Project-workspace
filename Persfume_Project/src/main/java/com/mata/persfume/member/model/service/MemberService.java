package com.mata.persfume.member.model.service;

import com.mata.persfume.member.model.vo.Member;

public interface MemberService {

	int idCheck(String checkId);
	
	int insertMember(Member m);
	
	Member loginMember(Member m);
	
	int insertCoupon(int memNo);
	
	int makeCoupon();
	
	int updateMember(Member m);
}
