$(function(){
	$("#loginBtn").on("click", loginCheck);
})

function loginCheck(){
	if($("#inputId").val() == ""){
		alert('아이디를 입력하세요.');
		return false;
	}else if($("#inputPwd").val() == ""){
		alert('비밀번호를 입력하세요.');
		return false;
	}
	return true;
}