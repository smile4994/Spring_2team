<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�޼�����</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>������ȣ</td>
			<td>�������</td>
			<td>����</td>
			<td>������¥</td>
		</tr>
		<c:if test="${empty messageList}">
			<tr>
				<td colspan="5">���� �°� �����ϴ�</td>
			</tr>
		</c:if>
		<c:if test="${not empty messageList}">
			<c:forEach items="${messageList}" var="message">
				<tr>
				<td>${message.messageNum}</td>
				<td>${message.sender }</td>
				<td>${message.content }</td>
				<td>${message.writeDate }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>