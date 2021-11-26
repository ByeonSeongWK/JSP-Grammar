<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");

		String professor_id = request.getParameter("professor_id");
		
		String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id 		= "dba_user";
		String db_pw 	= "6546";
		
		String sql = "DELETE FROM PROFESSOR WHERE professor_id = ?";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= professor_id %> - 데이터 삭제</title>
</head>
<body>
<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection con = DriverManager.getConnection(url, db_id, db_pw);
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, professor_id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();	
%>
<h4><%= professor_id %> - 데이터를 삭제했습니다. </h4>
<% 
		} catch(Exception e) {
			e.printStackTrace();
%>
<h4><%= professor_id %> - 데이터 삭제에 실패했습니다.</h4>
<%
	}
%>

</body>
</html>