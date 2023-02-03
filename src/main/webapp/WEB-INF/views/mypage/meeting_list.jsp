<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


<style>
.btnref{
float:right;
}
	table{
	width:100%;
	}
	.tablehd{
	background:rgb(209,231,221);
	}
</style>
</head>
<body>
	<div class="margind">
		<table class="table table-hover">
			<tr class="tablehd">
				<th>게시물번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>시작 예정일</th>
				<th>조회수</th>
			</tr>
			
			<tr>
				<td align="center"><a href="detailFacilities.jsp?facno="></a></td>
				<td><a href="detailFacilities.jsp?facno="></a></td>
				<td align="center"></td>
				<td align="center"></td>
				<td align="center"></td>
			
			</tr>

			<tr>
				<td colspan="5">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							
							<li class="page-item"><a class="page-link">Previous</a></li>
							<li class="page-item"><a class="page-link"
								href="mypage.jsp?rl=">1</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</nav>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>