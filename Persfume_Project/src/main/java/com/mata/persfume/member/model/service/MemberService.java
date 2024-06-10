package com.mata.persfume.member.model.service;

import com.mata.persfume.member.model.vo.Member;

public interface MemberService {

	int idCheck(String checkId);
	
	int insertMember(Member m);
}
