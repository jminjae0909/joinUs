<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.Duration"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
a {
	text-decoration: none;
	color: black;
}

#btn1{
margin-left:88%;
}

textarea{
width:100%;
}

</style>
<!-- --------header  -------- -->
<link rel="stylesheet" href="../css/main.css" />

<!-- 수정된 부분 -->
<link href="../Resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../Resources/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../Resources/vendor/aos/aos.css" rel="stylesheet">
<link href="../Resources/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="../Resources/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
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
<!-- ------------------------------------------- -->

</head>
<body>

	<form action="../refund/adminRefundOk.jsp">
	<div class="margind">
	
	<table class="table table-hover">
	<thead class="table-success">
	<tr align="center">
	<td></td><td>예약일</td><td>시설명</td><td>이용회차</td><td>결제금액</td><td>환불예정금액</td>
	</tr>
	</thead>

	<tr>
		<td><input type='checkbox' name="resno" id="resno" value="" class="checkSelect"></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="6"></td>
	</tr>

	</table>

	
	<input type="submit" value="환불승인" onclick="checkForm(this);" id="btn1" class="btn btn-outline-success"/>
			
			</div>
			</form>
	
		<script>
		
		
		</script>
</body>
</html>
