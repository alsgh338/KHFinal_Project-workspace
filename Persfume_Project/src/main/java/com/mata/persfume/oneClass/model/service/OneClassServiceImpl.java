package com.mata.persfume.oneClass.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.oneClass.model.dao.OneClassDao;
import com.mata.persfume.oneClass.model.vo.OneClass;
import com.mata.persfume.oneClass.model.vo.OneClassImg;
import com.mata.persfume.oneClass.model.vo.OneClassReview;

@Service
public class OneClassServiceImpl implements OneClassService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private OneClassDao oneClassDao;

	@Override
	public int selectListCount() {
		return oneClassDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<OneClass> selectList(PageInfo pi) {
		return oneClassDao.selectList(sqlSession, pi);
	}


	@Override
	public OneClass selectOneClass(int oneClassNo) {
		return oneClassDao.selectOneClass(sqlSession, oneClassNo);
		
	}

	@Override
	public ArrayList<OneClassReview> selectReplyList(int oneClassNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(OneClassReview r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<OneClassImg> selectOneClassImgList(int oneClassNo) {
		return oneClassDao.selectOneClassImgList(sqlSession, oneClassNo);
	}
	
	
	
}
