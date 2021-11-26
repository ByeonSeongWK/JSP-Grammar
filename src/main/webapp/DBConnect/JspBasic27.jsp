<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- INSERT 문 -->
<%@ page import="java.sql.*" %>
<!-- 객체를 만드려면 java에서 클래스를 불러와야한다. -->
<%@ page import="department.DepartmentDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		String dept_id 		= request.getParameter("dept_id"); // 전송 받은 값(dept_id)을 먼저 저장 시켜준다.
		String dept_name = request.getParameter("dept_name");
		String dept_tel 		= request.getParameter("dept_tel");

		// DB에 접근하는 부분의 긴 문장을 객체로 만들어 놓아서 쉽게 사용할 수 있다.
		DepartmentDAO dao = new DepartmentDAO();
		
		int rs = dao.departmentInsert(dept_id, dept_name, dept_tel);
		
		if (rs == 0) { 		// 실패하면 0이 반환되게 해놨다.
%>
<h4>삽입에 성공했습니다.</h4>
<%				
		}
		else if (rs == 1) {	// 성공하면 1이 반환되게 해놨다.
%>
<h4>삽입에 실패했습니다.</h4>		
<%
		}
%>

</body>
</html>