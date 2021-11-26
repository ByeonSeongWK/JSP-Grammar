<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function backPage() {
	
	/////// history 객체의 back()
	// 페이지 뒤로가기
	var rs = confirm('정말 뒤로가시겠습니까?')
	if(rs) {
		history.back()
	}
}
</script>

</head>
<body>

<button type = 'button' onclick = 'backPage()'>뒤로가기</button>

</body>
</html>