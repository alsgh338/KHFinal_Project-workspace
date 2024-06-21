package com.mata.persfume.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.notice.model.dao.NoticeDao;
import com.mata.persfume.notice.model.vo.Notice;


@Service
public class NoticeServiceImpl implements NoticeService {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public int selectListCount() {
		
		return noticeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		
		return noticeDao.selectList(sqlSession, pi);
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


    @Override
    public int getSearchListCount(String searchType, String keyword) {
        return noticeDao.getSearchListCount(sqlSession,searchType, keyword);
    }

    @Override
    public ArrayList<Notice> searchNoticeList(PageInfo pi, String searchType, String keyword) {
        return noticeDao.searchNoticeList(sqlSession,pi, searchType, keyword);
    }

	// 메인화면에 표시할 공지 (최신순 5개) - 2024-06-21 윤민호
	@Override
	public ArrayList<Notice> showMainNotice() {
		return noticeDao.showMainNotice(sqlSession);
	}


}
