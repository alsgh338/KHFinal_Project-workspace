package com.mata.persfume.oneClass.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.oneClass.model.vo.OneClass;
import com.mata.persfume.oneClass.model.vo.OneClassImg;

@Repository
public class OneClassDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("oneClassMapper.selectListCount");
	}
	
	public ArrayList<OneClass> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("oneClassMapper.selectList", null, rowBounds);
		
	}
	
	public OneClass selectOneClass(SqlSessionTemplate sqlSession, int oneClassNo) {
		return sqlSession.selectOne("oneClassMapper.selectOneClass", oneClassNo);
	}
	
	public ArrayList<OneClassImg> selectOneClassImgList(SqlSessionTemplate sqlSession ,int oneClassNo) {
		return (ArrayList)sqlSession.selectList("oneClassMapper.",oneClassNo);
	}

}
