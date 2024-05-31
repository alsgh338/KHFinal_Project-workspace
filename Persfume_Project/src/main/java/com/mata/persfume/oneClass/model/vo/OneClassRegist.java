package com.mata.persfume.oneClass.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class OneClassRegist {

	private int registNo;
	private int registPaycode;
	private String status;
	private int classNo;
	private int memNo;
}
