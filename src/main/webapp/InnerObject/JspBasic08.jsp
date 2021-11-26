<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>session 내장 객체</title>

</head>

<body>

<h2>session 내장 객체</h2>
<p> 아이디 입력 : </p>
<%--
[로그인 기능]
입력화면에서 아이디를 입력하여 "user" 명으로 세션 정보를 저장하고,
JspBasic08-01.jsp로 이동하여 저장된 세션 값을 반환하여 출력하는 프로그램을 작성하시오.
 --%>
<form method="POST">

		<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
		</table>

</form>
<%
		String user = "";

		// input에서 입력된 값을 받아온다.
		if (request.getParameter("id") != null){
		// input에 입력된 값이 아무것도 입력이 되지 않으면
		
		user = request.getParameter("id");
		session.setAttribute("user", user );
		response.sendRedirect("JspBasic08-01.jsp");
		}
%>

</body>

</html>