<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String id = null;

		if(session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		} else {
			out.println("<script>");
			out.println("alert('세션이 존재하지 않습니다.')");
			out.println("</script>");
			// else일시 Session01의 주소로 바로가게 만듦
			// response.sendRedirect("Session01.jsp");
		}
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>