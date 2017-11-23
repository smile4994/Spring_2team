<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>�Խ��� ���</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>�۹�ȣ</td>
			<td>����</td>
			<td>����</td>
			<td>�ۼ���</td>
			<td>�ۼ���</td>
			<td>��ȸ��</td>
		</tr>

		<c:forEach items="${boardList}" var="boardList">
			<tr>
				<td>${boardList.boardNum}</td>
				<td><a href="read.do?boardNum=${boardList.boardNum}">${boardList.title}</a>
				</td>
				<td>${boardList.contents}</td>
				<td>${boardList.writer}</td>
				<td><fmt:formatDate value="${boardList.date}" type="both"
						dateStyle="short" timeStyle="short" /></td>
				<td>${boardList.count}</td>
			</tr>
		</c:forEach>
	</table>
<%-- 	<c:if test="${sessionScope.loginId != null}"> --%>
		<a href="writeForm.do"><button>[�۾���]</button></a>
		<a href="logout.do"><button>[�α׾ƿ�]</button></a>
<%-- 	</c:if> --%>
</body>
</html>