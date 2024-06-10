package com.mata.persfume.oneClass.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.common.template.Pagination;
import com.mata.persfume.oneClass.model.service.OneClassService;
import com.mata.persfume.oneClass.model.vo.OneClass;
import com.mata.persfume.oneClass.model.vo.OneClassImg;

@Controller
public class OneClassController {
	
	@Autowired
	private OneClassService oneClassService;
	
	@GetMapping("list.oc")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = oneClassService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 9;
		
		// PageInfo 객체 만들어내기
		PageInfo pi 
			= Pagination.getPageInfo(listCount, 
								 	 currentPage, 
								 	 pageLimit, 
								 	 boardLimit);
		
		ArrayList<OneClass> list = oneClassService.selectList(pi);  
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "oneClass/oneClassListView";
	}
	
	@GetMapping("detail.bo")
	public String selectBoard(int ocno,
									Model model) {
		
		OneClass oc = oneClassService.selectOneClass(ocno);
		
		if(oc != null) {
			ArrayList<OneClassImg> oci = oneClassService.selectOneClassImgList(ocno);
		}
		
		return "board/boardDetailView";
		
	}

}
