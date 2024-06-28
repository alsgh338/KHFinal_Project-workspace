package com.mata.persfume.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mata.persfume.chat.model.service.ChatService;
import com.mata.persfume.chat.model.vo.ChatMessage;
import com.mata.persfume.member.model.vo.Member;
import com.mata.persfume.oneClass.model.service.OneClassService;
import com.mata.persfume.oneClass.model.vo.OneClassRegist;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@Autowired
	private OneClassService oneClassService;
	
	// -------------------- 임시 채팅창 연습용 페이지 이동
	
	
	@GetMapping("showChatList")
	public ModelAndView showChatList(HttpSession session, ModelAndView mv) {
		
		Member mem = (Member)session.getAttribute("loginMember");
		
		int memNo = mem.getMemNo();
		
		System.out.println(memNo);
		
		ArrayList<ChatMessage> list = chatService.getChatList(memNo);
		
		mv.addObject("list", list).setViewName("chat/chatListView");
		
		return mv;
	}
	
	@PostMapping("showChat")
	public String showChat(HttpSession session, int classNo, Model model) {
		
		model.addAttribute("classNo", classNo);
		
		return "chat/chatView";
		
	}
		
	
	@GetMapping("getPrevMessage")
	@ResponseBody
	public ArrayList<ChatMessage> getPrevChatMessage(String classNo){
		
		return chatService.getPrevChatMessage(classNo);
	}
	
	// 채팅방 명단 추가 ajax
	@ResponseBody
	@PostMapping(value="enrollChat.ct", produces="text/html; charset=UTF-8")
	public String insertChatMem(String ocrno)  throws Exception{	
		
		OneClassRegist ocr = oneClassService.selectOneClassRegist(ocrno);
		
		if(ocr != null) {
			int result = chatService.insertChatMem(ocr);	
			
			System.out.println(result);
			
			return "success";
		} else {
			
			return "fail";
			
		}
		

	}
	
	
}
