package com.mata.persfume.event.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mata.persfume.common.model.vo.PageInfo;
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
	public String eventList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
							@RequestParam(value="condition") String condition,
							Model model) {
		
		int listCount; 
		ArrayList<Event> list;
		PageInfo pi;
		
		int pageLimit = 10;
		int boardLimit = 8;
		
		if (condition.equals("expired")) {
	        listCount = eventService.selectExpiredListCount();
	        pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	        list = eventService.selectExpiredList(pi);
	    } else if (condition.equals("onGoing")) {
	        listCount = eventService.selectOngoingListCount();
	        pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	        list = eventService.selectOngoingList(pi);
	    } else {
	        listCount = eventService.selectScheduledListCount();
	        pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	        list = eventService.selectScheduledList(pi);
	    }
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("condition", condition);
		
		return "event/eventListView";
			
	}
	
	@GetMapping("eventList")
	@ResponseBody
	public ArrayList<Event> showMainEvent(Model model) {
		
        ArrayList<Event> list = eventService.selectEventList();
        return list;
        
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
	
	
}
