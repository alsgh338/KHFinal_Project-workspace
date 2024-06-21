package com.mata.persfume.product.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ProductReview {

	private int reviewNo;
	private String reviewContent;
	private String reviewImgPath;
	private String reviewImgOrigin;
	private String reviewImgChange;
	private Date reviewDate;
	private int reviewRating;
	private String reviewStatus;
	private int odId;
	private int memNo;
	private int productNo;
	//생성자
	
}
