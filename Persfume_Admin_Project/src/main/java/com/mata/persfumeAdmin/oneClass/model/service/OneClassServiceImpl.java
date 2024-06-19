package com.mata.persfumeAdmin.oneClass.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mata.persfumeAdmin.oneClass.model.dao.OneClassDao;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClass;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassImg;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassRegist;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassReview;

@Service
public class OneClassServiceImpl implements OneClassService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private OneClassDao oneClassDao;
	
	
	@Override
	public ArrayList<OneClass> selectList() {
		return oneClassDao.selectList(sqlSession);
	}
	
	@Override
	@Transactional
	public int insertOneClass(OneClass oc) {
		return oneClassDao.insertOneClass(sqlSession, oc);
	}


	@Override
	@Transactional
	public int insertOneClassImg(ArrayList<OneClassImg> ociList) {
		return oneClassDao.insertOneClassImg(sqlSession, ociList);
	}
	
	@Override
	public OneClass selectOneClass(int ocno) {
		return oneClassDao.selectOneClass(sqlSession, ocno);
	}
	
	@Override
	public ArrayList<OneClassImg> selectOneClassImgList(int ocno) {
		return oneClassDao.selectOneClassImgList(sqlSession, ocno);

	}
	
	@Override
	@Transactional
	public int updateOneClass(OneClass oc) {
		return oneClassDao.updateOneClass(sqlSession, oc);
	}
	
	@Override
	public ArrayList<OneClassRegist> selectRegistList() {
		return oneClassDao.selectRegistList(sqlSession);
	}
	
	@Override
	public int deleteOneClass(int ocno) {
		return oneClassDao.deleteOneClass(sqlSession, ocno);
	}
	
	@Override
	public int updateOneClassImg(ArrayList<OneClassImg> ociList) {
		return oneClassDao.updateOneClassImg(sqlSession, ociList);
	}
	
	@Override
	public int restoreOneClass(int ocno) {
		return oneClassDao.restoreOneClass(sqlSession, ocno);
	}


	
	

	
	/* 
	 * 여기서부턴 아임 포트 통신용 메소드	 
	 */
	
	@Override
	public String getToken(String apiKey, String secretKey) throws IOException {
        URL url = new URL("https://api.iamport.kr/users/getToken");
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
 
        // 요청 방식을 POST로 설정
        conn.setRequestMethod("POST");
 
        // 요청의 Content-Type과 Accept 헤더 설정
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
 
        // 해당 연결을 출력 스트림(요청)으로 사용
        conn.setDoOutput(true);
 
        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
        JsonObject json = new JsonObject();
        json.addProperty("imp_key", apiKey);
        json.addProperty("imp_secret", secretKey);
         
        // 출력 스트림으로 해당 conn에 요청
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString()); // json 객체를 문자열 형태로 HTTP 요청 본문에 추가
        bw.flush(); // BufferedWriter 비우기
        bw.close(); // BufferedWriter 종료
         
        // 입력 스트림으로 conn 요청에 대한 응답 반환
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        Gson gson = new Gson(); // 응답 데이터를 자바 객체로 변환
        String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
        String accessToken = gson.fromJson(response, Map.class).get("access_token").toString();
        br.close(); // BufferedReader 종료
 
        conn.disconnect(); // 연결 종료
        return accessToken;
    }
	
	
	@Override
	public void refundRequest(String access_token, String merchant_uid, String reason) throws IOException {
        URL url = new URL("https://api.iamport.kr/payments/cancel");
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
 
        // 요청 방식을 POST로 설정
        conn.setRequestMethod("POST");
 
        // 요청의 Content-Type, Accept, Authorization 헤더 설정
        conn.setRequestProperty("Content-type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestProperty("Authorization", access_token);
 
        // 해당 연결을 출력 스트림(요청)으로 사용
        conn.setDoOutput(true);
 
        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
        JsonObject json = new JsonObject();
        json.addProperty("merchant_uid", merchant_uid);
        json.addProperty("reason", reason);
 
        // 출력 스트림으로 해당 conn에 요청
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString());
        bw.flush();
        bw.close();
 
        // 입력 스트림으로 conn 요청에 대한 응답 반환
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        br.close();
        conn.disconnect();
    }




















	
	
	
}
