<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../views/script.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEE/STORE</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<style type="text/css">
	#storehome{
		float: left;
	}
	
	#data{
		margin-left : 905px;
		float: left;
	}

	#gostore{
		margin: auto;
		display: block; 
	}
	.icon-box {
	width: 400px;
	height: 520px;
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
	
	#services {
		padding-top: 5px;
	}
	
	* {
	  margin: 0;
	  padding: 0;
	  box-sizing:border-box;
	}
	
	.form-control{
		width: 300px;
	}
	
	.logo {
	  font-size: 32px;
	  margin-top: 130px;
	  margin-left : 25px;
	  padding: 0;
	  line-height: 1;
	  font-weight: 700;
	  letter-spacing: 2px;
	  text-transform: uppercase;
	}
	
	.logo a {
	  color: black;
	}
	
	.logo a span {
	  color: #ffc451;
	}
	
</style>
</head>
<body>

	<jsp:include page="head.jsp" />
	
	<div class="container">
	
		<h1 class="logo me-auto me-lg-0">
				<a href="/storehome" style="text-decoration: none;">CODEE<span>.</span>STORE</a>
			</h1>
	
		<div id=storehome>
			<form action="/search" id="search">
       			<div>
	       			 <input class="form-control me-2 border-success" type="search" name="data" id="data" /> 
	       			 <input type="submit" class="btn btn-success" value="검색" id="searchbtn"/>	
       			</div> 
			</form>
			
				
				<section id="services" class="services">
			<div class="container aos-init aos-animate" data-aos="fade-up">
				<div class="row" id="list">
					<c:forEach var="dto" items="${list }" varStatus="status">
						<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 aos-init aos-animate" data-aos="zoom-in" data-aos-delay="100">
							<div class="icon-box">
								<div class="studyItem_schedule">
									<a href="/getStore?store_number=${dto.store_number }"> 
									<img src="${path}/images/${dto.store_image}" class="card-img-top" /></a>
								</div>
								
								<div class="card-body">
									<input type="hidden" name="store_number" /> 
									<a href="/getStore?store_number=${dto.store_number}">
									<button id="gostore" class="btn btn-primary">구매하기</button></a>
								
								</div>
							</div>	
					</div>
				</c:forEach>	
			</div>			
		</div>
	</section>
	</div>
	</div>
		<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center active"><i
		class="bi bi-arrow-up-short"></i></a>
	</body>
</html>



