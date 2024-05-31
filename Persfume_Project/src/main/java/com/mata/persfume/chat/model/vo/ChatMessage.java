package com.mata.persfume.chat.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ChatMessage {

	private int cmNo;
	private String cmContent;
	private Date createDate;
	private int chatNo;
	private int memNo;
	
}
