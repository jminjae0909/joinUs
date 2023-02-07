<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEE/로그인</title>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- bootstrap cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet" href="../Resources/css/loginForm.css">

<!-- js -->
<script src="../Resources/js/loginForm.js"></script>

</head>
<body id="body">

<div class="container" id="container">
	<h1><a id="main" href="/joinus/main">CODEE<span id="yellow">.</span></a></h1>
	<form action="/login" method="post">
		<div class="mb-3">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" />
  			<input type="text" class="form-control" id="inputId" placeholder="아이디" name="users_id">
		</div>
		<div class="mb-3">
			<input type="password" class="form-control" id="inputPwd" placeholder="비밀번호" name="users_pwd">
		</div>
		<div class="d-grid gap-2">
  			<button id="loginBtn" class="btn btn-warning btn-lg" type="submit">로그인</button>
		</div>
	</form>
		<span><a id="re" href="/searchIdPw">아이디/비밀번호 찾기</a></span>
		<span><a id="re" href="/regist">회원가입</a></span>
		
		<div id="msg">SNS계정으로 간편하게 로그인/회원가입</div>
		<div id="logo">
			<div class="logo">
				<a href="oauth2/authorization/kakao">
					<img id="kakao" src="../images/kakao.png" alt="" />
				</a>
			</div>
			<div class="logo">
				<a href="oauth2/authorization/naver">
					<img id="naver" src="../images/naver.png" alt="" />
				</a>
			</div>
			<div class="logo">
				<a href="oauth2/authorization/google">
					<img id="google" src="../images/google.png" alt="" />
				</a>
			</div>
		</div>
</div>
</body>
</html>