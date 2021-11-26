<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");

		String professor_id 	= request.getParameter("professor_id");
		String name				= request.getParameter("name");
		String position 			= request.getParameter("position");
		String dept_id 			= request.getParameter("dept_id");
		String telephone 		= request.getParameter("telephone");
		String email				= request.getParameter("email");
		String duty 				= request.getParameter("duty");
		String mgr 				= request.getParameter("mgr");

		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id = "dba_user";
		String db_pw = "6546";

		String sql = "UPDATE PROFESSOR SET name = ?, position = ?,  dept_id = ?, telephone = ?, email = ?, duty = ?, mgr = ? WHERE professor_id = ?";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= professor_id %>교수 정보 수정</title>
</head>
<body>
<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, db_id, db_pw);
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, position);
			pstmt.setString(3, dept_id);
			pstmt.setString(4, telephone);
			pstmt.setString(5, email);
			pstmt.setString(6, duty);
			pstmt.setString(7, mgr);
			pstmt.setString(8, professor_id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();

%>
<h4><%= professor_id %> 의 데이터를 <%= name%>, <%= position%>, <%= dept_id%>, <%= telephone%>, <%= email%>, <%= duty%>, <%= mgr%>로 변경했습니다.</h4>
<%
		} catch(Exception e) {
			e.printStackTrace();
%>
<h4>데이터베이스 수정에 실패했습니다.</h4>
<%
		}
%>

</body>
</html>