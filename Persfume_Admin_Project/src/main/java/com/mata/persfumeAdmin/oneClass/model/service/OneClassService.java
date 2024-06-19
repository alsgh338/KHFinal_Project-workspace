package com.mata.persfumeAdmin.oneClass.model.service;

import java.io.IOException;
import java.util.ArrayList;

import com.mata.persfumeAdmin.oneClass.model.vo.OneClass;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassImg;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassRegist;


public interface OneClassService {

	int insertOneClass(OneClass oc);
	
	int insertOneClassImg(ArrayList<OneClassImg> ociList);
	
	ArrayList<OneClass> selectList();
	
	OneClass selectOneClass(int ocno);
	
	ArrayList<OneClassImg> selectOneClassImgList(int ocno);
	
	int updateOneClass(OneClass oc);

	int updateOneClassImg(ArrayList<OneClassImg> ociList);

	ArrayList<OneClassRegist> selectRegistList();
	
	int deleteOneClass(int ocno);
	int restoreOneClass(int ocno);
	
	
	
	// 아임 포트 결제 및 환불용 메소드	
	// 결제 <-> 환불 관련 토큰 발급
	String getToken(String apiKey, String secretKey) throws IOException;
	
	// 토큰 및 주문 번호로 활불 진행
	void refundRequest(String access_token, String merchant_uid, String reason) throws IOException;
	
	
}
