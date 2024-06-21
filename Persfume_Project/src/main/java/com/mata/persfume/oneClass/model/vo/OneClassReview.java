package com.mata.persfume.oneClass.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class OneClassReview {

	private int classReviewNo;
	private String classReviewContent;
	private String listNo;
	private String reviewWriter;
	
	private String startDate;
	private String className;
	
}
