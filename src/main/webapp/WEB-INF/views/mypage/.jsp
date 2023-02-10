<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">

<style>

.btnref {
	float: right;
}

table {
	width: 100%;
}

.tablehd {
	background: #ffc45199;
}

</style>
</head>
<body>
	<div class="margind1">
		<table class="table table-hover">
			<tr class="tablehd">
				<th>게시물번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>시작 예정일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="dto" items="${mypageList }">
			<tr onClick="location.href='/meeting/detail?meeting_number=${dto.meeting_number }'"> 
				<td align="center">${dto.meeting_number }</td>
				<td align="center">${dto.meeting_title }</td>
				<td align="center">${dto.meeting_insertdate }</td>
				<td align="center">${dto.meeting_startdate }</td>
				<td align="center">${dto.meeting_hits }</td>
			</tr>
			</c:forEach>
			
			<tr>
				<td colspan="5" >
					<nav aria-label="Page navigation example" >
						<ul class="pagination justify-content-center">
							<c:if test="${mypageMap.isPre }">
						    	<li class="page-item"><a class="page-link" onclick="page(${map.currentPage-5 })">Previous</a></li>
						    </c:if>
						    <c:forEach var="i" begin="${mypageMap.startPage }" end="${mypageMap.endPage }">
						    	<li class="page-item"><a class="page-link" onclick="page(${i})">${i }</a></li>
						    </c:forEach>
						    <c:if test="${mypageMap.isNext }">
								<li class="page-item"><a class="page-link" onclick="page(${map.currentPage+5 })">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>