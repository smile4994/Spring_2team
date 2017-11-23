<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
	function del_func(){
		var result = confirm('정말 삭제하시겠습니까?');
		if(result==true){
			location.href="delete.do?boardNum=${board.boardNum}";
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<table>
		<tr>
			<td>글번호 :</td>
			<td>${board.boardNum}</td>
		</tr>
		<tr>
			<td>제목 :</td>
			<td>${board.title}</td>
		</tr>
		<tr>
			<td>작성자 :</td>
			<td>${board.writer}</td>
		</tr>
		<tr>
			<td>조회수 :</td>
			<td>${board.count}</td>
		</tr>
		<tr>
			<td>작성일시 :</td>
			<td>${board.date}</td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td>${board.contents}</td>
		</tr>
	</table>

	<a href="board.do">[목록]</a>
	<a href="repleForm.do?boardNum=${board.boardNum}">[댓글]</a>	
	
	<c:if test="${sessionScope.loginId == board.writer}">
		<a href="updateForm.do?boardNum=${board.boardNum}">[수정]</a>
		<a onclick="del_func()" href="#">[삭제]</a>
	</c:if>

</body>
</html>