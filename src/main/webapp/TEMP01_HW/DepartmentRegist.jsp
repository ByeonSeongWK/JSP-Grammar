<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" action="DepartmentRegistAction.jsp">
		<table border="1">
			<tr>
					<td>학과코드</td>
					<td><input type ="text" name="dept_id"></td>
			</tr>
			<tr>
					<td>학과명</td>
					<td><input type ="text" name="dept_name"></td>
			</tr>
			<tr>
					<td>전화번호</td>
					<td><input type	="text" name="dept_pw"></td>
			</tr>
			<tr align="center">
					<td colspan="2">
							<input type ="submit" value="전송">
							<input type ="reset" value="취소">
					</td>
			</tr>
		</table>
	</form>

</body>
</html>