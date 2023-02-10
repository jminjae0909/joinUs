<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/script.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">

<style>
.main {
	width: 500px;
	height: 500px;
	border: 1px solid red;
	text-align: center;
}

#text {
	
}

.text {

	width: 500px;
	height: 100px;
	font-size: 25px;
	position: relative;
	top: 100px;
}

.button {

	width: 500px;
	height: 100px;
	font-size: 25px;
	position: relative;
	top: 100px;
}

#button {

	width: 300px;
	height: 50px;
}

</style>

<script type="text/javascript">
	
	function go() {
		var water = ${ldto.users_water};
		var bean = ${ldto.users_bean};
		var num = Math.floor(Math.random()*10);
		console.log("현재 물 : " + water);
		console.log("현재 콩 : " + bean);
		
		
		if(water >= 1) {
			console.log("아직 물 있음");
			water = water - 1;
			console.log("이후 물 : " + water);
			
			if(num==1) {
				$("#text").text("커피콩 당첨입니다.");
				bean = bean + 1;
				
				mypageBean(water, bean);
				$("#button").attr("disabled", true);
				
			}	
		}
		if(water < 1) {
			console.log("아직 물 없음");
			$("#button").attr("disabled", true);
		}
		
		console.log(num);
		
		
	}
	
	function mypageBean(water, bean) {
		
		$.ajax({
			url : "/joinus/mypageBean",
			type : "GET",
			data : { "water" : water, "bean" : bean, "users_id" : "${ldto.users_id}" } 

		}).done(function(data) {
			
		});
	}
</script>
</head>
<body>
	<div class="margind3">
		<div class="main">
			<div class="textFd">
				<span id="text">안녕하세요 버튼을 눌러주세요</span>
			</div>
			<div class="buttonFd">
				<button class="btn btn-primary" type="button" id="button" onclick="go();">Button</button>
			</div>
			<div class="footFd">
				<table>
					<tr>
						<td>현재 도전가능 횟수 : ${ldto.users_water }</td>
						<td>현재 커피콩 갯수 : ${ldto.users_bean }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>