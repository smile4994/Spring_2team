<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function(){	
	var result ='${result}';
	if(result == 'true'){
		alert('삭제 성공');
	}else{
		alert('삭제 실패');
	}
	location.href="messageList.do";
}
</script>
</head>
<body>

</body>
</html>