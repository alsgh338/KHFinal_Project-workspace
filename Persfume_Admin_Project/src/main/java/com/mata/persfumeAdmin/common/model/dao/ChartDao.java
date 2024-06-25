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
		Integer result = sqlSession.selectOne("chartMapper.totalSales");
		
		System.out.println(result);
		
		return (result != null) ? result : 0;
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
	
	public ArrayList<Chart> scentSale(SqlSessionTemplate sqlSession, String note) {
		return (ArrayList)sqlSession.selectList("chartMapper.scentSale");

	}

	public ArrayList<Chart> productStock(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chartMapper.productStock");

	}

	public ArrayList<Integer> monthRefund(SqlSessionTemplate sqlSession) {
		ArrayList<Integer> list = new ArrayList<>();
		
		int refundClass = sqlSession.selectOne("chartMapper.monthRefundClass");
		list.add(refundClass);
		
		
		int refundProduct = sqlSession.selectOne("chartMapper.monthRefundProduct");
		list.add(refundClass);
		
		
		
		return list;

	} 
	
	// 대시보드 - 일일 접속자 수 Ajax용 DAO	
	public int visitorCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.visitorCount");
	}
}
