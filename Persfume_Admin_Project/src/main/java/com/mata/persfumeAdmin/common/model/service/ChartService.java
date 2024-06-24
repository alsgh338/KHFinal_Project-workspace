package com.mata.persfumeAdmin.common.model.service;

import java.util.ArrayList;

import com.mata.persfumeAdmin.common.model.vo.Chart;
import com.mata.persfumeAdmin.product.model.vo.OrderDetail;

public interface ChartService {

	// 총 회원 수
	int totalMember();
	
	// 총 판매 액
	int totalSales();
	
	// 일일 접속자 수 - 보류
	int dailyAccess();
	
	// 일일 판매 건 수
	int dailySales();

	// 최근 일주일 접속자 추이
	ArrayList<Chart> weekAccess();
	
	// 최근 일주일 매출 추이
	ArrayList<OrderDetail> weekSales();

}
