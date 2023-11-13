package com.spring.todoproject.login.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.spring.todoproject.login.naver.NaverLoginRequestDTO;

import lombok.RequiredArgsConstructor;

@Component
public class ApiExamMemberProfile {
	
	public NaverLoginRequestDTO parseJsonData(String token) {
				
		
		System.out.println("asdfasdfsadf " + token);
		

//        String token = token; // 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가


        String apiURL = "https://openapi.naver.com/v1/nid/me";


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);
        String responseBody = get(apiURL,requestHeaders);




        System.out.println(responseBody);
//        String tokenpw = data;
        
		/*---------------------------------------*/
        
        
        JSONParser parser = new JSONParser();

        try {
            JSONObject jsonObject = (JSONObject) parser.parse(responseBody);
            JSONObject response = (JSONObject) jsonObject.get("response");

            String id = (String) response.get("id");
            String nickname = (String) response.get("nickname");
            String email = (String) response.get("email");
            String name = (String) response.get("name");
            
            
    		String email2 = email.substring(email.length() - 10);
    		System.out.println(email2);

    		String email1 = email.substring(0, email.length() - 10);

            System.out.println("ID: " + id);
            System.out.println("Nickname: " + nickname);
            System.out.println("Email: " + email1);
            System.out.println("Email: " + email2);
            System.out.println("Name: " + name);
            
//            sendData(id, nickname, email, name, token);
            
            return NaverLoginRequestDTO.builder()
            		.id(id)
            		.nickname(nickname)
            		.email1(email1)
            		.email2(email2)
            		.name(name)
            		.token(token)
            		.profile_color("D9D9D9")
            		.build();
            

        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
        
        
        
        
        
      

    
    }
	
	/*
	 * public void parseJsondelData(String tokendel) {
	 * 
	 * 
	 * String apiUrl =
	 * "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id="+
	 * "W7Mq7kXYF3dBqzpj2kxG"+
	 * "&client_secret="+"hhpMdDjGMX"+"&access_token="+tokendel.replaceAll("'",
	 * "")+"&service_provider=NAVER";
	 * 
	 * try { String res = requestToServer(apiUrl); model.addAttribute("res", res);
	 * //결과값 찍어주는용 session.invalidate(); } catch (IOException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } }
	 */



    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}