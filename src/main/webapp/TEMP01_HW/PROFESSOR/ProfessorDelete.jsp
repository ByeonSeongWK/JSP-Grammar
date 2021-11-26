<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 정보 삭제</title>
<script>
		function check() {
			if(document.delform.professor_id.value == "") {
				alert("교수번호는 필수입니다.");
				return;
			}
			document.delform.submit();
		}
</script>
</head>
<body>
<h4>교수 정보 삭제</h4>
<form method = "POST" action ="ProfessorDeleteAction.jsp" name = "delform">
		<table border="1">
					<tr>
							<td>교수 번호</td>
							<td><input type = "text" name = "professor_id"></td>
					</tr>
					<tr align = "center">
							<td colspan = "2">
									<input type = "button" value = "삭제" onclick = "check()">
									<input type = "reset" value = "취소">
							</td>
					</tr>
		</table>
</form>
</body>
</html>