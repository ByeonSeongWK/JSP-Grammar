<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Javascript의 기본문법</title>
<script>

var a = 200;
var b = 30;
		
// 알아서 데이터 타입이 맞춰진다. 자바와 다른점.
alert(a / b);

var flag = confirm('진행하시겠습니까?');

if (flag) {
	alert('진행중~~~');
} else {
	alert('중지!!');
}
// for 반복문
var arr = [1, 2, 3, 4, 5];	
for(var i = 0; i < arr.length; i++) {
	console.log(arr[i]);
}

// while 반복문
var n = 0;
while(n < 3) {
	console.log(n);
	n++;
}

</script>

<script>
// script 언어는 데이터 타입이 없어서.
// function 함수명 (매개변수)
function add(a, b) {
	alert(a + b);
	return a + b;
	// 반환을 해주고 싶으면 retunr을 적으면 된다.
}

//add(1, 3);


// 반환값이 없을 때
// 함수를 강제 종료 시키고자 하면 return; 을 사용
function confirmed(n) {
	if(n < 5) {
		alert('n은 5보다 작습니다.');
		return; // 참이면 함수를 강제 종료
	}
	var rs = 1;
	for(var i = 1; i <= n; i++) {
		rs *= i;	
	}
	alert(n + '의 펙토리얼은 = ' + rs + '입니다.');
}

confirmed(3);

</script>

</head>
<body>

</body>
</html>