<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Javascript 이벤트 처리</title>
<script>
function clicked() {
	// id 값을 이용해서 찾아온다.
	// var input1 = document.getElementById('input1').value;
	// var input2 = document.getElementById('input2').value;
	
	// class 값을 이용해서 찾아온다.
	// var input1 = document.getElementsByClassName('input1');
	
	// name 값을 이용햇 찾아온다.
	var input1 = document.getElementsByName('input1');
	//																		  ↑ 배열로 받아진다.
	alert(input1[0].value);
}
// getElements로 받아오는 것은 배열로 받아온다. 그래서 값을 받아 오려면 (변수명[0].value)
</script>

<script>
function movePage() {
	var input1 = document.getElementById('input1').value;
	if(input1 == null) {
		alert('첫 번째 인풋을 입력하세요');
		return;
	} 
	/////// location 객체 ─── 가장 중요
	///// 현재 페이지 url 변경
	// 페이지만 변경 하는 것
	// location.href = input1;
	
	///// 현재 페이지를 해당 url로 새로 만듦
	// 새로운 페이지를 만드는 것
	// location.replace(input1);
	
	///// 페이지 새로고침
	// location.reload(input1);
	
	/////// history 객체 back()
	// location.href = 'Javascript04.jsp';
	
	
	/////// window 객체 open()
	// 윈도우 창에 새로운 윈도우를 생성 (팝업)
	window.open('Javascript04.jsp', 'new', 'width = 800, height = 400');
	
}
</script>

</head>
<body>

<!-- class 	: 중복 되서 사용 될 수 있다. -->
<!-- id		: 중복 되서 사용 될 수 없다. -->
<!-- name	: form 내부에서는 중복이 불가능, 외부 form에선 중복이 허용됨 -->
<input class = "" id = "" type = "text" name = "" value = "">
<input class = "" id = "" type = "text" name = "" value = "">
<input class = "" id = "" type = "text" name = "" value = "">
<hr>
<form method = "POST" >
		<input type = "text" class = "input1" id = "input1" name = "input1" value = "">
		<input type = "text" class = "input1" id = "input2" name = "input2" value = "">
		<button type = "button" onclick = 'clicked()'>클릭</button>
		<button type = "button" onclick = 'movePage()'>전달</button>
</form>

</body>
</html>