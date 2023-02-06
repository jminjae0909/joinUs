<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- 서머노트 -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">


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
		
		$('.summernote').summernote({
			  height: 500,
			  width: 950,
			  lang: "ko-KR",
			  focus : true,
			  toolbar: [
				    // 글꼴 설정
				    ['fontname', ['fontname']],
				    // 글자 크기 설정
				    ['fontsize', ['fontsize']],
				    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    // 글자색
				    ['color', ['forecolor','color']],
				    // 표만들기
				    ['table', ['table']],
				    // 글머리 기호, 번호매기기, 문단정렬
				    ['para', ['ul', 'ol', 'paragraph']],
				    // 줄간격
				    ['height', ['height']],
				    // 그림첨부, 링크만들기, 동영상첨부
				    ['insert',['picture','link','video']],
				  ],
				  // 추가한 글꼴
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
				 // 추가한 폰트사이즈
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']									
		});
		
		$("#modi_button").click(function(){
			if($('#choices-multiple-remove-button').val().length==0){
				$('#choices-multiple-remove-button').focus();
				alert("기술을 선택해주세요");
				return false;
			};
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
	
	/* 주소 API */
	window.onload=function(){
		var btn = document.getElementById("addr");
		btn.onclick=openKakaoPostcode;
	};
	function openKakaoPostcode(){

		new daum.Postcode({
			oncomplete: function(data){

			document.getElementById("addr").value=data.roadAddress;
			}
		}).open();		
	};
			
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
}

li{
	list-style: none;
}

.information_title{
	margin-top: 100px;
} 
  
.form-select{
	width: 450px;
	height: 50px;
}
.form-control{
	width: 450px;
	height: 50px;
}

.zero_line_ul{
	margin-left: 100px;
    margin-top: 100px;   	
}

.zero_line_li1{
	float: left;
}

.one_line_ul{
	margin-left: 100px;
    margin-top: 50px;   	
}

.one_line_li1{
	float: left;
}

.one_line_li2{
	float: left;
	margin-left: 50px;
}

.two_line_ul{
	margin-left: 100px;
    margin-top: 100px;   	
}

.two_line_li1{
	float: left;
}

.two_line_li2{
	float: left;
	margin-left: 50px;
}

.three_line_ul{
	margin-left: 100px;
    margin-top: 100px;   	
}

.three_line_li1{
	float: left;
}

.three_line_li2{
	float: left;
	margin-left: 50px;
}

.four_line_ul{
	margin-left: 100px;
    margin-top: 100px;   	
}

.four_line_li1{
	float: left;
}


.choices__inner{
	float: right;
	margin-left: 90px;
	width: 450px;
	height: 50px;
	border-radius: 7px;
}

.five_line_ul{
	margin-left: 100px;
    margin-top: 50px;   	
}

.four_line_li1{
	float: left;
}

#meeting_title{
	width: 950px;
}

.four_line_li2{
	float: left;
	margin-left: 100px;
}

.information_title{
	display: flex;
    align-items: center;
    padding: 16px;
    margin-bottom: 36px;
    border-bottom: 3px solid #f2f2f2;
    margin-left: 100px;
    width: 1000px;
}

.number_icon1{
	margin-right: 8px;
    width: 28px;
    height: 28px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    background: #ffcd00;
    font-size: 16px;
    font-weight: 700;
    line-height: 19px;
    color: #fff;
}

.information_insert{
	font-weight: 700;
    font-size: 24px;
    line-height: 40px;
    letter-spacing: -.05em;
    margin: 0;
}

.contents_title{
	margin-top:100px;
	display: flex;
    align-items: center;
    padding: 16px;
    margin-bottom: 36px;
    border-bottom: 3px solid #f2f2f2;
    margin-left: 100px;
    width: 1000px;
}

.number_icon2{
	margin-right: 8px;
    width: 28px;
    height: 28px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    background: #ffcd00;
    font-size: 16px;
    font-weight: 700;
    line-height: 19px;
    color: #fff;
}

.contents_insert{
	font-weight: 700;
    font-size: 24px;
    line-height: 40px;
    letter-spacing: -.05em;
    margin: 0;
}
.write_back_button{
	display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-top: 1rem;
    margin-right: 210px;
}

#write_button{
	margin-left: 10px;
}

.label{
	display: inline-block;
    margin-bottom: 5px;
    color: #333;
    font-weight: bold;
    font-size: 18px;
}

a{
	text-decoration: none;	
}

a:hover{
	text-decoration:none;
}

</style>

