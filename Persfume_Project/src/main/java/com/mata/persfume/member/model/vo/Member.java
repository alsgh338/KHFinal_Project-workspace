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
public class Member {

	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String email;
	private String phone;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private String gender;
	private Date birthDate;
	private Date enrollDate;
	private Date modifyDate;
	private Date testDate;
	private String status;
	
	
}
