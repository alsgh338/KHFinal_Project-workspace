package com.mata.persfume.oneClass.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class OneClass {

	private int classNo;
	private String className;
	private String classTeacher;
	private int studentMaxNo;
	private String classDetail;
	private int price;
	private Date startTime;
	private Date endTime;
	private Date startDate;
	private Date enrollDate;
	private String status;
	
	
	private String thumbnailImg;
	private int currentStudent;
	
}
