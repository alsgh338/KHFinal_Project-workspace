package com.mata.persfumeAdmin.member.model.service;

import java.util.ArrayList;

import com.mata.persfumeAdmin.member.model.vo.Member;

public interface MemberService {
	
	ArrayList<Member> selectAllmember();

	int deleteMember(int memNo);

}
