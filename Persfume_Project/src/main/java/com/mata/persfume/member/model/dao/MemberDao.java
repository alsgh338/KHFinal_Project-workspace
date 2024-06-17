package com.mata.persfume.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.member.model.vo.Member;
import com.mata.persfume.member.model.vo.PWDmember;
import com.mata.persfume.product.model.vo.Favorites;
import com.mata.persfume.product.model.vo.OrderDetail;
import com.mata.persfume.product.model.vo.ProductReview;

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


	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember",m);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.deleteMember", m);
	}

	public ArrayList<ProductReview> selectReview(SqlSessionTemplate sqlSession, int memNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectReview", memNo);
	}

	public String IDfind(SqlSessionTemplate sqlSession, String email) {
		
		return sqlSession.selectOne("memberMapper.IDfind", email);
	}

	public int selectId(SqlSessionTemplate sqlSession, String ID) {
		
		return sqlSession.selectOne("memberMapper.selectId", ID);
	}

	public int sendPWD(SqlSessionTemplate sqlSession, PWDmember pm1) {
		return sqlSession.update("memberMapper.sendPWD", pm1);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, PWDmember pm) {
		
		return sqlSession.update("memberMapper.updatePwd", pm);
	}

	public ArrayList<Favorites> selectLike(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("memberMapper.selectLike", memNo);
	}

	public ArrayList<OrderDetail> selectOrder(SqlSessionTemplate sqlSession, int memNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectOrder", memNo);
	}
}
