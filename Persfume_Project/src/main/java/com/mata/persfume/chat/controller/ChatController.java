package com.mata.persfume.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mata.persfume.chat.model.service.ChatService;
import com.mata.persfume.chat.model.vo.ChatMessage;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
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
	
	
}
