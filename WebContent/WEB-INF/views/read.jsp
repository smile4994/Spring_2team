<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
	function del_func(){
		var result = confirm('���� �����Ͻðڽ��ϱ�?');
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
			<td>�۹�ȣ :</td>
			<td>${board.boardNum}</td>
		</tr>
		<tr>
			<td>���� :</td>
			<td>${board.title}</td>
		</tr>
		<tr>
			<td>�ۼ��� :</td>
			<td>${board.writer}</td>
		</tr>
		<tr>
			<td>��ȸ�� :</td>
			<td>${board.count}</td>
		</tr>
		<tr>
			<td>�ۼ��Ͻ� :</td>
			<td>${board.date}</td>
		</tr>
		<tr>
			<td>���� :</td>
			<td>${board.contents}</td>
		</tr>
	</table>

	<a href="board.do">[���]</a>
	<a href="repleForm.do?boardNum=${board.boardNum}">[���]</a>	
	
	<c:if test="${sessionScope.loginId == board.writer}">
		<a href="updateForm.do?boardNum=${board.boardNum}">[����]</a>
		<a onclick="del_func()" href="#">[����]</a>
	</c:if>

</body>
</html>