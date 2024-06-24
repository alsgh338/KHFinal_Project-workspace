package com.mata.persfumeAdmin.event.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
			thumbChangeName = savePath(upfiles[0], session);			
							
		}
		
		// 본문 이미지 저장
		if(!upfiles[1].getOriginalFilename().equals("")) {
			
			// 수정 파일명 
			contentChangeName = savePath(upfiles[1], session);			
							
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
		
		e.setEventNo(eno);
		
		
		// 썸네일
		if(!upfiles[0].getOriginalFilename().equals("")) {
			
			
			
			// 수정 파일명 
			thumbChangeName = savePath(upfiles[0], session);		
							
		}
		
		// 본문 이미지 저장
		if(!upfiles[1].getOriginalFilename().equals("")) {
			
			// 수정 파일명 
			contentChangeName = savePath(upfiles[1], session);			
							
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
	
	
	public String savePath(MultipartFile upfile, HttpSession session) {
		
		// 1. 원본파일명 뽑아오기
		String originName = upfile.getOriginalFilename(); // "bono.jpg"
		
		// 2. 시간 형식으로 문자열 뽑아내기
		// "20240521161430" (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 3. 뒤에 붙을 5자리 랜덤 수 얻어내기
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 4. 원본파일명으로부터 확장자명 뽑기
		String ext = originName.substring(originName.lastIndexOf("."));
		// ".jpg"
		
		// 5. 2 ~ 4 까지 모두 이어 붙이기
		String changeName = currentTime + ranNum + ext;
		
		// 6. 업로드하고자 하는 물리적인 서버의 경로 알아내기
		// > application 객체로부터 
		// (webapp/resources/uploadFiles/~~)
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/event/");
		
		// 7. 경로와 수정파일명 합체 후 파일을 업로드 해주기
		// > MultipartFile 객체가 제공하는
		//   transferTo 메소드를 이용함
		try {
			
			upfile.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException | IOException e) {
			
			e.printStackTrace();
		}
		
		return changeName;
	}
}
