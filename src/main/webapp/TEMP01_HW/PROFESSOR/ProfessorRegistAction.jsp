<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 정보 추가</title>
</head>
<body>
<%
			String professor_id 	= request.getParameter("professor_id");
			String name 				= request.getParameter("name");
			String position 			= request.getParameter("position");
			String dept_id 			= request.getParameter("dept_id");
			String telephone 		= request.getParameter("telephone");
			String email 				= request.getParameter("email");
			String duty 				= request.getParameter("duty");
			String mgr				= request.getParameter("mgr");
			
			String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String db_id 		= "dba_user";
			String db_pw 	= "6546";

			String sql_pro = "INSERT INTO PROFESSOR VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			
			try {
			
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con_pro = DriverManager.getConnection(url, db_id, db_pw);
				
				PreparedStatement pstmt_pro = con_pro.prepareStatement(sql_pro);
				pstmt_pro.setString(1, professor_id);
				pstmt_pro.setString(2, name);
				pstmt_pro.setString(3, position);
				pstmt_pro.setString(4, dept_id);
				pstmt_pro.setString(5, telephone);
				pstmt_pro.setString(6, email);
				pstmt_pro.setString(7, duty);
				pstmt_pro.setString(8, mgr);
			
				pstmt_pro.executeUpdate();
				
				pstmt_pro.close();
				con_pro.close();
				
				out.println("<h4>교수 정보 추가에 성공했습니다.<h4>");
				
			} catch(Exception e) {
				e.printStackTrace();
				out.println("<h4>교수 정보 추가에 실패했습니다.<h4>");
			}

%>
</body>
</html>