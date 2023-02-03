<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../views/script.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />


<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">


<!-- JavaScript Bundle with Popper -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
	integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"
	integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
<script
	src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<script>
	$(function() {
		$(document).ready(function() {
				var multipleCancelButton = new Choices(
						'#choices-multiple-remove-button', {
							removeItemButton : true,
							maxItemCount : 5,
							searchResultLimit : 5,
							renderChoiceLimit : 20
						});

					});

		$('#date-picker').datepicker({
			format : 'yyyy-mm-dd',
			language : "ko",
			keyboardNavigation : false,
			forceParse : false,
			autoclose : true,
			todayHighlight : true
		});

	});
	
	/* 주소 API */
	window.onload=function(){
		var btn = document.getElementById("addr");
		btn.onclick=openKakaoPostcode;
	}
	function openKakaoPostcode(){

		new daum.Postcode({
			oncomplete: function(data){

			document.getElementById("addr").value=data.roadAddress;
			}
		}).open();
		
	}
	
</script>

<style>
.choices__list--multiple .choices__item {
    display: inline-block;
    vertical-align: middle;
    border-radius: 20px;
    padding: 4px 10px;
    font-size: 12px;
    font-weight: 500;
    margin-right: 3.75px;
    margin-bottom: 3.75px;
    background-color: rgb(68, 68, 68);
    border: 1px solid rgb(68, 68, 68);
    color: #fff;
    word-break: break-all;
</style>

<body>
	<%-- <jsp:include page="head.jsp" /> --%>
	<h2>codee writeForm.jsp</h2>
	<h2>codee writeForm.jsp</h2>


	<div class="container">
		<form action="write" method="post">
			<table class="table table-striped">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="users_id" id="" /></td>
				</tr>

				<tr>
					<th>제목</th>
					<td><input class="form-control" type="text"
						name="meeting_title" id="" /></td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea class="form-control" name="meeting_contents"
							id="" cols="80" rows="20"></textarea></td>
				</tr>

				<tr>
					<th>상태</th>
					<td>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_state">
								<option selected>선택하세요</option>
								<option value="0">모집중</option>
								<option value="1">모집완료</option>
							</select>
						</div>
					</td>
				</tr>

				<tr>
					<th>모집인원</th>
					<td>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_membernum">
								<option selected>선택하세요</option>
								<option value="1">1명</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<option value="5">5명</option>
								<option value="6">6명</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>연락방법</th>
					<td><input type="text" class="form-control"
						name="meeting_contact" id="" /></td>
				</tr>
				<tr>
					<th>진행방식</th>
					<td>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_onoff">
								<option selected>선택하세요</option>
								<option value="온라인">온라인</option>
								<option value="오프라인">오프라인</option>
							</select>
						</div>
					</td>
				</tr>

				<tr>
					<th>시작예정</th>
					<td><input type="text" id="date-picker"
						class="form-control bg-white border-1 small" aria-label="Search"
						aria-describedby="basic-addon2" name="meeting_startdate">

					</td>
				</tr>

				<tr>
					<th>예상기간</th>
					<td>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_period">
								<option selected>선택하세요</option>
								<option value="1~2개월">1~2개월</option>
								<option value="2~3개월">2~3개월</option>
								<option value="3~4개월">3~4개월</option>
								<option value="5개월~장기">5개월~장기</option>
							</select>

						</div>
					</td>
				</tr>
				<tr>
					<th>모임장소</th>
					<td>
						<input type="text"  class="form-control" name="meeting_place" id="addr" size="30" />						
					</td>
									
				</tr>
				<tr>
					<th>모임종류</th>
					<td>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_category">
								<option selected>선택하세요</option>
								<option value="1">프로젝트</option>
								<option value="2">스터디</option>
							</select>
						</div>
					</td>
				</tr>

				<tr>
					<th>기술</th>
					<td>
						<div class="row d-flex justify-content-center mt-100">
						<div class="col-md-6">
							<select id="choices-multiple-remove-button"
								placeholder="Select upto 5 tags" class="mul-select" name="meeting_skill" multiple>
								<option value="java">java</option>
								<option value="Spring">Spring</option>
								<option value="Nodejs">Nodejs</option>
								<option value="Kotlin">Kotlin</option>
								<option value="TypeScript">TypeScript</option>
								<option value="React">React</option>
								<option value="Vue">Vue</option>
								<option value="MySQL">MySQL</option>
								<option value="Python">Python</option>
								<option value="php">php</option>
							</select>
						</div>
						</div>
							
					</td>
				</tr>

				<tr>
					<td><td><input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" /></td></td>
				</tr>
				
				<tr>
					<td colspan="4"><input type="submit" value="작성완료"
						class="btn btn-outline-primary" /></td>
				</tr>

			</table>

		</form>
	</div>

</body>
</html>