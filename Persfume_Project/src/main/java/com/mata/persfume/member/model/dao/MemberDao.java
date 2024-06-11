package com.mata.persfume.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.member.model.vo.Member;

@Repository
public class MemberDao {

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		
		return sqlSession.selectOne("memberMapper.idCheck",checkId);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertCoupon(SqlSessionTemplate sqlSession, int memNo) {
		
		return sqlSession.insert("memberMapper.insertCoupon", memNo);
	}
	
	
	public int makeCoupon(SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("memberMapper.makeCoupon");
	}
}
