<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 정보 수정</title>
<script>
		function check() {
			if(document.idform.professor_id.value == ""){
				alert("교수코드는 필수입니다.")
				return;
			}
			document.idform.submit();
		}
</script>

</head>
<body>

<h4>교수 정보 수정</h4>
<form	method="POST" action="ProfessorChangeAction.jsp" name="idform">
		<table border="1">
					<tr>
							<td>교수번호</td>
							<td><input type="text" name="professor_id"></td>
					</tr>
		
					<tr align="center">
							<td colspan="2">
									<input type="button" value = "확인" onclick = "check()">
									<input type="reset" value = "취소">
							</td>
					</tr>
		
		</table>
</form>

</body>
</html>