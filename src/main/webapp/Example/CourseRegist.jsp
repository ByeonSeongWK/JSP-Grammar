<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 추가 페이지</title>
</head>
<body>
<h4>과목 추가 페이지</h4>
<form method = "GET" action = "CourseRegistAction2.jsp">		<!-- 길이 제한 -->
		<table border = "1">
					<tr>
							<td>과목코드</td>
							<td><input type = "text" name = "course_id" maxlength = "5"></td>
					</tr>
					<tr>
							<td>과목명</td>
							<td><input type = "text" name = "title"></td>
					</tr>
					<tr>
							<td>학점수</td>
							<td><input type = "text" name = "c_number" maxlength = "3"></td>
					</tr>
					<tr>
							<td>담당교수번호</td>
							<td><input type = "text" name = "professor_id"></td>
					</tr>
					<tr>
							<td>추가수강료</td>
							<td><input type = "text" name = "course_fees"></td>
					</tr>
					<tr align = "center">
							<td colspan = "2">
									<input type = "submit" value = "입력">
									<input type = "reset" value = "취소">
							</td>
					</tr>
		</table>
</form>
</body>
</html>