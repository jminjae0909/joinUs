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
}

.services .icon-box .studyItem_place {
	margin: 30px 0px 80px 0px;
}

.studyItem_info {
	border-top: 2px solid #d1d1d1;
	padding: 25px 0px 0px 0px;
}

.find p {
	font-size: 20px;
}

.section-title {
	padding-bottom: 10px;
}

.breadcrumbs {
	background-color: white;
}

#services {
	padding-top: 5px;
}

* {
  margin: 0;
  padding: 0;
  box-sizing:border-box;
}

/* Slideshow container */
.slideshow-container {
  max-width: 1200px;
  max-height: 750px;
  position: relative;
  margin: auto;
}
.slideshow-container .mySlides img {
  height: 500px;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 3.0s;
  animation-name: fade;
  animation-duration: 3.0s;
}

@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
</style>
<script type="text/javascript">
	var slideIndex = 0; //slide index
	
	//HTML 로드가 끝난 후 동작
	window.onload=function(){
	showSlides(slideIndex);
	
	// Auto Move Slide
	var sec = 3000;
	setInterval(function(){
	 slideIndex++;
	 showSlides(slideIndex);
	
	}, sec);
	}
	
	
	//Next/previous controls
	function moveSlides(n) {
	slideIndex = slideIndex + n
	showSlides(slideIndex);
	}
	
	//Thumbnail image controls
	function currentSlide(n) {
	slideIndex = n;
	showSlides(slideIndex);
	}
	
	function showSlides(n) {
	
	var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("dot");
	var size = slides.length;
	
	if ((n+1) > size) {
	 slideIndex = 0; n = 0;
	}else if (n < 0) {
	 slideIndex = (size-1);
	 n = (size-1);
	}
	
	for (i = 0; i < slides.length; i++) {
	   slides[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
	   dots[i].className = dots[i].className.replace(" active", "");
	}
	
	slides[n].style.display = "block";
	dots[n].className += " active";
	}
</script>
<script type="text/javascript">
	$(function() {
		$('.cbox').prop('checked', true);

		$('.cbox').change(function() {
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

	<main id="main">
	
		<section class="breadcrumbs">
			
			<div class="slideshow-container">

				<!-- Full-width images with number and caption text -->
				<div class="mySlides fade">
					<div class="numbertext">1 / 4</div>
					<img
						src="https://divisare-res.cloudinary.com/images/f_auto,q_auto,w_800/v1491425456/ltekybkstiyl7faumrsq/acne-studios-acne-studio-potsdamer-strasse.jpg"
						style="width: 100%">
					<div class="text">ACNE STUDIO</div>
				</div>

				<div class="mySlides fade">
					<div class="numbertext">2 / 4</div>
					<img
						src="https://divisare-res.cloudinary.com/images/f_auto,q_auto,w_800/v1491425435/hwxwxqxfwo4htfgqksbu/acne-studios-acne-studio-potsdamer-strasse.jpg"
						style="width: 100%">
					<div class="text">ACNE STUDIO</div>
				</div>

				<div class="mySlides fade">
					<div class="numbertext">3 / 4</div>
					<img
						src="https://divisare-res.cloudinary.com/images/f_auto,q_auto,w_800/v1491425448/rnelglmoujifzlbzykxw/acne-studios-acne-studio-potsdamer-strasse.jpg"
						style="width: 100%">
					<div class="text">ACNE STUDIO</div>
				</div>

				<div class="mySlides fade">
					<div class="numbertext">4 / 4</div>
					<img
						src="https://divisare-res.cloudinary.com/images/f_auto,q_auto,w_800/v1491425434/coct9kmra7uhmeu4cxto/acne-studios-acne-studio-potsdamer-strasse.jpg"
						style="width: 100%">
					<div class="text">ACNE STUDIO</div>
				</div>

				<!-- Next and previous buttons -->
				<a class="prev" onclick="moveSlides(-1)">&#10094;</a> 
				<a class="next" onclick="moveSlides(1)">&#10095;</a>
			</div>
			<br />

			<!-- The dots/circles -->
			<div style="text-align: center">
				<span class="dot" onclick="currentSlide(0)"></span> 
				<span class="dot" onclick="currentSlide(1)"></span> 
				<span class="dot" onclick="currentSlide(2)"></span> 
				<span class="dot" onclick="currentSlide(3)"></span> 
				<span class="dot" onclick="currentSlide(4)"></span> 
				<span class="dot" onclick="currentSlide(5)"></span>
			</div>
		</section>
		<!-- ======= Breadcrumbs ======= -->
		<section class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
					<div class="section-title">
						<div class="find">
							<table>
								<tr>
									<td><select class="form-select"
										aria-label="Default select example">
											<option selected>전체</option>
											<option value="1">프로젝트</option>
											<option value="2">스터디</option>
									</select></td>
									<td></td>
									<td><p id="current_state">모집 중만 보기</p></td>
									<td><label class="switch-button"> <input
											type="checkbox" class="cbox" /> <span class="onoff-switch"></span></label>
									</td>
								</tr>
							</table>
						</div>
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

							<div class="icon-box">
								<div class="studyItem_schedule">
									<p class="startedate">시작 예정일 |
										${dto.meeting_startdate.substring(0,10) }</p>
								</div>
								<h4 class="studyItem_title">
									<a href="/joinus/detail?meeting_number=${dto.meeting_number }">${dto.meeting_title }</a>
								</h4>
								<p class="studyItem_place">${dto.meeting_place }</p>

								<div class="studyItem_info">
									<p class="">
										<img src="" alt="" />작성자 : ${dto.users_id }
									</p>
								</div>
							</div>
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