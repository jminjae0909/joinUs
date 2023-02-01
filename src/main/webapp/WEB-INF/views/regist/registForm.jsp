<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="../Resources/css/registForm.css">

<!-- js -->
<script src="../Resources/js/registForm.js"></script>

<!-- bootstrap cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<!-- daum post cdn -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="container">
	<div id="logo">
		<a href="/joinus/main" >CODEE</a>
	</div>
	<div id="regist">회원가입</div>
	<form action="/regist" method="post" onsubmit="return checkAll()">
		<h6>아이디</h6>
		<div class="input-group mb-3">
			<input type="text" id="id" name="users_id" class="form-control" placeholder="아이디" aria-label="Recipient's username" aria-describedby="button-addon2">
  			<button id="idBtn" class="btn btn-outline-secondary" type="button" id="button-addon2">중복확인</button>
		</div>
		<div id="idCheck"></div>
		<h6>이메일</h6>
		<div class="input-group mb-3">
  			<input type="text" id="email1" name="email1" class="form-control" placeholder="이메일 아이디" aria-label="Username" value="${emailId }" >
  			<span class="input-group-text">@</span>
  			<input type="text" id="email2" name="email2" class="form-control" placeholder="이메일 주소" aria-label="Server" value="${emailDomain}" >
  			<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"></button>
  				<ul id="mytype" class="dropdown-menu dropdown-menu-end">
    				<li><a class="dropdown-item" href="#">naver.com</a></li>
    				<li><a class="dropdown-item" href="#">gmail.com</a></li>
    				<li><a class="dropdown-item" href="#">daum.net</a></li>
    				<li><a class="dropdown-item" href="#">hanmail.net</a></li>
  				</ul>
		</div>
		<h6>비밀번호</h6>
		<div class="input-group mb-3">
			<input type="password" id="pw" name="users_pwd" class="form-control" aria-label="Text input with dropdown button" placeholder="비밀번호 입력">
		</div>
		<h6>비밀번호 확인</h6>
			<div class="input-group mb-3">
				<input type="password" id="rePw" name="rePw" class="form-control" aria-label="Text input with dropdown button" placeholder="비밀번호 확인">
			</div>
		<div id="pwCheck"></div>
		<h6>닉네임</h6>
		<div class="input-group mb-3">
			<input type="text" id="nickname" name="users_nick" class="form-control" aria-label="Text input with dropdown button" placeholder="닉네임 입력">
		</div>
		<h6>이름</h6>
		<div class="input-group mb-3">
			<input type="text" id="name" name="users_name" class="form-control" aria-label="Text input with dropdown button" placeholder="이름 입력">
		</div>
		<h6>전화번호</h6>
			<div class="input-group mb-3">
				<input type="text" id="phone" name="users_phone" class="form-control" aria-label="Text input with dropdown button" placeholder="하이픈(-)없이 입력">
			</div>
		<h6>주소</h6>
		<div class="input-group mb-3">
			<input type="text" id="zipcode" name="users_zipcode" class="form-control" placeholder="우편번호" aria-label="Recipient's username" aria-describedby="button-addon2" readonly>
  			<button class="btn btn-outline-secondary" type="button" id="searchAddrs">주소찾기</button>
  		</div>
  		<div class="input-group mb-3">
  			<input type="text" id="address" name="address" class="form-control" aria-label="Text input with dropdown button" placeholder="주소입력" readonly>
  		</div>
  		<div class="input-group mb-3">
  			<input type="text" id="addrsDetail" name="addrsDetail" class="form-control" aria-label="Text input with dropdown button" placeholder="상세주소 입력">
		</div>
		<div id="button">
			<button type="submit" class="btn btn-primary">회원가입하기</button>
			<a href="/main"><button type="button" class="btn btn-secondary">취소하기</button></a>
		</div>
	</form>
</div>
<body>

</html>