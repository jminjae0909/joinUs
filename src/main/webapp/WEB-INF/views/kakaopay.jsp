<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEE</title>

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
var IMP = window.IMP; 
IMP.init("imp06114482"); 

function requestPay() {
    IMP.request_pay({
        pg : 'kakao',
        pay_method : 'card',
        merchant_uid: "57008833-33004", 
        name : '커피콩 1개',
        amount : 1000,
        buyer_email : 'Iamport@chai.finance',
        buyer_name : '포트원 기술지원팀',
        buyer_tel : '010-1234-5678',
        buyer_addr : '서울특별시 강남구 삼성동',
        buyer_postcode : '123-456'
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log(rsp);
        } else {
            console.log(rsp);
        }
    });
}
</script>
</head>
<body>
	<button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>