package com.mata.persfume.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mata.persfume.member.model.dao.MemberDao;
import com.mata.persfume.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public int idCheck(String checkId) {
		
		return memberDao.idCheck(sqlSession,checkId);
		
	}

	@Override
	@Transactional
	public int insertMember(Member m) {
		
		int result = memberDao.insertMember(sqlSession,m);
		
		return result;
	}

	@Override
	@Transactional
	public Member loginMember(Member m) {

		return memberDao.loginMember(sqlSession,m);
	}

	@Override
	@Transactional
	public int insertCoupon(int memNo) {
		
		return memberDao.insertCoupon(sqlSession,memNo);
	}

	@Override
	public int makeCoupon() {
		
		return memberDao.makeCoupon(sqlSession);
	}

	@Override
	public int updateMember(Member m) {
		
		return memberDao.updateMember(sqlSession, m);
	
	}
	
}
	
