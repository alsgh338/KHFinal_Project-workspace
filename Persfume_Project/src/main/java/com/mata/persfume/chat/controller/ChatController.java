package com.mata.persfume.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mata.persfume.chat.model.service.ChatService;
import com.mata.persfume.chat.model.vo.ChatMessage;
import com.mata.persfume.oneClass.model.service.OneClassService;
import com.mata.persfume.oneClass.model.vo.OneClassRegist;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	
	@Autowired
	private OneClassService oneClassService;
	
	@GetMapping("getPrevMessage")
	@ResponseBody
	public ArrayList<ChatMessage> getPrevChatMessage(int chatNo){
		
		return chatService.getPrevChatMessage(chatNo);
	}
	
	@GetMapping("getChatNo")
	@ResponseBody
	public int getChatNo(String classNo) {
		
		return Integer.parseInt(chatService.selectChatRoomId(classNo));
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
