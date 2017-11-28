<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판 목록</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
</script>
 
</head>
<body>

<form action="board.do" method="post">
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>

		<c:if test="${empty boardList}">
			<tr>
				<td colspan="6">작성된 게시글이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach items="${boardList}" var="boardList">
			<tr>
				<td>${boardList.boardNum}</td>
				<td>${boardList.kategorie}</td>
				<td><a href="read.do?boardNum=${boardList.boardNum}">${boardList.title}</a>
				</td>
				<td>${boardList.writer}</td>
				<td><fmt:formatDate value="${boardList.date}" type="both"
						dateStyle="short" timeStyle="short" /></td>
				<td>${boardList.count}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="right"><a href="logout.do">[로그아웃]</a>
				<a href="writeForm.do">[글쓰기]</a></td>
		</tr>
	</table>
	
	<br>
	<div id="search">
		<select name="searchType">
			<option value="1" selected="selected">제목</option>
			<option value="2">작성자</option>
			<option value="3" >카테고리</option>
		</select>
		
		<input type="text" name="searchWrite" size="40">
		<input type="submit" value="검색">
		
		<input type="hidden" id="searchType">
		<input type="hidden" id="searchWrite">
	</div>
</form>

</body>
</html>