<body>

	<jsp:include page="head.jsp" />

	<div class="container">
		<form action="modify" method="post">
			<input type="hidden" name="users_id" id="users_id" value="${meetingdto.users_id }" />
			<div>
			<section>
				<div class="information_title">
					<span class="number_icon1">1</span>
					<h2 class="information_insert">기본 정보를 입력해주세요.</h2>
				</div>
			</section>
			<div>
				<ul class="one_line_ul">
					<li class="one_line_li1">
						<label class="label">모집 종류</label>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_category" id="meeting_category_val2">
								<option selected>선택하세요</option>
								<option value="0">프로젝트</option>
								<option value="1">스터디</option>
							</select>
						</div>
						<div>
							<input type="hidden" name="" id="meeting_category_val" value="${meetingdto.meeting_category }" />					
						</div>
					</li>
					<li class="one_line_li2">
						<label class="label">모집 인원</label>
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
							<input type="hidden" name="" id="meeting_membernum_val" value="${meetingdto.meeting_membernum }" />
						</div>
					</li>
				</ul>
			</div>
			</div>
			<br>
			<div>
				<ul class="two_line_ul">
					<li class="two_line_li1">
						<label class="label">진행 방식</label>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_onoff" id="meeting_onoff_val2">
								<option selected>선택하세요</option>
								<option value="온라인">온라인</option>
								<option value="오프라인">오프라인</option>
							</select>
						</div>
						<div>
							<input type="hidden" name="" id="meeting_onoff_val" value="${meetingdto.meeting_onoff }" />					
						</div>
					</li>
					<li class="two_line_li2">
						<label class="label">예상 기간</label>
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
							<input type="hidden" name="" id="meeting_period_val" value="${meetingdto.meeting_period }" />					
						</div>
					</li>
				</ul>
			</div>
			<br>
			<div>
				<ul class="three_line_ul">
					<li class="three_line_li1">
						<label class="label">시작 예정</label>
						<div>
							<input type="text" id="date-picker"
							class="form-control bg-white border-1 small" aria-label="Search"
							aria-describedby="basic-addon2" name="meeting_startdate" value="${meetingdto.meeting_startdate}">					
						</div>
					</li>
					<li class="three_line_li2">
						<label class="label">모임 장소</label>
						<div>
							<input type="text"  class="form-control" name="meeting_place" id="addr" size="30" placeholder="주소 찾기" value="${meetingdto.meeting_place }"/>											
						</div>
					</li>
				</ul>
			</div>
			<br>
			<div>
				<ul class="four_line_ul">
					<li class="four_line_li1">
						<label class="label">오픈 카톡</label>
						<div>
							<input type="text" class="form-control" name="meeting_contact" id="" value="${meetingdto.meeting_contact }" />					
						</div>
					</li>
					<li class="four_line_li2">
						<label style="margin-left: -50px;" class="label">기술</label>
						<div class="row d-flex justify-content-center mt-100">
						<div class="col-md-6">
							<select id="choices-multiple-remove-button"
								placeholder="Select upto 5 tags" class="mul-select" name="meeting_skill"  multiple>
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
							<input type="hidden" name="" id="meeting_skill_val" value="${meetingdto.meeting_skill }" />					
						</div>
					</li>
				</ul>
			</div>
			<br>
			<div>
				<ul class="zero_line_ul">
					<li class="zero_line_li1">
						<label class="label">모집 상태</label>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_state" id="meeting_state_val2">
								<option selected>선택하세요</option>
								<option value="0">모집중</option>
								<option value="1">모집완료</option>
							</select>
						</div>
						<div>
							<input type="hidden" name="" id="meeting_state_val" value="${meetingdto.meeting_state }" />					
						</div>
					</li>
				</ul>
			</div>
			<br>
			<br>
			<br>
			<br>
			<div>
			<section>
				<div class="contents_title">
					<span class="number_icon2">2</span>
					<h2 class="contents_insert">프로젝트를 소개해주세요.</h2>
				</div>
			</section>
				<ul class="five_line_ul">
					<li class="five_line_li1">
						<label class="label">제목</label>
						<div>							
							<input class="form-control" type="text" name="meeting_title" id="meeting_title" value="${meetingdto.meeting_title }" />					
							<input type="hidden" name="meeting_number" value="${meetingdto.meeting_number }" />
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" />
						</div>
						<br>
						<div>
							<textarea class="summernote" name="meeting_contents">${meetingdto.meeting_contents }</textarea> 
						</div>
					</li>					
				</ul>
			</div>
			<br>
			<div>
				<section class="write_back_button">
					<a href="javascript:history.back();"><input type="button" value="취소" id="back_button"  class="btn btn-light" /></a>
					<input type="submit" value="수정완료" id="modi_button" class="btn btn-dark"/>	
				</section>
			</div>
		</form>
	</div>

</body>
</html>