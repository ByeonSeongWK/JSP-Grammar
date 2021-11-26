<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 추가</title>

<script type = "text/javascript">
			function insert() {
				if(document.studentId.dept_id.value == "") {
					alert("학번은 필수입니다!");
					return;
				} else if(document.studentId.name.value == "") {
					alert("성명은 필수입니다!");
					return;
				} else if(document.studentId.id_number.value == "") {
					alert("주민등록번호는 필수입니다!");
					return;
				} else if(document.studentId.addr.value == "") {
					alert("주소는 필수입니다!");
					return;
				} else if(document.studentId.telephone.value == "") {
					alert("전화번호는 필수입니다!");
					return;
				} else if(document.studentId.email.value == "") {
					alert("email주소는 필수입니다!");
					return;
				}
				document.studentId.submit();
			}
</script>

</head>
<body>

<h4>학생 정보 추가</h4>
<form method="POST" action = "StudentRegistAction.jsp" name="studentId">
		<table border="1">
					<tr>
							<td>학과코드</td>
							<td><input type="text" name="dept_id"></td>
					</tr>
					<tr>
							<td>학년</td>
							<td><input type="text" name="year"></td>
					</tr>
					<tr>
							<td>학번</td>
							<td><input type="text" name="student_id"></td>
					</tr>
					<tr>
							<td>성명</td>
							<td><input type="text" name="name"></td>
					</tr>
					<tr>
							<td>주민등록번호</td>
							<td><input type="text" name="id_number"></td>
					</tr>
					<tr>
							<td>주소</td>
							<td><input type="text" name="addr"></td>
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
							<td>재학상태</td>
							<td><input type="text" name="status"></td>
					</tr>
					<tr>
							<td>입학일자</td>
							<td><input type="text" name="i_date"></td>
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