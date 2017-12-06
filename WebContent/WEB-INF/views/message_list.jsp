<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메세지함</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>쪽지번호</td>
			<td>보낸사람</td>
			<td>내용</td>
			<td>보낸날짜</td>
		</tr>
		<c:if test="${empty messageList}">
			<tr>
				<td colspan="5">쪽지 온게 없습니다</td>
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