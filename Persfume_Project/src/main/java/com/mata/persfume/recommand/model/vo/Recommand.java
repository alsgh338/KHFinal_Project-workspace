package com.mata.persfume.recommand.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Recommand {
	
	private String scentAnswer;
	private String genderAnswer;
	private String categoryAnswer;
	private int reviewStart;
	private int reviewEnd;
	private int priceStart;
	private int priceEnd;

}
