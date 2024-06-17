package com.mata.persfume.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class PWDmember {
	
	private String email;
	private String randomPwd;
	private String newPwd;
	private int memNo;
	private String memPwd;

}
