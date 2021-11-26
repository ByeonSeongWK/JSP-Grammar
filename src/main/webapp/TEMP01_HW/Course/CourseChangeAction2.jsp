<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");

		String 	course_id 		= request.getParameter("course_id");
		String 	title 				= request.getParameter("title");
		int 		c_number 	= Integer.parseInt(request.getParameter("c_number"));
		String	professor_id	= request.getParameter("professor_id");
		int 		course_fees 	= Integer.parseInt(request.getParameter("course_fees"));

		String url		 	= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id 		= "dba_user";
		String db_pw 	= "6546";
		
		String sql = "UPDATE COURSE SET title = ? , c_number = ?, professor_id = ?,  course_fees = ? WHERE course_id = ?";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=course_id %>과목 정보 수정</title>
</head>
<body>

<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection con 				= DriverManager.getConnection(url, db_id, db_pw);
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString	(1, title);
			pstmt.setInt		(2, c_number);
			pstmt.setString	(3, professor_id);
			pstmt.setInt		(4, course_fees);
			pstmt.setString	(5, course_id);
		
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
%>
<h4>
<%=course_id%> : 의 데이터를<%=title %>, <%=c_number %>, <%=professor_id %>, <%=course_fees %>);
</h4>
<%
		}catch(Exception e){
			e.printStackTrace();
%>
<h4>데이터베이스 수정에 실패했습니다.</h4>
<%
		}
%>

</body>
</html>