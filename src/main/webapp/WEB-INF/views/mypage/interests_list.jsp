<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<div class="margind">
	<table class="table table-hover">
		<tr class="tablehd">
			<th>제목</th>
			<th>즐겨찾기 등록날짜</th>
			<th>삭제</th>
		</tr>
		<!-- db 연결해서 데이터를 가져온 후 완성 -->

		<tr class="tablemain">
			<td><a href="detailFacilities.jsp?facno="></a></td>
			<td align="center"></td>
			<td align="center"><input type="checkbox" name="xxx" value="yyy"
				checked></td>
		</tr>
		<tr>
			<td colspan="3">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">

						<li class="page-item"><a class="page-link">Previous</a></li>

						<li class="page-item"><a class="page-link"
							href="mypage.jsp?il=">1</a></li>

						<li class="page-item"><a class="page-link" href="#">Next</a></li>

					</ul>
				</nav>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<div class="btnref">
					<a href=""> <input type="button" value="삭제" class="btn btn-success" />
					</a>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>