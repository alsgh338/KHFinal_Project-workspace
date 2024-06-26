package com.mata.persfumeAdmin.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfumeAdmin.common.model.dao.ChartDao;
import com.mata.persfumeAdmin.common.model.vo.Chart;
import com.mata.persfumeAdmin.product.model.vo.OrderDetail;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	private ChartDao chartDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int totalMember() {
		return chartDao.totalMember(sqlSession);
	}

	@Override
	public int totalSales() {
		return chartDao.totalSales(sqlSession);
	}

	@Override
	public int dailyAccess() {
		return chartDao.dailyAccess(sqlSession);
	}

	@Override
	public int dailySales() {
		return chartDao.dailySales(sqlSession);
	}

	@Override
	public ArrayList<Chart> weekAccess() {
		return chartDao.weekAccess(sqlSession);
	}

	@Override
	public ArrayList<OrderDetail> weekSales() {
		return chartDao.weekSales(sqlSession);
	}

	@Override
	public ArrayList<Chart> scentSale(String note) {
		return chartDao.scentSale(sqlSession, note);

	}

	@Override
	public ArrayList<Chart> productStock() {
		return chartDao.productStock(sqlSession);

	}

	@Override
	public ArrayList<Integer> monthRefund() {
		return chartDao.monthRefund(sqlSession);

	} 
	
	@Override
	public int visitorCount() {
		return chartDao.visitorCount(sqlSession);
	}

}
