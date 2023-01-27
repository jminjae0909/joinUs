<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- Vendor CSS Files -->
<link href="../Resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../Resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="../Resources/vendor/aos/aos.css" rel="stylesheet">
<link href="../Resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="../Resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../Resources/css/main.css" rel="stylesheet">

<!-- Vendor JS Files -->
<script src="../Resources/js/bootstrap.bundle.js"></script>
<script src="../Resources/vendor/aos/aos.js"></script>
<script src="../Resources/vendor/glightbox/js/glightbox.min.js"></script>
<script src="../Resources/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="../Resources/vendor/swiper/swiper-bundle.min.js"></script>
<script src="../Resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="../Resources/vendor/php-email-form/validate.js"></script>

<link rel="stylesheet" href="../css/main.css" />

<!-- Template Main JS File -->
<script src="../Resources/js/main.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body>
	<h2>list.jsp</h2>
	<form action="/board/search">
		<input type="text" name="data" id="data" />
		<input type="submit" value="검색" />
	</form>
	<section id="services" class="services sections-bg">
	<div class="container" data-aos="fade-up">
		<div class="row gy-4" data-aos="fade-up" data-aos-delay="100">
		
			<c:forEach var="dto" items="${list }">
			
				<div class="col-lg-4 col-md-6">
					<div class="service-item  position-relative">
						<div id="imgdiv"> 
							<i class="bi bi-chat-square-text"></i>
						</div>
						<h3>${dto.meeting_title }</h3>
						<p>장소 : ${dto.meeting_place }</p> 
						<a href="/board/detail?meeting_number=${dto.meeting_number }" class="readmore stretched-link">
							detail more <i class="bi bi-arrow-right"> </i>
						</a>
					</div>	
				</div>
					
			</c:forEach>
		</div>
	</div>
	</section>

</body>
</html>