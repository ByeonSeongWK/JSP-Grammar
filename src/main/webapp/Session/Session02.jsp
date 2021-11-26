<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		// 아이디와 비밀번호 입력한 값을 받아왔다.(Session1에서)
		String id 	= request.getParameter("id");
		String pw 	= request.getParameter("pw");
		
		// 세션에 등록
		// .setAttrubute(세션 이름, 값);
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>세션 값 확인 페이지 : <a href="Session03.jsp">이동</a></h4>

</body>
</html>