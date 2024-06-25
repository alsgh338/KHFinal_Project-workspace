package com.mata.persfumeAdmin.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfumeAdmin.event.model.dao.EventDao;
import com.mata.persfumeAdmin.event.model.vo.Event;
import com.mata.persfumeAdmin.event.model.vo.EventImg;

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

	// 이벤트 상세 조회 (썸네일만)
	@Override
	public Event selectEventThumbnail(int eno) {
		return eventDao.selectEventThumbnail(sqlSession, eno);
	}

	// 이벤트 본문 내용 수정
	@Override
	public int modifyEvent(Event e) {
		return eventDao.modifyEvent(sqlSession, e);
	}

	// 이벤트 사진 수정
	@Override
	public int modifyEventImg(EventImg ei) {
		return eventDao.modifyEventImg(sqlSession, ei);
	}

	// 이벤트 작성
	@Override
	public int insertEvent(Event e) {
		return eventDao.insertEvent(sqlSession, e);
	}

	// 이벤트 작성 (이미지)
	@Override
	public int insertEventImg(EventImg ei) {
		return eventDao.insertEventImg(sqlSession, ei);
	}

	// 이벤트 삭제
	@Override
	public int deleteEvent(int eno) {
		return eventDao.deleteEvent(sqlSession, eno);
	}

	// 이벤트 복구
	@Override
	public int restoreEvent(int eno) {
		return eventDao.restoreEvent(sqlSession, eno);
	}

	// 기존 이미지 경로 불러오기 (썸네일)
	@Override
	public String getImgPathThumbnail(int eno) {
		return eventDao.getImgPathThumbnail(sqlSession, eno);
	}

	// 기존 이미지 경로 불러오기 (본문)
	@Override
	public String getImgPathContent(int eno) {
		return eventDao.getImgPathContent(sqlSession, eno);
	}
}
