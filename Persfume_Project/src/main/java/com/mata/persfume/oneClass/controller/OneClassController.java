package com.mata.persfume.oneClass.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
import com.mata.persfume.member.model.vo.Member;
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
	
    @Value("${key.impKey}")
    private String apiKey;
 
    @Value("${key.impSecretkey}")
    private String secretKey;
	
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
	public String selectOneClass(int ocno,HttpSession session,
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
			session.setAttribute("alertMsg", "해당 클래스의 정보를 찾지 못했습니다.");
			return "redirect:/list.oc";
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
	public String reservationClass(int ocno, HttpSession session, Model model) {

		OneClass oc = oneClassService.selectOneClass(ocno);
		
		int rimitReservation = oneClassService.countReservation(((Member)session.getAttribute("loginMember")).getMemNo());
		
		
		if( oc.getCurrentStudent() >= oc.getStudentMaxNo()) {
			session.setAttribute("alertMsg", "클래스 정원이 모두 찼습니다.");
			return "redirect:/list.oc";
			
		} else {
			
			if(rimitReservation >= 4){
				session.setAttribute("alertMsg", "한 클래스에는 한 계정 당 최대 4명까지 예약 가능합니다 (현재 예약 내역 : 4/4)");
				return "redirect:/list.oc";
			}else {
				model.addAttribute("oc",oc);
				model.addAttribute("rimitReservation",rimitReservation);
				model.addAttribute("impApiKey",impApiKey);
				return "oneClass/oneClassReservationView";
			}
			
		}
		

		
		

	}
	
	@ResponseBody
	@PostMapping(value="regist.oc", produces="text/html; charset=UTF-8")
	public String insertOneClassReigst(OneClassRegist ocr)  throws Exception{
		
		OneClass oc = oneClassService.selectOneClass(ocr.getClassNo());
				
		if( oc.getCurrentStudent() >= oc.getStudentMaxNo()) {
			return "Fail";
			
		} else {
			try {
				
				int result = oneClassService.insertOneClassReigst(ocr);
				
				if(result > 0) { // DB에 해당 결제 정보 저장 성공-> 결제 O + 데이터 O => 성공
					System.out.println("결제 성공");
					return "Success";
					
				} else { // DB에 해당 결제 정보 저장 실패 -> 결제 O + 데이터 X => 기존 결제 정보 환불 진행
					
					String token = oneClassService.getToken(apiKey, secretKey);
					oneClassService.refundRequest(token, ocr.getRegistNo(), "결제 정보 저장 오류");
					System.out.println("결제 정보 저장 오류");
					return "Fail";
				}
				
			} catch (Exception e) {
				
				String token = oneClassService.getToken(apiKey, secretKey);
				oneClassService.refundRequest(token, ocr.getRegistNo(), e.getMessage());
				System.out.println("그냥 안되는듯" + e.getMessage());
				return "Fail";
			}
		}
		
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
	
		// 클래스 예약 취소
		@PostMapping("deleteRegist.oc")
		public String deleteRegist(String ocrno, String refundMsg, HttpSession session, Model model) {
			
			try {
				
				OneClassRegist oc = oneClassService.selectOneClassRegist(ocrno);
				
				System.out.println(apiKey + "  /  " +  secretKey);
				int result = oneClassService.deleteRegist(ocrno);
				
				if(result > 0) { // DB에 해당 결제 정보 수정 성공
					String token = oneClassService.getToken(apiKey, secretKey);
					oneClassService.refundRequest(token, ocrno, refundMsg);
					
					int rimitReservation = oneClassService.countReservation(((Member)session.getAttribute("loginMember")).getMemNo());
					
					if(rimitReservation <= 0 ) {
						oneClassService.deleteChatMem(oc);
					} 
					return "redirect:/";
					

					
				} else { // DB에 해당 결제 정보 수정 실패
					return "redirect:/";
				}
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return "redirect:/";
				
			}
		}
		
	// 클래스 리뷰 작성
	@PostMapping("insertReview.oc")
	public String insertReview(OneClassReview ocr, HttpSession session, Model model) {
		
		System.out.println(ocr);
		
		int result = oneClassService.insertReview(ocr);
		
		if(result >= 0) { // 리뷰 작성 성공
			session.setAttribute("alertMsg", "리뷰를 성공적으로 작성하였습니다.");
		} else { // 리뷰 작성 실패
			session.setAttribute("alertMsg", "리뷰 작성에 실패했습니다.");
			
		}
		
		return "redirect:/myPage.me";
		
	}
		
		
		
		
		
}
