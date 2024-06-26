package com.mata.persfume.member.model.service;

import java.util.ArrayList;
import java.util.Date;

import com.mata.persfume.member.model.vo.Member;
import com.mata.persfume.member.model.vo.PWDmember;
import com.mata.persfume.oneClass.model.vo.OneClass;
import com.mata.persfume.oneClass.model.vo.OneClassRegist;
import com.mata.persfume.product.model.vo.Favorites;
import com.mata.persfume.product.model.vo.OrderDetail;
import com.mata.persfume.product.model.vo.ProductReview;

public interface MemberService {

	int idCheck(String checkId);
	
	int insertMember(Member m);
	
	Member loginMember(Member m);
	
	int insertCoupon(int memNo);
	
	int makeCoupon();
	
	int updateMember(Member m);
	
	int deleteMember(Member m);
	
	ArrayList<ProductReview> selectReview(int memNo);
	
	String IDfind(String email);
	
	int selectId(String ID);

	int sendPWD(PWDmember pm1);

	int updatePwd(PWDmember pm);

	ArrayList<Favorites> selectLike(int memNo);
	
	ArrayList<OrderDetail> selectOrder(int memNo);

	ArrayList<OneClassRegist> selectClass(int memNo);

	ArrayList<OneClass> selectClassAbout(ArrayList<OneClassRegist> registlist);

	int insertVisitCount(Date today);

	int selectEmail(String email);

}
