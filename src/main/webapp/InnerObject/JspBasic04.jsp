<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 출력</title>
</head>
<body>

<h2>구구단</h2>
<table border="1">
	<% for(int i = 1; i < 10; i++) { %>
		<tr>
		<% for(int j = 2; j < 10; j++) { %>
			<td> <% out.println(j + " * " + i + " = " + (i *j)); %> </td>
		<% } %>
		</tr>
	<% } %>
<%--↑ 마무리 중괄호가 반드시 필요하다. 중요!! --%>
</table>


</body>
</html>