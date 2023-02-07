<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../script.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>

<!-- css -->
<link rel="stylesheet" href="../Resources/css/registOk.css">

<!-- bootstrap cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="../head.jsp" />
<div class="container" id="container">
	<img src="../images/ecology.png" alt="" />
	<h1>회원가입이 완료되었습니다!</h1>
	<div id="congmsg">
		CODEE에서 마음이 맞는 사람을 찾아 공부하고<br />
		나만의 커피나무를 키워보세요!
	</div>
	<div id="btnGroup">
		<a href="/login" id="goLogin" class="btn btn-warning">로그인하기</a>
		<a href="/joinus/main" id="goMain" class="btn btn-secondary">메인화면으로 가기</a>
	</div>
</div>
</body>
</html>