<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "department.DepartmentDAO" %>
<%@ page import = "department.DepartmentBean" %>
<%@ page import = "java.util.ArrayList" %>
<!-- SELECT 문 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과 검색</title>
</head>
<body>

<%
		// ArrayList<배열에 들어울 수 있는 타입을 지정>
		ArrayList<DepartmentBean> list = null;
		
		DepartmentDAO dao = new DepartmentDAO();
		
		list = dao.departmentList();
		
%>

<h4>DEPARTMENT 테이블</h4>
<table border="1">
		<tr>
				<th>순번</th> <!-- th : 테이블 헤더 -->
				<th>학과코드</th>
				<th>학과명</th>
				<th>전화번호</th>
		</tr>
<%
		if (list != null) { // null이면 못하도록 한다. null이면 .size가 작동이 안되기 때문에.
			for (int i = 0; i < list.size(); i++) {
%>
		<tr>
				<td><%= i + 1 %></td>
				<td><%= list.get(i).getDept_id() %></td><!-- list.get(i) -> Bean 객체가 오는것. 객체에서 get메소드를 불러옴 -->
				<td><%= list.get(i).getDept_name() %></td>
				<td><%= list.get(i).getDept_tel() %></td>
		</tr>
<%
			}
		}
%>
</table>

</body>
</html>