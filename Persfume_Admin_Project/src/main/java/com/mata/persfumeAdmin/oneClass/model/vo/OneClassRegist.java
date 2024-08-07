package com.mata.persfumeAdmin.oneClass.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class OneClassRegist {

	private String registNo;
	private String registPaycode;
	private int registPrice;
	private int registPersonNo;
	private String registDate;
	private String registCancleDate;
	private String status;
	private String classNo;
	private String memNo;
	
}
