<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">

<style>
#been {
	width: 100%;
	height: 1000px;
}

#watercan {
	float: right;
	width: 150px;
	height: 120px;
}

#water {
	float: left;
	width: 100px;
	height: 100px;
}

#field {
	width: 100%;
	height: 300px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		$(document).mousemove(function(e) {
			var mouseX = e.pageX;
			var mouseY = e.pageY;

			$('.been').css({
				left : mouseX + "px",
				top : mouseY + "px"
			})
		})
	})
</script>

</head>
<body>
	<div class="margind4">
		<div id="been">
			<img src="${path}/images/wateringcan.png" id="watercan" /> <img
				src="${path}/images/water.png" id="water" /> <img
				src="${path}/images/field.png" id="field" />
		</div>
	</div>
</body>
</html>