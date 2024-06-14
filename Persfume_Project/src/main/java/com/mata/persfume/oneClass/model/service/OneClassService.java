package com.mata.persfume.oneClass.model.service;

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
	
	
}
