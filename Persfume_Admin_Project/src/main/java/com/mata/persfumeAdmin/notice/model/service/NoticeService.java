package com.mata.persfumeAdmin.notice.model.service;

import java.util.ArrayList;


import com.mata.persfumeAdmin.notice.model.vo.Notice;




//import com.kh.spring.common.model.vo.PageInfo;

public  interface NoticeService {


	// 공지글  리스트 조회
	ArrayList<Notice> selectList();

	
	// 공지글 작성하기 서비스
	int insertNotice(Notice n);


	// 공지글  조회수 증가
	int increaseCount(int noticeNo);
	// 공지글  상세조회 서비스
	Notice selectNotice(int noticeNo);
	
	// 공지글 삭제 서비스
	int deleteNotice(int noticeNo);
	
	// 공지글 수정 서비스
	int updateNotice(Notice n);


	//공지글 복구
	int restoreNotice(int nno);


}






