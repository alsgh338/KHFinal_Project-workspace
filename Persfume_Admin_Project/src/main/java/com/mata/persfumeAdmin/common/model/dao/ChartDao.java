package com.mata.persfumeAdmin.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfumeAdmin.common.model.vo.Chart;
import com.mata.persfumeAdmin.product.model.vo.OrderDetail;

@Repository
public class ChartDao {

	public int totalMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chartMapper.totalMember");
	}

	public int totalSales(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chartMapper.totalSales");
	}

	public int dailyAccess(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chartMapper.dailyAccess");
	}

	public int dailySales(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chartMapper.dailySales");
	}

	public ArrayList<Chart> weekAccess(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("chartMapper.weekAccess");
	}

	public ArrayList<OrderDetail> weekSales(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chartMapper.weekSales");
	}
}
