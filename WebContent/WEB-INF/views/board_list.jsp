<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판 목록</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
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
		<a href="writeForm.do"><button>[글쓰기]</button></a>
		<a href="logout.do"><button>[로그아웃]</button></a>
<%-- 	</c:if> --%>
</body>
</html>