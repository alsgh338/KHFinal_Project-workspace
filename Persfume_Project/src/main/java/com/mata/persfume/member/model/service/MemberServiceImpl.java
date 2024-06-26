package com.mata.persfume.member.model.service;

import java.util.ArrayList;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mata.persfume.member.model.dao.MemberDao;
import com.mata.persfume.member.model.vo.Member;
import com.mata.persfume.member.model.vo.PWDmember;
import com.mata.persfume.oneClass.model.vo.OneClass;
import com.mata.persfume.oneClass.model.vo.OneClassRegist;
import com.mata.persfume.product.model.vo.Favorites;
import com.mata.persfume.product.model.vo.OrderDetail;
import com.mata.persfume.product.model.vo.ProductReview;

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
	@Transactional
	public int updateMember(Member m) {
		
		return memberDao.updateMember(sqlSession, m);
	
	}

	@Override
	@Transactional
	public int deleteMember(Member m) {
		
		return memberDao.deleteMember(sqlSession, m);
	}

	@Override
	public ArrayList<ProductReview> selectReview(int memNo) {
		
		return memberDao.selectReview(sqlSession, memNo);
	}

	@Override
	public String IDfind(String email) {
		
		return memberDao.IDfind(sqlSession, email);
	}

	@Override
	public int selectId(String ID) {
		
		return memberDao.selectId(sqlSession, ID);
	}

	@Override
	public int sendPWD(PWDmember pm1) {
		
		return memberDao.sendPWD(sqlSession,pm1);
	}

	@Override
	public int updatePwd(PWDmember pm) {
		
		return memberDao.updatePwd(sqlSession,pm);
	}

	@Override
	public ArrayList<Favorites> selectLike(int memNo) {
		
		return memberDao.selectLike(sqlSession,memNo);
	}

	@Override
	public ArrayList<OrderDetail> selectOrder(int memNo) {
		
		return memberDao.selectOrder(sqlSession,memNo);
	}

	@Override
	public ArrayList<OneClassRegist> selectClass(int memNo) {
		
		return memberDao.selectClass(sqlSession,memNo);
	}

	@Override
	public ArrayList<OneClass> selectClassAbout(ArrayList<OneClassRegist> registlist) {
		
		return memberDao.selectClassAbout(sqlSession,registlist);
	}
	
	@Transactional
	@Override
	public int insertVisitCount(Date today) {
		
		return memberDao.insertVisitCount(sqlSession, today);
		
	}

	@Override
	public int selectEmail(String email) {
		
		return memberDao.selectEmail(sqlSession, email);
	}
	
}
	
