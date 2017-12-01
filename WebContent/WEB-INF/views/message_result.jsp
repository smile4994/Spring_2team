<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
window.onload = function(){	
	var result ='${result}';
	if(result == 'true'){
		alert('메세지 성공');
	}else{
		alert('메세지 전송 실패');
	}
	location.href="board.do";
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메세지 전송 결과 화면</title>
</head>
<body>

</body>
</html>