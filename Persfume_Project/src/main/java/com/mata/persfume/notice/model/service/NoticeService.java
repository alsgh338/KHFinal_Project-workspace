package com.mata.persfume.notice.model.service;

import java.util.ArrayList;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.notice.model.vo.Notice;




//import com.kh.spring.common.model.vo.PageInfo;

public  interface NoticeService {



	// ������  ����Ʈ ��ȸ ���� + ����¡ ó��
	// ������  �� ���� ��ȸ
	int selectListCount();
	
	// ������  ����Ʈ ��ȸ
	ArrayList<Notice> selectList(PageInfo pi);
	
	// ������ �ۼ��ϱ� ����
	int insertNotice(Notice n);


	// ������  ��ȸ�� ����
	int increaseCount(int noticeNo);
	// ������  ����ȸ ����
	Notice selectNotice(int noticeNo);
	
	// ������ ���� ����
	int deleteNotice(int noticeNo);
	
	// ������ ���� ����
	int updateNotice(Notice n);
	
	
}






