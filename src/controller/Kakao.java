package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class Kakao {
	private static final String RestApiKey = "143f11601de1d062d2049ad4904cbb34";

	private static final String Redirect_URL = "http://localhost:8888/Spring_2team/kakaologin.do";

	private static final String keyHost = "https://kauth.kakao.com";

	public static String getCode() {
		String getcode = keyHost;
		getcode += "/oauth/authorize?client_id=" + RestApiKey;
		getcode += "&redirect_uri=" + Redirect_URL;
		getcode += "&response_type=code";
		return getcode;
	}

	// TODO: 사용자 토큰 받기
	public static String getAccessToken(String authorize_code) {
		String getAccesToken = "https://kauth.kakao.com/oauth/token?grant_type=authorization_code";
		getAccesToken += "&client_id="+ RestApiKey;
		getAccesToken += "&redirect_uri=" + Redirect_URL;
		getAccesToken += "&code=" + authorize_code;
		
		return getAccesToken;
	}
	
	// TODO : 요청한 값 읽어오기
	public static String getHtml(String accestoken) {
		HttpURLConnection urlconn = null;
		String returnresult = null;
		
			try {
				URL url = new URL(accestoken);
				
				urlconn = (HttpURLConnection) url.openConnection();
				
				urlconn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
				
				urlconn.setRequestMethod("POST");
				
				urlconn.setDoOutput(true);
				
				urlconn.connect();
				
				BufferedReader in = new BufferedReader(new InputStreamReader(urlconn.getInputStream(), "UTF-8"));
				
				StringBuffer sb = new StringBuffer();
				
				String result = null;
				while((result = in.readLine()) != null) {
					sb.append(result);
					sb.append("\n");
				}
				returnresult=sb.toString();
				
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		return returnresult;
	}
	
	
}
