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

	text-align: center;
}

#tree {
	width: 250px;
	height: 350px;

}

#bean {
	position: absolute;
	top: -250px;
	left: 550px;
	width: 100px;
	height: 100px;
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
		var num = Math.floor(Math.random()*2);
		console.log("현재 물 : " + water);
		console.log("현재 콩 : " + bean);
		
		
		if(water >= 1) {
			console.log("아직 물 있음");
			water = water - 1;
			console.log("이후 물 : " + water);
			
			if(num==1) {
				$("#text").text("커피콩 당첨입니다.");
				bean = bean + 1;
				$("#button").attr("disabled", true);
				mypageBeanS(water, bean);
				$("#bean").animate({
					top: '150px'
				})
			}else {
				mypageBeanF(water, bean);
			}
			
			
		}
		if(water < 1) {
			console.log("아직 물 없음");
			$("#button").attr("disabled", true);
		}
		
		console.log(num);
		
		
	}
	
	function mypageBeanF(water, bean) {
		console.log("실패했을때");
		$.ajax({
			url : "/joinus/mypageBean",
			type : "GET",
			data : { "water" : water, "bean" : bean, "users_id" : "${ldto.users_id}" } 

		}).done(function(data) {
			$(".margind3").empty();
			$(".margind3").replaceWith(data);

		});
	}
	
	function mypageBeanS(water, bean) {
		console.log("성공했을때");
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
			<div class="img">
				<img src="/images/tree.png" alt="" id="tree"/>
				<img src="/images/bean.png" alt="" id="bean"/>
			</div>
			<div class="textFd">
				<span id="text">안녕하세요 버튼을 눌러주세요</span>
			</div>
			<div class="buttonFd">
				<button class="btn btn-primary" type="button" id="button" onclick="go();">Button</button>
			</div>
			<div class="footFd">
			<br />
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