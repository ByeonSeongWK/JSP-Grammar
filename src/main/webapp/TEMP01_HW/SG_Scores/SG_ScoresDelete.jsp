<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 정보 삭제</title>
<script>
		function check() {
			if(document.delform.student_id.value == ""){
				alert("학번은 필수입니다.");
				return;
			}
			document.delform.submit();
		}
</script>
<style>
		a{
		display : block;
		text-decoration : none;
		color : #999;
		font-weight : bold;
		}
</style>
</head>
<body>
<h4>수강 정보 삭제</h4>
<form method = "POST" action = "SG_ScoresDeleteAction.jsp" name = "delform">
		<table border = "1">
					<tr>
							<td>학번</td>
							<td><input type = "text" name = "student_id"></td>
					</tr>
					<tr>
							<td colspan = "2" bgcolor = "gray"></td>
					</tr>
					<tr>
						<td align = "right">
								<a href ="SG_ScoresView.jsp">초기화면으로</a>
						</td>
						<td align = "right">
								<input type = "button" value = "삭제" onclick = "check()">
								<input type = "reset" value = "취소">
						</td>
					</tr>
		</table>
</form>
</body>
</html>