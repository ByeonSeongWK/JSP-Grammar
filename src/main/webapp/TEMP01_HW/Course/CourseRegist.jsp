<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" action = "CourseRegistAction.jsp">
	<h4>과목 추가</h4>
		<table border="1">
					<tr>
							<td>과목코드</td>
							<td><input type="text" name="course_id"></td>
					</tr>
					<tr>
							<td>과목명</td>
							<td><input type="text" name="title"></td>
					</tr>
					<tr>
							<td>학점수</td>
							<td><input type="text" name="c_number"></td>
					</tr>
					<tr>
							<td>담당교수코드</td>
							<td><input type="text" name="professor_id"></td>
					</tr>
					<tr>
							<td>추가수강료</td>
							<td><input type="text" name="course_fees"></td>
					</tr>
					<tr align="center">
							<td colspan="2">
									<input type="submit" value="전송">
									<input type="reset" value="취소">
							</td>
					</tr>		
		</table>
	</form>

</body>
</html>