package com.mata.persfume.cart.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString

public class Cart {

	private int cartNo; 
	private int price;	
	private int quantity;	//수량 
	private int memberNo;	//(회원테이블참조)  
	private int productNo;	//(상품테이블참조)

}
