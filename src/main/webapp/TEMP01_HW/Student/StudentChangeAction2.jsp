<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");

		String dept_id		= request.getParameter("dept_id");
		int 	year 				= Integer.parseInt(request.getParameter("year"));
		String student_id 	= request.getParameter("student_id");
		String name			= request.getParameter("name");
		String id_number	= request.getParameter("id_number");
		String addr			= request.getParameter("addr");
		String telephone	= request.getParameter("telephone");
		String email 			= request.getParameter("email");
		String status  		= request.getParameter("status");
		String i_date 		= request.getParameter("i_date");

		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id = "dba_user";
		String db_pw = "6546";
		
		String sql = "UPDATE STUDENT SET year = ?, student_id = ?, name = ?, id_number = ?, addr = ?, telephone = ?, email = ?, status = ?, i_date = ? WHERE dept_id = ?";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=dept_id  %> - 학생 정보 수정</title>
</head>
<body>
<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection con = DriverManager.getConnection(url, db_id, db_pw);
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, year);
			pstmt.setString(2, student_id);
			pstmt.setString(3, name);
			pstmt.setString(4, id_number);
			pstmt.setString(5, addr);
			pstmt.setString(6, telephone);
			pstmt.setString(7, email);
			pstmt.setString(8, status);
			pstmt.setString(9, i_date);
			pstmt.setString(10, dept_id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
%>
<h4>
<%=dept_id %> : 의 데이터를 <%= year%>, <%= student_id%>, <%= name%>, <%= id_number%>, <%= addr%>, <%= telephone%>, <%= email%>, <%= status%>, <%= i_date%> 로 변경했습니다. 
</h4>
<%
		} catch(Exception e){
			e.printStackTrace();
%>
<h4>데이터베이스 수정에 실패했습니다.</h4>
<% } %>
</body>
</html>