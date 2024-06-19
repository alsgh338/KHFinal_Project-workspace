package com.mata.persfumeAdmin.event.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfumeAdmin.event.model.vo.Event;

@Repository
public class EventDao {

	// 이벤트 리스트 조회
	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("eventMapper.selectEventList");
	}

	// 이벤트 상세 조회
	public Event selectEventDetail(SqlSessionTemplate sqlSession, int eno) {
		Event ev = sqlSession.selectOne("eventMapper.selectEventDetail", eno);
		System.out.println(ev);
		return ev;
	}

}
