package com.mata.persfume.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.event.model.dao.EventDao;
import com.mata.persfume.event.model.vo.Event;

@Service
public class EventServiceImpl implements EventService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EventDao eventDao;
	
	
	@Override
	public int selectListCount() {
		return eventDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Event> selectList(PageInfo pi) {
		return eventDao.selectList(sqlSession, pi);
	}

	@Override
	public int increaseCount(int eventNo) {
		return 0;
	}

	@Override
	public Event selectEvent(int eventNo) {
		return null;
	}

}
