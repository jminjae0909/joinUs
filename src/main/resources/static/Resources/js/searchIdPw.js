$(function() {
	/*이메일 인증 버튼 눌렀을 때 이벤트*/
	$("#checkEmail").click(function() {
		if ($("#exampleFormControlInput1").val() == "") {
			alert('이메일을 입력해주세요');
			return false;
		}

		//해당 이메일이 존재하는지 검증
		$.ajax({
			type: "GET",
			url: "/isExistEmail",
			data: { "users_email": $("#exampleFormControlInput1").val().trim() },
			success: function(data) {
				console.log(data);
				if (data == 0) {
					alert("존재하지 않는 이메일입니다.");
					return false;
				} else {
					$.ajax({
						type: "POST",
						url: "login/mailConfirm",
						data: {
							"email": $("#exampleFormControlInput1").val()
						},
						success: function(data) {
							alert("해당 이메일로 인증번호 발송이 완료되었습니다.");
							console.log("data : " + data);
							chkEmailConfirm(data, $("#memailconfirm"));
						}
					});
				}
			}
		});
	})

});


// 이메일 인증번호 체크 함수
function chkEmailConfirm(data, $memailconfirm) {
	$("#memailconfirmBtn").on("click", function() {
		if (data != $memailconfirm.val()) { //
			alert('인증번호가 올바르지 않습니다.');
			return false;

		} else if (data == $memailconfirm.val()) {

			//해당 이메일로 저장된 아이디와 비밀번호 가져오기
			$.ajax({
				type: "GET",
				url: "/viewIdPw",
				data: { "users_email": $("#exampleFormControlInput1").val().trim() },
				success: function(data) {
					console.log(data);
					var id = data.id;
					var pw = data.pw;
					$("#viewId").html("당신의 id는 " + id + ",<br /> 비밀번호는 "+pw+" 입니다.");
				}
			});
		}
	})
}