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
<body id="body">

<div class="container" id="container">
	<div id="logo">
		<a id="main" href="/joinus/main" >CODEE<span id="yellow">.</span></a>
	</div>
	<div id="regist">회원가입</div>
	<form action="/regist" method="post" onsubmit="return checkAll()">
			<label for="id" class="form-label">아이디</label>
		<div class="input-group mb-3">
			<input type="text" id="id" name="users_id" class="form-control" placeholder="아이디" aria-label="Recipient's username" aria-describedby="button-addon2">
  			<button id="idBtn" class="btn btn-outline-secondary" type="button" id="button-addon2">중복확인</button>
		</div>
		<div id="idCheck"></div>
		<label for="email" class="form-label">이메일</label>
		
		<!-- 소셜로그인으로 회원가입 진행하는 경우 -->
		<c:if test="${emailId ne null && emailDomain ne null }">
			<div class="input-group mb-3">
				<input type="hidden" name="clientName" value="${clientName }" />
	  			<input type="text" id="email1" name="email1" class="form-control" placeholder="이메일 아이디" aria-label="Username" value="${emailId }" readonly >
	  			<span class="input-group-text">@</span>
	  			<input type="text" id="email2" name="email2" class="form-control" placeholder="이메일 주소" aria-label="Server" value="${emailDomain}" readonly >
	  			<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" disabled="disabled"></button>
	  				<ul id="mytype" class="dropdown-menu dropdown-menu-end">
	    				<li><a class="dropdown-item" href="#">naver.com</a></li>
	    				<li><a class="dropdown-item" href="#">gmail.com</a></li>
	    				<li><a class="dropdown-item" href="#">daum.net</a></li>
	    				<li><a class="dropdown-item" href="#">hanmail.net</a></li>
	  				</ul>
	  		</div>
		</c:if>
		
		<!-- 일반 회원가입으로 진행하는 경우 -->
		<c:if test="${emailId eq null && emailDomain eq null }">
			<div class="input-group mb-3">
				<input type="hidden" name="clientName" value="x" />
				<input type="text" id="email1" name="email1" class="form-control" placeholder="이메일 아이디" aria-label="Username" >
	  			<span class="input-group-text">@</span>
	  			<input type="text" id="email2" name="email2" class="form-control" placeholder="이메일 주소" aria-label="Server" >
	  			<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"></button>
	  				<ul id="mytype" class="dropdown-menu dropdown-menu-end">
	    				<li><a class="dropdown-item" href="#">naver.com</a></li>
	    				<li><a class="dropdown-item" href="#">gmail.com</a></li>
	    				<li><a class="dropdown-item" href="#">daum.net</a></li>
	    				<li><a class="dropdown-item" href="#">hanmail.net</a></li>
	  				</ul>
	  		</div>
	  		<div class="d-grid gap-2">
  				<button id="checkEmail" class="btn btn-secondary" type="button">이메일 인증하기</button>
			</div>
			<div class="mb-3">
  				<label for="memailconfirm" id="memailconfirmTxt" class="form-label">인증번호</label>
  				<input type="text" class="form-control" id="memailconfirm" placeholder="인증번호 입력">
			</div>
		</c:if>
		
		<label for="password" class="form-label">비밀번호</label>
		<div class="input-group mb-3">
			<input type="password" id="pw" name="users_pwd" class="form-control" aria-label="Text input with dropdown button" placeholder="비밀번호 입력">
		</div>
		<label for="password" class="form-label">비밀번호 확인</label>
			<div class="input-group mb-3">
				<input type="password" id="rePw" name="rePw" class="form-control" aria-label="Text input with dropdown button" placeholder="비밀번호 확인">
			</div>
		<div id="pwCheck"></div>
		<label for="nickname" class="form-label">닉네임</label>
		<div class="input-group mb-3">
			<input type="text" id="nickname" name="users_nick" class="form-control" aria-label="Text input with dropdown button" placeholder="닉네임 입력">
		</div>
		<label for="name" class="form-label">이름</label>
		<div class="input-group mb-3">
			<input type="text" id="name" name="users_name" class="form-control" aria-label="Text input with dropdown button" placeholder="이름 입력">
		</div>
		<label for="phone" class="form-label">전화번호</label>
			<div class="input-group mb-3">
				<input type="text" id="phone" name="users_phone" class="form-control" aria-label="Text input with dropdown button" placeholder="하이픈(-)없이 입력">
			</div>
		<label for="address" class="form-label">주소</label>
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
			<button type="submit" class="btn btn-warning">회원가입하기</button>
			<a href="/joinus/main"><button type="button" class="btn btn-secondary">취소하기</button></a>
		</div>
	</form>
</div>
</body>

</html>