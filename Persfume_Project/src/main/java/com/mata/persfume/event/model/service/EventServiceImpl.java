package com.mata.persfume.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.event.model.dao.EventDao;
import com.mata.persfume.event.model.vo.Event;
import com.mata.persfume.event.model.vo.EventImg;

@Service
public class EventServiceImpl implements EventService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EventDao eventDao;
	
	@Override
	public int selectExpiredListCount() {
		return eventDao.selectExpiredListCount(sqlSession);
	}

	@Override
	public int selectOngoingListCount() {
		return eventDao.selectOngoingListCount(sqlSession);
	}

	@Override
	public int selectScheduledListCount() {
		return eventDao.selectScheduledListCount(sqlSession);
	}

	//////////////////////////////
	@Override
	public ArrayList<Event> selectExpiredList(PageInfo pi) {
		return eventDao.selectExpiredList(sqlSession, pi);
	}

	@Override
	public ArrayList<Event> selectOngoingList(PageInfo pi) {
		return eventDao.selectOngoingList(sqlSession, pi);
	}

	@Override
	public ArrayList<Event> selectScheduledList(PageInfo pi) {
		return eventDao.selectScheduledList(sqlSession, pi);
	}

	@Override
	public ArrayList<Event> selectEventList() {
		return eventDao.selectEventList(sqlSession);
	}
	// 썸네일 + 텍스트 insert
	@Override
	@Transactional
	public int insertEvent(Event e) {
		return eventDao.insertEvent(sqlSession, e);
	}
	
	// 본문 이미지 insert
	@Override
	@Transactional
	public int insertEventImg(EventImg ei) {
		return eventDao.insertEventImg(sqlSession, ei);
	}
	
	@Override
	public int increaseCount(int eno) {
		return eventDao.increaseCount(sqlSession, eno);
	}

	@Override
	public Event selectEvent(int eno) {
		return eventDao.selectEvent(sqlSession, eno);
	}


	

	


}
