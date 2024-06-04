package com.mata.persfume.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	@GetMapping("enroll.me")
	public String memberEnrollform() {
		
		return "member/memberEnrollform";
		
	}

}
