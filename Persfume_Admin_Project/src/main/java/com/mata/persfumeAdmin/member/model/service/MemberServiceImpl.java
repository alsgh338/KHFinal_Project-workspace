package com.mata.persfumeAdmin.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfumeAdmin.member.model.dao.MemberDao;
import com.mata.persfumeAdmin.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public ArrayList<Member> selectAllmember() {
		
		System.out.println("회원 전체 조회 서비스");
		
		return memberDao.selectMemberAll(sqlSession);
	}

	@Override
	public int deleteMember(int memNo) {
		
		System.out.println("회원 탈퇴시키기 서비스");
		
		return memberDao.deleteMember(sqlSession, memNo);
	}

	@Override
	public int aliveMember(int memNo) {
		
		System.out.println("회원 복구시키기 서비스");
		
		return memberDao.aliveMember(sqlSession,memNo);
		
	}


	
	
	

}
