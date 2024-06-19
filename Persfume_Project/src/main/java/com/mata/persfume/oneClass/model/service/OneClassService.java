package com.mata.persfume.oneClass.model.service;

import java.io.IOException;
import java.util.ArrayList;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.oneClass.model.vo.OneClass;
import com.mata.persfume.oneClass.model.vo.OneClassImg;
import com.mata.persfume.oneClass.model.vo.OneClassRegist;
import com.mata.persfume.oneClass.model.vo.OneClassReview;


public interface OneClassService {
	
	// 게시판 리스트 조회 서비스 + 페이징 처리
	// 게시글 총 갯수 조회
	int selectListCount();
	// 게시글 리스트 조회
	ArrayList<OneClass> selectList(PageInfo pi);
	
	// 게시글 상세조회 서비스
	// 게시글 상세 조회
	OneClass selectOneClass(int oneClassNo);
	
	// 게시글 첨부파일 조회
	ArrayList<OneClassImg> selectOneClassImgList(int oneClassNo);
	
	// 리뷰 리스트 조회 서비스 - ajax
	ArrayList<OneClassReview> selectClassReviewList(int oneClassNo);
	
	// 댓글 작성 서비스 - ajax
	int insertReply(OneClassReview r);
	
	// 결제 완료 후 결제 정보 Insert
	int insertOneClassReigst(OneClassRegist orc);
	
	// 클래스 신청 정보 조회
	OneClassRegist selectOneClassRegist(String ocrno);
	
	// 클래스 신청 취소
	int deleteRegist(String ocrno);
	
	
	// 결제 <-> 환불 관련 토큰 발급
	String getToken(String apiKey, String secretKey) throws IOException;
	
	// 토큰 및 주문 번호로 활불 진행
	void refundRequest(String access_token, String merchant_uid, String reason) throws IOException;
	
	
}
