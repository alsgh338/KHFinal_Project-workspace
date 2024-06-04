package com.mata.persfume.event.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.common.template.Pagination;
import com.mata.persfume.event.model.service.EventService;
import com.mata.persfume.event.model.vo.Event;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;
	
	@GetMapping("list.ev")
	public String eventList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = eventService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 8;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Event> list = eventService.selectList(pi);

		System.out.println(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "event/eventListView";
	}
	
	@GetMapping("detail.ev")
	public String eventDetailView() {
		
		return "event/eventDetailView";
	}
	
	@GetMapping("enrollForm.ev")
	public String eventEnrollForm() {
		
		return "event/eventEnrollForm";
	}
	
	@PostMapping("insert.ev")
	public String insertEvent(Event e, MultipartFile[] upfiles, HttpSession session, Model model) {
		
		return "";
	}
}
