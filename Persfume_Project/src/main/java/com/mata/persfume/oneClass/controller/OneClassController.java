package com.mata.persfume.oneClass.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.common.template.Pagination;
import com.mata.persfume.oneClass.model.service.OneClassService;
import com.mata.persfume.oneClass.model.vo.OneClass;
import com.mata.persfume.oneClass.model.vo.OneClassImg;
import com.mata.persfume.oneClass.model.vo.OneClassRegist;
import com.mata.persfume.oneClass.model.vo.OneClassReview;

@Controller
public class OneClassController {
	
	@Autowired
	private OneClassService oneClassService;
	
	
	@Value("${key.kakaoMap}")
    private String kakakoMapApiKey;
	
	@Value("${key.imp}")
    private String impApiKey;
	
	//클래스 목록 조회 컨트롤러 
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
	
	
	// 클래스 상세 조회 컨트롤러
	@GetMapping("detail.oc")
	public String selectOneClass(int ocno,
									Model model) {
		
		OneClass oc = oneClassService.selectOneClass(ocno);
		oc.setClassDetail(oc.getClassDetail().replaceAll("\r\n", "<hr>").replaceAll("\r", "<hr>").replaceAll("\n", "<hr>"));
		
		
		if(oc != null) {
			ArrayList<OneClassImg> oci = oneClassService.selectOneClassImgList(ocno);

			model.addAttribute("oc",oc);
			model.addAttribute("oci",oci);
			model.addAttribute("kakakoMapApiKey",kakakoMapApiKey);
			
			
			return "oneClass/oneClassDetailView";
		} else {
			// 클래스 정보를 찾지 못했을 경우 에러페이지 or alert 메세지
			return "oneClass/oneClassDetailView";
		}

	}
	
	// 클래스 상세 조회 리뷰 Ajax 조회 컨트롤러
	@ResponseBody
	@PostMapping(value="review.oc", produces="application/json; charset=UTF-8")
	public String selectClassReviewList(int oneClassNo) {
		
		
		ArrayList<OneClassReview> list = oneClassService.selectClassReviewList(oneClassNo);
		return new Gson().toJson(list);
		
	}
	
	
	// 클래스 예약 화면 컨트롤러
	@GetMapping("reservation.oc")
	public String reservationClass(int ocno,Model model) {

		OneClass oc = oneClassService.selectOneClass(ocno);
		model.addAttribute("oc",oc);
		model.addAttribute("impApiKey",impApiKey);
		
	
		return "oneClass/oneClassReservationView";
	}
	
	@ResponseBody
	@PostMapping(value="regist.oc", produces="text/html; charset=UTF-8")
	public String insertOneClassReigst(OneClassRegist ocr)  throws Exception{
				
		int result = oneClassService.insertOneClassReigst(ocr);		
		
		return String.valueOf(result);
	}
	
	
	@GetMapping("complete.oc")
	public String selectOneClassReigst(String ocrno , Model model)  throws Exception{
		
		OneClassRegist ocr = oneClassService.selectOneClassRegist(ocrno);
		
		if(ocr != null) {
			OneClass oc = oneClassService.selectOneClass(ocr.getClassNo());
			model.addAttribute("ocr",ocr);
			model.addAttribute("oc",oc);
			return "oneClass/oneClassCompleteView";
		} else {
			return "oneClass/oneClassCompleteView";
		}

	}
}
