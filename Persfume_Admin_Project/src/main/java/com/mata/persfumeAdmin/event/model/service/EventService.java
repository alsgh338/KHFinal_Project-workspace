package com.mata.persfumeAdmin.event.model.service;

import java.util.ArrayList;

import com.mata.persfumeAdmin.event.model.vo.Event;

public interface EventService {

	// 이벤트 리스트 조회
	ArrayList<Event> selectEventList();

	// 이벤트 상세 조회
	Event selectEventDetail(int eno);

}
