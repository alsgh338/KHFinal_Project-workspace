package com.mata.persfume.oneClass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OneClassController {
	
	@GetMapping("list.oc")
	public String selectList() {
		return "oneClass/oneClassListView";
	}

}
