<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../views/script.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.icon-box {
	width: 420px;
	height: 400px;
}

.switch-button {
	position: relative;
	display: inline-block;
	width: 55px;
	height: 30px;
}

.switch-button input {
	opacity: 0;
	width: 0;
	height: 0;
}

.onoff-switch {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	border-radius: 20px;
	background-color: #ccc;
	box-shadow: inset 1px 5px 1px #999;
	-webkit-transition: .4s;
	transition: .4s;
}

.onoff-switch:before {
	position: absolute;
	content: "";
	height: 22px;
	width: 22px;
	left: 4px;
	bottom: 4px;
	background-color: #fff;
	-webkit-transition: .5s;
	transition: .4s;
	border-radius: 20px;
}

.switch-button input:checked+.onoff-switch {
	background-color: #F2D522;
	box-shadow: inset 1px 5px 1px #E3AE56;
}

.switch-button input:checked+.onoff-switch:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

label {
	display: inline-block;
	width: 100px;
	line-height: 50px;
}

.icon-box {
	border-radius: 2em;
}

.icon-box * {
	text-align: left;
}

.services .icon-box {
	border: 3px solid #dee2e6;
}

.services .icon-box p {
	color: grey;
	font-size: 20px;
}

.services .icon-box .studyItem_title {
	font-size: 30px;
	margin: 20px 0px;
	color: black;
}

.services .icon-box .studyItem_place {
	margin: 30px 0px 80px 0px;
}

.studyItem_info {
	border-top: 2px solid #d1d1d1;
	padding: 25px 0px 0px 0px;
}

.breadcrumbs {
	background-color: white;
}

#services {
	padding-top: 5px;
}

#current_state {
	margin-bottom: 0px;
	font-size: 25px;
	font-weight: bold;
}
</style>

<script type="text/javascript">
	$(function() {
		$('.cbox').prop('checked', true);

		$('.cbox').change(function() {
			var category = $('.form-select').val();
			var state = $(".cbox").is(':checked');
			
			if(state) {
				$("#current_state").text("모집 중만 보기")
			}else {
				$("#current_state").text("전체 보기")
			}
			
			
			$.ajax({
				url : "/joinus/distinction",
				type : "GET",
				data : (state) ? {
					"state" : 0,
					"category" : category
				} : {
					"state" : 1,
					"category" : category
				}

			}).done(function(data) {

				$("#list").empty();
				$("#list").replaceWith(data);
			});

			if (!$(".cbox").is(':checked')) {
				$("#current_state").innerText("text");
			}
		});

		$(".form-select").change(function() {
			var category = $('.form-select').val();
			var state = $(".cbox").is(':checked');

			$.ajax({
				url : "/joinus/distinction",
				type : "GET",
				data : (state) ? {
					"state" : 0,
					"category" : category
				} : {
					"state" : 1,
					"category" : category
				}

			}).done(function(data) {
				$("#list").empty();
				$("#list").replaceWith(data);
			});

		});
	});
</script>
</head>
<body>
	<jsp:include page="head.jsp" />
	<h5><sec:authentication property="principal"/></h5>
	
	<main id="main">
		<jsp:include page="AD.jsp" />

		<!-- ======= Breadcrumbs ======= -->
		<section class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
					
					<div class="mainSelect" style="float: left;">
						<select class="form-select" aria-label="Default select example">
							<option selected>전체</option>
							<option value="1">프로젝트</option>
							<option value="2">스터디</option>
						</select>
					</div>
					<div class="state" style=" float: right;">
					<table>
						<tr>
							<td><p id="current_state">모집 중만 보기</p></td>
							<td>
								<label class="switch-button"> 
									<input type="checkbox" class="cbox" />
									<span class="onoff-switch"></span>
								</label>
							</td>
						</tr>
					</table>
					</div>		
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<section id="services" class="services">
			<div class="container aos-init aos-animate" data-aos="fade-up">
				<div class="row" id="list">
					<c:forEach var="dto" items="${list }" varStatus="status">
						<div
							class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 aos-init aos-animate"
							data-aos="zoom-in" data-aos-delay="100">
							<a href="/joinus/detail?meeting_number=${dto.meeting_number }">
								<div class="icon-box">

									<div class="studyItem_schedule">
										<p class="startedate">시작 예정일 |
											${dto.meeting_startdate.substring(0,10) }</p>
									</div>
									<h4 class="studyItem_title">${dto.meeting_title }</h4>
									<p class="studyItem_place">${dto.meeting_place }</p>

									<div class="studyItem_info">
										<p class="">
											<img src="" alt="" />작성자 : ${dto.users_id }
										</p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
	</main>

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center active"><i
		class="bi bi-arrow-up-short"></i></a>
</body>
</html>