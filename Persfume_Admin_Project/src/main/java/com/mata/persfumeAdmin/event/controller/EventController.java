package com.mata.persfumeAdmin.event.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mata.persfumeAdmin.common.template.FileRename;
import com.mata.persfumeAdmin.event.model.service.EventService;
import com.mata.persfumeAdmin.event.model.vo.Event;
import com.mata.persfumeAdmin.event.model.vo.EventImg;



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
		
		Event ev = eventService.selectEventDetail(eno);

		Event evTh = eventService.selectEventThumbnail(eno);
		
		model.addAttribute("ev", ev);
		
		model.addAttribute("evTh", evTh);
		
		return "event/eventModifyForm";
	}
	
	@GetMapping("insertForm.ev")
	public String eventEnrollForm() {
		
		return "event/eventEnrollForm";
	}
	
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
	
	@PostMapping("modify.ev")
	public String modifyEvent(int eno, Event e, EventImg ei1, EventImg ei2, MultipartFile[] upfiles, HttpSession session, Model model) {
		
		String thumbChangeName = "";
		String contentChangeName ="";
		
		System.out.println("eno" + eno);
		
		e.setEventNo(eno);
		
		System.out.println(e);
		
		// 썸네일
		if(!upfiles[0].getOriginalFilename().equals("")) {
			
			
			
			// 수정 파일명 
			thumbChangeName = FileRename.savePath(upfiles[0], session);		
							
		}
		
		// 본문 이미지 저장
		if(!upfiles[1].getOriginalFilename().equals("")) {
			
			// 수정 파일명 
			contentChangeName = FileRename.savePath(upfiles[1], session);			
							
		}
		
		System.out.println(e);
		
		System.out.println(e.getEventNo());
		System.out.println(e.getEventTitle());
		System.out.println(e.getEventContent());
		System.out.println(e.getStartDate());
		System.out.println(e.getDewDate());
		System.out.println(thumbChangeName);
		System.out.println(contentChangeName);
		
		int result = eventService.modifyEvent(e);
		
		System.out.println(result);
		
		if(result > 0) { // 성공시 이미지 insert		   // 본문 이미지를 따로 저장
			
			ei1.setEventImgNo(e.getEventNo());
			ei1.setEventImgLevel("1");
			ei1.setEventImgOrigin(upfiles[0].getOriginalFilename());
			ei1.setEventImgChange(thumbChangeName);
			ei1.setEventImgPath("resources/uploadFiles/" + thumbChangeName); // 파일 경로
			ei1.setStatus("Y");
			ei1.setEventNo(eno);
			
			System.out.println(ei1);
			
			int resultImg1 = eventService.modifyEventImg(ei1);
			
			ei2.setEventImgNo(e.getEventNo());
			ei2.setEventImgLevel("2");
			ei2.setEventImgOrigin(upfiles[1].getOriginalFilename());
			ei2.setEventImgChange(contentChangeName);
			ei2.setEventImgPath("resources/uploadFiles/" + contentChangeName); // 파일 경로
			ei2.setStatus("Y");
			ei2.setEventNo(eno);
			
			System.out.println(ei2);
			
			int resultImg2 = eventService.modifyEventImg(ei2);
			
			if(resultImg1 * resultImg2 != 0){
				
				session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
				
				
			} else {
				
				
			}
		}
		
		return "redirect:/list.ev";
	}
	
	@PostMapping("delete.ev")
	public String deleteEvent(int eno, Model model) {
		
		int result = eventService.deleteEvent(eno);
		
		return "redirect:/list.ev";
	}
	
	@PostMapping("restore.ev")
	public String restoreEvent(int eno, Model model) {
		
		int result = eventService.restoreEvent(eno);
		
		return "redirect:/list.ev";
	}
	
}
