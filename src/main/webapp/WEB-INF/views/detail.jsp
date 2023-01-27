<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>detail.jsp</h1>
		<table class="table table-striped-columns">
			<tr>
				<th>게시물 번호</th>
				<td>${dto.meeting_number }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${dto.users_id }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${dto.meeting_insertdate }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.meeting_title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.meeting_contents }</td>
			</tr>
			<tr>
				<th>상태</th>
				<td>${dto.meeting_state }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${dto.meeting_hits }</td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td>${dto.meeting_membernum }</td>
			</tr>
			<tr>
				<th>연락방법</th>
				<td>${dto.meeting_contact }</td>
			</tr>
			<tr>
				<th>온, 오프</th>
				<td>${dto.meeting_onoff }</td>
			</tr>
			<tr>
				<th>모임 시작일</th>
				<td>${dto.meeting_startdate }</td>
			</tr>
			<tr>
				<th>모임 기간</th>
				<td>${dto.meeting_period }</td>
			</tr>
			<tr>
				<th>모임종류</th>
				<td>${dto.meeting_category }</td>
			</tr>
		</table>	
		<div id="map" style="width: 770px; height: 400px;"></div>
	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be39b82c365176fd1189160e6062424c&libraries=services,clusterer,drawing"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
		
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch("${dto.meeting_place}", function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:250px;text-align:center;padding:6px 0;">모임장소</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			}); 
		</script>
	</div>
</body>
</html>