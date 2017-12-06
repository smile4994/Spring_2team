<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판 목록</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Pets Love Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/galleryeffect.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

<!-- fonts -->
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Acme' rel='stylesheet'
	type='text/css'>
<!-- //fonts -->

<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->

</head>
<body>
	<%@include file="top.jsp"%>
	<div class="gallery">
		<div class="container">
			<h3 class="title">
				Our <span>Board</span>
			</h3>

			<form action="board.do" method="post">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>글번호</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>

						<tbody>

							<c:if test="${empty boardPage.boardList}">
								<tr>
									<td colspan="6">작성된 게시글이 존재하지 않습니다.</td>
								</tr>
							</c:if>

							<c:forEach items="${boardPage.boardList}" var="boardList">
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

								<td colspan="6" align="right">
									<h1 class="t-button">
										<a href="writeForm.do"> <span class="label label-success">[글쓰기]</span>
										</a>
									</h1>
								</td>

							</tr>
						</tbody>
					</table>


				<div id="search" class="col-lg-6 in-gp-tl">
					<nav>
						<ul class="pagination pagination-lg">
							<!-- 	하단 페이지 링크 부분 -->
							<c:forEach begin="${boardPage.startPage}"
								end="${boardPage.endPage}" var="p" step="1">

								<li><a href="board.do?page=${p}">${p} </a></li>
							</c:forEach>
						</ul>
					</nav>

					<div class="input-group">
						<div class="input-group-btn">
							<select name="searchType" class="btn btn-default dropdown-toggle">
								<option value="1" selected="selected">제목</option>
								<option value="2">작성자</option>
								<option value="3">카테고리</option>
							</select>
						</div>
						<input type="text" class="form-control" name="searchWrite"
							size="40"> <span class="input-group-btn"> <input
							type="submit" class="btn btn-default" value="검색">
						</span> <input type="hidden" id="searchType"> <input
							type="hidden" id="searchWrite">
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
</html>