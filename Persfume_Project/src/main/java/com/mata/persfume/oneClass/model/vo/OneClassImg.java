package com.mata.persfume.oneClass.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class OneClassImg {

	private int classImgNo;
	private String classImgPath;
	private String classImgOrigin;
	private String classImgChange;
	private int imgType;
	private String status;
	private int refCno;
}
