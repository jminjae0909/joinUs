<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/script.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container">
		<h1>detail.jsp</h1>
		
		<table class="table table-striped-columns">
			<tr>
				<th>게시물 번호</th>
				<td>${dto.meeting_number }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${dto.users_id }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${dto.meeting_insertdate }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.meeting_title }</td>
			</tr>
			<tr> 
				<th>내용</th>
				<td>${dto.meeting_contents }</td>
			</tr>
			<tr>
				<th>상태</th>
				<td>${dto.meeting_state }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${dto.meeting_hits }</td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td>${dto.meeting_membernum }</td>
			</tr>
			<tr>
				<th>연락방법</th>
				<td>${dto.meeting_contact }</td>
			</tr>
			<tr>
				<th>온, 오프</th>
				<td>${dto.meeting_onoff }</td>
			</tr>
			<tr>
				<th>모임 시작일</th>
				<td>${dto.meeting_startdate }</td>
			</tr>
			<tr>
				<th>모임 기간</th>
				<td>${dto.meeting_period }</td>
			</tr>
			<tr>
				<th>모임종류</th>
				<td>${dto.meeting_category }</td>
			</tr>
		</table>
			
		<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
			<jsp:include page="../views/map.jsp">
				<jsp:param value="${dto.meeting_place }" name="place"/>
			</jsp:include>
		</div>
		
		<table class="table table-striped-columns">
			<tr>
				<td colspan="4">
					<a href="main" class="btn btn-outline-primary">목록</a>
					<a href="/meeting/modify?meeting_number=${dto.meeting_number }" class="btn btn-outline-primary">수정</a>
					<a href="/meeting/delete?meeting_number=${dto.meeting_number }" class="btn btn-outline-primary">삭제</a>
				</td>
			</tr>
		</table>	
		
		
		
	</div>
</body>
</html>