package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Naver {
	private static final String Client_ID = "ACACABHDqtMy92PCqNLb";
	private static final String Client_Secret = "lXjOTqRVyT";
	private static final String SURVICE_URL = "http://70.12.115.53:8888/Spring_2team/naverstart.do";
	private static final String Redirect_URL = "http://70.12.115.53:8888/Spring_2team/naverlogin.do";
	
	
	
	public static String generateState() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}
	
	public static final String getCode() {
		String getCode = "https://nid.naver.com/oauth2.0/authorize?client_id="+Client_ID;
		getCode += "&response_type=code";
		getCode += "&redirect_uri=" + Redirect_URL;
		getCode += "&state=" + generateState();
		
		return getCode;
	}
	
	public static final String getAccessToken(String code, String state) {
		String getAccessToken = "https://nid.naver.com/oauth2.0/token?client_id="+Client_ID;
		getAccessToken += "&client_secret="+Client_Secret;
		getAccessToken += "&grant_type=authorization_code";
		getAccessToken += "&state="+state;
		getAccessToken += "&code="+code;
		
		String result = (String)getHtml(getAccessToken, null);
		
		return result;
	}
	
	public static String getxml(String tokenType, String accessToken) {
		String profileDataXml = getHtml("https://apis.naver.com/nidlogin/nid/getUserProfile.xml", tokenType + " " + accessToken);
		
		return profileDataXml;
	}
	
	public static String getHtml(String url, String authorization) {
		HttpURLConnection httpRequest = null;
		String resultValue = null;
		
		try {
			URL u = new URL(url);
			httpRequest = (HttpURLConnection)u.openConnection();
			httpRequest.setRequestProperty("Content-type", "text/xml; charset=UTF-8");
			
			if(authorization != null) {
				httpRequest.setRequestProperty("Authorization", authorization);
			}
			
			httpRequest.connect();
			BufferedReader in = new BufferedReader(new InputStreamReader(httpRequest.getInputStream(), "UTF-8"));
			
			StringBuffer sb = new StringBuffer();
			String line = null;
			while ((line = in.readLine()) != null) {
				sb.append(line);
				sb.append("\n");
			}
			
			resultValue = sb.toString();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(httpRequest != null) {
				httpRequest.disconnect();
			}
		}
		return resultValue;
	}
	
	public static Map<String, String> JSONStringToMap(String str){
		Map<String, String> map = new HashMap<String, String>();
		ObjectMapper mapper = new ObjectMapper();
		try {
			map = mapper.readValue(str, new TypeReference<HashMap<String, String>>() {
			});
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return map;
		
	}
}
