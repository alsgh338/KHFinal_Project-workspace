package com.mata.persfume.oneClass.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.oneClass.model.vo.OneClass;
import com.mata.persfume.oneClass.model.vo.OneClassImg;
import com.mata.persfume.oneClass.model.vo.OneClassRegist;
import com.mata.persfume.oneClass.model.vo.OneClassReview;

@Repository
public class OneClassDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("oneClassMapper.selectListCount");
	}
	
	public ArrayList<OneClass> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		ArrayList<OneClass> list= (ArrayList)sqlSession.selectList("oneClassMapper.selectList", null, rowBounds);
		return list;
		
	}
	
	public OneClass selectOneClass(SqlSessionTemplate sqlSession, int oneClassNo) {
		return sqlSession.selectOne("oneClassMapper.selectOneClass", oneClassNo);
	}
	
	public ArrayList<OneClassImg> selectOneClassImgList(SqlSessionTemplate sqlSession ,int oneClassNo) {
		return (ArrayList)sqlSession.selectList("oneClassMapper.selectOneClassImgList",oneClassNo);
	}
	
	public ArrayList<OneClassReview> selectClassReviewList(SqlSessionTemplate sqlSession, int oneClassNo){
		return (ArrayList)sqlSession.selectList("oneClassMapper.selectClassReviewList",oneClassNo);

	}

	public int insertOneClassReigst(SqlSessionTemplate sqlSession, OneClassRegist orc) {
		 return sqlSession.insert("oneClassMapper.insertOneClassReigst", orc);
	}
	
	public OneClassRegist selectOneClassRegist(SqlSessionTemplate sqlSession, String ocrno) {
		return sqlSession.selectOne("oneClassMapper.selectOneClassRegist", ocrno);
	}
	
	public int deleteRegist(SqlSessionTemplate sqlSession ,String ocrno) {
		return sqlSession.update("oneClassMapper.deleteRegist", ocrno);

	}

	

}
