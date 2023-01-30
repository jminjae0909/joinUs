<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="../css/registForm.css" />

<!-- js -->
<script src="../Resources/js/registForm.js"></script>
</head>
<body>
<div class="container">
	<h1>registForm.jsp</h1>
	
	<div class="mb-3">
  		<label for="email" class="form-label">이메일</label>
  		<input type="email" class="form-control" id="exampleFormControlInput1" value="${email }">
	</div>
	
	<div class="mb-3">
  		<label for="id" class="form-label">아이디 입력</label>
  		<input type="text" id="id" class="form-control" id="exampleFormControlInput1" >
	</div>
	<div class="d-grid gap-2">
  		<button class="btn btn-primary" id="idBtn" type="button">중복체크</button>
	</div>
	<div class="mb-3">
  		<label for="pw" class="form-label">비밀번호 입력</label>
  		<input type="password" id="pw" class="form-control" id="exampleFormControlInput1" >
	</div>
	<div class="mb-3">
  		<label for="id" class="form-label">비밀번호 재입력</label>
  		<input type="password" id="rePw" class="form-control" id="exampleFormControlInput1" >
	</div>
	<div class="mb-3">
  		<label for="id" class="form-label">닉네임</label>
  		<input type="text" id="nickname" class="form-control" id="exampleFormControlInput1" >
	</div>
	
</div>
</body>
</html>