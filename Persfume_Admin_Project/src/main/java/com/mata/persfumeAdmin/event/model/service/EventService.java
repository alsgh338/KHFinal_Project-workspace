package com.mata.persfumeAdmin.event.model.service;

import java.util.ArrayList;

import com.mata.persfumeAdmin.event.model.vo.Event;
import com.mata.persfumeAdmin.event.model.vo.EventImg;

public interface EventService {

	// 이벤트 리스트 조회
	ArrayList<Event> selectEventList();

	// 이벤트 상세 조회
	Event selectEventDetail(int eno);
	
	// 이벤트 상세 조회 (썸네일만)
	Event selectEventThumbnail(int eno);

	// 이벤트 내용물 수정
	int modifyEvent(Event e);

	// 이벤트 이미지 수정
	int modifyEventImg(EventImg ei);

	// 이벤트 작성
	int insertEvent(Event e);
	
	// 이벤트 작성 (이미지)
	int insertEventImg(EventImg ei);

	// 이벤트 삭제
	int deleteEvent(int eno);
	
	// 이벤트 복구
	int restoreEvent(int eno);

}
