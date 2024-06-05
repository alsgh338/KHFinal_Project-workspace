package com.mata.persfume.event.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.common.template.FileRename;
import com.mata.persfume.common.template.Pagination;
import com.mata.persfume.event.model.service.EventService;
import com.mata.persfume.event.model.vo.Event;
import com.mata.persfume.event.model.vo.EventImg;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;
	
	// ongoing과 finished로 나눠서 페이지 분할
	@GetMapping("list.ev")
	public String eventList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = eventService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 8;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Event> list = eventService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "event/eventListView";
	}
	
	@GetMapping("detail.ev")
	public ModelAndView eventDetailView(int eno, ModelAndView mv) {
		
		int result = eventService.increaseCount(eno);
		
		if(result > 0) { // 조회수 증가에 성공하면 상세내용 가져오기
			
			Event e = eventService.selectEvent(eno);
			
			mv.addObject("e", e).setViewName("event/eventDetailView");
		} else {
			
			mv.addObject("errorMsg", "이벤트 상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@GetMapping("enrollForm.ev")
	public String eventEnrollForm() {
		
		return "event/eventEnrollForm";
	}
	
	// 로그인 정보 가져와서 관리자 아니면 실행 안되도록 해야함
	@PostMapping("insert.ev")
	public ModelAndView insertEvent(Event e, EventImg ei1, EventImg ei2, MultipartFile[] upfiles, HttpSession session, ModelAndView mv) {

		String thumbChangeName = "";
		String contentChangeName ="";
		// 썸네일 저장
		if(!upfiles[0].getOriginalFilename().equals("")) {
			
			// 수정 파일명 
			thumbChangeName = FileRename.savePath(upfiles[0], session);			
							
		}
		
		// 본문 이미지 저장
		if(!upfiles[1].getOriginalFilename().equals("")) {
			
			// 수정 파일명 
			contentChangeName = FileRename.savePath(upfiles[1], session);			
							
		}
		
		
		int result = eventService.insertEvent(e);
		
		if(result > 0) { // 성공시 이미지 insert		   // 본문 이미지를 따로 저장
			
			ei1.setEventImgNo(e.getEventNo());
			ei1.setEventImgLevel("1");
			ei1.setEventImgOrigin(upfiles[0].getOriginalFilename());
			ei1.setEventImgChange(thumbChangeName);
			ei1.setEventImgPath("resources/uploadFiles/" + thumbChangeName); // 파일 경로
			ei1.setStatus("Y");
			
			int resultImg1 = eventService.insertEventImg(ei1);
			
			ei2.setEventImgNo(e.getEventNo());
			ei2.setEventImgLevel("2");
			ei2.setEventImgOrigin(upfiles[1].getOriginalFilename());
			ei2.setEventImgChange(contentChangeName);
			ei2.setEventImgPath("resources/uploadFiles/" + contentChangeName); // 파일 경로
			ei2.setStatus("Y");
			
			int resultImg2 = eventService.insertEventImg(ei2);
			
			if(resultImg1 * resultImg2 != 0){
				
				session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
				
				mv.setViewName("redirect:/list.ev");
			} else {
				
				mv.addObject("errorMsg", "게시글 등록 실패").setViewName("common/errorPage");
			}
							
		} else { // 에러페이지
			
			mv.addObject("errorMsg", "게시글 등록 실패").setViewName("common/errorPage");
			
		}
		
		return mv;
	}
}
