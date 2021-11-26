<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		// 세션값 불러오기
		// session.getAttribute(세션 이름);
		// 반환 타입 : Object(클래스의 최상위) ──> 반환 받은 후 현변환 필수!
		String id 	= (String)session.getAttribute("id"); // 다형성
		String pw 	= (String)session.getAttribute("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 확인 페이지</title>
</head>
<body>
<h1>저장된 세션 값</h1>
<h3>id : <%=id %></h3>
<h3>pw : <%=pw %></h3>
<a href = "Session04.jsp">로그아웃</a>
</body>
</html>