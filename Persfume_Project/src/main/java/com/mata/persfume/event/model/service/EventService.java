package com.mata.persfume.event.model.service;

import java.util.ArrayList;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.event.model.vo.Event;
import com.mata.persfume.event.model.vo.EventImg;

public interface EventService {

	// 게시판 리스트 조회 서비스 + 페이징 처리
	// 게시글 총 갯수 조회
	int selectListCount();
	
	// 이벤트 리스트 조회
	ArrayList<Event> selectList(PageInfo pi);
	
	// 이벤트 작성
	int insertEvent(Event e);
	// 이벤트 작성 성공시 실행할 이미지 삽입
	int insertEventImg(EventImg ei);
	
	
	// 이벤트 상세 조회
	// 조회수 증가 먼저
	int increaseCount(int eventNo);
	// 이벤트 상세 조회
	Event selectEvent(int eventNo);
	
	
	
}
