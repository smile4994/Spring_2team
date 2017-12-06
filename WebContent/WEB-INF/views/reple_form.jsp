<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>댓글 페이지</title>
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
				Board <span>Reply</span>
			</h3>

			<form action="repleWrite.do" method="post">
				<input type="hidden" name="ref" value="${board.ref}"> <input
					type="hidden" name="indent" value="${board.indent}"> <input
					type="hidden" name="step" value="${board.step}"> <input
					type="hidden" name="boardImg" value="${board.boardImg}">

				<table class="table table-bordered">
					<tr>
						<td>카테고리 :</td>
						<td><input type="text" name="kategorie" size="20"
							value="${board.kategorie}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>글번호 :</td>
						<td><input type="text" name="boardNum" size="20"
							value="${board.boardNum}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>제목 :</td>
						<td><input type="text" name="title" size="20"
							value="└${board.title}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>내용 :</td>
						<td><textarea name="contents" rows="20" cols="50" required></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
						<input type="submit" class="btn btn-default" value="작성완료"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>