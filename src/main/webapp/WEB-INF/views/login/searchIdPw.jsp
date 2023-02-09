<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../script.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- js -->
<script src="../Resources/js/searchIdPw.js"></script>

<!-- css -->
<link rel="stylesheet" href="../Resources/css/searchIdPw.css">

<!-- bootstrap cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="../head.jsp" />
<div class="container" id="container">
	<img src="../images/search.png" alt="" />
	<h3>아이디/비밀번호 찾기</h3>
	<div id="msg">* 일반 회원가입으로 가입한 정보만 조회 가능합니다.</div>
	<div class="mb-3">
  		<label for="exampleFormControlInput1" class="form-label">이메일을 입력하세요</label>
  		<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
	</div>
	<div class="d-grid gap-2">
  		<button id="checkEmail" class="btn btn-warning" type="button">이메일 인증하기</button>
	</div>
	<div class="input-group mb-3">
		<input type="text" id="memailconfirm" class="form-control" placeholder="인증번호 입력" aria-label="Recipient's username" aria-describedby="button-addon2">
  		<button id="memailconfirmBtn" class="btn btn-outline-secondary" type="button" id="button-addon2">찾기</button>
	</div>
	<div id="viewId">
		
	</div>
</div>
</body>
</html>