<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../views/script.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEE</title>
<style>

ul.tabs {
	float: left;
	margin: 0px;
	padding: 0px;
	list-style: none;
	width: 15%;
	height: 300px;
	font-weight: bold;
}

ul.tabs li {
	float: left;
	width: 100%;
	background: none;
	color: #222;
	padding: 22px 16px;
	cursor: pointer;
	text-align: center;
	display: inline-block;
	outline: none;
	transition: 0.3s;
}

ul.tabs li.current {
	background: #ededed;
	color: #222;
}

.tab-content {
	width: 70%;
	float: left;
	display: none;
	padding: 10px 20px;
	border-top: 3px solid #eee;
}

.tab-content.current {
	display: inherit;
}

#tab-5 {
	padding-top: 5%;
	padding-left: 8%;
}

h6 {
	font-family: GmarketSansMedium;
}

.tab {
	margin-top: 58px;
}

.tablehd {
	background: #ffc45199;
	text-align: center;
}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">

	$(function() {

		mypageMeetingList(1);
		
		$('ul.tabs li').click(function() {
			
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			/* 현재 클릭한 li에 currnet 추가 */
			$(this).addClass('current');
			/* 현재 클릭한 li에 data-tab을 id로 하는 div에 current 추가 */
			$("#" + tab_id).addClass('current');

			if(tab_id == 'tab-2') {
				
				mypageFavoritesList(1)
			}
			
			if(tab_id == 'tab-3') {
				console.log('3번입니다.');
				var water = ${ldto.users_water}
				var bean = ${ldto.users_bean}
				console.log(water +" / " + bean);
				mypageBeanStart(water, bean);
			}

		});

	});
	
	function mypageMeetingList(mcp) {
		
		$.ajax({
			url : "/joinus/mypageMeetingList",
			type : "GET",
			data : { "cp" : mcp, "users_id" : "${ldto.users_id}" } 

		}).done(function(data) {
			$(".margind1").empty();
			$(".margind1").replaceWith(data);
		});
	}
	
	function mypageFavoritesList(fcp) {
		
		$.ajax({
			url : "/joinus/mypageFavoritesList",
			type : "GET",
			data : { "cp" : fcp, "users_id" : "${ldto.users_id}" } 

		}).done(function(data) {
			$(".margind2").empty();
			$(".margind2").replaceWith(data);
		});
	}
	
	function mypageBeanStart(water, bean) {
		
		$.ajax({
			url : "/joinus/mypageBean",
			type : "GET",
			data : { "water" : water, "bean" : bean, "users_id" : "${ldto.users_id}" } 

		}).done(function(data) {
			$(".margind3").empty();
			$(".margind3").replaceWith(data);
		});
	}
	
	function page(cp) {
		
		mypageMeetingList(cp);
	}
	
	var fpage = 1;
	
	function fav_page(cp) {
		if(cp < 0) { cp = 1 }
		fpage = cp;
		
		mypageFavoritesList(cp);
	}
	
	function deleteOne(num) {
		
		$.ajax({
			url : "/joinus/mypageFavoritesDelete",
			type : "GET",
			data : { "favorites_number" : num } 

		}).done(function(data) {
			
			mypageFavoritesList(fpage);
			
		});
	}



</script>
</head>
<body>
	<header id="header" class="header d-flex align-items-center">
		<jsp:include page="head.jsp" />
	</header>
	<div class="tab">
		<ul class="tabs">
			
			<li class="tab-link current" data-tab="tab-1">나의모임글조회</li>
			<li class="tab-link" data-tab="tab-2">관심목록조회</li>
			<li class="tab-link" data-tab="tab-3">나의커피콩</li>
		</ul>

		<div id="tab-1" class="tab-content current ">
			<div class="margind1" ></div>
		</div>
		
		<div id="tab-2" class="tab-content">
			<div class="margind2" ></div>
		</div>
		
		<div id="tab-3" class="tab-content">
			<div class="margind3"></div>
		</div>
		
	</div>
</body>
</html>