package com.mata.persfume.recommand.controller;

import javax.servlet.http.HttpSession;

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
	public String selectList(Recommand r, int memNo, HttpSession session) {
		
		r.setGenderAnswer(r.getGenderAnswer().toUpperCase());
		System.out.println(r);
		

		
		Product p =  recommandService.selectList(r);
		System.out.println(p);
		
		
		if(p != null) {
		
			int countCoupon = recommandService.selectCoupon(memNo);
			
			System.out.println(countCoupon);
			
			if(countCoupon <= 0) {
				int result = recommandService.insertCoupone(memNo);
				session.setAttribute("alertMsg", "첫 테스트 쿠폰이 발급되었습니다.");
			}
				return new Gson().toJson(p);
		} else {
			System.out.println("null 넘어옴");
		}
		
		return null;
		
	}

}
