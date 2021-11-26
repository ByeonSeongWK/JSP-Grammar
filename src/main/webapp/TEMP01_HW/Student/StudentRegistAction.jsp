<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 추가</title>
</head>
<body>
<%
			String dept_id 		= request.getParameter("dept_id");
			int	 year 				= Integer.parseInt(request.getParameter("year"));
			String student_id 	= request.getParameter("student_id");
			String name 			= request.getParameter("name");
			String id_number 	= request.getParameter("id_number");
			String addr 			= request.getParameter("addr");
			String telephone	= request.getParameter("telephone");
			String email			= request.getParameter("email");
			String status			= request.getParameter("status");
			String i_date			= request.getParameter("i_date");
			
			String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String db_id 		= "dba_user";
			String db_pw 	= "6546";

			String sql = "INSERT INTO STUDENT VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			try {
			
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection(url, db_id, db_pw);
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dept_id);
				pstmt.setInt(2, year);
				pstmt.setString(3, student_id);
				pstmt.setString(4, name);
				pstmt.setString(5, id_number);
				pstmt.setString(6, addr);
				pstmt.setString(7, telephone);
				pstmt.setString(8, email);
				pstmt.setString(9, status);
				pstmt.setString(10, i_date);
			
				pstmt.executeUpdate();
				
				pstmt.close();
				con.close();
				
				out.println("<h4>학생 정보 추가에 성공했습니다.<h4>");
				
			} catch(Exception e) {
				e.printStackTrace();
				out.println("<h4>학생 정보 추가에 실패했습니다.<h4>");
			}

%>
</body>
</html>