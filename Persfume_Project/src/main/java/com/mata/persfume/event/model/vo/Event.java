package com.mata.persfume.event.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Event {

	private int eventNo;
	private String eventTitle;
	private String eventContent;
	private String eventCount;
	private Date startDate;
	private Date dewDate;
	private Date createDate;
	private String status;
}
