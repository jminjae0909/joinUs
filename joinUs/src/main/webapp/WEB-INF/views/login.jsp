<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<form action="/users/login" method="post">
	<table>
		<tr>
			<th>id</th>
			<td><input type="text" name="users_id" id="" /></td>
		</tr>
		<tr>
			<th>pw</th>
			<td><input type="text" name="users_pwd" id="" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<a class="btn btn-outline-primary" href="oauth2/authorization/google">구글</a>
				<a class="btn btn-outline-primary" href="oauth2/authorization/naver">네이버</a>
				<a class="btn btn-outline-primary" href="oauth2/authorization/kakao">카카오</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>