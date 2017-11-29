<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>삭제결과</title>
<script type="text/javascript">
	window.onload = function(){
		var result = '${result}';
		if(result >= 0){
			alert('삭제 완료!');
		}else{
			alert('삭제 실패!');
		}
		location.href="board.do";
	}
</script>
</head>
<body>

</body>
</html>