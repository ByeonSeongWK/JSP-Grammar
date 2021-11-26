<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 정보 수정</title>
<script>
		function check() {
			if(document.idform.course_id.value == ""){
				alert("학과코드는 필수입니다.")
				return;
			}
			document.idform.submit();
		}
</script>
</head>
<body>
<h4>과목 정보 수정</h4>
<form method="POST" action="CourseChangeAction.jsp" name=idform>
		<table border="1">
					<tr>
							<td>과목 코드</td>
							<td><input type = "text" name = "course_id"></td>
					</tr>
					<tr align="center">
							<td colspan = "2">
									<input type = "button" value = "수정" onclick = "check()">
									<input type = "reset" value = "취소">
							</td>
					</tr>
		</table>
</form>		
</body>
</html>