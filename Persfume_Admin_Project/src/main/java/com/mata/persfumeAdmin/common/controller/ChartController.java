package com.mata.persfumeAdmin.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mata.persfumeAdmin.common.model.service.ChartService;
import com.mata.persfumeAdmin.common.model.vo.Chart;
import com.mata.persfumeAdmin.product.model.vo.OrderDetail;

@Controller
public class ChartController {

	@Autowired
	private ChartService chartService;
	
	
	@PostMapping("totalMember")
	@ResponseBody
	public int totalMember() {
		
		int result = chartService.totalMember();
		
		return result;
	}
	
	@PostMapping("totalSales")
	@ResponseBody
	public int totalSales() {
		
		int result = chartService.totalSales();
		
		return result;
	}
	
	@PostMapping("dailySales")
	@ResponseBody
	public int dailySales() {
		
		int result = chartService.dailySales();
		
		return result;
	}
	
	@PostMapping("weekAccess")
	@ResponseBody
	public ArrayList<Chart> weekAccess(){
		
		ArrayList<Chart> list = chartService.weekAccess(); 
		
		return list;
	}
	
	@PostMapping("weekSales")
	@ResponseBody
	public ArrayList<OrderDetail> weekSales(){
		
		ArrayList<OrderDetail> list = chartService.weekSales(); 
		
		System.out.println(list);
		
		return list;
	}
	
	
}
