<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<a id="kakao-login-btn"></a>
<input type="button" value="�α׾ƿ�" onclick="ktout()" >
<script type='text/javascript'>
  //<![CDATA[
    // ����� ���� JavaScript Ű�� ������ �ּ���.
    Kakao.init('26d87c26aedeeae26b0990bf1ae5c8cd');
    // īī�� �α��� ��ư�� �����մϴ�.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
    	  // �α��� ������, API�� ȣ��
    	  Kakao.API.request({
    		  url:'http://localhost:8888/Spring_2team/callback.do',
    		  success: function(res){
    			  alert(res.properties.nickname+'�� ȯ���մϴ�.');
    			  location.href="http://localhost:8888/Spring_2team/callback.do";
    		  },
    		  fail: function(error){
    			  alert(JSON.stringify(error));
    		  }
    	  })
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
    
    function ktout(){
    	Kakao.Auth.logout(function(){
    		setTimeout(function(){
			location.href="http://www.naver.com"	
			}, 1000);
    	});
    }
  //]]>
</script>

</body>
</html>