package com.mata.persfume.notice.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int count;
	private Date createDate;
	private String noticeImgPath;
	private String noticeImgOrigin;
	private String noticeImgChange;
	private String status;
}
