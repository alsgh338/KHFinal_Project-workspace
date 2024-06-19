package com.mata.persfumeAdmin.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mata.persfumeAdmin.notice.model.dao.NoticeDao;
import com.mata.persfumeAdmin.notice.model.vo.Notice;


@Service
public class NoticeServiceImpl implements NoticeService {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;
	


	@Override
	public ArrayList<Notice> selectList() {
		
		return noticeDao.selectList(sqlSession);
	}

	
	@Override
	@Transactional
	public int insertNotice(Notice n) {
		
		return noticeDao.insertNotice(sqlSession, n);
	}

	@Override
	@Transactional
	public int increaseCount(int noticeNo) {
		
		return noticeDao.increaseCount(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		
		return noticeDao.selectNotice(sqlSession, noticeNo);
	}

	@Override
	@Transactional
	public int deleteNotice(int noticeNo) {
		
		return noticeDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	@Transactional
	public int updateNotice(Notice n) {
		
		return noticeDao.updateNotice(sqlSession, n);
	}



 
}
