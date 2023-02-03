<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./script.jsp"%>

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



</head>
<script>

	$(function() {
		$(document).ready(
				function() {

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
			language: "ko",
	        keyboardNavigation: false,
	        forceParse: false,
	        autoclose: true,
	        todayHighlight: true
		});
				
	});
	
	$(function() {
				
		/* modi select value값 가져오기 */
		/* 미팅상태 */
		var meeting_state_val =  $('#meeting_state_val').val();					
		$("#meeting_state_val2 option[value='"+meeting_state_val+"']").prop("selected",true);
		/* 미팅인원 */
		var meeting_membernum_val = $('#meeting_membernum_val').val();		
		$("#meeting_membernum_val2 option[value='"+meeting_membernum_val+"']").prop("selected",true);		
		/* 미팅온&오프 */
		var meeting_onoff_val = $('#meeting_onoff_val').val();		
		$("#meeting_onoff_val2 option[value='"+meeting_onoff_val+"']").prop("selected",true);
		/* 작업기간 */
		var meeting_period_val = $('#meeting_period_val').val();
		$("#meeting_period_val2 option[value='"+meeting_period_val+"']").prop("selected",true);		
		/* 모임종류 */
		var meeting_category_val = $('#meeting_category_val').val();		
		$("#meeting_category_val2 option[value='"+meeting_category_val+"']").prop("selected",true);
		
	});
		
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

	<div class="container">
		<form action="modify" method="post">
			<table class="table table-striped">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="users_id" id="" value="${dto.users_id }"/></td>
				</tr>

			
				<tr>
					<th>제목</th>
					<td><input class="form-control" type="text" name="meeting_title" id="" value="${dto.meeting_title }" /></td>
					<td><input type="hidden" name="meeting_number" value="${dto.meeting_number }" /></td>

					<td><input type="hidden" name="skill_number" value="${dto2.skill_number }" /></td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea class="form-control" name="meeting_contents" id="" cols="80"
							rows="20">${dto.meeting_contents }</textarea></td>
				</tr>

				<tr>
					<th>상태</th>
					<td>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_state" id="meeting_state_val2">
								<option selected>선택하세요</option>
								<option value="0">모집중</option>
								<option value="1">모집완료</option>
							</select>
						</div>
						<div >
							<input type="hidden" name="" id="meeting_state_val" value="${dto.meeting_state }" />
						</div>
					</td>
				</tr>

				<tr>
					<th>모집인원</th>
					<td>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_membernum" id="meeting_membernum_val2">
								<option selected>선택하세요</option>
								<option value="1">1명</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<option value="5">5명</option>
								<option value="6">6명</option>
							</select>
						</div>
						<div >
							<input type="hidden" name="" id="meeting_membernum_val" value="${dto.meeting_membernum }" />
						</div>
					</td>
				</tr>
				<tr>
					<th>연락방법</th>
					<td><input type="text" class="form-control" name="meeting_contact" id="" value="${dto.meeting_contact }"/></td>
				</tr>
				<tr>
					<th>진행방식</th>
					<td>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_onoff" id="meeting_onoff_val2">
								<option selected>선택하세요</option>
								<option value="온라인">온라인</option>
								<option value="오프라인">오프라인</option>
							</select>
						</div>
						<div>
							<input type="hidden" name="" id="meeting_onoff_val" value="${dto.meeting_onoff }" />					
						</div>
					</td>
				</tr>

				<tr>
					<th>시작예정</th>
					<td><input type="text" id="date-picker"
					class="form-control bg-white border-1 small" aria-label="Search"
					aria-describedby="basic-addon2" name="meeting_startdate" value="${dto.meeting_startdate }">

				</td>
				</tr>

				<tr>
					<th>예상기간</th>
					<td>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_period" id="meeting_period_val2">
								<option selected>선택하세요</option>
								<option value="1~2개월">1~2개월</option>
								<option value="2~3개월">2~3개월</option>
								<option value="3~4개월">3~4개월</option>
								<option value="5개월~장기">5개월~장기</option>
							</select> 
						</div>
						<div>
							<input type="hidden" name="" id="meeting_period_val" value="${dto.meeting_period }" />					
						</div>
					</td>
				</tr>
				<tr>
					<th>모임장소</th>
					<td><input type="text" class="form-control" name="meeting_place" id="" value="${dto.meeting_place }"/></td>
				</tr>
				<tr>
					<th>모임종류</th>
					<td>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_category" id="meeting_category_val2">
								<option selected>선택하세요</option>
								<option value="1">스터디</option>
								<option value="2">프로젝트</option>
							</select> 
						</div>
						<div>
							<input type="hidden" name="" id="meeting_category_val" value="${dto.meeting_category }" />					
						</div>
					</td>
				</tr>
				
				
				
				<tr>
					<th>기술</th>
					<td>					
						<div class="row d-flex justify-content-center mt-100">
						<div class="col-md-6">
							<select id="choices-multiple-remove-button"
								placeholder="Select upto 5 tags" name="meeting_skill" multiple>
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
						<div>
							<input type="hidden" name="" id="meeting_skill_val" value="${dto.meeting_skill}" />					
						</div>										
					</td>
				</tr>
				
				<tr>
					<td><td><input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" /></td></td>
				</tr>

				<tr>
					<td colspan="4"><input type="submit" value="수정완료"
						class="btn btn-outline-primary" /></td>
				</tr>

			</table>

		</form>
	</div>

</body>
</html>