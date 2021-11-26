<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Javascript 기본 입출력</title>

<script>
// 알림창 띄우기
alert('안녕하세요.');

// 선택창 띄우기
// 확인 : true 반환, 취소 : false반환
// JavaScript는 변수를 선언할 때 데이터타입을 특별하게 지정하지 않는다.

var reply = confirm('확인 또는 취소 선택');
alert(reply);

// 프롬프트 입력창 띄우기
var name = prompt('이름을 입력하세요.');
alert(name);

// 프롬프트 입력창 띄우기 (기본값 설정)		  ↓ 기본값
var age = prompt('나이를 입력하세요.', 19);
alert(age);

// HTML에 문자 작성
// document도 하나의 객체이다.
document.write('<h1>document.write</h1>');
document.write('<h5>↑ 화면에 찍히는 내용</h5>');

// consol 창에 출력
// 관리자가 볼적에 적는 부분.
console.log('console log 입니다!!');

</script>

</head>

<body>

</body>

</html>