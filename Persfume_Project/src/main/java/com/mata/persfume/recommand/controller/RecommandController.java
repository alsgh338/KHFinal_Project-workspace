package com.mata.persfume.recommand.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mata.persfume.member.model.vo.Member;

@Controller
public class RecommandController {
	
	@GetMapping(value="test.rc")
	public String selectList() {
		return "recommand/recommand";
	}
	
	@ResponseBody
	@PostMapping(value="test.rc", produces="application/json; charset=UTF-8")
	public String selectPerfumeList() {
		
		ArrayList<Member> list = new ArrayList<>();
		list.add(new Member());
		list.add(new Member());
		list.add(new Member());
		list.add(new Member());
		list.add(new Member());
		
		return new Gson().toJson(list);
		
	}

}
