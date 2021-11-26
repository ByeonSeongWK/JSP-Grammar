<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 정보 추가</title>
<script>
		function check() {
			if(document.SG_Sinput.student_id.value == ""){
				alert("학번은 필수입니다.");
				return;
			}
			document.SG_Sinput.submit();
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

<h4>수강 정보 추가</h4>
<form method = "POST" action = SG_ScoresRegistAction.jsp name="SG_Sinput">
		<table border = "1">
				<tr>
						<td>학번</td>
						<td><input type = "text" name = "student_id"></td>
				</tr>
				<tr>
						<td>과목코드</td>
						<td><input type = "text" name = "course_id"></td>
				</tr>
				<tr>
						<td>성적</td>
						<td><input type = "text" name = "score"></td>
				</tr>
				<tr>
						<td>등급</td>
						<td><input type = "text" name = "grade"></td>
				</tr>
				<tr>
						<td>성적취득일자</td>
						<td><input type = "text" name = "score_assigned"></td>
				</tr>
				<tr>
						<td colspan="2" bgcolor = "gray"></td>
				</tr>
			
				<tr align = "center">
						<td>
								<a href = "SG_ScoresView.jsp">초기화면으로</a>
						</td>
						<td align = "right">
								<input type = "button" value = "추가" onclick = "check()">
								<input type = "reset" value = "취소">
						</td>
				</tr>
		</table>
</form>
</body>
</html>