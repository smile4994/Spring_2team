<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>로그아웃</title>
<script type="text/javascript">
	window.onload = function(){
		alert('로그아웃 되었습니다.');
		location.href="${pageContext.request.contextPath}/";
	}
</script>
</head>
<body>

</body>
</html>