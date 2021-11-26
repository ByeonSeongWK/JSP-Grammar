<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 정보 추가</title>

<script type = "text/javascript">
			function insert() {
				if(document.professorId.professor_id.value == "") {
					alert("아이디은 필수입니다!");
					return;
				} else if(document.professorId.name.value == "") {
					alert("이름은 필수입니다!");
					return;
				} else if(document.professorId.position.value == "") {
					alert("직급은 필수입니다!");
					return;
				}
				document.professorId.submit();
			}
</script>

</head>
<body>

<h4>교수 정보 추가</h4>
<form method="POST" action = "ProfessorRegistAction.jsp" name="professorId">
		<table border="1">
					<tr>
							<td>교수번호</td>
							<td><input type="text" name="professor_id"></td>
					</tr>
					<tr>
							<td>교수명</td>
							<td><input type="text" name="name"></td>
					</tr>
					<tr>
							<td>직위</td>
							<td><input type="text" name="position"></td>
					</tr>
					<tr>
							<td>소속학과코드</td>
							<td><input type="text" name="dept_id"></td>
					</tr>
					<tr>
							<td>전화번호</td>
							<td><input type="text" name="telephone"></td>
					</tr>
					<tr>
							<td>email주소</td>
							<td><input type="text" name="email"></td>
					</tr>
					<tr>
							<td>직책명</td>
							<td><input type="text" name="duty"></td>
					</tr>
					<tr>
							<td>관리자번호</td>
							<td><input type="text" name="mgr"></td>
					</tr>
					<tr align="center">
							<td colspan="2">
									<input type="button" value="추가" onclick="insert()"> 
									<input type="reset" value="취소">
							</td>
					</tr>
		</table>

</form>
</body>
</html>