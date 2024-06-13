package com.mata.persfume.cart.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.mata.persfume.cart.model.service.CartService;
import com.mata.persfume.cart.model.vo.Cart;
import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.common.template.Pagination;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    // 장바구니 목록 조회
    @GetMapping("list.ca")
    public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,Model model) {
        
    	//페이징처리용 변수
    	int listCount = cartService.selectListCount();
        int pageLimit = 10;
        int boardLimit = 5;

        PageInfo pi = Pagination.getPageInfo(listCount, 
							        		currentPage, 
							        		pageLimit, 
							        		boardLimit);
        
        ArrayList<Cart> list = 
        		cartService.selectList(pi);

        model.addAttribute("pi", pi);
        model.addAttribute("list", list);

        return "cart/cartListView";
    }
    
    // 장바구니에 상품 추가
    @PostMapping("add.ca")
    @ResponseBody
    public String addCart(Cart c, HttpSession session) {
        int result = cartService.addCart(c);

        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 장바구니에 추가되었습니다.");
            return "success";
        } else {
            return "fail";
        }
    }

    // 장바구니 상품 수정
    @PostMapping("edit.ca")
    @ResponseBody
    public String editCart(Cart c, HttpSession session) {
        int result = cartService.editCart(c);

        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 장바구니가 수정되었습니다.");
            return "success";
        } else {
            return "fail";
        }
    }

    // 장바구니 상품 삭제
    @PostMapping("delete.ca")
    @ResponseBody
    public String deleteCart(@RequestParam("cartNos") String[] cartNos, HttpSession session) {
        int result = cartService.deleteCart(cartNos);

        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 장바구니에서 삭제되었습니다.");
            return "success";
        } else {
            return "fail";
        }
    }

    // 장바구니 전체 비우기
    @PostMapping("allDelete.cart")
    @ResponseBody
    public String allDeleteCart(@RequestParam("memNo") int memNo, HttpSession session) {
        int result = cartService.allDeleteCart(memNo);

        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 장바구니가 비워졌습니다.");
            return "success";
        } else {
            return "fail";
        }
    }
}

    
    
    