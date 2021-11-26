<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 내장 객체 2</title>
</head>

<body>

<h2>response 내장 객체</h2>
<%-- JspBasic02.jsp 페이지로 이동 --%>
<% response.sendRedirect("JspBasic02.jsp"); %>

</body>

</html>