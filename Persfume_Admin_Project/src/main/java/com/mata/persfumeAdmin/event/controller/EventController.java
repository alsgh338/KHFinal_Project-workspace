package com.mata.persfumeAdmin.event.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mata.persfumeAdmin.event.model.service.EventService;
import com.mata.persfumeAdmin.event.model.vo.Event;



@Controller
public class EventController {

	@Autowired
	private EventService eventService;
	
	@GetMapping("list.ev")
	public String selectEventList(Model model) {
		
		ArrayList<Event> list = eventService.selectEventList();
		
		model.addAttribute("list", list);
		
		return "event/eventListView";
	}
	
	@GetMapping("detail.ev")
	public String selectEventDetail(int eno, Model model) {
		
		System.out.println(eno);
		
		Event ev = eventService.selectEventDetail(eno);
		
		System.out.println(ev.getEventCount());
		
		model.addAttribute("ev", ev);
		
		return "event/eventEnrollForm";
	}
	
}
