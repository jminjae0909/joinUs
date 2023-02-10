<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEE</title>
</head>
<body>
	<header id="header" class="fixed-top header-inner-pages">
		<div class="container d-flex align-items-center justify-content-lg-between">

			<h1 class="logo me-auto me-lg-0">
				<a href="/joinus/main" style="text-decoration: none;">CODEE<span>.</span></a>
			</h1>

			<nav id="navbar" class="navbar order-last order-lg-0">
				<ul>
					<li>
						<c:if test="${ldto.users_role == 'ADMIN' }">
							<a class="nav-link scrollto" href="/admin">관리자 페이지</a>
						</c:if>
					</li>
					<li>
						<a class="nav-link scrollto" href="/storehome">스토어</a>
					</li>

					<li>
						<c:if test="${ldto.users_id eq null }">
							<a class="nav-link scrollto" href="/login">새글 쓰기</a>
						</c:if>
						<c:if test="${ldto.users_id ne null }">	
							<a class="nav-link scrollto" href="/meeting/write">새글 쓰기</a>
						</c:if>	
					</li>
					<li class="dropdown">
						<c:if test="${ldto.users_id eq null }">
							<a href="/login" style="text-decoration: none;"><span>로그인</span></a>
						</c:if>
						<c:if test="${ldto.users_id ne null }">
							<a href="#" style="text-decoration: none;"><span>${ldto.users_nick}님, 환영합니다</span> <i class="bi bi-chevron-down"></i></a>
							<ul>
								<li><a href="/joinus/mypage">마이페이지</a></li>
								<li><a href="/joinus/changeInfo">회원정보수정</a></li>
								<li>
									<a href="/logout">로그아웃</a>
								</li>
							</ul>
						</c:if>
					</li>
				</ul>
			</nav>
		</div>
	</header>
</body>
</html>