<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</head>
<body>
	<h1>loginForm.jsp</h1>
	<form action="/login" method="post">
	<table>
		<tr>
			<th>ID</th>
			<td>
				<input type="text" name="users_id" id="" />
			</td>
		</tr>
		<tr>
			<th>pw</th>
			<td>
				<input type="password" name="users_pwd" id="" />
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<a class="btn btn-outline-primary" href="oauth2/authorization/google">구글 로그인</a>
				<a class="btn btn-outline-primary" href="oauth2/authorization/naver">네이버 로그인</a>
				<a class="btn btn-outline-primary" href="oauth2/authorization/kakao">카카오 로그인</a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인하기" />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>