<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Insert title here</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		replyRead_func();
		$('#replyOk').click(function() {
			var str = $('#re_contents').val();
			var a = str.charAt(0);
			if (a == " " || str.length < 1) {
				alert("댓글의 첫글자 공백을 허용하지 않습니다");
				return false;
			}
			replyWrite_func();
			return true;
		})

		$('#replyDel').click(function() {
			alert("replyDel누름");
		})
	})

	function replyDel_func(replyNum) {
		var replyNum = replyNum;
		var result = "성공";
		$.ajax({
			url : 'replyDelete.do',
			type : 'get',
			data : 'replyNum=' + replyNum,
			cache : false,
			success : function(data) {
				replyRead_func();
				if (data != result) {
					alert("다른사람글은 건드릴수 없어");
				}
			},
			error : function() {
			}
		})
	}

	function replyWrite_func() {
		var re_contents = $('#re_contents').val();
		var allData = {
			"boardNum" : $('input[name=boardNum]').val(),
			"re_contents" : $('#re_contents').val()
		};
		$.ajax({
			type : 'post',
			url : 'replyWrite.do',
			data : allData,
			cache : false,
			success : function(responseData) {
				replyRead_func();
				$('#re_contents').val("");
			},
			error : function() {
				alert("replyWrite_ajax실패");
			}
		})
	}

	function replyRead_func() {
		var boardNum = ${board.boardNum};
			$.ajax({
					url : 'replyRead.do',
					type : 'get',
					data : 'boardNum=' + boardNum,
					dataType : 'json',
					cache : false,
					success : function(data) {
						var replyHtml = "";
						$.each(data,function(key, replyList) {
							replyHtml += "<div style='width:25%'><b><img style='width: 50px; height: 50px;' src='"+replyList.re_src+"'></b>&nbsp";
							replyHtml += "<b>"
									+ replyList.re_writer
													+ "</b>&nbsp:&nbsp";
											replyHtml += replyList.re_contents;
											replyHtml += "<a id='replyDel' onclick='replyDel_func("
													+ replyList.reply_num
													+ ")' style='color:grey;'>&times;</a>";
											replyHtml += "<div style='font-size:12px;font-style:monospace; color:grey; margin-top:5px; margin-bottom:3px;'>"
													+ replyList.re_date
													+ "</div><hr>";
											replyHtml += "</div>"
										});
						$('#replyRead').html(replyHtml);
					},
					error : function() {
					}
				});
	}

	function del_func() {
		var result = confirm('정말 삭제하시겠습니까?');
		if (result == true) {
			location.href = "delete.do?boardNum=${board.boardNum}";
			return true;
		}
		return false;
	}
</script>
<style type="text/css">
.table {
	width: 700;
	max-width: 700;
	margin-bottom: 20px;
}
</style>

</head>
<body>
	<%@include file="top.jsp"%>

	<div class="gallery">
		<div class="container">
			<h3 class="title">
				Board<span>Read</span>
			</h3>

			<form action="repleForm.do" method="post">
				<input type="hidden" name="ref" value="${board.ref}"> <input
					type="hidden" name="indent" value="${board.indent}"> <input
					type="hidden" name="step" value="${board.step}">


				<table class="table table-bordered">
					<tr>
						<td>카테고리</td>
						<td><input type="text" name="kategorie" size="20"
							value="${board.kategorie}" readonly="readonly"></td>
					</tr>

					<tr>
						<td>글번호</td>
						<td><input type="text" name="boardNum" size="20"
							value="${board.boardNum}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" size="20"
							value="${board.title}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${board.writer}</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td>${board.count}</td>
					</tr>
					<tr>
						<td>작성일시</td>
						<td><fmt:formatDate value="${board.date}" type="both"
								dateStyle="short" timeStyle="short" /></td>
					</tr>


					<c:if test="${board.boardImg ne 'noImg'}">
						<tr>
							<td>이미지 파일</td>
							<td><img width="300" height="250" src="${board.boardImg}"
								alt="이미지형식이 맞지 않습니다"></td>
						</tr>
					</c:if>
					<tr>
						<td>내용</td>
						<td>${board.contents}</td>
					</tr>
					<tr>
						<td colspan="2" align="right"><input type="submit"
							class="btn btn-default" name="sbm" value="[답글]"></td>
					</tr>
				</table>
			</form>


			<div id="selectBtn" align="center">
				<h2 class="t-button">
					<a href="board.do"> <span class="label label-primary">[목록]</span>
					</a>

					<c:if test="${sessionScope.loginId == board.writer}">
						<a href="updateForm.do?boardNum=${board.boardNum}"> <span
							class="label label-success">[수정]</span>
						</a>
						<a onclick="del_func()" href="#"> 
						<span class="label label-danger">[삭제]</span></a>
					</c:if>
				</h2>
			</div>
			<br>

			<!-- 	리플이 달리는부분ㅎㅎ -->
			<div id="replyRead" align="center"></div>

			<div id="replyWrite" align="center">
				<textarea id="re_contents" rows="5" cols="50"
					onclick="if(this.value=='댓글을 입력하세요'){this.value=''}">댓글을 입력하세요</textarea>
				<input type="button" class="btn btn-default" id="replyOk" value="확인">
			</div>
		</div>
	</div>

</body>
</html>
