<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
	<div class="margind2">
		<table class="table table-hover">
			<tr class="tablehd">
				<th>즐겨찾기 번호</th>
				<th>제목</th>
				<th>즐겨찾기 등록날짜</th>
				<th>삭제</th>
			</tr>
	
			<c:forEach var="dto" items="${mypageList }">
			<tr> 
				<td align="center">${dto.favorites_number }</td>
				<td align="center">${dto.meeting_title }</td>
				<td align="center">${dto.favorites_date }</td>
				<td align="center"><button type="button" class="btn btn-outline-warning" onclick="deleteOne(${dto.favorites_number })">삭제</button></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="3" >
					<nav aria-label="Page navigation example" >
						<ul class="pagination justify-content-center">
							<c:if test="${mypageMap.isPre }">
						    	<li class="page-item"><a class="page-link" onclick="fav_page(${map.currentPage-5 })">Previous</a></li>
						    </c:if>
						    <c:forEach var="i" begin="${mypageMap.startPage }" end="${mypageMap.endPage }">
						    	<li class="page-item"><a class="page-link" onclick="fav_page(${i})">${i }</a></li>
						    </c:forEach>
						    <c:if test="${mypageMap.isNext }">
								<li class="page-item"><a class="page-link" onclick="fav_page(${map.currentPage+5 })">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>