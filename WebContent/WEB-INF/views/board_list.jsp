<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>�Խ��� ���</title>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css?ver=1" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Acme' rel='stylesheet' type='text/css'><!-- //fonts -->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
</script>
<style>
.table{
	width:50%;
	height:auto;
	margin:auto;
	max-width:500px;
	border-style:solid;
	border-bottom-width: 2px;
	border-color:black;
}
tr, td, a{
	padding-bottom: 8px;
	padding-top: 8px;
}
tr:hover{
	background-color:silver;
	opacity: 0.8;
}
</style>
</head>
<body>
<form action="board.do" method="post">
<!--   <section id="tables"> -->
  <div class="bs-docs-example">
	<table class="table">
	<thead>
		<tr>
			<th>�۹�ȣ</th>
			<th>ī�װ�</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty boardList}">
			<tr>
				<td colspan="6">�ۼ��� �Խñ��� �������� �ʽ��ϴ�.</td>
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
			<td colspan="6" align="right"><a href="logout.do">[�α׾ƿ�]</a>
				<a href="writeForm.do">[�۾���]</a></td>
		</tr>
		</tbody>
	</table>
	</div>
<!-- 	</section> -->
	
	<div id="search">
		<select name="searchType">
			<option value="1" selected="selected">����</option>
			<option value="2">�ۼ���</option>
			<option value="3" >ī�װ�</option>
		</select>
		
		<input type="text" name="searchWrite" size="40">
		<input type="submit" value="�˻�">
		
		<input type="hidden" id="searchType">
		<input type="hidden" id="searchWrite">
	</div>
</form>

</body>
</html>