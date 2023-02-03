<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../views/script.jsp"%>
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<style type="text/css">
	#storedetail{
		margin-top: 150px;
	}
	.icon-box {
		border-radius: 2em;
		border: 3px solid #dee2e6;
	}
	#detailimage{
		text-align: center;
	
	}
	#detailcontents{
		text-align: center;
		margin: auto;
	}
	
	#cnt_info{
		border-top: 2px solid #d1d1d1;
		padding: 25px 0px 0px 0px;
	}
	
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="head.jsp" />
		
		<div id="storedetail">
			<div class="container">
			
				<div class="icon-box">
				<div class="row g-0  position-relative" id="detailimage" >
					<div class="col-md-6 mb-md-0 p-md-4">
						<img src="${path}/images/${dto.store_image}" />
					</div>
					<div class="col-md-6 p-4 ps-md-0" id="detailcontents">
						<div class="mt-0">
							<input type="hidden" name="store_number"
								value="${dto.store_number}" />
						</div>
						<p>상품이름 : ${dto.store_items }</p>
						<p>상품가격 : 커피콩 ${dto.store_price }개</p>
						<p>상품소개 : ${dto.store_contents}</p>
						
						<p id="cnt_info"><select name="payment_amount" id="cnt" data-target="#staticBackdrop">
							<c:forEach begin="1" end="10" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>&nbsp;개
						<button type="button" class="btn btn-primary" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop" id="payment">구매하기</button>
						<a href="/home"><button type="button" class="btn btn-success">목록보기</button></a>
						</p>
					</div>
				</div>
			</div>	
		</div>
		
		
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">구매 확인</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form action="/payment" method="post">
						<div id="mb" class="modal-body">
							<table class="table">
								<tr>
									<td colspan="2"><input type="hidden" name="store_number"
										value="${dto.store_number}" /></td>
								</tr>
								<tr>
									<td colspan="2">
									<img src="${path}/images/${dto.store_image}" width="200px"
										height="200px" />
									<td>
								</tr>
								<tr>
									<td>상품이름</td>
									<td>${dto.store_items }</td>
								</tr>
								<tr>
									<td>수량</td>
									<td id="amount"></td>
								</tr>
								<tr>
									<td>총 상품가격</td>
									<td id="total"></td>
								</tr>
							</table>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">구매하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$(function(){
		
		$("#payment").on("click",function(){
			console.log("구매하기 누름");
			var cnt = $('#cnt').val();
			console.log(cnt);
			$("#amount").text(cnt+'장');
			$("#total").text('커피콩 '+cnt* ${dto.store_price}+'개');
		})	
	})


</script>


</body>
</html>