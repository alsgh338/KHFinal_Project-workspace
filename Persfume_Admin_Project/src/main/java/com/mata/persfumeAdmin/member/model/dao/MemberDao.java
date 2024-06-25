package com.mata.persfumeAdmin.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfumeAdmin.member.model.vo.Member;

@Repository
public class MemberDao {

	public ArrayList<Member> selectMemberAll(SqlSessionTemplate sqlSession) {
		
		System.out.println("Dao 호출 잘 되나??");
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberAll");
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, int memNo) {
		
		return sqlSession.update("memberMapper.deleteMember", memNo);
	}

	public int aliveMember(SqlSessionTemplate sqlSession, int memNo) {
		
		return sqlSession.update("memberMapper.aliveMember", memNo);
	}
	

	

}
