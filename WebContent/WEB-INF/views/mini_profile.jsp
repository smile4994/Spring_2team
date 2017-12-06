<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/custom.css?ver=1" rel="stylesheet" type="text/css" media="all" />

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
<script type="text/javascript">
window.onload = function(){
	var message = '${message}';
	if(message == null && message == ''){
		alert(message);
	}else{
		return false;
	}
	location.href="board.do";
}

	function closeProfile(){
		window.close();
	}

</script>
</head>
<body>
	<div class="news-left">
		<div class="container">
			<h3 class="title ">
				프로필
			</h3>
			<form>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">ID</span>
					<input type="text" class="form-control" name="id" value="${memberInfo.id}" readonly="readonly">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">NAME</span>
					<input type="text" class="form-control" 
						name="name" value="${memberInfo.name}" readonly="readonly">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">프로필사진</span>
					<div id="img_box"><img style="width: 100px; height: 100px;" src="${memberInfo.memberSrc}"></div>
				</div>
			</form>
			<div class="row">
				<div class="in-gp-tb">
					<div class="input-group">
						<button class="btn btn-default" ONCLICK="closeProfile();"type="button">닫기</button>
					</div>
					<!-- /input-group -->
				</div>
				<!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->
		</div>
	</div>
</body>
</html>