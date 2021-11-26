<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>학과 정보 수정</title>
<script>
		function check() {
			if(document.idform.dept_id.value == ""){
			// 현재페이지. idform에.dept_id값에.값이 == 빈값이면
				alert("학과코드는 필수입니다.")
				return;
			}
			document.idform.submit();
		}
</script>
</head>
<body>

<h4>학과 정보 수정</h4>
<form method = "POST" action = "JspBasic21.jsp" name = "idform">
		<table border = "1">
				<tr>
						<td align = "center">학과 코드</td>
						<td><input type = "text" name = "dept_id"></td>
				</tr>
				<tr align = "center">
						<td colspan = "2">
								<input type = "submit" value = "수정">
								<input type = "reset" 	value = "취소">
						</td>
						
				</tr>
		</table>
</form>

</body>
</html>