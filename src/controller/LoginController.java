package controller;

import java.util.Map;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	Kakao kakao = new Kakao();
	
	
	
	
	// 네이버 로그인
	
	@RequestMapping(value="/naverstart.do", method=RequestMethod.GET)
	public String naverStart() throws Exception{
		return "redirect:" + Naver.getCode();
	}
	
	
	@RequestMapping(value="/naverlogin.do", method=RequestMethod.GET)
    public String naverLogin(@RequestParam("code") String code, @RequestParam("state")String state) throws Exception {
		System.out.println("naver code : " + code);
		System.out.println("naver state : " + state);

//		String result = Naver.getAccessToken(code, state);
		
		Map<String, String> mapResult=Naver.JSONStringToMap(Naver.getAccessToken(code, state));
		String result = (String)Naver.getxml((String)mapResult.get("token_type"), (String)mapResult.get("access_token"));
		System.out.println("result :"+result);
		
		JSONObject jsonObject = XML.toJSONObject(result);
		System.out.println("jsonObject :" +jsonObject);
		
		JSONObject responseData = jsonObject.getJSONObject("data");
		System.out.println("responseData :" + responseData);
		
		Map<String, String> userMap=Naver.JSONStringToMap(responseData.get("response").toString());
		System.out.println("id:"+(String)userMap.get("id"));
		System.out.println("name:"+(String)userMap.get("name"));
		System.out.println("email:"+(String)userMap.get("email"));
//		System.out.println("access_token : "+(String)mapResult.get("access_token"));
//		System.out.println("refresh_token : "+(String)mapResult.get("refresh_token"));
//		System.out.println("token_type : "+(String)mapResult.get("token_type"));
//		System.out.println("expires_in : "+(String)mapResult.get("expires_in"));
		return "main";
    }
	
	
	
	
	
	
	
	// 카카오 로그인
	@RequestMapping(value="/kakaoGetCode.do", method=RequestMethod.GET)
	public String kakao() throws Exception{
		Kakao kakao = new Kakao();
//		System.out.println("kakao.getCode() : " + kakao.getCode());
		
		return "redirect:"+kakao.getCode();
	}
	
	@RequestMapping(value="/kakaologin.do", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code) throws Exception {
//		System.out.println("code : " + code);
		
		String data = (String)kakao.getHtml((kakao.getAccessToken(code)));
		System.out.println("data : " + data);
		
		Map<String, String> map = kakao.JsonStringMap(data);
		
		System.out.println("map :"+map);
		System.out.println("access_token :"+map.get("access_token"));
		System.out.println("refresh_token :"+map.get("refresh_token"));
		System.out.println("scope :"+map.get("scope"));
		System.out.println("token_type :"+map.get("token_type"));
		System.out.println("expires_in :"+map.get("expires_in"));
		
		String list = kakao.getAllList((String)map.get("access_token"));
		System.out.println("list :"+list);
		
		Map<String, String> getAllListMap = kakao.JsonStringMap(list);
//		System.out.println("getAllListMap :"+getAllListMap);
		System.out.println("nickName :"+(String)getAllListMap.get("nickName"));
		System.out.println("profileImageURL :"+(String)getAllListMap.get("profileImageURL"));
		System.out.println("thumbnailURL :"+(String)getAllListMap.get("thumbnailURL"));
		System.out.println("id :"+(String)getAllListMap.get("id"));
		System.out.println("kaccount_email :"+(String)getAllListMap.get("kaccount_mail"));
		System.out.println("countryISO :"+(String)getAllListMap.get("countryISO"));
		
		return "main";
	}
}
