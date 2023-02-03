<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../views/script.jsp"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<style type="text/css">
	.icon-box {
		width: 800px;
		height: 210px;
	}
	 .icon-box {
			border-radius: 2em;
			border: 3px solid #dee2e6;
			margin: auto;
		}
	
	#payment{
		margin-top: 150px; 
		text-align: center;
	}
	

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="head.jsp" />
	
		<div id="payment">
			<div class="icon-box">
				<h2 class="title">구매 완료</h2>
					<p> &nbsp;</p>
					<p>~님 구매가 완료되었습니다.</p>
					<p>현재 ~님의 잔여 커피콩은 ~ 개 입니다.</p>
					
			
				<%-- <c:forEach var="dto" items="${list}">
					<h3 class="mt-0">${dto.users_id}님 구매가 완료되었습니다.</h3>
					
					<p>구매 번호 : ${dto.payment_number}</p>
					<p>구매한 상품번호 : ${dto.store_number}</p>
					<p>구매 날짜 : ${dto.payment_date}</p> --%>
					
					<a href="/index.html" class="btn btn-primary">홈으로 돌아가기</a>
				<%-- </c:forEach> --%>
			</div>
		
	</div>

</body>
</html>