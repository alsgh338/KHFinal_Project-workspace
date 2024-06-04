package com.mata.persfume.event.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class EventImg {

	// 안쓰이면 삭제 예정인 VO
	private int eventImgNo;
	private String eventImgPath;
	private String eventImgLevel;
	private String status;
	private int eventNo;
}
