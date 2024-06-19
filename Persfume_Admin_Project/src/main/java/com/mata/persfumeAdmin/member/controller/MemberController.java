package com.mata.persfumeAdmin.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mata.persfumeAdmin.member.model.service.MemberService;
import com.mata.persfumeAdmin.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("adList.me")
	public String memberList(Model model) {
		
		ArrayList<Member> list =  memberService.selectAllmember();
		
		System.out.println(list);
		
		model.addAttribute("list", list); // Model에 list를  attribute로 설정
		
		return "member/memberListView";
	}
	
	@Transactional
	@PostMapping(value="delete.me")
	public String deleteMember(int memNo,
							HttpSession session,
				 			ModelAndView mv) {
		
		
		System.out.println("회원 탈퇴 잘 호출되나??");
			
			int result = memberService.deleteMember(memNo);
			
			if(result > 0) {// 탈퇴 성공
				
				System.out.println("탈퇴 성공");
				
				session.setAttribute("alertMsg", "탈퇴가 완료되었습니다.");
				
				return "redirect:/adList.me";
				
				//mv.setViewName("member/memberListView");
				
			}else {// 탈퇴 실패 
				System.out.println("탈퇴 실패");
				
				session.setAttribute("alertMsg", "탈퇴에 실패했습니다. 다시 시도해주세요");
				
				mv.setViewName("member/memberListView");
			}
			
			return "redirect:/adList.me";
		
	}
	
	@Transactional
	@PostMapping("alive.me")
	public String aliveMember(int memNo) {
		
		System.out.println("회원 복구 잘 호출되나??");
		
		int result = memberService.aliveMember(memNo);
		
		if(result > 0) {
			// 회원 복구 성공
			
			System.out.println("회원 복구 성공!");
			
			
			// mv.setViewName("member/memberListView");
			return "redirect:/adList.me";
			
		}else {
			// 실패 
			System.out.println("회원 복구 실패!");
			
			// mv.setViewName("member/memberListView");
			return "redirect:/adList.me";
		}
		
		//return mv;
		
		
	}

}
