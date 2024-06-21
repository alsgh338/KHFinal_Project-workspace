package com.mata.persfume.recommand.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.recommand.model.service.RecommandServiceImpl;
import com.mata.persfume.recommand.model.vo.Recommand;

@Controller
public class RecommandController {
	
	@Autowired
	private RecommandServiceImpl recommandService;
	
	@GetMapping(value="test.rc")
	public String selectList() {
		return "recommand/recommand";
	}
	
	@ResponseBody
	@PostMapping(value="result.rc", produces="application/json; charset=UTF-8")
	public String selectList(Recommand r, int memNo) {
		
		
		Product p =  recommandService.selectList(r);
		
		
		if(p != null) {
			int countCoupon = recommandService.selectCoupon(memNo);
			
			if(countCoupon <= 0) {
				recommandService.insertCoupone(memNo);
			}
				return new Gson().toJson(p);
		}
		
		return null;
		
	}

}
