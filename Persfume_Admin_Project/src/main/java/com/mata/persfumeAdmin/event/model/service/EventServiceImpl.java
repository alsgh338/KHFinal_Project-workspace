package com.mata.persfumeAdmin.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfumeAdmin.event.model.dao.EventDao;
import com.mata.persfumeAdmin.event.model.vo.Event;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EventDao eventDao;

	// 이벤트 리스트 조회
	@Override
	public ArrayList<Event> selectEventList() {
		return eventDao.selectEventList(sqlSession);
	}

	// 이벤트 상세 조회
	@Override
	public Event selectEventDetail(int eno) {
		return eventDao.selectEventDetail(sqlSession, eno);
	}
}
