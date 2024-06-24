package com.mata.persfumeAdmin.member.model.service;

import java.util.ArrayList;

import com.mata.persfumeAdmin.member.model.vo.Member;

public interface MemberService {
	
	ArrayList<Member> selectAllmember();

	int deleteMember(int memNo);

	int aliveMember(int memNo);
	
	
	// 대시보드 일일 접속자 수 용 서비스
	int visitorCount();

}
