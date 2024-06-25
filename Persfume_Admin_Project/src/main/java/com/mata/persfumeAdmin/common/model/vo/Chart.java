package com.mata.persfumeAdmin.common.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Chart {

	private Date visitDate;
	private int visitCount;
	
	private String scent;
	private int saleCount;
	private int stock;
	private String productName;
	
}
