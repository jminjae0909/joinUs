<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../script.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet" href="../Resources/css/loginForm.css">

</head>
<body bgcolor="#FAFAFA">

<div class="container" id="container">
	<h1><a id="main" href="/joinus/main">CODEE</a></h1>
	<form action="/login" method="post">
		<div class="mb-3">
  			<input type="text" class="form-control" id="inputId" placeholder="아이디" name="users_id">
		</div>
		<div class="mb-3">
			<input type="password" class="form-control" id="inputPwd" placeholder="비밀번호" name="users_pwd">
		</div>
		<div class="d-grid gap-2">
  			<button id="loginBtn" class="btn btn-warning btn-lg" type="button">로그인</button>
		</div>
		<span><a id="re" href="">비밀번호 재설정</a></span>
		<span><a id="re" href="">회원가입</a></span>
		
		<div id="msg">SNS계정으로 간편하게 로그인/회원가입</div>
		<div id="logo">
			<div class="logo">
				<a href="oauth2/authorization/kakao">
					<img id="kakao" src="../Resources/img/kakao.png" alt="" />
				</a>
			</div>
			<div class="logo">
				<a href="oauth2/authorization/naver">
					<img id="naver" src="../Resources/img/naver.png" alt="" />
				</a>
			</div>
			<div class="logo">
				<a href="oauth2/authorization/google">
					<img id="google" src="../Resources/img/google.png" alt="" />
				</a>
			</div>
		</div>
	</form>
</div>
</body>
</html>